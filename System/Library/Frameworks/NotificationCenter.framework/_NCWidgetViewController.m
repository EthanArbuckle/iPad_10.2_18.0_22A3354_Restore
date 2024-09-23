@implementation _NCWidgetViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550BB040);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550B3A50);
}

+ (void)initialize
{
  objc_class *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v3 = (objc_class *)objc_opt_class();
    NCSwizzleClassMethod(v3, sel_labelColor, sel_nc_labelColor);
    objc_msgSend(MEMORY[0x24BDF6C50], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyboardFencingEnabled:", 0);

    v5 = (void *)MEMORY[0x24BDF6E58];
    v24[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appearanceWhenContainedInInstancesOfClasses:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v9 = (void *)MEMORY[0x24BDF6E58];
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appearanceWhenContainedInInstancesOfClasses:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSeparatorInset:", *MEMORY[0x24BDF7DE0], 0.0, *MEMORY[0x24BDF7DE0], *MEMORY[0x24BDF7DE0]);

    v12 = (void *)MEMORY[0x24BDF6E60];
    v22 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appearanceWhenContainedInInstancesOfClasses:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    v16 = (void *)MEMORY[0x24BDF6B68];
    v21 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appearanceWhenContainedInInstancesOfClasses:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v19);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", a1, sel__reduceTransparencyDidChange_, *MEMORY[0x24BDF7318], 0);

    objc_msgSend(a1, "_reduceTransparencyDidChange:", 0);
  }
}

+ (void)_reduceTransparencyDidChange:(id)a3
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    if (dyld_program_sdk_at_least())
    {
      v13 = (void *)MEMORY[0x24BDF6E58];
      v56 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appearanceWhenContainedInInstancesOfClasses:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSeparatorColor:", v16);

      v17 = (void *)MEMORY[0x24BDF6E58];
      v55 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appearanceWhenContainedInInstancesOfClasses:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6F88], "widgetEffectForVibrancyStyle:", 120);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSeparatorEffect:", v20);

      v21 = objc_alloc(MEMORY[0x24BDF6FC8]);
      objc_msgSend(MEMORY[0x24BDF6F88], "widgetEffectForVibrancyStyle:", 112);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v21, "initWithEffect:", v22);

      objc_msgSend(v11, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBackgroundColor:", v24);

      v25 = (void *)MEMORY[0x24BDF6E60];
      v54 = objc_opt_class();
      v26 = (void *)MEMORY[0x24BDBCE30];
      v27 = &v54;
    }
    else
    {
      v28 = dyld_program_sdk_at_least();
      v29 = (void *)MEMORY[0x24BDF6E58];
      v30 = objc_opt_class();
      if (!v28)
      {
        v50 = v30;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "appearanceWhenContainedInInstancesOfClasses:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.52, 1.0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setSeparatorColor:", v47);

        v48 = (void *)MEMORY[0x24BDF6E58];
        v49 = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "appearanceWhenContainedInInstancesOfClasses:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6F88], "notificationCenterVibrancyEffect");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSeparatorEffect:", v44);
        goto LABEL_9;
      }
      v53 = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "appearanceWhenContainedInInstancesOfClasses:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("platterClientStyle"), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_visualStylingForStyle:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "color");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setSeparatorColor:", v35);

      v36 = (void *)MEMORY[0x24BDF6E58];
      v52 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "appearanceWhenContainedInInstancesOfClasses:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6F88], "widgetTertiaryVibrancyEffect");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setSeparatorEffect:", v39);

      v40 = objc_alloc(MEMORY[0x24BDF6FC8]);
      objc_msgSend(MEMORY[0x24BDF6F88], "widgetQuaternaryVibrancyEffect");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v40, "initWithEffect:", v41);

      objc_msgSend(v11, "contentView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "tintColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v43);

      v25 = (void *)MEMORY[0x24BDF6E60];
      v51 = objc_opt_class();
      v26 = (void *)MEMORY[0x24BDBCE30];
      v27 = &v51;
    }
    objc_msgSend(v26, "arrayWithObjects:count:", v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appearanceWhenContainedInInstancesOfClasses:", v12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_forSpringBoardSetDefaultSelectedBackgroundView:", v11);
LABEL_9:

    goto LABEL_10;
  }
  v3 = (void *)MEMORY[0x24BDF6E58];
  v59[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appearanceWhenContainedInInstancesOfClasses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "tableSeparatorLightColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorColor:", v6);

  v7 = (void *)MEMORY[0x24BDF6E58];
  v58 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appearanceWhenContainedInInstancesOfClasses:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSeparatorEffect:", 0);

  v10 = (void *)MEMORY[0x24BDF6E60];
  v57 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appearanceWhenContainedInInstancesOfClasses:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_forSpringBoardSetDefaultSelectedBackgroundView:", 0);
LABEL_10:

}

