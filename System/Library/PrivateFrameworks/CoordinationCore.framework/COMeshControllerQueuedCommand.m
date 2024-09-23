@implementation COMeshControllerQueuedCommand

- (COMeshControllerQueuedCommand)initWithCommand:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  COMeshControllerQueuedCommand *v9;
  COMeshControllerQueuedCommand *v10;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMeshControllerQueuedCommand;
  v9 = -[COMeshControllerQueuedCommand init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_command, a3);
    v11 = objc_msgSend(v8, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

  }
  return v10;
}

- (void)invokeCallbackWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, id);

  v4 = a3;
  -[COMeshControllerQueuedCommand completionHandler](self, "completionHandler");
  v6 = (void (**)(id, void *, id))objc_claimAutoreleasedReturnValue();
  -[COMeshControllerQueuedCommand command](self, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, v4);

}

- (COMeshCommand)command
{
  return self->_command;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (COMeshNode)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
