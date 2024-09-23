@implementation APTCCDisclosureCell

- (APTCCDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  APTCCDisclosureCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APTCCDisclosureCell;
  v4 = -[APTCCDisclosureCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[APTCCDisclosureCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

id __53__APTCCDisclosureCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateConfigurationWithPreparedIconImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BEBD728];
  v5 = a3;
  objc_msgSend(v4, "cellConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", self->_appName);
  v6 = (void *)MEMORY[0x24BEBD640];
  v7 = objc_msgSend(v5, "CGImage");

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  -[APTCCDisclosureCell setContentConfiguration:](self, "setContentConfiguration:", v10);
}

- (void)configureForRecord:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSString *v7;
  NSString *bundleID;
  NSString *v9;
  NSString *appName;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  APTCCDisclosureCell *v28;
  NSString *v29;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->_bundleID);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleID = self->_bundleID;
    self->_bundleID = v7;

    objc_msgSend(v4, "localizedName");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    appName = self->_appName;
    self->_appName = v9;

    objc_msgSend(MEMORY[0x24BEBD728], "cellConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", self->_appName);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", self->_bundleID);
    objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AF0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageForDescriptor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "placeholder"))
    {
      v15 = self->_bundleID;
      APUIImageIOQueue();
      v16 = objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __42__APTCCDisclosureCell_configureForRecord___block_invoke;
      v25 = &unk_25079FEC8;
      v26 = v12;
      v27 = v13;
      v28 = self;
      v29 = v15;
      v17 = v15;
      dispatch_async(v16, &v22);

    }
    v18 = (void *)MEMORY[0x24BEBD640];
    v19 = objc_msgSend(v14, "CGImage", v22, v23, v24, v25);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v21);

    -[APTCCDisclosureCell setContentConfiguration:](self, "setContentConfiguration:", v11);
  }

}

void __42__APTCCDisclosureCell_configureForRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "prepareImageForDescriptor:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__APTCCDisclosureCell_configureForRecord___block_invoke_2;
  block[3] = &unk_25079FEA0;
  v3 = *(void **)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v2;
  v4 = v2;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

uint64_t __42__APTCCDisclosureCell_configureForRecord___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "isEqual:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "updateConfigurationWithPreparedIconImage:", *(_QWORD *)(a1 + 48));
  return result;
}

- (void)prepareForReuse
{
  NSString *bundleID;
  NSString *appName;
  UIImage *placeholderImage;
  objc_super v6;

  bundleID = self->_bundleID;
  self->_bundleID = 0;

  appName = self->_appName;
  self->_appName = 0;

  placeholderImage = self->_placeholderImage;
  self->_placeholderImage = 0;

  v6.receiver = self;
  v6.super_class = (Class)APTCCDisclosureCell;
  -[APTCCDisclosureCell prepareForReuse](&v6, sel_prepareForReuse);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