- (_NCWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  dispatch_queue_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NCWidgetViewController;
  v4 = -[_NCWidgetViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    NCRegisterWidgetsLogging();
    v5 = dispatch_queue_create("com.apple.NotificationCenter.RVCProxyQueue", 0);
    v6 = (void *)*((_QWORD *)v4 + 121);
    *((_QWORD *)v4 + 121) = v5;

    dispatch_suspend(*((dispatch_object_t *)v4 + 121));
    if (dyld_program_sdk_at_least())
    {
      v7 = *MEMORY[0x24BDF7718];
      v8 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    }
    else
    {
      v7 = xmmword_21995A1A0;
      v8 = xmmword_21995A1B0;
    }
    *((_OWORD *)v4 + 67) = v7;
    *((_OWORD *)v4 + 68) = v8;
    objc_msgSend(MEMORY[0x24BDF6C38], "_setPanGestureRecognizersEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v4 + 122);
    *((_QWORD *)v4 + 122) = v9;

    objc_msgSend(v4, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  }
  return (_NCWidgetViewController *)v4;
}

- (void)dealloc
{
  NSObject *remoteViewControllerProxyQueue;
  objc_super v4;

  remoteViewControllerProxyQueue = self->_remoteViewControllerProxyQueue;
  if (!dispatch_queue_get_specific(remoteViewControllerProxyQueue, "_NCWidgetHostViewControllerQueueIsEnabledTag"))
    dispatch_resume(remoteViewControllerProxyQueue);
  v4.receiver = self;
  v4.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController dealloc](&v4, sel_dealloc);
}

- (void)_enqueueProxyRequest:(id)a3
{
  id v4;
  NSObject *remoteViewControllerProxyQueue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    remoteViewControllerProxyQueue = self->_remoteViewControllerProxyQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48___NCWidgetViewController__enqueueProxyRequest___block_invoke;
    block[3] = &unk_24DB73EA8;
    v7 = v4;
    objc_copyWeak(&v8, &location);
    dispatch_async(remoteViewControllerProxyQueue, block);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }

}

- (void)_setContentProvidingViewController:(id)a3
{
  id v5;
  void *v6;
  id *p_contentProvidingViewController;
  _BOOL4 v8;
  char v9;
  char v10;
  char v11;
  char v12;

  v5 = a3;
  v6 = v5;
  p_contentProvidingViewController = (id *)&self->_contentProvidingViewController;
  if (!self->_contentProvidingViewController)
  {
    v8 = 1;
    if (!v5)
      goto LABEL_21;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_ERROR))
    -[_NCWidgetViewController _setContentProvidingViewController:].cold.1();
  v8 = *p_contentProvidingViewController == 0;
  if (v6)
  {
LABEL_7:
    if (v8)
    {
      objc_storeStrong((id *)&self->_contentProvidingViewController, a3);
      objc_msgSend(*p_contentProvidingViewController, "setViewRespectsSystemMinimumLayoutMargins:", 0);
      objc_msgSend(*p_contentProvidingViewController, "willMoveToParentViewController:", self);
      -[_NCWidgetViewController addChildViewController:](self, "addChildViewController:", *p_contentProvidingViewController);
      *(_BYTE *)&self->_contentProvidingViewControllerFlags = *(_BYTE *)&self->_contentProvidingViewControllerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = 2;
      else
        v9 = 0;
      *(_BYTE *)&self->_contentProvidingViewControllerFlags = *(_BYTE *)&self->_contentProvidingViewControllerFlags & 0xFD | v9;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 4;
      else
        v10 = 0;
      *(_BYTE *)&self->_contentProvidingViewControllerFlags = *(_BYTE *)&self->_contentProvidingViewControllerFlags & 0xFB | v10;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = 8;
      else
        v11 = 0;
      *(_BYTE *)&self->_contentProvidingViewControllerFlags = *(_BYTE *)&self->_contentProvidingViewControllerFlags & 0xF7 | v11;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 16;
      else
        v12 = 0;
      *(_BYTE *)&self->_contentProvidingViewControllerFlags = *(_BYTE *)&self->_contentProvidingViewControllerFlags & 0xEF | v12;
    }
  }
LABEL_21:

}

- (void)_requestMarginInsets
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  if ((dyld_program_sdk_at_least() & 1) == 0 && (*(_BYTE *)&self->_contentProvidingViewControllerFlags & 2) != 0)
  {
    -[NCWidgetProvidingPrivate widgetMarginInsetsForProposedMarginInsets:](self->_contentProvidingViewController, "widgetMarginInsetsForProposedMarginInsets:", self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
    self->_clientMarginInsets.top = v3;
    self->_clientMarginInsets.left = v4;
    self->_clientMarginInsets.bottom = v5;
    self->_clientMarginInsets.right = v6;
  }
}

