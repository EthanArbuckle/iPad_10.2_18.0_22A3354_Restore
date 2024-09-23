@implementation CXPullCallAction

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXPullCallAction;
  -[CXCallAction customDescription](&v7, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXPullCallAction handoffContext](self, "handoffContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handoffContext=%@"), v4);

  -[CXPullCallAction dateConnected](self, "dateConnected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateConnected=%@"), v5);

  return v3;
}

+ (double)timeout
{
  return 20.0;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXPullCallAction fulfillWithDateConnected:](self, "fulfillWithDateConnected:", v3);

}

- (void)fulfillWithDateConnected:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXPullCallAction fulfillWithDateConnected:]", CFSTR("dateConnected"));
  v4 = (void *)-[CXPullCallAction copy](self, "copy");
  objc_msgSend(v4, "updateAsFulfilledWithDateConnected:", v6);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (void)updateAsFulfilledWithDateConnected:(id)a3
{
  id v4;

  v4 = a3;
  -[CXAction updateAsFulfilled](self, "updateAsFulfilled");
  -[CXPullCallAction setDateConnected:](self, "setDateConnected:", v4);

}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXPullCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v9, sel_updateCopy_withZone_, v6, a4);
  -[CXPullCallAction dateConnected](self, "dateConnected", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDateConnected:", v7);

  -[CXPullCallAction handoffContext](self, "handoffContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHandoffContext:", v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXPullCallAction)initWithCoder:(id)a3
{
  id v4;
  CXPullCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CXHandoffContext *handoffContext;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDate *dateConnected;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CXPullCallAction;
  v5 = -[CXCallAction initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_handoffContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    handoffContext = v5->_handoffContext;
    v5->_handoffContext = (CXHandoffContext *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_dateConnected);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dateConnected = v5->_dateConnected;
    v5->_dateConnected = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXPullCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CXPullCallAction handoffContext](self, "handoffContext", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handoffContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXPullCallAction dateConnected](self, "dateConnected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateConnected);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

}

- (CXHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void)setHandoffContext:(id)a3
{
  objc_storeStrong((id *)&self->_handoffContext, a3);
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void)setDateConnected:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_handoffContext, 0);
}

@end
