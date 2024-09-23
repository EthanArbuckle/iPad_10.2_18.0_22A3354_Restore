@implementation HKHealthStore(Workflow)

+ (id)wf_shortcutsAppHealthStore
{
  if (wf_shortcutsAppHealthStore_onceToken != -1)
    dispatch_once(&wf_shortcutsAppHealthStore_onceToken, &__block_literal_global_12829);
  return (id)wf_shortcutsAppHealthStore_store;
}

@end