- (void)_processInputItems:(id)a3 initialActiveDisplayMode:(int64_t *)a4
{
  id v6;
  _QWORD v7[16];
  _QWORD v8[3];
  char v9;
  _QWORD v10[3];
  char v11;
  _QWORD v12[3];
  char v13;
  _QWORD v14[3];
  char v15;
  _QWORD v16[3];
  char v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[3];
  char v27;

  v6 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = dyld_program_sdk_at_least();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71___NCWidgetViewController__processInputItems_initialActiveDisplayMode___block_invoke;
  v7[3] = &unk_24DB73ED0;
  v7[4] = self;
  v7[5] = v26;
  v7[6] = v24;
  v7[7] = v22;
  v7[8] = v20;
  v7[9] = v18;
  v7[10] = v16;
  v7[11] = v14;
  v7[12] = v12;
  v7[13] = v10;
  v7[14] = v8;
  v7[15] = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _QWORD v19[5];
  int64_t v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _NCWidgetViewController *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)_NCWidgetViewController;
    -[_NCWidgetViewController beginRequestWithExtensionContext:](&v21, sel_beginRequestWithExtensionContext_, v4);
    objc_msgSend(v4, "_setHostViewController:", self);
    -[_NCWidgetViewController childViewControllers](self, "childViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _setContentProvidingViewController:](self, "_setContentProvidingViewController:", v6);

    if (!self->_contentProvidingViewController)
    {
      v7 = NCLogWidgets;
      if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219951000, v7, OS_LOG_TYPE_DEFAULT, "No content providing view controller found", buf, 2u);
      }
    }
    v20 = 0;
    objc_msgSend(v4, "inputItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _processInputItems:initialActiveDisplayMode:](self, "_processInputItems:initialActiveDisplayMode:", v8, &v20);

    v9 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2050;
      v25 = self;
      v26 = 2114;
      v27 = v12;
      _os_log_impl(&dword_219951000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Beginning request",
        buf,
        0x20u);

    }
    -[NCWidgetProvidingPrivate beginRequestWithExtensionContext:](self->_contentProvidingViewController, "beginRequestWithExtensionContext:", v4);
    -[_NCWidgetViewController _setVisibilityState:force:](self, "_setVisibilityState:force:", self->_visibilityState, 1);
    -[_NCWidgetViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v13 = -[_NCWidgetViewController _clientLargestSupportedDisplayMode](self, "_clientLargestSupportedDisplayMode");
    v14 = v20;
    if (v13 == -1)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __60___NCWidgetViewController_beginRequestWithExtensionContext___block_invoke;
      v19[3] = &__block_descriptor_40_e33_v16__0___NCWidgetViewController_8l;
      v19[4] = v20;
      -[_NCWidgetViewController _enqueueProxyRequest:](self, "_enqueueProxyRequest:", v19);
    }
    else if (v20 >= v13)
    {
      v14 = v13;
    }
    -[_NCWidgetViewController _setActiveDisplayMode:unconditionallyNotifyingContentProvidingViewController:](self, "_setActiveDisplayMode:unconditionallyNotifyingContentProvidingViewController:", v14, 1);
  }
  else
  {
    v15 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_219951000, v16, OS_LOG_TYPE_DEFAULT, "Extension context of unexpected class (%{public}@)", buf, 0xCu);

    }
  }

}

