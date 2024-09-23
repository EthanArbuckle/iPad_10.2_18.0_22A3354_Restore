@implementation QLPreviewSceneActivationConfiguration

- (QLPreviewSceneActivationConfiguration)initWithItemsAtURLs:(NSArray *)urls options:(QLPreviewSceneOptions *)options
{
  NSArray *v6;
  QLPreviewSceneOptions *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  QLPreviewSceneActivationConfiguration *v13;
  QLPreviewSceneActivationConfiguration *v14;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = urls;
  v7 = options;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "initWithActivityType:", CFSTR("com.apple.quicklook.private.scene.detachedActivityType"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.quicklook.private.activity.URLsKey"), CFSTR("com.apple.quicklook.private.activity.IndexKey"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequiredUserInfoKeys:", v9);
  if (v7)
    v10 = -[QLPreviewSceneOptions initialPreviewIndex](v7, "initialPreviewIndex");
  else
    v10 = 0;
  v17[1] = CFSTR("com.apple.quicklook.private.activity.IndexKey");
  v18[0] = v6;
  v17[0] = CFSTR("com.apple.quicklook.private.activity.URLsKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addUserInfoEntriesFromDictionary:", v12);
  v16.receiver = self;
  v16.super_class = (Class)QLPreviewSceneActivationConfiguration;
  v13 = -[UIWindowSceneActivationConfiguration initWithUserActivity:](&v16, sel_initWithUserActivity_, v8);
  v14 = v13;
  if (v13)
    -[QLPreviewSceneActivationConfiguration setOptions:](v13, "setOptions:", 0);

  return v14;
}

- (void)setOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x24BEBDB68]);
  v7 = v6;
  objc_msgSend(MEMORY[0x24BEBD8E8], "configurationWithName:sessionRole:", CFSTR("com.apple.quicklook.private.scene.detachedActivityType"), *MEMORY[0x24BEBE6F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegateClass:", objc_opt_class());
  objc_msgSend(v7, "_setQuickLookSceneConfiguration:", v8);
  v9.receiver = self;
  v9.super_class = (Class)QLPreviewSceneActivationConfiguration;
  -[UIWindowSceneActivationConfiguration setOptions:](&v9, sel_setOptions_, v7);

}

@end
