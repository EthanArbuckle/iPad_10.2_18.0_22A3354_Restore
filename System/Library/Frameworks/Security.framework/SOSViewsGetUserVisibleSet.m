@implementation SOSViewsGetUserVisibleSet

void __SOSViewsGetUserVisibleSet_block_invoke()
{
  SOSViewsGetUserVisibleSet_subViewSet = (uint64_t)SOSViewCopyViewSet(4u);
  CFSetRemoveValue((CFMutableSetRef)SOSViewsGetUserVisibleSet_subViewSet, CFSTR("iCloudIdentity"));
  CFSetRemoveValue((CFMutableSetRef)SOSViewsGetUserVisibleSet_subViewSet, CFSTR("BackupBagV0"));
}

@end
