@implementation DOCActivity

+ (id)activityWithIdentifier:(id)a3 actionPerformerProxy:(id)a4
{
  return (id)objc_msgSend(a1, "_activityWithIdentifier:forBrowserAction:actionPerformerProxy:", a3, 0, a4);
}

+ (id)activityForBrowserAction:(id)a3 actionPerformerProxy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_activityWithIdentifier:forBrowserAction:actionPerformerProxy:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_activityWithIdentifier:(id)a3 forBrowserAction:(id)a4 actionPerformerProxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  __objc2_class **v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "_activityStyleForActivityIdentifier:", v11);

  if (v12 == 1 || v9 && objc_msgSend(v9, "actionStyle") == 1)
    v13 = off_24C0EFB38;
  else
    v13 = off_24C0EFB10;
  v14 = (void *)objc_msgSend(objc_alloc(*v13), "initWithIdentifier:actionPerformer:forBrowserAction:", v8, v10, v9);

  return v14;
}

+ (BOOL)isDestructiveActionIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("com.apple.DocumentManager.action.trash");
  v8 = CFSTR("com.apple.DocumentManager.action.mixedDelete");
  v9 = CFSTR("com.apple.DocumentManager.action.delete");
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4, v7, v8, v9, v10);

  return (char)v3;
}

+ (int64_t)_activityStyleForActivityIdentifier:(id)a3
{
  return objc_msgSend(a1, "isDestructiveActionIdentifier:", a3);
}

