@implementation JavaScriptDialogState

- (JavaScriptDialogState)initWithMessage:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  JavaScriptDialogState *v10;
  uint64_t v11;
  NSString *message;
  void *v13;
  id completionHandler;
  JavaScriptDialogState *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)JavaScriptDialogState;
  v10 = -[JavaScriptDialogState init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    message = v10->_message;
    v10->_message = (NSString *)v11;

    v10->_type = a4;
    v13 = _Block_copy(v9);
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = v13;

    v15 = v10;
  }

  return v10;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)type
{
  return self->_type;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSString)currentInput
{
  return self->_currentInput;
}

- (void)setCurrentInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInput, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
