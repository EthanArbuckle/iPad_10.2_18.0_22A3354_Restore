@implementation CXEndCallAction

- (id)customDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXEndCallAction;
  -[CXCallAction customDescription](&v6, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXEndCallAction dateEnded](self, "dateEnded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateEnded=%@"), v4);

  return v3;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXEndCallAction fulfillWithDateEnded:](self, "fulfillWithDateEnded:", v3);

}

- (void)fulfillWithDateEnded:(NSDate *)dateEnded
{
  void *v4;
  void *v5;
  NSDate *v6;

  v6 = dateEnded;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXEndCallAction fulfillWithDateEnded:]", CFSTR("dateEnded"));
  v4 = (void *)-[CXEndCallAction copy](self, "copy");
  objc_msgSend(v4, "updateAsFulfilledWithDateEnded:", v6);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (void)updateAsFulfilledWithDateEnded:(id)a3
{
  id v4;

  v4 = a3;
  -[CXAction updateAsFulfilled](self, "updateAsFulfilled");
  -[CXEndCallAction setDateEnded:](self, "setDateEnded:", v4);

}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXEndCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v8, sel_updateSanitizedCopy_withZone_, v6, a4);
  -[CXEndCallAction dateEnded](self, "dateEnded", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDateEnded:", v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXEndCallAction)initWithCoder:(id)a3
{
  id v4;
  CXEndCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDate *dateEnded;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXEndCallAction;
  v5 = -[CXCallAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_dateEnded);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    dateEnded = v5->_dateEnded;
    v5->_dateEnded = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXEndCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXEndCallAction dateEnded](self, "dateEnded", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateEnded);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (void)setDateEnded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateEnded, 0);
}

@end
