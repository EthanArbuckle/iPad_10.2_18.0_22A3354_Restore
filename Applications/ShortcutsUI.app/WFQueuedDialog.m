@implementation WFQueuedDialog

- (WFQueuedDialog)initWithRequest:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFQueuedDialog *v12;
  WFQueuedDialog *v13;
  id v14;
  id completionHandler;
  WFQueuedDialog *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFQueuedDialog;
  v12 = -[WFQueuedDialog init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    v14 = objc_msgSend(v11, "copy");
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = v14;

    v13->_isFollowUp = 0;
    v16 = v13;
  }

  return v13;
}

- (WFDialogRequest)request
{
  return self->_request;
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isFollowUp
{
  return self->_isFollowUp;
}

- (void)setIsFollowUp:(BOOL)a3
{
  self->_isFollowUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
