@implementation _AFDeviceRequestHandlingRecordMutation

- (_AFDeviceRequestHandlingRecordMutation)initWithBase:(id)a3
{
  id v5;
  _AFDeviceRequestHandlingRecordMutation *v6;
  _AFDeviceRequestHandlingRecordMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFDeviceRequestHandlingRecordMutation;
  v6 = -[_AFDeviceRequestHandlingRecordMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getRequestID
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_requestID;
  }
  else
  {
    -[AFDeviceRequestHandlingRecord requestID](self->_base, "requestID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getDeviceRoles
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_deviceRoles;
  else
    return -[AFDeviceRequestHandlingRecord deviceRoles](self->_base, "deviceRoles");
}

- (void)setDeviceRoles:(unint64_t)a3
{
  self->_deviceRoles = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
