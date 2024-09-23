@implementation NSArray

void __82__NSArray_PreviewDeviceInfoAppearanceAdditions__ic_deviceInfosByAddingAppearances__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  +[ICAppearanceInfo appearanceInfoWithType:](ICAppearanceInfo, "appearanceInfoWithType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceInfoFromAddingAppearanceInfo:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

@end
