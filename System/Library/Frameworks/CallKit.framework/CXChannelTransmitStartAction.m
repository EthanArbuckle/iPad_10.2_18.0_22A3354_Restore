@implementation CXChannelTransmitStartAction

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStartAction;
  -[CXChannelAction customDescription](&v7, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_startDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannelTransmitStartAction startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  return v3;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXChannelTransmitStartAction fulfillWithStartDate:](self, "fulfillWithStartDate:", v3);

}

- (void)fulfillWithStartDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelTransmitStartAction fulfillWithStartDate:]", CFSTR("startDate"));
  v4 = (void *)-[CXChannelTransmitStartAction copy](self, "copy");
  objc_msgSend(v4, "updateAsFulfilledWithStartDate:", v6);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStartAction;
  v6 = (id *)a3;
  -[CXChannelAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_storeStrong(v6 + 8, self->_startDate);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelTransmitStartAction)initWithCoder:(id)a3
{
  id v4;
  CXChannelTransmitStartAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDate *startDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelTransmitStartAction;
  v5 = -[CXChannelAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_startDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

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
  v7.super_class = (Class)CXChannelTransmitStartAction;
  v4 = a3;
  -[CXChannelAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXChannelTransmitStartAction startDate](self, "startDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (void)updateAsFulfilledWithStartDate:(id)a3
{
  id v4;

  v4 = a3;
  -[CXAction updateAsFulfilled](self, "updateAsFulfilled");
  -[CXChannelTransmitStartAction setStartDate:](self, "setStartDate:", v4);

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
