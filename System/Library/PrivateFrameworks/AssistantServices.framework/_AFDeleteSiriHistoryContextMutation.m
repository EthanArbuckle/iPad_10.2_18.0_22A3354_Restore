@implementation _AFDeleteSiriHistoryContextMutation

- (_AFDeleteSiriHistoryContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFDeleteSiriHistoryContextMutation *v6;
  _AFDeleteSiriHistoryContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFDeleteSiriHistoryContextMutation;
  v6 = -[_AFDeleteSiriHistoryContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getSuccessTitle
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_successTitle;
  }
  else
  {
    -[AFDeleteSiriHistoryContext successTitle](self->_base, "successTitle");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSuccessTitle:(id)a3
{
  objc_storeStrong((id *)&self->_successTitle, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getSuccessBody
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_successBody;
  }
  else
  {
    -[AFDeleteSiriHistoryContext successBody](self->_base, "successBody");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSuccessBody:(id)a3
{
  objc_storeStrong((id *)&self->_successBody, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getSuccessButtonText
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_successButtonText;
  }
  else
  {
    -[AFDeleteSiriHistoryContext successButtonText](self->_base, "successButtonText");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSuccessButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_successButtonText, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getErrorTitle
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_errorTitle;
  }
  else
  {
    -[AFDeleteSiriHistoryContext errorTitle](self->_base, "errorTitle");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setErrorTitle:(id)a3
{
  objc_storeStrong((id *)&self->_errorTitle, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getErrorBody
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_errorBody;
  }
  else
  {
    -[AFDeleteSiriHistoryContext errorBody](self->_base, "errorBody");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setErrorBody:(id)a3
{
  objc_storeStrong((id *)&self->_errorBody, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (id)getErrorButtonText
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_errorButtonText;
  }
  else
  {
    -[AFDeleteSiriHistoryContext errorButtonText](self->_base, "errorButtonText");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setErrorButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_errorButtonText, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorButtonText, 0);
  objc_storeStrong((id *)&self->_errorBody, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_successButtonText, 0);
  objc_storeStrong((id *)&self->_successBody, 0);
  objc_storeStrong((id *)&self->_successTitle, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