- (void)loadView
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _NCWidgetViewControllerView *v7;
  void *v8;
  _NCWidgetViewControllerView *v9;
  int v10;
  void *v11;
  __int16 v12;
  _NCWidgetViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2050;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_219951000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Loading view",
      (uint8_t *)&v10,
      0x20u);

  }
  v7 = [_NCWidgetViewControllerView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = -[_NCWidgetViewControllerView initWithFrame:](v7, "initWithFrame:");

  -[_NCWidgetViewControllerView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
  -[NCSizeObservingView setDelegate:](v9, "setDelegate:", self);
  -[_NCWidgetViewController setView:](self, "setView:", v9);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIScrollViewDelayedTouchesBeganGestureRecognizer *v5;
  UIScrollViewDelayedTouchesBeganGestureRecognizer *touchDelayGestureRecognizer;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *v12;
  UIView *contentView;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIView *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[_NCWidgetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizesSubviews:", 1);
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  v5 = (UIScrollViewDelayedTouchesBeganGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D58]), "initWithTarget:action:", self, sel_delayed_);
  touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
  self->_touchDelayGestureRecognizer = v5;

  -[UIScrollViewDelayedTouchesBeganGestureRecognizer setDelaysTouchesBegan:](self->_touchDelayGestureRecognizer, "setDelaysTouchesBegan:", 1);
  objc_msgSend(v3, "addGestureRecognizer:", self->_touchDelayGestureRecognizer);
  -[_NCWidgetViewController _requestMarginInsets](self, "_requestMarginInsets");
  SanitizedClientFrameFromHostSize(self->_initialBounds.size.width, self->_initialBounds.size.height, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
  v8 = v7;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v9, v10, v11, v7);
  contentView = self->_contentView;
  self->_contentView = v12;

  -[_NCWidgetViewController _requestPreferredViewHeight:](self, "_requestPreferredViewHeight:", v8);
  -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
  -[UIView setAutoresizesSubviews:](self->_contentView, "setAutoresizesSubviews:", 1);
  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 0);
  -[UIView setInsetsLayoutMarginsFromSafeArea:](self->_contentView, "setInsetsLayoutMarginsFromSafeArea:", 0);
  v14 = *MEMORY[0x24BDF7718];
  v15 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v16 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v17 = *(double *)(MEMORY[0x24BDF7718] + 24);
  -[UIView setLayoutMargins:](self->_contentView, "setLayoutMargins:", *MEMORY[0x24BDF7718], v15, v16, v17);
  -[UIView setPreservesSuperviewLayoutMargins:](self->_contentView, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v3, "addSubview:", self->_contentView);
  -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLayoutMargins:", v14, v15, v16, v17);

  -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreservesSuperviewLayoutMargins:", 1);

  -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_contentView, "bounds");
  objc_msgSend(v21, "setFrame:");

  -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAutoresizingMask:", 18);

  v23 = self->_contentView;
  -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v23, "addSubview:", v24);

  objc_msgSend(v3, "setLayoutMargins:", self->_initialLayoutMargins.top, self->_initialLayoutMargins.left, self->_initialLayoutMargins.bottom, self->_initialLayoutMargins.right);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)_closeTransactionWithAppearState:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMapTable *wrappedAppearStatesToOpenTransactionIDs;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSMapTable *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  int v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _NCWidgetViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v3 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v25 = v7;
    v26 = 2050;
    v27 = self;
    v28 = 2114;
    v29 = v8;
    v30 = 1026;
    v31 = v3;
    v32 = 1026;
    v33 = -[_NCWidgetViewController _appearState](self, "_appearState");
    _os_log_impl(&dword_219951000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Attempting to close transaction with appear state '%{public}d' (cu"
      "rrent appear state '%{public}d')",
      buf,
      0x2Cu);

  }
  wrappedAppearStatesToOpenTransactionIDs = self->_wrappedAppearStatesToOpenTransactionIDs;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](wrappedAppearStatesToOpenTransactionIDs, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __60___NCWidgetViewController__closeTransactionWithAppearState___block_invoke;
    v21 = &unk_24DB73F18;
    v23 = v3;
    v22 = v11;
    -[_NCWidgetViewController _enqueueProxyRequest:](self, "_enqueueProxyRequest:", &v18);

  }
  else
  {
    v12 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v14;
      v26 = 2050;
      v27 = self;
      v28 = 2114;
      v29 = v15;
      v30 = 1026;
      v31 = v3;
      _os_log_impl(&dword_219951000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No open appearance transaction for state '%{public}d' to close",
        buf,
        0x26u);

    }
  }
  v16 = self->_wrappedAppearStatesToOpenTransactionIDs;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3, v18, v19, v20, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](v16, "removeObjectForKey:", v17);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *remoteViewControllerProxyQueue;
  void *v10;
  _QWORD v11[4];
  id v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  _NCWidgetViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v7;
    v16 = 2050;
    v17 = self;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_219951000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View will appear",
      buf,
      0x20u);

  }
  remoteViewControllerProxyQueue = self->_remoteViewControllerProxyQueue;
  if (!dispatch_queue_get_specific(remoteViewControllerProxyQueue, "_NCWidgetHostViewControllerQueueIsEnabledTag"))
  {
    dispatch_queue_set_specific(remoteViewControllerProxyQueue, "_NCWidgetHostViewControllerQueueIsEnabledTag", (void *)1, 0);
    dispatch_resume((dispatch_object_t)self->_remoteViewControllerProxyQueue);
  }
  v13.receiver = self;
  v13.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);
  -[NCWidgetProvidingPrivate beginAppearanceTransition:animated:](self->_contentProvidingViewController, "beginAppearanceTransition:animated:", 1, v3);
  objc_initWeak((id *)buf, self);
  v10 = (void *)*MEMORY[0x24BDF74F8];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42___NCWidgetViewController_viewWillAppear___block_invoke;
  v11[3] = &unk_24DB73F40;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v10, "_performBlockAfterCATransactionCommits:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  _NCWidgetViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v11 = v7;
    v12 = 2050;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_219951000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View did appear",
      buf,
      0x20u);

  }
  v9.receiver = self;
  v9.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController viewDidAppear:](&v9, sel_viewDidAppear_, v3);
  -[NCWidgetProvidingPrivate endAppearanceTransition](self->_contentProvidingViewController, "endAppearanceTransition");
  -[_NCWidgetViewController _closeTransactionWithAppearState:](self, "_closeTransactionWithAppearState:", 2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  _NCWidgetViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v11 = v7;
    v12 = 2050;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_219951000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View will disappear",
      buf,
      0x20u);

  }
  v9.receiver = self;
  v9.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, v3);
  -[NCWidgetProvidingPrivate beginAppearanceTransition:animated:](self->_contentProvidingViewController, "beginAppearanceTransition:animated:", 0, v3);
  -[_NCWidgetViewController _closeTransactionWithAppearState:](self, "_closeTransactionWithAppearState:", 3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  _NCWidgetViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v11 = v7;
    v12 = 2050;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_219951000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> View did disappear",
      buf,
      0x20u);

  }
  v9.receiver = self;
  v9.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, v3);
  -[NCWidgetProvidingPrivate endAppearanceTransition](self->_contentProvidingViewController, "endAppearanceTransition");
  -[_NCWidgetViewController _closeTransactionWithAppearState:](self, "_closeTransactionWithAppearState:", 0);
}

