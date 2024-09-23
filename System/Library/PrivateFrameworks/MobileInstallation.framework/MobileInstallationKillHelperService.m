@implementation MobileInstallationKillHelperService

void __MobileInstallationKillHelperService_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "serviceName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Warning, couldn't kill %@ error: %@"), v4, v3);

}

@end
