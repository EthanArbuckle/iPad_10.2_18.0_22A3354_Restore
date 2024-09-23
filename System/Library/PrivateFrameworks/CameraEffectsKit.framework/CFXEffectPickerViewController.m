@implementation CFXEffectPickerViewController

+ (id)effectPickerViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDF6E00];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storyboardWithName:bundle:", CFSTR("CFXEffectPickerViewController"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instantiateViewControllerWithIdentifier:", CFSTR("CFXEffectPickerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  dispatch_queue_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CFXEffectPickerViewController;
  -[CFXEffectPickerViewController viewDidLoad](&v12, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (viewDidLoad_onceToken != -1)
    dispatch_once(&viewDidLoad_onceToken, &__block_literal_global_31);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.%@.effectLoadingQueue"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v11 = dispatch_queue_create(v10, MEMORY[0x24BDAC9C0]);
  -[CFXEffectPickerViewController setEffectLoadingQueue:](self, "setEffectLoadingQueue:", v11);

}

void __44__CFXEffectPickerViewController_viewDidLoad__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(2);
  v1 = (void *)s_effectLoadingSemaphore;
  s_effectLoadingSemaphore = (uint64_t)v0;

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXEffectPickerViewController;
  -[CFXEffectPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CFXEffectPickerViewController pickerView](self, "pickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  if (-[CFXEffectPickerViewController isPreviewing](self, "isPreviewing"))
    -[CFXEffectPickerViewController CFX_restartPreviewing](self, "CFX_restartPreviewing");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXEffectPickerViewController;
  -[CFXEffectPickerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[CFXEffectPickerViewController isPreviewing](self, "isPreviewing"))
    -[CFXEffectPickerViewController CFX_stopPreviewing](self, "CFX_stopPreviewing");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CFXEffectPickerViewController;
  v7 = a4;
  -[CFXEffectPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__CFXEffectPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24EE59A58;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

void __84__CFXEffectPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "pickerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "orientationDidChange");

}

- (void)setPreviewBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_previewBackgroundImage, a3);
  if (-[CFXEffectPickerViewController isPreviewing](self, "isPreviewing"))
    -[CFXEffectPickerViewController CFX_restartPreviewing](self, "CFX_restartPreviewing");
}

- (void)setEffectType:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_effectType) & 1) == 0)
  {
    -[CFXEffectPickerViewController CFX_stopPreviewing](self, "CFX_stopPreviewing");
    -[CFXEffectPickerViewController pickerView](self, "pickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_storeStrong((id *)&self->_effectType, a3);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__CFXEffectPickerViewController_setEffectType___block_invoke;
    v7[3] = &unk_24EE57AA8;
    v7[4] = self;
    v8 = v5;
    -[CFXEffectPickerViewController CFX_loadEffectsForType:completion:](self, "CFX_loadEffectsForType:completion:", v8, v7);

  }
}

uint64_t __47__CFXEffectPickerViewController_setEffectType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "CFX_createPickerViewForEffectType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPickerView:", v2);

  result = objc_msgSend(*(id *)(a1 + 32), "isPreviewing");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "CFX_restartPreviewing");
  return result;
}

