@implementation FigResetDisplaySleepTimer

dispatch_queue_t __FigResetDisplaySleepTimer_block_invoke()
{
  dispatch_queue_t result;

  FigResetDisplaySleepTimer_sActiveAssertions = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  result = dispatch_queue_create("com.apple.coremedia.displaysleeptimer", 0);
  FigResetDisplaySleepTimer_sAssertionQueue = (uint64_t)result;
  return result;
}

void __FigResetDisplaySleepTimer_block_invoke_2(uint64_t a1)
{
  void *v2;
  FigDisplaySleepAssertion *v3;
  FigDisplaySleepAssertion *v4;
  uint64_t v5;
  FigDisplaySleepAssertion *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x19403137C]();
  v3 = (FigDisplaySleepAssertion *)objc_msgSend((id)FigResetDisplaySleepTimer_sActiveAssertions, "objectForKey:", *(_QWORD *)(a1 + 40));
  if (!v3)
  {
    v4 = [FigDisplaySleepAssertion alloc];
    v5 = *(_QWORD *)(a1 + 40);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __FigResetDisplaySleepTimer_block_invoke_3;
    v10 = &__block_descriptor_40_e5_v8__0l;
    v11 = v5;
    v3 = -[FigDisplaySleepAssertion initWithReason:queue:expirationHandler:](v4, "initWithReason:queue:expirationHandler:");
    objc_msgSend((id)FigResetDisplaySleepTimer_sActiveAssertions, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
    v6 = v3;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[FigDisplaySleepAssertion resetIdleTimer](v3, "resetIdleTimer");
  objc_autoreleasePoolPop(v2);
}

uint64_t __FigResetDisplaySleepTimer_block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)FigResetDisplaySleepTimer_sActiveAssertions, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

@end
