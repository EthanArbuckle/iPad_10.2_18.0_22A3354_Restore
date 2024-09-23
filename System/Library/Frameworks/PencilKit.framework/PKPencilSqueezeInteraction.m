@implementation PKPencilSqueezeInteraction

+ (id)_existingInteractionForWindowScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Feature Flag isn't enabled!", v8, 2u);
    }

    goto LABEL_7;
  }
  if (!v3)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  +[PKPencilSqueezeInteraction _perSceneInteractions](PKPencilSqueezeInteraction, "_perSceneInteractions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v5;
}

+ (id)_perSceneInteractions
{
  if (qword_1ECEE6358 != -1)
    dispatch_once(&qword_1ECEE6358, &__block_literal_global_59);
  return (id)_MergedGlobals_143;
}

void __51__PKPencilSqueezeInteraction__perSceneInteractions__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_143;
  _MergedGlobals_143 = v0;

}

+ (void)_postPencilSettingsDidChangeRemoteNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PKRemotePencilSettingsDidChangePreferredSqueezeActionNotification"), 0, 0, 1u);
}

- (PKPencilSqueezeInteraction)init
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  PKPencilSqueezeInteraction *v6;
  PKPencilSqueezeInteraction *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v10;
  uint8_t buf[4];
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Feature Flag isn't enabled!", buf, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();

  if ((-[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.Stickers.UserGenerated.MessagesExtension")) & 1) != 0|| (-[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.iMessageAppsViewService")) & 1) != 0|| -[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.UIKit.ColorPickerUIService")))
  {
    v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v12 = v4;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Can't init interaction in process: %{private}@", buf, 0xCu);
    }

LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v10.receiver = self;
  v10.super_class = (Class)PKPencilSqueezeInteraction;
  v8 = -[PKPencilSqueezeInteraction init](&v10, sel_init);
  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_PKHandleRemotePencilSettingDidChangeNotification, CFSTR("PKRemotePencilSettingsDidChangePreferredSqueezeActionNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  self = v8;
  v6 = self;
LABEL_11:

  return v6;
}

- (void)set_delegate:(id)a3
{
  id v4;
  PKPencilSqueezeInteractionDelegate **p_delegate;
  id WeakRetained;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_delegate = &self->__delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != v4)
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      v9 = 138478083;
      v10 = v8;
      v11 = 2113;
      v12 = v4;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Updating delegate from: %{private}@ to %{private}@", (uint8_t *)&v9, 0x16u);

    }
    objc_storeWeak((id *)p_delegate, v4);
  }

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("PKRemotePencilSettingsDidChangePreferredSqueezeActionNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)PKPencilSqueezeInteraction;
  -[PKPencilSqueezeInteraction dealloc](&v4, sel_dealloc);
}

- (void)_performSqueezeAction
{
  -[PKPencilSqueezeController performSqueezeAction]((uint64_t)self->_squeezeController);
}

- (void)_setMiniPaletteVisible:(BOOL)a3 hoverLocation:(CGPoint)a4 inView:(id)a5
{
  _BOOL8 v5;
  double v7;
  double v8;

  v5 = a3;
  objc_msgSend(a5, "convertPoint:toView:", 0, a4.x, a4.y);
  -[PKPencilSqueezeController setMiniPaletteVisible:hoverLocation:]((uint64_t)self->_squeezeController, v5, v7, v8);
}

- (BOOL)_paletteViewVisible
{
  PKPencilSqueezeController *squeezeController;

  squeezeController = self->_squeezeController;
  return squeezeController && squeezeController->_paletteViewVisible;
}

- (void)_updateUserInterfaceStyle
{
  -[PKPencilSqueezeController updateUserInterfaceStyle]((uint64_t)self->_squeezeController);
}

- (void)_handleRemotePencilSettingDidChangeNotification
{
  -[PKPencilSqueezeController pencilSettingsDidChange]((uint64_t)self->_squeezeController);
}

