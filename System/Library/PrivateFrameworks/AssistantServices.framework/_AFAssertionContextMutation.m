@implementation _AFAssertionContextMutation

- (_AFAssertionContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFAssertionContextMutation *v6;
  _AFAssertionContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAssertionContextMutation;
  v6 = -[_AFAssertionContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getTimestamp
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_timestamp;
  else
    return -[AFAssertionContext timestamp](self->_base, "timestamp");
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getReason
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_reason;
  }
  else
  {
    -[AFAssertionContext reason](self->_base, "reason");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getEffectiveDate
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_effectiveDate;
  }
  else
  {
    -[AFAssertionContext effectiveDate](self->_base, "effectiveDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setEffectiveDate:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveDate, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (double)getExpirationDuration
{
  double result;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_expirationDuration;
  -[AFAssertionContext expirationDuration](self->_base, "expirationDuration");
  return result;
}

- (void)setExpirationDuration:(double)a3
{
  self->_expirationDuration = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getUserInfo
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    -[AFAssertionContext userInfo](self->_base, "userInfo");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
