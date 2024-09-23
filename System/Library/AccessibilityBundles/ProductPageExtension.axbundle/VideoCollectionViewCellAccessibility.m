@implementation VideoCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.VideoCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityContextDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("category");
  v7 = CFSTR("value");
  v8[0] = CFSTR("VIDEO");
  accessibilityAppStoreLocalizedString(CFSTR("video.view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1, v6, v7, v8[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
