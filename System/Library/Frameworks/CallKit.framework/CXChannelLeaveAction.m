@implementation CXChannelLeaveAction

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelLeaveAction;
  -[CXChannelAction customDescription](&v7, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_leaveDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannelLeaveAction leaveDate](self, "leaveDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  return v3;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXChannelLeaveAction fulfillWithLeaveDate:](self, "fulfillWithLeaveDate:", v3);

}

- (void)fulfillWithLeaveDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannelLeaveAction fulfillWithLeaveDate:]", CFSTR("leaveDate"));
  v4 = (void *)-[CXChannelLeaveAction copy](self, "copy");
  objc_msgSend(v4, "setLeaveDate:", v6);
  objc_msgSend(v4, "updateAsFulfilled");
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelLeaveAction;
  v6 = (id *)a3;
  -[CXChannelAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_storeStrong(v6 + 8, self->_leaveDate);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelLeaveAction)initWithCoder:(id)a3
{
  id v4;
  CXChannelLeaveAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDate *leaveDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelLeaveAction;
  v5 = -[CXChannelAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_leaveDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    leaveDate = v5->_leaveDate;
    v5->_leaveDate = (NSDate *)v8;

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
  v7.super_class = (Class)CXChannelLeaveAction;
  v4 = a3;
  -[CXChannelAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CXChannelLeaveAction leaveDate](self, "leaveDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_leaveDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSDate)leaveDate
{
  return self->_leaveDate;
}

- (void)setLeaveDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaveDate, 0);
}

@end
