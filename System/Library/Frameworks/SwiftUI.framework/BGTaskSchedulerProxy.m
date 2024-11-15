@implementation BGTaskSchedulerProxy

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BGTaskSchedulerProxy_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_proxy;
}

void __30__BGTaskSchedulerProxy_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_proxy;
  shared_proxy = (uint64_t)v1;

}

- (BOOL)registerForTaskWithIdentifier:(id)a3 launchHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)getBGTaskSchedulerClass_softClass;
  v15 = getBGTaskSchedulerClass_softClass;
  if (!getBGTaskSchedulerClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getBGTaskSchedulerClass_block_invoke;
    v11[3] = &unk_1E1B1B9F8;
    v11[4] = &v12;
    __getBGTaskSchedulerClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v8, "sharedScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v5, 0, v6);

  return 1;
}

@end
