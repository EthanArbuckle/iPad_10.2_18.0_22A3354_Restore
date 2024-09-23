@implementation WFMediaCollectionContentItem

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("MPMediaItemCollection"), CFSTR("MediaPlayer"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Media");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Media Collection"), CFSTR("Media Collection"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Media Collections"), CFSTR("Media Collections"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Media Collections"));
}

- (MPMediaItemCollection)collection
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)getMPMediaItemCollectionClass_softClass;
  v10 = getMPMediaItemCollectionClass_softClass;
  if (!getMPMediaItemCollectionClass_softClass)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getMPMediaItemCollectionClass_block_invoke;
    v6[3] = &unk_24C4E3118;
    v6[4] = &v7;
    __getMPMediaItemCollectionClass_block_invoke((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v7, 8);
  -[WFContentItem objectForClass:](self, "objectForClass:", v4);
  return (MPMediaItemCollection *)(id)objc_claimAutoreleasedReturnValue();
}

@end