- (double)_effectiveHeightForRequestedHeight:(double)a3
{
  return self->_clientMarginInsets.top + a3 + self->_clientMarginInsets.bottom;
}

- (void)_requestPreferredViewHeight:(double)a3
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double width;
  double height;
  id v11;
  NCWidgetProvidingPrivate *contentProvidingViewController;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[5];
  CGRect v19;

  -[_NCWidgetViewController _effectiveHeightForRequestedHeight:](self, "_effectiveHeightForRequestedHeight:", a3);
  v5 = v4;
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke;
  v18[3] = &__block_descriptor_40_e33_v16__0___NCWidgetViewController_8l;
  *(double *)&v18[4] = v4;
  -[_NCWidgetViewController _enqueueProxyRequest:](self, "_enqueueProxyRequest:", v18);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    if (-[_NCWidgetViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIView frame](self->_contentView, "frame");
      SanitizedClientFrameFromHostSize(v7, v8, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
      width = v19.size.width;
      height = v19.size.height;
      if (CGRectGetHeight(v19) == v5)
      {
        v11 = objc_alloc_init(MEMORY[0x24BDF7178]);
        contentProvidingViewController = self->_contentProvidingViewController;
        objc_msgSend(v11, "_transitionCoordinator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCWidgetProvidingPrivate viewWillTransitionToSize:withTransitionCoordinator:](contentProvidingViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v13, width, height);

        if (self->_clientUsesAutolayout)
        {
          objc_initWeak(&location, self);
          objc_msgSend(v11, "_transitionCoordinator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v6;
          v15[1] = 3221225472;
          v15[2] = __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke_2;
          v15[3] = &unk_24DB73F68;
          objc_copyWeak(&v16, &location);
          objc_msgSend(v14, "animateAlongsideTransition:completion:", v15, 0);

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }
        objc_msgSend(v11, "__runAlongsideAnimations");
        objc_msgSend(v11, "completeTransition:", 1);

      }
    }
  }
}

- (double)_clientPreferredContentHeightPermittingAutolayout:(BOOL)a3 didUseFittingSize:(BOOL *)a4
{
  _BOOL4 v5;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double result;

  v5 = a3;
  -[NCWidgetProvidingPrivate preferredContentSize](self->_contentProvidingViewController, "preferredContentSize");
  if (v5 && fabs(v7) < 2.22044605e-16)
  {
    -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCWidgetProvidingPrivate view](self->_contentProvidingViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    LODWORD(v10) = 1148846080;
    LODWORD(v12) = 1112014848;
    objc_msgSend(v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v11, v13, v10, v12);

    if (a4)
      *a4 = 1;
  }
  NCMainScreenScale();
  UIRoundToScale();
  return result;
}

- (double)_clientPreferredContentHeight
{
  double result;

  -[_NCWidgetViewController _clientPreferredContentHeightPermittingAutolayout:didUseFittingSize:](self, "_clientPreferredContentHeightPermittingAutolayout:didUseFittingSize:", 0, 0);
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  if (self->_contentProvidingViewController == a3)
  {
    -[_NCWidgetViewController _clientPreferredContentHeight](self, "_clientPreferredContentHeight");
    -[_NCWidgetViewController _requestPreferredViewHeight:](self, "_requestPreferredViewHeight:");
  }
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  double v4;

  if (self->_contentProvidingViewController == a3)
  {
    objc_msgSend(a3, "preferredContentSize");
    if (fabs(v4) < 2.22044605e-16)
    {
      -[_NCWidgetViewController _clientPreferredContentHeightPermittingAutolayout:didUseFittingSize:](self, "_clientPreferredContentHeightPermittingAutolayout:didUseFittingSize:", 1, &self->_clientUsesAutolayout);
      -[_NCWidgetViewController _requestPreferredViewHeight:](self, "_requestPreferredViewHeight:");
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  _NCWidgetViewController *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGSize v28;
  CGRect v29;

  height = a3.height;
  width = a3.width;
  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28.width = width;
    v28.height = height;
    NSStringFromCGSize(v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v10;
    v21 = 2050;
    v22 = self;
    v23 = 2114;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_219951000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Transitioning to size: %{public}@",
      buf,
      0x2Au);

  }
  SanitizedClientFrameFromHostSize(width, height, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
  v13 = v29.size.width;
  v14 = v29.size.height;
  v15 = CGRectGetWidth(v29);
  -[_NCWidgetViewController _setMaximumWidth:forDisplayMode:](self, "_setMaximumWidth:forDisplayMode:", 0);
  -[_NCWidgetViewController _setMaximumWidth:forDisplayMode:](self, "_setMaximumWidth:forDisplayMode:", 1, v15);
  v18.receiver = self;
  v18.super_class = (Class)_NCWidgetViewController;
  -[_NCWidgetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, v13, v14);
  if (self->_clientUsesAutolayout)
  {
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78___NCWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v16[3] = &unk_24DB73F68;
    objc_copyWeak(&v17, (id *)buf);
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v16, 0);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_performUpdateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_contentProvidingViewControllerFlags & 1) != 0)
  {
    -[_NCWidgetViewController _contentProvidingViewController](self, "_contentProvidingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63___NCWidgetViewController__performUpdateWithCompletionHandler___block_invoke;
    v7[3] = &unk_24DB73F90;
    v8 = v5;
    objc_msgSend(v6, "widgetPerformUpdateWithCompletionHandler:", v7);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (void)_clientLargestSupportedDisplayModeDidChange
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = -[_NCWidgetViewController _clientLargestSupportedDisplayMode](self, "_clientLargestSupportedDisplayMode");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70___NCWidgetViewController__clientLargestSupportedDisplayModeDidChange__block_invoke;
  v4[3] = &__block_descriptor_40_e33_v16__0___NCWidgetViewController_8l;
  v4[4] = v3 & ~(v3 >> 63);
  -[_NCWidgetViewController _enqueueProxyRequest:](self, "_enqueueProxyRequest:", v4);
}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  uint64_t *p_contentView;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  UIView *contentView;
  int v22;
  void *v23;
  __int16 v24;
  _NCWidgetViewController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  UIView *v33;
  uint64_t v34;
  CGSize v35;
  CGSize v36;

  height = a4.height;
  width = a4.width;
  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEBUG))
  {
    v14 = v8;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35.width = width;
    v35.height = height;
    NSStringFromCGSize(v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v36.width = v18;
    v36.height = v19;
    NSStringFromCGSize(v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    contentView = self->_contentView;
    v22 = 138544642;
    v23 = v15;
    v24 = 2050;
    v25 = self;
    v26 = 2114;
    v27 = v16;
    v28 = 2114;
    v29 = v17;
    v30 = 2114;
    v31 = v20;
    v32 = 2114;
    v33 = contentView;
    _os_log_debug_impl(&dword_219951000, v14, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p; container: %{public}@> View did change from size: %{public}@; to size: %{public}@; _conte"
      "ntView: %{public}@",
      (uint8_t *)&v22,
      0x3Eu);

  }
  p_contentView = (uint64_t *)&self->_contentView;
  if (!-[UIView autoresizingMask](self->_contentView, "autoresizingMask"))
  {
    v10 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEBUG))
      -[_NCWidgetViewController sizeObservingView:didChangeSize:].cold.1(v10, self, p_contentView);
    v11 = (void *)*p_contentView;
    objc_msgSend(v7, "bounds");
    SanitizedClientFrameFromHostSize(v12, v13, self->_clientMarginInsets.top, self->_clientMarginInsets.left, self->_clientMarginInsets.bottom, self->_clientMarginInsets.right);
    objc_msgSend(v11, "setFrame:");
    objc_msgSend((id)*p_contentView, "setAutoresizingMask:", 18);
  }

}

