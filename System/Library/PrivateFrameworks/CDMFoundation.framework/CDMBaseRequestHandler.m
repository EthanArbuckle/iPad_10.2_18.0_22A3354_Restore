@implementation CDMBaseRequestHandler

- (CDMBaseRequestHandler)init
{
  +[InvalidMethodCalledException raise:format:](InvalidMethodCalledException, "raise:format:", CFSTR("InvalidMethodCalledException"), CFSTR("init shouldn't be called"));

  return 0;
}

- (CDMBaseRequestHandler)initWithId:(id)a3 serviceGraph:(id)a4
{
  id v7;
  id v8;
  CDMBaseRequestHandler *v9;
  CDMBaseRequestHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMBaseRequestHandler;
  v9 = -[CDMBaseRequestHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_handlerState = 0;
    objc_storeStrong((id *)&v9->_serviceGraph, a4);
    objc_storeStrong((id *)&v10->_handlerId, a3);
  }

  return v10;
}

- (id)getServiceGraph
{
  return self->_serviceGraph;
}

- (void)setHandlerState:(unint64_t)a3
{
  self->_handlerState = a3;
}

- (unint64_t)getHandlerState
{
  void *v3;
  void *v4;
  char v5;

  if (self->_handlerState == 1)
  {
    -[CDMServiceGraph getEndNode](self->_serviceGraph, "getEndNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isFinished") & 1) != 0)
    {
      -[CDMServiceGraph getEndNode](self->_serviceGraph, "getEndNode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isCancelled");

      if ((v5 & 1) == 0)
        self->_handlerState = 2;
    }
    else
    {

    }
  }
  return self->_handlerState;
}

- (id)getError
{
  return -[CDMServiceGraph error](self->_serviceGraph, "error");
}

- (id)getResult
{
  return -[CDMServiceGraph getGraphOutput](self->_serviceGraph, "getGraphOutput");
}

- (NSString)handlerId
{
  return self->_handlerId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerId, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_serviceGraph, 0);
}

@end
