@implementation INAddTasksTargetTaskListResolutionResult

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INAddTasksTargetTaskListResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v12, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadConfirmation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasAddTasksIntentTargetTaskListConfirmationReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadConfirmation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setConfirmationReason:", objc_msgSend(v10, "addTasksIntentTargetTaskListConfirmationReason") == 1);

    }
  }

  return v7;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INAddTasksTargetTaskListResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v9, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 3
    && -[INIntentResolutionResult confirmationReason](self, "confirmationReason"))
  {
    objc_msgSend(v4, "payloadConfirmation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReason:", 1000);

    objc_msgSend(v4, "payloadConfirmation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[INIntentResolutionResult confirmationReason](self, "confirmationReason") == 1)
      v7 = 1;
    else
      v7 = 0x7FFFFFFFLL;
    objc_msgSend(v6, "setAddTasksIntentTargetTaskListConfirmationReason:", v7);

  }
  return v4;
}

+ (INAddTasksTargetTaskListResolutionResult)confirmationRequiredWithTaskListToConfirm:(INTaskList *)taskListToConfirm forReason:(INAddTasksTargetTaskListConfirmationReason)reason
{
  void *v5;

  objc_msgSend(a1, "confirmationRequiredWithTaskListToConfirm:", taskListToConfirm);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfirmationReason:", reason);
  return (INAddTasksTargetTaskListResolutionResult *)v5;
}

@end
