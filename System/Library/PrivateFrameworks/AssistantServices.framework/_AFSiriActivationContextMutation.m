@implementation _AFSiriActivationContextMutation

- (_AFSiriActivationContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFSiriActivationContextMutation *v6;
  _AFSiriActivationContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSiriActivationContextMutation;
  v6 = -[_AFSiriActivationContextMutation init](&v9, sel_init);
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
    return -[AFSiriActivationContext timestamp](self->_base, "timestamp");
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getSource
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_source;
  else
    return -[AFSiriActivationContext source](self->_base, "source");
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int64_t)getEvent
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_event;
  else
    return -[AFSiriActivationContext event](self->_base, "event");
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (unint64_t)getOptions
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_options;
  else
    return -[AFSiriActivationContext options](self->_base, "options");
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getDeviceID
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_deviceID;
  }
  else
  {
    -[AFSiriActivationContext deviceID](self->_base, "deviceID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (id)getUserInfo
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    -[AFSiriActivationContext userInfo](self->_base, "userInfo");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