- (void)startPreviewing
{
  void *v3;
  void *v4;

  -[CFXEffectPickerViewController setPreviewing:](self, "setPreviewing:", 1);
  -[CFXEffectPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[CFXEffectPickerViewController CFX_restartPreviewing](self, "CFX_restartPreviewing");
}

- (void)stopPreviewing
{
  -[CFXEffectPickerViewController setPreviewing:](self, "setPreviewing:", 0);
  -[CFXEffectPickerViewController CFX_stopPreviewing](self, "CFX_stopPreviewing");
}

- (void)CFX_restartPreviewing
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[CFXEffectPickerViewController pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXEffectPickerViewController pickerView](self, "pickerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopPreviewing");

    -[CFXEffectPickerViewController effectType](self, "effectType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "jtEffectType");

    if (v6 == 2)
    {
      -[CFXEffectPickerViewController pickerView](self, "pickerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPreviewBackgroundImage:", 0);

      -[CFXEffectPickerViewController pickerView](self, "pickerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContinuousPreviewEnabled:", 1);

      -[CFXEffectPickerViewController pickerView](self, "pickerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0;
    }
    else
    {
      if (v6 != 1)
      {
        -[CFXEffectPickerViewController pickerView](self, "pickerView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPreviewBackgroundImage:", 0);

        -[CFXEffectPickerViewController pickerView](self, "pickerView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setUseCameraForContinuousPreview:", 0);

        -[CFXEffectPickerViewController pickerView](self, "pickerView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setContinuousPreviewEnabled:", 0);
        goto LABEL_9;
      }
      -[CFXEffectPickerViewController previewBackgroundImage](self, "previewBackgroundImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectPickerViewController pickerView](self, "pickerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPreviewBackgroundImage:", v7);

      -[CFXEffectPickerViewController previewBackgroundImage](self, "previewBackgroundImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      -[CFXEffectPickerViewController pickerView](self, "pickerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContinuousPreviewEnabled:", v10);

      -[CFXEffectPickerViewController pickerView](self, "pickerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v10;
    }
    objc_msgSend(v12, "setUseCameraForContinuousPreview:", v14);
LABEL_9:

    -[CFXEffectPickerViewController pickerView](self, "pickerView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startPreviewing");

  }
}

- (void)CFX_stopPreviewing
{
  id v2;

  -[CFXEffectPickerViewController pickerView](self, "pickerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPreviewing");

}

- (void)CFX_loadEffectsForType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  CFXEffectPickerViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CFXEffectPickerViewController setEffects:](self, "setEffects:", 0);
  if (v6)
  {
    +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "jtEffectType");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__CFXEffectPickerViewController_CFX_loadEffectsForType_completion___block_invoke;
    v10[3] = &unk_24EE59A80;
    v11 = v6;
    v12 = self;
    v13 = v7;
    objc_msgSend(v8, "effectIDsForType:completion:", v9, v10);

  }
}

void __67__CFXEffectPickerViewController_CFX_loadEffectsForType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        +[CFXEffect effectWithIdentifier:forEffectType:](CFXEffect, "effectWithIdentifier:forEffectType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), *(_QWORD *)(a1 + 32), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "setEffects:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (unint64_t)CFX_indexForEffectIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CFXEffectPickerViewController effects](self, "effects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__CFXEffectPickerViewController_CFX_indexForEffectIdentifier___block_invoke;
  v9[3] = &unk_24EE59AA8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __62__CFXEffectPickerViewController_CFX_indexForEffectIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)CFX_createPickerViewForEffectType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  objc_msgSend(a3, "jtEffectType");
  v4 = (void *)objc_opt_new();
  -[CFXEffectPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  objc_msgSend(v4, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  objc_msgSend(v4, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v8;
  objc_msgSend(v4, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectPickerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v13);

  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  return v4;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectPickerViewController;
  -[CFXEffectPickerViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, v4);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_255914308))
    objc_msgSend(v4, "setFilterPickerPresentationDelegate:", self);

}

- (void)effectPickerView:(id)a3 didPickEffectAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CFXEffectPickerViewController effects](self, "effects", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a4)
  {
    -[CFXEffectPickerViewController effects](self, "effects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "copy");

    -[CFXEffectPickerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectPickerViewController:didPickEffect:", self, v11);

  }
}

- (void)effectPickerViewDidScroll:(id)a3
{
  id v3;

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickerDidScroll");

}

- (unint64_t)numberOfEffectsInPickerView:(id)a3
{
  void *v3;
  unint64_t v4;

  -[CFXEffectPickerViewController effects](self, "effects", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)effectPickerView:(id)a3 effectAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[CFXEffectPickerViewController effects](self, "effects", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v9 = 0;
  }
  else
  {
    -[CFXEffectPickerViewController effects](self, "effects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)effectPickerView:(id)a3 effectIdentifierAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[CFXEffectPickerViewController effects](self, "effects", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v10 = 0;
  }
  else
  {
    -[CFXEffectPickerViewController effects](self, "effects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)effectPickerView:(id)a3 effectTitleAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[CFXEffectPickerViewController effects](self, "effects", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)effectPickerView:(id)a3 indexForEffectID:(id)a4
{
  return -[CFXEffectPickerViewController CFX_indexForEffectIdentifier:](self, "CFX_indexForEffectIdentifier:", a4);
}

- (void)effectPickerView:(id)a3 effectAtIndex:(int64_t)a4 forPreviewingAtSizeInPixels:(CGSize)a5 completionBlock:(id)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  char v19;
  double v20;
  double v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CFXEffectPickerViewController *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  char v31;

  height = a5.height;
  width = a5.width;
  v10 = a6;
  -[CFXEffectPickerViewController effects](self, "effects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 > a4)
  {
    -[CFXEffectPickerViewController effects](self, "effects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "jtEffect");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "type") == 2)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;
    if (!objc_msgSend(v15, "isNone"))
    {
      v18 = objc_msgSend(v15, "renderEffectResourcesAreReady");
      if (v17 && objc_msgSend(v17, "hasDynamicText"))
        v19 = objc_msgSend(v17, "wasDynamicTextSet") ^ 1;
      else
        v19 = 0;
      objc_msgSend(v15, "renderSize");
      if (!v18 || (v19 & 1) != 0)
      {
        -[CFXEffectPickerViewController effectLoadingQueue](self, "effectLoadingQueue");
        v22 = objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke;
        v23[3] = &unk_24EE59B20;
        v24 = v15;
        v31 = v19;
        v25 = v17;
        v26 = self;
        v29 = width;
        v30 = height;
        v28 = v10;
        v27 = v14;
        dispatch_async(v22, v23);

        goto LABEL_18;
      }
      if (v20 != width || v21 != height)
        -[CFXEffectPickerViewController CFX_configureEffect:previewSizeInPixels:](self, "CFX_configureEffect:previewSizeInPixels:", v15, width, height);
    }
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
LABEL_18:

    goto LABEL_19;
  }
  (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_19:

}

void __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  uint64_t v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  dispatch_semaphore_t v15;

  v2 = s_effectLoadingSemaphore;
  v3 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v3);
  objc_msgSend(*(id *)(a1 + 32), "loadRenderEffect");
  v4 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 88))
  {
    v5 = dispatch_semaphore_create(0);
    v6 = *(void **)(a1 + 40);
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_2;
    v14[3] = &unk_24EE59AD0;
    v15 = v5;
    v7 = v5;
    objc_msgSend(v6, "updateDynamicTextWithCompletionBlock:", v14);
    v8 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v7, v8);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)s_effectLoadingSemaphore);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_3;
  block[3] = &unk_24EE59AF8;
  block[4] = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 72);
  v12 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

intptr_t __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_configureEffect:previewSizeInPixels:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)CFX_configureEffect:(id)a3 previewSizeInPixels:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  CGFloat v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  CGAffineTransform v18;
  _OWORD v19[3];

  height = a4.height;
  width = a4.width;
  v6 = a3;
  if ((objc_msgSend(v6, "isNone") & 1) == 0 && objc_msgSend(v6, "renderEffectResourcesAreReady"))
  {
    objc_msgSend(v6, "setRenderSize:", width, height);
    objc_msgSend(v6, "renderEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = kDefaultEffectPreviewAnimationRange;
    v19[1] = xmmword_226AB8860;
    v19[2] = xmmword_226AB8870;
    objc_msgSend(v7, "setEffectRange:", v19);

    objc_msgSend(v6, "setForceRenderAtPosterFrame:", 1);
    if (objc_msgSend(v6, "type") == 2)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;
    v10 = v9;
    if (v9)
    {
      v13 = *MEMORY[0x24BDC0D88];
      v16 = *MEMORY[0x24BDC0D88];
      v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      v17 = v11;
      objc_msgSend(v9, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v16, 0.0, 0.0, width, height, 0.0, 0.0, width, height);
      objc_msgSend(v10, "pickerScale");
      if (v12 != 1.0)
      {
        CGAffineTransformMakeScale(&v18, v12, v12);
        v14 = v13;
        v15 = v11;
        objc_msgSend(v10, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v18, &v14, 1, 0.0, 0.0, width, height);
      }
    }

  }
}