- (void)willMoveToView:(id)a3
{
  id v4;
  UIView **p_view;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (v4 && !WeakRetained)
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138478083;
      v23 = v4;
      v24 = 2113;
      v25 = v9;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Installing interaction on view: %{private}@, scene: %{private}@", (uint8_t *)&v22, 0x16u);

    }
    objc_msgSend(v4, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        _os_log_fault_impl(&dword_1BE213000, v12, OS_LOG_TYPE_FAULT, "windowScene must not be nil when installing an interaction.", (uint8_t *)&v22, 2u);
      }

    }
    +[PKPencilSqueezeInteraction _perSceneInteractions](PKPencilSqueezeInteraction, "_perSceneInteractions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", self, v15);
LABEL_15:

    goto LABEL_16;
  }
  v16 = objc_loadWeakRetained((id *)&self->_view);

  if (!v4 && v16)
  {
    v17 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v18, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "windowScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138478083;
      v23 = v18;
      v24 = 2113;
      v25 = v20;
      _os_log_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEFAULT, "Uninstalling interaction from view: %{private}@, scene: %{private}@", (uint8_t *)&v22, 0x16u);

    }
    +[PKPencilSqueezeInteraction _perSceneInteractions](PKPencilSqueezeInteraction, "_perSceneInteractions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v21);

    goto LABEL_15;
  }
LABEL_16:
  objc_storeWeak((id *)p_view, v4);

}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  PKPencilSqueezeController *squeezeController;
  void *v7;
  PKPencilSqueezeController *v8;
  PKPencilSqueezeController *v9;
  PKTextEffectsWindowObserver *v10;
  id v11;
  void *v12;
  PKTextEffectsWindowObserver *v13;
  void *v14;
  void *v15;
  PKTextEffectsWindowObserver *v16;
  PKTextEffectsWindowObserver *textEffectsWindowObserver;
  PKTextEffectsWindowObserver **p_textEffectsWindowObserver;
  id v19;
  void *v20;
  PKPencilSqueezeController *v21;
  id v22;
  PKPencilSqueezeController *v23;
  PKPencilSqueezeController *v24;
  PKPencilSqueezeController *v25;
  id v26;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    squeezeController = self->_squeezeController;

    if (!squeezeController)
    {
      v11 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [PKTextEffectsWindowObserver alloc];
        v14 = objc_loadWeakRetained((id *)p_view);
        objc_msgSend(v14, "window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (PKTextEffectsWindowObserver *)-[PKTextEffectsWindowObserver initWithTextEffectsWindow:](v13, v15);
        p_textEffectsWindowObserver = &self->_textEffectsWindowObserver;
        textEffectsWindowObserver = self->_textEffectsWindowObserver;
        self->_textEffectsWindowObserver = v16;

      }
      else
      {
        p_textEffectsWindowObserver = &self->_textEffectsWindowObserver;
        v14 = self->_textEffectsWindowObserver;
        self->_textEffectsWindowObserver = 0;
      }

      if (*p_textEffectsWindowObserver)
        objc_storeWeak((id *)&(*p_textEffectsWindowObserver)->_delegate, self);
      v19 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v19, "window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rootViewController");
      v26 = (id)objc_claimAutoreleasedReturnValue();

      v21 = [PKPencilSqueezeController alloc];
      v22 = objc_loadWeakRetained((id *)p_view);
      v23 = (PKPencilSqueezeController *)-[PKPencilSqueezeController initWithContainerView:rootViewController:textEffectsWindowObserver:](v21, v22, v26, self->_textEffectsWindowObserver);
      v24 = self->_squeezeController;
      self->_squeezeController = v23;

      v25 = self->_squeezeController;
      if (v25)
        objc_storeWeak((id *)&v25->_delegate, self);
      v7 = v26;
      goto LABEL_16;
    }
  }
  v7 = objc_loadWeakRetained((id *)p_view);
  if (v7)
  {
LABEL_16:

    return;
  }
  v8 = self->_squeezeController;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, 0);
    v9 = self->_squeezeController;
    self->_squeezeController = 0;

    v10 = self->_textEffectsWindowObserver;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_delegate, 0);
      v7 = self->_textEffectsWindowObserver;
    }
    else
    {
      v7 = 0;
    }
    self->_textEffectsWindowObserver = 0;
    goto LABEL_16;
  }
}

