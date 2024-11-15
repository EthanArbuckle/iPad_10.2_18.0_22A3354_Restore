@implementation _AKAppleIDPasskeyRequestState

+ (id)stateWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _AKAppleIDPasskeyRequestState *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_AKAppleIDPasskeyRequestState);
  -[_AKAppleIDPasskeyRequestState setContext:](v7, "setContext:", v6);

  -[_AKAppleIDPasskeyRequestState setCompletion:](v7, "setCompletion:", v5);
  return v7;
}

- (AKAppleIDPasskeyCredentialRequestContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
