@implementation DDSLinguisticAttributeFilter

- (void)addRegionWithCountry:(id)a3 province:(id)a4 city:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  if (v12)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("Country"));
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("Province"));
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("City"));
  -[DDSAttributeFilter addAllowedValue:forKey:](self, "addAllowedValue:forKey:", v11, CFSTR("AssetRegion"));

}

- (void)addAssetLocale:(id)a3
{
  -[DDSAttributeFilter addAllowedValue:forKey:](self, "addAllowedValue:forKey:", a3, CFSTR("AssetLocale"));
}

- (void)addContentType:(id)a3
{
  -[DDSAttributeFilter addAllowedValue:forKey:](self, "addAllowedValue:forKey:", a3, CFSTR("ContentType"));
}

- (void)addContentItemLocale:(id)a3
{
  -[DDSAttributeFilter addAllowedValue:forKey:](self, "addAllowedValue:forKey:", a3, CFSTR("Locale"));
}

- (void)addLinguisticAssetType:(id)a3
{
  -[DDSAttributeFilter addAllowedValue:forKey:](self, "addAllowedValue:forKey:", a3, CFSTR("LinguisticAssetType"));
}

@end