- (BOOL)_isPointInsidePaletteView:(CGPoint)a3 fromView:(id)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  if (-[PKPencilSqueezeInteraction _paletteViewVisible](self, "_paletteViewVisible"))
  {
    objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
    -[PKPencilSqueezeController hitTest:fromView:withEvent:]((uint64_t)self->_squeezeController, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = *MEMORY[0x1E0C80C00];
  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    NSStringFromCGRect(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138477827;
    v11 = v9;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "editing overlay container did change to scene bounds: %{private}@", (uint8_t *)&v10, 0xCu);

  }
  -[PKPencilSqueezeController keyWindowDidChangeBounds]((uint64_t)self->_squeezeController);
}

- (void)textEffectsWindowDidChangeKeyWindowBounds:(id)a3
{
  -[PKPencilSqueezeController keyWindowDidChangeBounds]((uint64_t)self->_squeezeController);
}

- (void)textEffectsWindowDidChangeKeyWindowUserInterfaceStyle:(id)a3
{
  -[PKPencilSqueezeController updateUserInterfaceStyle]((uint64_t)self->_squeezeController);
}

- (BOOL)pencilSqueezeControllerCanShowPaletteView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[PKPencilSqueezeInteraction _delegate](self, "_delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  -[PKPencilSqueezeInteraction _delegate](self, "_delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_pencilSqueezeInteractionCanShowPaletteView:", self);

  return v7;
}

- (void)pencilSqueezeControllerWillChangePaletteViewVisibility:(id)a3 toVisible:(BOOL)a4
{
  _BOOL4 v4;
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a4;
  v6 = a3;
  v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Post palette view visibility will change notification", v10, 2u);
  }

  if (!v6)
  {
    if (!v4)
      goto LABEL_10;
    goto LABEL_6;
  }
  if (!v6[208] && v4)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("PKPencilSqueezeInteractionWillShowPaletteViewNotification"), self);

    goto LABEL_10;
  }
  if (v6[208] && !v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("PKPencilSqueezeInteractionWillHidePaletteViewNotification"), self);

    self->_paletteViewDismissedTimestamp = CACurrentMediaTime();
  }
LABEL_10:

}

- (void)pencilSqueezeControllerDidChangePaletteViewVisibility:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Post palette view visibility did change notification", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PKPencilSqueezeInteractionDidChangePaletteViewVisibilityNotification"), self);

}

- (CGRect)_paletteViewFrameForHoverLocation:(CGPoint)a3 inView:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (a4)
    objc_msgSend(a4, "convertPoint:toView:", 0, a3.x, a3.y);
  v5 = -[PKPencilSqueezeController paletteViewFrameForHoverLocation:]((uint64_t)self->_squeezeController, a3.x, a3.y);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_tiledCanvasViewShouldDiscardTapStroke:(id)a3
{
  double v3;
  double v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CACurrentMediaTime() - self->_paletteViewDismissedTimestamp;
  v4 = *(double *)&PKSqueezePaletteElapsedTimeSinceVisibleToDiscardTapStrokes;
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = v3 < v4;
    v8 = 2048;
    v9 = v3;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Should discard tap stroke: %{BOOL}d, elapsedTimeSincePaletteVisible: %.2f", (uint8_t *)v7, 0x12u);
  }

  return v3 < v4;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (PKPencilSqueezeInteractionDelegate)_delegate
{
  return (PKPencilSqueezeInteractionDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_textEffectsWindowObserver, 0);
  objc_storeStrong((id *)&self->_squeezeController, 0);
}

@end
