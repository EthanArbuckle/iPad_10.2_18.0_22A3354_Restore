@implementation WFGetWorkflowEventStore

void __WFGetWorkflowEventStore_block_invoke()
{
  uint64_t v0;
  void *v1;

  WFRecreateEventStore();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)workflowEventStore;
  workflowEventStore = v0;

}

@end
