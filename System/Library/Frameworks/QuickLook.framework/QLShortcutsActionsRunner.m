@implementation QLShortcutsActionsRunner

- (void)runAction:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id completionHandler;
  id v12;

  v8 = a4;
  v9 = a3;
  v10 = _Block_copy(a5);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v10;

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC1418]), "initWithContextualAction:actionContext:", v9, v8);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "start");

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
