@implementation AFInterstitialCommandWrapper

- (void)dealloc
{
  objc_super v3;

  -[AFInterstitialCommandWrapper dispatchCompletionWithReply:error:](self, "dispatchCompletionWithReply:error:", self->_defaultReply, 0);
  v3.receiver = self;
  v3.super_class = (Class)AFInterstitialCommandWrapper;
  -[AFInterstitialCommandWrapper dealloc](&v3, sel_dealloc);
}

- (AFInterstitialCommandWrapper)initWithCommand:(id)a3 defaultReply:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFInterstitialCommandWrapper *v11;
  uint64_t v12;
  SAAceCommand *command;
  uint64_t v14;
  SAAceCommand *defaultReply;
  uint64_t v16;
  id completion;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AFInterstitialCommandWrapper;
  v11 = -[AFInterstitialCommandWrapper init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    command = v11->_command;
    v11->_command = (SAAceCommand *)v12;

    v14 = objc_msgSend(v9, "copy");
    defaultReply = v11->_defaultReply;
    v11->_defaultReply = (SAAceCommand *)v14;

    v16 = MEMORY[0x1A1AC0C3C](v10);
    completion = v11->_completion;
    v11->_completion = (id)v16;

  }
  return v11;
}

- (void)dispatchCompletionWithReply:(id)a3 error:(id)a4
{
  void (**completion)(id, id, id);
  id v6;

  completion = (void (**)(id, id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    v6 = self->_completion;
    self->_completion = 0;

  }
}

- (SAAceCommand)command
{
  return self->_command;
}

- (SAAceCommand)defaultReply
{
  return self->_defaultReply;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultReply, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
