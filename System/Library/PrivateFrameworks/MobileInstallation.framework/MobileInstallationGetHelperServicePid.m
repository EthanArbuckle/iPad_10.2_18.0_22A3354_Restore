@implementation MobileInstallationGetHelperServicePid

void __MobileInstallationGetHelperServicePid_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "serviceName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Warning, couldn't get pid of %@ error: %@"), v4, v3);

}

uint64_t __MobileInstallationGetHelperServicePid_block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
