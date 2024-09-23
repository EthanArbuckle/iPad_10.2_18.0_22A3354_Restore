@implementation CLFPhotosSettings_GeneratedCode

+ (CLFPhotosSettings)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_7);
  return (CLFPhotosSettings *)(id)sharedInstance_SharedSettings_4;
}

- (CLFPhotosSettings_GeneratedCode)init
{
  CLFPhotosSettings_GeneratedCode *v2;
  CLFPhotosSettings_GeneratedCode *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLFPhotosSettings_GeneratedCode;
  v2 = -[CLFBaseSettings init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_includeSharedAlbums);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("IncludeSharedAlbums"), v5);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_selectedSharedAlbumCloudIdentifiers);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("SelectedSharedAlbumCloudIdentifiers"), v7);

  }
  return v3;
}

+ (id)domainName
{
  return CFSTR("com.apple.ClarityUI.Photos");
}

+ (id)allPreferenceSelectorsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CLFPhotosSettings_GeneratedCode;
  objc_msgSendSuper2(&v8, sel_allPreferenceSelectorsAsStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_includeSharedAlbums);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_selectedSharedAlbumCloudIdentifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)includeSharedAlbums
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("IncludeSharedAlbums"), 0);
}

- (void)setIncludeSharedAlbums:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("IncludeSharedAlbums"));

}

- (NSArray)selectedSharedAlbumCloudIdentifiers
{
  return (NSArray *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("SelectedSharedAlbumCloudIdentifiers"), objc_opt_class(), MEMORY[0x24BDBD1A8]);
}

- (void)setSelectedSharedAlbumCloudIdentifiers:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SelectedSharedAlbumCloudIdentifiers"));
}

@end