- (unint64_t)selectedFilterIndexForFilterPickerView:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;

  -[CFXEffectPickerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedFilterIdentifierForEffectPickerViewController:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = (id)*MEMORY[0x24BE79298];
  v6 = -[CFXEffectPickerViewController CFX_indexForEffectIdentifier:](self, "CFX_indexForEffectIdentifier:", v5);

  return v6;
}

- (BOOL)shouldDisplayExpandedModeForFilterPickerView:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
    return 1;
  -[CFXEffectPickerViewController parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_255914308))
    v6 = objc_msgSend(v7, "layoutPresentationStyle") == 1;
  else
    v6 = 0;

  return v6;
}

- (BOOL)shouldRotateCellsForDeviceOrientation
{
  void *v2;
  char v3;

  -[CFXEffectPickerViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldRotateCellsForDeviceOrientation");

  return v3;
}

- (void)filterPickerPresentationModeDidChange
{
  void *v2;
  id v3;

  -[CFXEffectPickerViewController pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickerDidChangePresentationMode");

}

- (UIImage)previewBackgroundImage
{
  return self->_previewBackgroundImage;
}

- (CFXEffectType)effectType
{
  return self->_effectType;
}

- (CFXEffectPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (CFXEffectPickerViewControllerDelegate)delegate
{
  return (CFXEffectPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)effects
{
  return self->_effects;
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->_effects, a3);
}

- (OS_dispatch_queue)effectLoadingQueue
{
  return self->_effectLoadingQueue;
}

- (void)setEffectLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_effectLoadingQueue, a3);
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (void)setPreviewing:(BOOL)a3
{
  self->_previewing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectLoadingQueue, 0);
  objc_storeStrong((id *)&self->_effects, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_effectType, 0);
  objc_storeStrong((id *)&self->_previewBackgroundImage, 0);
}

@end
