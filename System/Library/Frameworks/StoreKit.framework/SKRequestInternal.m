@implementation SKRequestInternal

- (SKRequestInternal)init
{
  SKRequestInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKRequestInternal;
  result = -[SKRequestInternal init](&v3, sel_init);
  if (result)
    result->_backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
  return result;
}

- (void)dealloc
{
  int64_t v3;
  void *v4;
  objc_super v5;

  v3 = *MEMORY[0x1E0DC4878];
  if (self->_backgroundTaskIdentifier != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", self->_backgroundTaskIdentifier);

    self->_backgroundTaskIdentifier = v3;
  }
  -[SKXPCConnection setDisconnectBlock:](self->_connection, "setDisconnectBlock:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SKRequestInternal;
  -[SKRequestInternal dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
