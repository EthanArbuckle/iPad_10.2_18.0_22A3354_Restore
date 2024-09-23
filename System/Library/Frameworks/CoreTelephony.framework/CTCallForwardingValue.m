@implementation CTCallForwardingValue

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", reason=%i"), -[CTCallForwardingValue reason](self, "reason"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", clss=%i"), -[CTCallForwardingValue clss](self, "clss"));
  v4 = -[CTCallForwardingValue enabled](self, "enabled");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(", enabled=%@"), v5);
  -[CTCallForwardingValue saveNumber](self, "saveNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", saveNumber=%@"), v6);

  -[CTCallForwardingValue noReplyTime](self, "noReplyTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", noReplyTime=%@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setReason:", -[CTCallForwardingValue reason](self, "reason"));
  objc_msgSend(v4, "setClss:", -[CTCallForwardingValue clss](self, "clss"));
  objc_msgSend(v4, "setEnabled:", -[CTCallForwardingValue enabled](self, "enabled"));
  -[CTCallForwardingValue saveNumber](self, "saveNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSaveNumber:", v6);

  -[CTCallForwardingValue noReplyTime](self, "noReplyTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setNoReplyTime:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCallForwardingValue reason](self, "reason"), CFSTR("reason"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCallForwardingValue clss](self, "clss"), CFSTR("clss"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallForwardingValue enabled](self, "enabled"), CFSTR("enabled"));
  -[CTCallForwardingValue saveNumber](self, "saveNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("saveNumber"));

  -[CTCallForwardingValue noReplyTime](self, "noReplyTime");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("noReplyTime"));

}

- (CTCallForwardingValue)initWithCoder:(id)a3
{
  id v4;
  CTCallForwardingValue *v5;
  uint64_t v6;
  NSString *saveNumber;
  uint64_t v8;
  NSNumber *noReplyTime;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCallForwardingValue;
  v5 = -[CTCallForwardingValue init](&v11, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    v5->_clss = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clss"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saveNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    saveNumber = v5->_saveNumber;
    v5->_saveNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("noReplyTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    noReplyTime = v5->_noReplyTime;
    v5->_noReplyTime = (NSNumber *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)reason
{
  return self->_reason;
}

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

- (int)clss
{
  return self->_clss;
}

- (void)setClss:(int)a3
{
  self->_clss = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)saveNumber
{
  return self->_saveNumber;
}

- (void)setSaveNumber:(id)a3
{
  objc_storeStrong((id *)&self->_saveNumber, a3);
}

- (NSNumber)noReplyTime
{
  return self->_noReplyTime;
}

- (void)setNoReplyTime:(id)a3
{
  objc_storeStrong((id *)&self->_noReplyTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noReplyTime, 0);
  objc_storeStrong((id *)&self->_saveNumber, 0);
}

@end
