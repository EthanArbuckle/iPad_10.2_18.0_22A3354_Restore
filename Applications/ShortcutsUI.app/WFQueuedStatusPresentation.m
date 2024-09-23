@implementation WFQueuedStatusPresentation

- (WFQueuedStatusPresentation)initWithRunningContext:(id)a3
{
  id v5;
  WFQueuedStatusPresentation *v6;
  WFQueuedStatusPresentation *v7;
  WFQueuedStatusPresentation *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFQueuedStatusPresentation;
  v6 = -[WFQueuedStatusPresentation init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFQueuedStatusPresentation context](self, "context"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = a3;
  if (v5
    && (v6 = objc_opt_class(WFQueuedStatusPresentation, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFQueuedStatusPresentation context](self, "context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
