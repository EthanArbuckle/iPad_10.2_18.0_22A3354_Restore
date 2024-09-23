@implementation ATXNudgeRegistrar

+ (void)registerForNearbyAppNudgeWithBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC5EB8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ATXNudgeRegistrar_registerForNearbyAppNudgeWithBlock___block_invoke;
  v7[3] = &unk_1E82DFDD8;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "registerForSuggestedActionNudgeOfType:withOptions:block:", 5, 0, v7);

}

uint64_t __56__ATXNudgeRegistrar_registerForNearbyAppNudgeWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
