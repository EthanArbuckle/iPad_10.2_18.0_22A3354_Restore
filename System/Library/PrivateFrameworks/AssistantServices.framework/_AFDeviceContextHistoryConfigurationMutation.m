@implementation _AFDeviceContextHistoryConfigurationMutation

- (_AFDeviceContextHistoryConfigurationMutation)initWithBase:(id)a3
{
  id v5;
  _AFDeviceContextHistoryConfigurationMutation *v6;
  _AFDeviceContextHistoryConfigurationMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFDeviceContextHistoryConfigurationMutation;
  v6 = -[_AFDeviceContextHistoryConfigurationMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (BOOL)getKeepsHistory
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_keepsHistory;
  else
    return -[AFDeviceContextHistoryConfiguration keepsHistory](self->_base, "keepsHistory");
}

- (void)setKeepsHistory:(BOOL)a3
{
  self->_keepsHistory = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getHistoryBufferSize
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_historyBufferSize;
  else
    return -[AFDeviceContextHistoryConfiguration historyBufferSize](self->_base, "historyBufferSize");
}

- (void)setHistoryBufferSize:(unint64_t)a3
{
  self->_historyBufferSize = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
