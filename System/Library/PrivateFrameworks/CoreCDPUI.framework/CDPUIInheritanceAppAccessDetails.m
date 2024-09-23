@implementation CDPUIInheritanceAppAccessDetails

- (CDPUIInheritanceAppAccessDetails)initWithBundleID:(id)a3
{
  return -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:](self, "initWithBundleID:accessString:", a3, 0);
}

- (CDPUIInheritanceAppAccessDetails)initWithBundleID:(id)a3 accessString:(id)a4
{
  id v6;
  id v7;
  CDPUIInheritanceAppAccessDetails *v8;
  uint64_t v9;
  NSString *bundleID;
  uint64_t v11;
  NSString *accessString;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *appName;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDPUIInheritanceAppAccessDetails;
  v8 = -[CDPUIInheritanceAppAccessDetails init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    accessString = v8->_accessString;
    v8->_accessString = (NSString *)v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v8->_bundleID, 1, 0);
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "localizedName");
      v15 = objc_claimAutoreleasedReturnValue();
      appName = v8->_appName;
      v8->_appName = (NSString *)v15;

    }
    -[CDPUIInheritanceAppAccessDetails _prepareIcon](v8, "_prepareIcon");

  }
  return v8;
}

- (void)_prepareIcon
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  CDPUIInheritanceAppAccessDetails *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", self->_bundleID);
  if (v3)
  {
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __48__CDPUIInheritanceAppAccessDetails__prepareIcon__block_invoke;
    v5[3] = &unk_24C854520;
    v6 = v3;
    v7 = self;
    dispatch_async(v4, v5);

  }
}

void __48__CDPUIInheritanceAppAccessDetails__prepareIcon__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 40.0, 40.0, v4);
  objc_msgSend(v12, "setShouldApplyMask:", 1);
  objc_msgSend(v12, "setShape:", 1);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "prepareImageForDescriptor:", v12);
  objc_msgSend(*(id *)(a1 + 32), "imageForDescriptor:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBD640];
  v8 = objc_msgSend(v6, "CGImage");
  objc_msgSend(v6, "scale");
  objc_msgSend(v7, "imageWithCGImage:scale:orientation:", v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v9;

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)appName
{
  return self->_appName;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (NSString)accessString
{
  return self->_accessString;
}

- (void)setAccessString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessString, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