- (void)_encodeLayerTreeToURL:(id)a3 withCodingImageFormat:(id)a4 withReplyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double Width;
  double v30;
  double Height;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    dispatch_get_global_queue(17, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_snapshotTimestampsEnabled)
    {
      v13 = objc_alloc_init(MEMORY[0x24BDF6B68]);
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = (void *)MEMORY[0x24BDD1500];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringFromDate:dateStyle:timeStyle:", v16, 1, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("snapshot - %@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v18);

      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextColor:", v19);

      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v20);

      objc_msgSend(v13, "sizeToFit");
      objc_msgSend(v12, "addSubview:", v13);
      objc_msgSend(v13, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v12, "bounds");
      Width = CGRectGetWidth(v46);
      v47.origin.x = v22;
      v47.origin.y = v24;
      v47.size.width = v26;
      v47.size.height = v28;
      v30 = Width - CGRectGetWidth(v47);
      objc_msgSend(v12, "bounds");
      Height = CGRectGetHeight(v48);
      v49.origin.x = v22;
      v49.origin.y = v24;
      v49.size.width = v26;
      v49.size.height = v28;
      objc_msgSend(v13, "setFrame:", v30, Height - CGRectGetHeight(v49), v26, v28);
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v12, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v8 && v11 && v32)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke;
      block[3] = &unk_24DB74008;
      v39 = v32;
      v40 = v8;
      v41 = v9;
      v42 = v13;
      v43 = v10;
      dispatch_async(v11, block);

      v34 = v39;
    }
    else
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no layer to encode (%@), we failed to obtain a queue (%@), or no URL was provided (%@)"), v32, v11, v8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("NCWidgetErrorDomain"), 3, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v37);

    }
  }

}

- (int64_t)_clientLargestSupportedDisplayMode
{
  void *v3;
  int64_t v4;

  if (!dyld_program_sdk_at_least())
    return 1;
  -[_NCWidgetViewController _widgetExtensionContext](self, "_widgetExtensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_largestAvailableDisplayMode");

  return v4;
}

