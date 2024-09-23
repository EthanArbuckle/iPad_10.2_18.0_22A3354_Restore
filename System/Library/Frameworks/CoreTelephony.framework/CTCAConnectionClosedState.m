@implementation CTCAConnectionClosedState

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", reason=%s"), CTCAStewieExitReasonAsString(-[CTCAConnectionClosedState reason](self, "reason")));
  -[CTCAConnectionClosedState closedAt](self, "closedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", closedAt=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", wasActiveServices=%lu"), -[CTCAConnectionClosedState wasActiveServices](self, "wasActiveServices"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setReason:", -[CTCAConnectionClosedState reason](self, "reason"));
  -[CTCAConnectionClosedState closedAt](self, "closedAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setClosedAt:", v7);

  objc_msgSend(v5, "setWasActiveServices:", -[CTCAConnectionClosedState wasActiveServices](self, "wasActiveServices"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionClosedState reason](self, "reason"), CFSTR("reason"));
  -[CTCAConnectionClosedState closedAt](self, "closedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("closedAt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTCAConnectionClosedState wasActiveServices](self, "wasActiveServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("wasActiveServices"));

}

- (CTCAConnectionClosedState)initWithCoder:(id)a3
{
  id v4;
  CTCAConnectionClosedState *v5;
  uint64_t v6;
  NSDate *closedAt;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTCAConnectionClosedState;
  v5 = -[CTCAConnectionClosedState init](&v10, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closedAt"));
    v6 = objc_claimAutoreleasedReturnValue();
    closedAt = v5->_closedAt;
    v5->_closedAt = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wasActiveServices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wasActiveServices = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSDate)closedAt
{
  return self->_closedAt;
}

- (void)setClosedAt:(id)a3
{
  objc_storeStrong((id *)&self->_closedAt, a3);
}

- (unint64_t)wasActiveServices
{
  return self->_wasActiveServices;
}

- (void)setWasActiveServices:(unint64_t)a3
{
  self->_wasActiveServices = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closedAt, 0);
}

@end
