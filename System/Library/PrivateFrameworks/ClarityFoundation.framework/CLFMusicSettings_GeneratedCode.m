@implementation CLFMusicSettings_GeneratedCode

+ (CLFMusicSettings)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_3);
  return (CLFMusicSettings *)(id)sharedInstance_SharedSettings_1;
}

- (CLFMusicSettings_GeneratedCode)init
{
  CLFMusicSettings_GeneratedCode *v2;
  CLFMusicSettings_GeneratedCode *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLFMusicSettings_GeneratedCode;
  v2 = -[CLFBaseSettings init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_selectedPlaylists);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("SelectedPlaylists"), v5);

  }
  return v3;
}

+ (id)domainName
{
  return CFSTR("com.apple.ClarityUI.Music");
}

+ (id)allPreferenceSelectorsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CLFMusicSettings_GeneratedCode;
  objc_msgSendSuper2(&v7, sel_allPreferenceSelectorsAsStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_selectedPlaylists);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)selectedPlaylists
{
  return (NSArray *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("SelectedPlaylists"), objc_opt_class(), MEMORY[0x24BDBD1A8]);
}

- (void)setSelectedPlaylists:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SelectedPlaylists"));
}

@end
