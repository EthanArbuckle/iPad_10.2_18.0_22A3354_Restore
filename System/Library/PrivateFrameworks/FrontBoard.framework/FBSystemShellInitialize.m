@implementation FBSystemShellInitialize

void __FBSystemShellInitialize_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  +[FBServiceFacilityServer sharedInstance](FBServiceFacilityServer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteMilestoneReached:", *MEMORY[0x1E0D22E98]);

  objc_msgSend(*(id *)(a1 + 32), "_informSystemShellServiceDidFinishLaunching");
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __FBSystemShellInitialize_block_invoke_2;
  v7 = &unk_1E4A11FD0;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], &v4);
  v3 = *(void **)(a1 + 56);
  if (v3)
    objc_msgSend(v3, "invalidate", v4, v5, v6, v7, v8);

}

uint64_t __FBSystemShellInitialize_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0D23328], 0);

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_noteShellInitializationComplete");

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

@end
