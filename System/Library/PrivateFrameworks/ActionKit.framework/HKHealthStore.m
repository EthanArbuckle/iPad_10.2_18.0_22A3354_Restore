@implementation HKHealthStore

uint64_t __53__HKHealthStore_Workflow__wf_shortcutsAppHealthStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v1 = (void *)wf_shortcutsAppHealthStore_store;
  wf_shortcutsAppHealthStore_store = (uint64_t)v0;

  objc_msgSend((id)wf_shortcutsAppHealthStore_store, "setSourceBundleIdentifier:", *MEMORY[0x24BEC1780]);
  return objc_msgSend((id)wf_shortcutsAppHealthStore_store, "resume");
}

@end