- (void)_notifyContentProvidingViewControllerOfActiveDisplayModeChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  _NCWidgetViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_contentProvidingViewControllerFlags & 4) != 0)
  {
    -[_NCWidgetViewController _widgetExtensionContext](self, "_widgetExtensionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_activeDisplayMode");
    v5 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NCStringFromWidgetDisplayMode(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544130;
      v12 = v7;
      v13 = 2050;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_219951000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Notifying content providing view controller of active display mo"
        "de change: %{public}@",
        (uint8_t *)&v11,
        0x2Au);

    }
    -[_NCWidgetViewController _contentProvidingViewController](self, "_contentProvidingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_maximumSizeForDisplayMode:", v4);
    objc_msgSend(v10, "widgetActiveDisplayModeDidChange:withMaximumSize:", v4);

  }
}

- (void)_setActiveDisplayMode:(int64_t)a3 unconditionallyNotifyingContentProvidingViewController:(BOOL)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  _NCWidgetViewController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NCStringFromWidgetDisplayMode(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v9;
    v16 = 2050;
    v17 = self;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_219951000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Setting active display mode: %{public}@",
      (uint8_t *)&v14,
      0x2Au);

  }
  -[_NCWidgetViewController _widgetExtensionContext](self, "_widgetExtensionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_activeDisplayMode");
  objc_msgSend(v12, "_setActiveDisplayMode:", a3);
  if (a4 || v13 != objc_msgSend(v12, "_activeDisplayMode"))
    -[_NCWidgetViewController _notifyContentProvidingViewControllerOfActiveDisplayModeChange](self, "_notifyContentProvidingViewControllerOfActiveDisplayModeChange");

}

- (void)_setMaximumWidth:(double)a3 forDisplayMode:(int64_t)a4
{
  void *v7;
  double v8;
  double v9;
  id v10;

  -[_NCWidgetViewController _widgetExtensionContext](self, "_widgetExtensionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_maximumSizeForDisplayMode:", a4);
  v9 = v8;

  -[_NCWidgetViewController _widgetExtensionContext](self, "_widgetExtensionContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setMaximumSize:forDisplayMode:", a4, a3, v9);

}

- (void)_setVisibilityState:(int64_t)a3 force:(BOOL)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _NCWidgetViewController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a4 || self->_visibilityState != a3)
  {
    self->_visibilityState = a3;
    if ((*(_BYTE *)&self->_contentProvidingViewControllerFlags & 8) != 0)
    {
      v5 = (void *)NCLogWidgets;
      if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v5;
        -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NCStringFromWidgetVisibilityState(self->_visibilityState);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138544130;
        v11 = v7;
        v12 = 2050;
        v13 = self;
        v14 = 2114;
        v15 = v8;
        v16 = 2114;
        v17 = v9;
        _os_log_impl(&dword_219951000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Updating visibility state: %{public}@",
          (uint8_t *)&v10,
          0x2Au);

      }
      -[NCWidgetProvidingPrivate widgetDidBecomeForeground:](self->_contentProvidingViewController, "widgetDidBecomeForeground:", self->_visibilityState == 1);
    }
  }
}

- (void)_setVisibilityState:(int64_t)a3
{
  -[_NCWidgetViewController _setVisibilityState:force:](self, "_setVisibilityState:force:", a3, 0);
}

- (BOOL)_setVisibleFrame:(CGRect)a3
{
  $0E4DB4B6D3D371CDD2C960DF20F7ED59 contentProvidingViewControllerFlags;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v16;
  void *v17;
  __int16 v18;
  _NCWidgetViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  CGRect v25;

  v24 = *MEMORY[0x24BDAC8D0];
  contentProvidingViewControllerFlags = self->_contentProvidingViewControllerFlags;
  if ((*(_BYTE *)&contentProvidingViewControllerFlags & 0x10) != 0)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v9 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      NSStringFromCGRect(v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v11;
      v18 = 2050;
      v19 = self;
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_219951000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Updating visibility frame: %{public}@",
        (uint8_t *)&v16,
        0x2Au);

    }
    -[NCWidgetProvidingPrivate widgetVisibleFrameDidChange:](self->_contentProvidingViewController, "widgetVisibleFrameDidChange:", x, y, width, height);
  }
  return (*(unsigned int *)&contentProvidingViewControllerFlags >> 4) & 1;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 1;
}

- (void)__setActiveDisplayMode:(int64_t)a3
{
  -[_NCWidgetViewController _setActiveDisplayMode:unconditionallyNotifyingContentProvidingViewController:](self, "_setActiveDisplayMode:unconditionallyNotifyingContentProvidingViewController:", a3, 0);
}

- (void)__setMaximumSize:(CGSize)a3 forDisplayMode:(int64_t)a4
{
  double height;
  double width;
  id v7;

  height = a3.height;
  width = a3.width;
  -[_NCWidgetViewController _widgetExtensionContext](self, "_widgetExtensionContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setMaximumSize:forDisplayMode:", a4, width, height);

}

