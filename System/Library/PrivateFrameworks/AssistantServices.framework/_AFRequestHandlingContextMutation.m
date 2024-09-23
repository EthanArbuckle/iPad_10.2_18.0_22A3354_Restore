@implementation _AFRequestHandlingContextMutation

- (_AFRequestHandlingContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFRequestHandlingContextMutation *v6;
  _AFRequestHandlingContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFRequestHandlingContextMutation;
  v6 = -[_AFRequestHandlingContextMutation init](&v9, sel_init);
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
    -[AFRequestHandlingContext requestID](self->_base, "requestID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getInputDeviceID
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_inputDeviceID;
  }
  else
  {
    -[AFRequestHandlingContext inputDeviceID](self->_base, "inputDeviceID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setInputDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_inputDeviceID, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getInputAssistantID
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_inputAssistantID;
  }
  else
  {
    -[AFRequestHandlingContext inputAssistantID](self->_base, "inputAssistantID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setInputAssistantID:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantID, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantID, 0);
  objc_storeStrong((id *)&self->_inputDeviceID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
