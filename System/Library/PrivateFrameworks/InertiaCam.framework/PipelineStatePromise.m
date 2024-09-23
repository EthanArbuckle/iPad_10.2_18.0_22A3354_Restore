@implementation PipelineStatePromise

- (PipelineStatePromise)initWithDispatchGroup:(id)a3 pipelineStates:(id)a4 errors:(id)a5
{
  id v9;
  id v10;
  id v11;
  PipelineStatePromise *v12;
  PipelineStatePromise *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PipelineStatePromise;
  v12 = -[PipelineStatePromise init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->group, a3);
    objc_storeStrong((id *)&v13->pipelineStates, a4);
    objc_storeStrong((id *)&v13->errors, a5);
  }

  return v13;
}

- (BOOL)timesOutWaitingForPipelineStates:(double)a3
{
  unsigned __int8 v3;
  intptr_t v5;
  BOOL result;

  v3 = atomic_load((unsigned __int8 *)&self->initialization_completed);
  if ((v3 & 1) == 0)
  {
    v5 = dispatch_group_wait((dispatch_group_t)self->group, (unint64_t)a3);
    result = 1;
    if (v5)
      return result;
    atomic_store(1u, (unsigned __int8 *)&self->initialization_completed);
  }
  return 0;
}

- (BOOL)groupWasSuccessful
{
  -[PipelineStatePromise timesOutWaitingForPipelineStates:](self, "timesOutWaitingForPipelineStates:", 1.84467441e19);
  return -[NSMapTable count](self->errors, "count") == 0;
}

- (id)pipelineStateForFunction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PipelineStatePromise timesOutWaitingForPipelineStates:](self, "timesOutWaitingForPipelineStates:", 1.84467441e19);
  -[NSMapTable objectForKey:](self->pipelineStates, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)errorForFunction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PipelineStatePromise timesOutWaitingForPipelineStates:](self, "timesOutWaitingForPipelineStates:", 1.84467441e19);
  -[NSMapTable objectForKey:](self->errors, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->group, 0);
  objc_storeStrong((id *)&self->errors, 0);
  objc_storeStrong((id *)&self->pipelineStates, 0);
}

@end
