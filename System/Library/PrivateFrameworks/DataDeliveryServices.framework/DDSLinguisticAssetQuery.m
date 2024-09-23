@implementation DDSLinguisticAssetQuery

- (DDSLinguisticAssetQuery)initWithAssetType:(id)a3 languageIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  DDSLinguisticAssetQuery *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  +[DDSAttributeFilter attributeFilter](DDSLinguisticAttributeFilter, "attributeFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAssetLocale:", v7);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v10, "isEqualToString:", v7);
  if ((v9 & 1) == 0)
    objc_msgSend(v8, "addAssetLocale:", v10);
  v13.receiver = self;
  v13.super_class = (Class)DDSLinguisticAssetQuery;
  v11 = -[DDSAssetQuery initWithAssetType:filter:](&v13, sel_initWithAssetType_filter_, v6, v8);

  return v11;
}

- (DDSLinguisticAssetQuery)initWithLanguageIdentifier:(id)a3
{
  return -[DDSLinguisticAssetQuery initWithAssetType:languageIdentifier:](self, "initWithAssetType:languageIdentifier:", CFSTR("com.apple.MobileAsset.LinguisticData"), a3);
}

- (void)addRegionWithCountry:(id)a3 province:(id)a4 city:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DDSAssetQuery filter](self, "filter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addRegionWithCountry:province:city:", v10, v9, v8);

}

@end
