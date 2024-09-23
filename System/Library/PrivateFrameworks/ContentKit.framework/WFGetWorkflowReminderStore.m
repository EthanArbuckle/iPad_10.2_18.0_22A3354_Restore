@implementation WFGetWorkflowReminderStore

void __WFGetWorkflowReminderStore_block_invoke()
{
  uint64_t v0;
  void *v1;

  getREMStoreClass();
  v0 = objc_opt_new();
  v1 = (void *)workflowReminderStore;
  workflowReminderStore = v0;

}

@end
