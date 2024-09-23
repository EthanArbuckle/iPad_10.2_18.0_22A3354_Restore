@implementation CNLocalAccountSyncRequest

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("retryCount"), self->_retryCount);
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("standby"), self->_standby);
  v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("resetStandby"), self->_resetStandby);
  v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("clearify"), self->_clearify);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CNLocalAccountSyncRequest *v4;
  BOOL v5;

  v4 = (CNLocalAccountSyncRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || self->_retryCount != v4->_retryCount
      || !self->_standby == v4->_standby
      || !self->_resetStandby == v4->_resetStandby)
    {
      v5 = 0;
    }
    else
    {
      v5 = !self->_clearify ^ v4->_clearify;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  v2 = self->_standby - self->_retryCount + 32 * self->_retryCount;
  v3 = self->_resetStandby - v2 + 32 * v2;
  return self->_clearify - v3 + 32 * v3 + 15699857;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNLocalAccountSyncRequest)initWithCoder:(id)a3
{
  id v4;
  CNLocalAccountSyncRequest *v5;
  CNLocalAccountSyncRequest *v6;

  v4 = a3;
  v5 = -[CNLocalAccountSyncRequest init](self, "init");
  if (v5)
  {
    -[CNLocalAccountSyncRequest setRetryCount:](v5, "setRetryCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retryCount")));
    -[CNLocalAccountSyncRequest setStandby:](v5, "setStandby:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("standby")));
    -[CNLocalAccountSyncRequest setResetStandby:](v5, "setResetStandby:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resetStandby")));
    -[CNLocalAccountSyncRequest setClearify:](v5, "setClearify:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clearify")));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t retryCount;
  id v5;

  retryCount = self->_retryCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", retryCount, CFSTR("retryCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_standby, CFSTR("standby"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_resetStandby, CFSTR("resetStandby"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_clearify, CFSTR("clearify"));

}

+ (id)argumentsForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", CFSTR("--tricklesync"));
  if (objc_msgSend(v3, "retryCount"))
  {
    objc_msgSend(v4, "addObject:", CFSTR("--retry"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v3, "retryCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (objc_msgSend(v3, "standby"))
    objc_msgSend(v4, "addObject:", CFSTR("--standby"));
  if (objc_msgSend(v3, "resetStandby"))
    objc_msgSend(v4, "addObject:", CFSTR("--reset-standby"));
  if (objc_msgSend(v3, "clearify"))
    objc_msgSend(v4, "addObject:", CFSTR("--clearify"));

  return v4;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)standby
{
  return self->_standby;
}

- (void)setStandby:(BOOL)a3
{
  self->_standby = a3;
}

- (BOOL)resetStandby
{
  return self->_resetStandby;
}

- (void)setResetStandby:(BOOL)a3
{
  self->_resetStandby = a3;
}

- (BOOL)clearify
{
  return self->_clearify;
}

- (void)setClearify:(BOOL)a3
{
  self->_clearify = a3;
}

@end
