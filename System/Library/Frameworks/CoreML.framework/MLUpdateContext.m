@implementation MLUpdateContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MLUpdateContext task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLUpdateContext model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLUpdateProgressHandlersUtils progressEventsToString:](MLUpdateProgressHandlersUtils, "progressEventsToString:", -[MLUpdateContext event](self, "event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLUpdateContext metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLUpdateContext parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("task: %p, \nmodel: %p, \nevent: %@, \nmetrics: %@, \nparameters: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MLUpdateTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (MLModel)model
{
  return (MLModel *)self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (MLUpdateProgressEvent)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

+ (MLUpdateContext)updateContextWithTask:(id)a3 model:(id)a4 event:(int64_t)a5 metrics:(id)a6 parameters:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setTask:", v14);

  objc_msgSend(v15, "setModel:", v13);
  objc_msgSend(v15, "setEvent:", a5);
  objc_msgSend(v15, "setMetrics:", v12);

  objc_msgSend(v15, "setParameters:", v11);
  return (MLUpdateContext *)v15;
}

+ (id)updateContextForEvent:(int64_t)a3 metrics:(id)a4 parameters:(id)a5 error:(id)a6
{
  id v9;
  void *v10;

  v9 = a6;
  +[MLUpdateContext updateContextWithTask:model:event:metrics:parameters:](MLUpdateContext, "updateContextWithTask:model:event:metrics:parameters:", 0, 0, a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setError:", v9);

  return v10;
}

@end
