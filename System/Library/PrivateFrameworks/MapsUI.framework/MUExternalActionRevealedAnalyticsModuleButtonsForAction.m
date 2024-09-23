@implementation MUExternalActionRevealedAnalyticsModuleButtonsForAction

id __MUExternalActionRevealedAnalyticsModuleButtonsForAction_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D27458];
  v4 = a2;
  objc_msgSend(v3, "moduleButtonForType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setVendor:", v6);
  objc_msgSend(v5, "setMetadata:", *(_QWORD *)(a1 + 32));
  return v5;
}

@end