+ (id)_imageNameForActivityIdentifier:(id)a3
{
  __CFString *v3;
  const __CFString *v5;

  v3 = (__CFString *)a3;
  if (CFSTR("com.apple.DocumentManager.action.copySharedLink") == v3)
  {
    v5 = CFSTR("square.and.arrow.up");
  }
  else if (CFSTR("com.apple.DocumentManager.action.copy") == v3)
  {
    v5 = CFSTR("doc.on.doc");
  }
  else if (CFSTR("com.apple.DocumentManager.action.archive") == v3
         || CFSTR("com.apple.DocumentManager.action.unarchive") == v3)
  {
    v5 = CFSTR("archivebox");
  }
  else if (CFSTR("com.apple.DocumentManager.action.rename") == v3)
  {
    v5 = CFSTR("pencil");
  }
  else if (CFSTR("com.apple.DocumentManager.action.duplicate") == v3)
  {
    v5 = CFSTR("plus.square.on.square");
  }
  else if (CFSTR("com.apple.DocumentManager.action.move") == v3)
  {
    v5 = CFSTR("folder");
  }
  else if (CFSTR("com.apple.DocumentManager.action.trash") == v3)
  {
    v5 = CFSTR("trash");
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

+ (id)_titleForActivityIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (CFSTR("com.apple.DocumentManager.action.copySharedLink") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Copy Link [Action Sheet]");
    v9 = CFSTR("Copy Link");
LABEL_18:
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v9, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  if (CFSTR("com.apple.DocumentManager.action.copy") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Copy [Action Sheet]");
    v9 = CFSTR("Copy");
    goto LABEL_18;
  }
  if (CFSTR("com.apple.DocumentManager.action.archive") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Compress [Action Sheet]");
    v9 = CFSTR("Compress");
    goto LABEL_18;
  }
  if (CFSTR("com.apple.DocumentManager.action.unarchive") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Uncompress [Action Sheet]");
    v9 = CFSTR("Uncompress");
    goto LABEL_18;
  }
  if (CFSTR("com.apple.DocumentManager.action.rename") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Rename [Action Sheet]");
    v9 = CFSTR("Rename");
    goto LABEL_18;
  }
  if (CFSTR("com.apple.DocumentManager.action.duplicate") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Duplicate [Action Sheet]");
    v9 = CFSTR("Duplicate");
    goto LABEL_18;
  }
  if (CFSTR("com.apple.DocumentManager.action.move") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Move [Action Sheet]");
    v9 = CFSTR("Move");
    goto LABEL_18;
  }
  if (CFSTR("com.apple.DocumentManager.action.trash") == v3)
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Delete [Action Sheet]");
    v9 = CFSTR("Delete");
    goto LABEL_18;
  }
  v5 = 0;
LABEL_19:

  return v5;
}

- (DOCActivity)initWithIdentifier:(id)a3 actionPerformer:(id)a4 forBrowserAction:(id)a5
{
  id v9;
  id v10;
  id v11;
  DOCActivity *v12;
  DOCActivity *v13;
  void *v14;
  uint64_t v15;
  NSString *identifier;
  NSString *v17;
  uint64_t v18;
  NSString *imageName;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  UIImage *image;
  uint64_t v35;
  NSString *localizedTitle;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  void *v41;
  void *v42;
  objc_super v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCActivity.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionPerformer"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCActivity.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  v43.receiver = self;
  v43.super_class = (Class)DOCActivity;
  v12 = -[UIActivity init](&v43, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionPerformerProxy, a4);
    if (v11)
    {
      objc_msgSend(v11, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      identifier = v13->_identifier;
      v13->_identifier = (NSString *)v15;

    }
    else
    {
      v17 = (NSString *)v9;
      v14 = v13->_identifier;
      v13->_identifier = v17;
    }

    objc_msgSend((id)objc_opt_class(), "_imageNameForActivityIdentifier:", v9);
    v18 = objc_claimAutoreleasedReturnValue();
    imageName = v13->_imageName;
    v13->_imageName = (NSString *)v18;

    if (v11 && !v13->_imageName)
    {
      objc_msgSend(v11, "image");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "traitCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferredContentSizeCategory");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();

      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v23);
      v25 = *MEMORY[0x24BEBE1D0];
      if (IsAccessibilityCategory)
      {
        v26 = (void *)MEMORY[0x24BEBD5E8];
        objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE078]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "fontDescriptorWithSymbolicTraits:", 0x8000);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD5E0], "fontWithDescriptor:size:", v29, 0.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BEBD660];
        objc_msgSend(v30, "pointSize");
        objc_msgSend(v31, "configurationWithPointSize:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBE338]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v20, "imageWithConfiguration:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      image = v13->_image;
      v13->_image = (UIImage *)v33;

    }
    objc_msgSend((id)objc_opt_class(), "_titleForActivityIdentifier:", v9);
    v35 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v13->_localizedTitle;
    v13->_localizedTitle = (NSString *)v35;

    v37 = -[NSString length](v13->_localizedTitle, "length");
    if (v11 && !v37)
    {
      objc_msgSend(v11, "localizedTitle");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v13->_localizedTitle;
      v13->_localizedTitle = (NSString *)v38;

    }
    -[DOCActivity validate](v13, "validate");
  }

  return v13;
}

- (void)validate
{
  OUTLINED_FUNCTION_0_1(&dword_209052000, a2, a3, "Unable to find image name for activity with identifier %@", a5, a6, a7, a8, 2u);
}

- (BOOL)_needsResolvedActivityItems
{
  return 0;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  DOCActivity *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self;
  -[DOCActivity items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v17 = 0;
        objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v9, 0, &v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v17;
        if (v10)
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        else
        {
          v12 = *MEMORY[0x24BE2DF90];
          if (!*MEMORY[0x24BE2DF90])
          {
            DOCInitLogging();
            v12 = *MEMORY[0x24BE2DF90];
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v23 = v9;
            v24 = 2112;
            v25 = v11;
            _os_log_error_impl(&dword_209052000, v12, OS_LOG_TYPE_ERROR, "Unable to wrap url %@ with error %@", buf, 0x16u);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v6);
  }

  -[DOCActivity actionPerformerProxy](v15, "actionPerformerProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCActivity activityType](v15, "activityType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __30__DOCActivity_performActivity__block_invoke;
  v16[3] = &unk_24C0F1DF8;
  v16[4] = v15;
  objc_msgSend(v13, "performAction:withURLs:completionHandler:", v14, v3, v16);

}

uint64_t __30__DOCActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

- (DOCItemActivityPerformer)actionPerformerProxy
{
  return (DOCItemActivityPerformer *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_actionPerformerProxy, 0);
}

@end
