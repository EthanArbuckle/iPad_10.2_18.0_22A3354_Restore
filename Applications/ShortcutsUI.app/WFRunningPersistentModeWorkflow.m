@implementation WFRunningPersistentModeWorkflow

- (WFRunningPersistentModeWorkflow)initWithRunningContext:(id)a3 attribution:(id)a4 progressSubscriber:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFRunningPersistentModeWorkflow *v13;
  WFRunningPersistentModeWorkflow *v14;
  WFRunningPersistentModeWorkflow *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRunningPersistentModeWorkflow.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attribution"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRunningPersistentModeWorkflow.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runningContext"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRunningPersistentModeWorkflow.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progressSubscriber"));

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)WFRunningPersistentModeWorkflow;
  v13 = -[WFRunningPersistentModeWorkflow init](&v20, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_runningContext, a3);
    objc_storeStrong((id *)&v14->_attribution, a4);
    objc_storeStrong(&v14->_progressSubscriber, a5);
    v15 = v14;
  }

  return v14;
}

- (void)updateWithProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *progress;
  void *v7;

  v5 = (NSProgress *)a3;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRunningPersistentModeWorkflow.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

  }
  progress = self->_progress;
  self->_progress = v5;

}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_attribution, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (WFBannerPresentable)associatedPill
{
  return self->_associatedPill;
}

- (void)setAssociatedPill:(id)a3
{
  objc_storeStrong((id *)&self->_associatedPill, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPill, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
}

@end
