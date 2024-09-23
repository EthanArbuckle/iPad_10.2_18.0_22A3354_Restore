@implementation CXChannelTransmitStopAction

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStopAction;
  -[CXChannelAction customDescription](&v7, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stopDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannelTransmitStopAction stopDate](self, "stopDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  return v3;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXChannelTransmitStopAction fulfillWithStopDate:](self, "fulfillWithStopDate:", v3);

}

- (void)fulfillWithStopDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelTransmitStopAction fulfillWithStopDate:]", CFSTR("stopDate"));
  v4 = (void *)-[CXChannelTransmitStopAction copy](self, "copy");
  objc_msgSend(v4, "updateAsFulfilledWithStopDate:", v6);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStopAction;
  v6 = (id *)a3;
  -[CXChannelAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_storeStrong(v6 + 8, self->_stopDate);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelTransmitStopAction)initWithCoder:(id)a3
{
  id v4;
  CXChannelTransmitStopAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDate *stopDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelTransmitStopAction;
  v5 = -[CXChannelAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_stopDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    stopDate = v5->_stopDate;
    v5->_stopDate = (NSDate *)v8;

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
  v7.super_class = (Class)CXChannelTransmitStopAction;
  v4 = a3;
  -[CXChannelAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXChannelTransmitStopAction stopDate](self, "stopDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stopDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (void)updateAsFulfilledWithStopDate:(id)a3
{
  id v4;

  v4 = a3;
  -[CXAction updateAsFulfilled](self, "updateAsFulfilled");
  -[CXChannelTransmitStopAction setStopDate:](self, "setStopDate:", v4);

}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (void)setStopDate:(id)a3
{
  objc_storeStrong((id *)&self->_stopDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopDate, 0);
}

@end