- (void)__requestEncodedLayerTreeToURL:(id)a3 withCodingImageFormat:(id)a4 withReplyHandler:(id)a5
{
  if (a5)
    -[_NCWidgetViewController _encodeLayerTreeToURL:withCodingImageFormat:withReplyHandler:](self, "_encodeLayerTreeToURL:withCodingImageFormat:withReplyHandler:", a3, a4);
}

- (void)__performUpdateWithReplyHandler:(id)a3
{
  if (a3)
    -[_NCWidgetViewController _performUpdateWithCompletionHandler:](self, "_performUpdateWithCompletionHandler:");
}

- (void)__openTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  NSMapTable **p_wrappedAppearStatesToOpenTransactionIDs;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMapTable *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  _NCWidgetViewController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = *(_QWORD *)&a3;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  p_wrappedAppearStatesToOpenTransactionIDs = &self->_wrappedAppearStatesToOpenTransactionIDs;
  if (-[NSMapTable count](self->_wrappedAppearStatesToOpenTransactionIDs, "count") >= 2)
  {
    v8 = (void *)NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_ERROR))
      -[_NCWidgetViewController __openTransactionForAppearanceCallWithState:withIdentifier:].cold.1((void **)&self->_wrappedAppearStatesToOpenTransactionIDs, v8);
  }
  v9 = (void *)-[NSMapTable copy](*p_wrappedAppearStatesToOpenTransactionIDs, "copy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        -[_NCWidgetViewController _closeTransactionWithAppearState:](self, "_closeTransactionWithAppearState:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14++), "integerValue", (_QWORD)v21));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    }
    while (v12);
  }

  v15 = *p_wrappedAppearStatesToOpenTransactionIDs;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v15, "setObject:forKey:", v6, v16);

  v17 = (void *)NCLogWidgets;
  if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    -[_NCWidgetViewController _widgetIdentifier](self, "_widgetIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NCWidgetViewController _containerIdentifier](self, "_containerIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = v19;
    v27 = 2050;
    v28 = self;
    v29 = 2114;
    v30 = v20;
    v31 = 1026;
    v32 = v4;
    v33 = 2114;
    v34 = v6;
    _os_log_impl(&dword_219951000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Opened appearance transaction with state: %{public}d; identifier: %{public}@",
      buf,
      0x30u);

  }
}

- (void)__updateVisibleFrame:(CGRect)a3 withReplyHandler:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v9;
  void *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v9 = -[_NCWidgetViewController _setVisibleFrame:](self, "_setVisibleFrame:", x, y, width, height);
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, _BOOL8))v11 + 2))(v11, v9);
    v10 = v11;
  }

}

- (void)__updateLayoutMargins:(id)a3
{
  void *v4;
  NSString *string;
  UIEdgeInsets v6;

  string = (NSString *)a3;
  if (-[NSString length](string, "length"))
  {
    -[_NCWidgetViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = UIEdgeInsetsFromString(string);
    objc_msgSend(v4, "setLayoutMargins:", v6.top, v6.left, v6.bottom, v6.right);

  }
}

- (NCWidgetProvidingPrivate)_contentProvidingViewController
{
  return self->_contentProvidingViewController;
}

- (void)setContentProvidingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentProvidingViewController, a3);
}

- (int64_t)_visibilityState
{
  return self->_visibilityState;
}

- (UIView)_contentView
{
  return self->_contentView;
}

- (void)_setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIEdgeInsets)_clientMarginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_clientMarginInsets.top;
  left = self->_clientMarginInsets.left;
  bottom = self->_clientMarginInsets.bottom;
  right = self->_clientMarginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setClientMarginInsets:(UIEdgeInsets)a3
{
  self->_clientMarginInsets = a3;
}

- (UIEdgeInsets)_initialLayoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_initialLayoutMargins.top;
  left = self->_initialLayoutMargins.left;
  bottom = self->_initialLayoutMargins.bottom;
  right = self->_initialLayoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setInitialLayoutMargins:(UIEdgeInsets)a3
{
  self->_initialLayoutMargins = a3;
}

- (NSString)_widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSString)_containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentProvidingViewController, 0);
  objc_storeStrong((id *)&self->_touchDelayGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_wrappedAppearStatesToOpenTransactionIDs, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerProxyQueue, 0);
}

- (void)_setContentProvidingViewController:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219951000, v0, (uint64_t)v0, "Attempt to set content providing VC (%{public}@) when one already exists (%{public}@)", v1);
}

- (void)sizeObservingView:(uint64_t *)a3 didChangeSize:.cold.1(void *a1, void *a2, uint64_t *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "_widgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "_containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  v9 = 138544130;
  v10 = v6;
  v11 = 2050;
  v12 = a2;
  v13 = 2114;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  _os_log_debug_impl(&dword_219951000, v5, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p; container: %{public}@> Updating content view autoresizing mask: %{public}@",
    (uint8_t *)&v9,
    0x2Au);

}

- (void)__openTransactionForAppearanceCallWithState:(void *)a1 withIdentifier:(void *)a2 .cold.1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219951000, v3, v4, "have %{public}lu open appearance transactions (expected 0 or 1): %{public}@", v5);

}

@end
