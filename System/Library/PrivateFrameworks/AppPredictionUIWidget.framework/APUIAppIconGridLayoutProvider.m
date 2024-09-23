@implementation APUIAppIconGridLayoutProvider

- (APUIAppIconGridLayoutProvider)initWithLargeIconsEnabled:(BOOL)a3
{
  APUIAppIconGridLayoutProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APUIAppIconGridLayoutProvider;
  result = -[APUIAppIconGridLayoutProvider init](&v5, sel_init);
  if (result)
    result->_largeIconsEnabled = a3;
  return result;
}

- (id)layoutForIconLocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _Unwind_Exception *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  if (-[APUIAppIconGridLayoutProvider isLargeIconsEnabled](self, "isLargeIconsEnabled"))
    v5 = 24;
  else
    v5 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v6 = (void *)getSBHDefaultIconListLayoutProviderClass_softClass;
  v36 = getSBHDefaultIconListLayoutProviderClass_softClass;
  if (!getSBHDefaultIconListLayoutProviderClass_softClass)
  {
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = (uint64_t)__getSBHDefaultIconListLayoutProviderClass_block_invoke;
    v31 = &unk_24DB7D4C8;
    v32 = &v33;
    __getSBHDefaultIconListLayoutProviderClass_block_invoke((uint64_t)&v28);
    v6 = (void *)v34[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v33, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithLayoutOptions:", v5);
  v28 = 0;
  v29 = (uint64_t)&v28;
  v30 = 0x2020000000;
  v9 = (_QWORD *)getSBIconLocationRootSymbolLoc_ptr;
  v31 = (void *)getSBIconLocationRootSymbolLoc_ptr;
  if (!getSBIconLocationRootSymbolLoc_ptr)
  {
    v10 = (void *)SpringBoardHomeLibrary();
    v9 = dlsym(v10, "SBIconLocationRoot");
    *(_QWORD *)(v29 + 24) = v9;
    getSBIconLocationRootSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v28, 8);
  if (!v9)
  {
    v27 = (_Unwind_Exception *)-[APUIAppIconGridLayoutProvider layoutForIconLocation:].cold.1();
    _Block_object_dispose(&v33, 8);
    _Unwind_Resume(v27);
  }
  objc_msgSend(v8, "makeLayoutForIconLocation:", *v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfPortraitColumns:", 4);

  objc_msgSend(v11, "layoutConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLandscapeColumns:", 4);

  objc_msgSend(v11, "layoutConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfPortraitRows:", 2);

  objc_msgSend(v11, "layoutConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLandscapeRows:", 2);

  objc_msgSend(v11, "layoutConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "portraitLayoutInsets");
  v18 = v17;
  v20 = v19;

  if (self->_mode == 1)
  {
    v20 = 12.0;
    v18 = 12.0;
    v21 = 12.0;
  }
  else
  {
    v21 = 0.0;
  }
  objc_msgSend(v11, "layoutConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPortraitLayoutInsets:", v21, v18, v21, v20);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v11, "layoutConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLandscapeLayoutInsets:", 12.0, 12.0, 12.0, 12.0);

  }
  return v11;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isLargeIconsEnabled
{
  return self->_largeIconsEnabled;
}

- (uint64_t)layoutForIconLocation:.cold.1()
{
  dlerror();
  abort_report_np();
  return __getSBHDefaultIconListLayoutProviderClass_block_invoke_cold_1();
}

@end
