@implementation AMSBag

void __49__AMSBag_AppleMediaServicesUI__amsui_internalBag__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(MEMORY[0x24BE08260], "bagKeySet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v0);

  objc_msgSend(MEMORY[0x24BE083F8], "bagKeySet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v1);

  objc_msgSend(MEMORY[0x24BE08060], "registerBagKeySet:forProfile:profileVersion:", v2, CFSTR("appstored"), CFSTR("1"));
}

@end
