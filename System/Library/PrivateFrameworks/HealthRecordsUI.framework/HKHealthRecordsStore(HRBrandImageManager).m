@implementation HKHealthRecordsStore(HRBrandImageManager)

- (id)hk_brandImageManager
{
  id v1;
  void *v2;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, sel_hk_brandImageManager);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[HRBrandImageManager imageManagerWithHealthRecordsStore:](HRBrandImageManager, "imageManagerWithHealthRecordsStore:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v1, sel_hk_brandImageManager, v2, (void *)1);
  }
  objc_sync_exit(v1);

  return v2;
}

@end
