@implementation SCNUIKitSource

- (SCNUIKitSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNUIKitSource;
  return -[SCNUIKitSource init](&v3, sel_init);
}

- (BOOL)supportsMetal
{
  return 0;
}

- (id)prepareWindowIfNeeded
{
  _QWORD block[5];

  if (!self->_uiWindow && !self->_windowPreparing)
  {
    self->_windowPreparing = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SCNUIKitSource_prepareWindowIfNeeded__block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = self;
    if (pthread_main_np() == 1)
      __39__SCNUIKitSource_prepareWindowIfNeeded__block_invoke((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  return self->_uiWindow;
}

void __39__SCNUIKitSource_prepareWindowIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _SCNSnapshotWindow *v8;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiView"), "bounds");
  v8 = -[_SCNSnapshotWindow initWithFrame:]([_SCNSnapshotWindow alloc], "initWithFrame:", v2, v3, v4, v5);
  -[_SCNSnapshotWindow setWindowScene:](v8, "setWindowScene:", objc_msgSend((id)objc_msgSend((id)gCurrentSCNViewEvent, "window"), "windowScene"));
  -[_SCNSnapshotWindow setHidden:](v8, "setHidden:", 1);
  LODWORD(v6) = 1.0;
  -[_SCNSnapshotWindow setCharge:](v8, "setCharge:", v6);
  -[_SCNSnapshotWindow setWindowLevel:](v8, "setWindowLevel:", 10000.0);
  -[_SCNSnapshotWindow addSubview:](v8, "addSubview:", objc_msgSend(*(id *)(a1 + 32), "uiView"));
  objc_msgSend((id)objc_msgSend((id)-[_SCNSnapshotWindow subviews](v8, "subviews"), "firstObject"), "setNeedsDisplay");
  -[_SCNSnapshotWindow setNeedsDisplay](v8, "setNeedsDisplay");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiView"), "isOpaque");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = -[_SCNSnapshotWindow layer](v8, "layer");
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "superlayer");
  objc_msgSend(v7, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SCN_isBackingUIView"));
  objc_msgSend(*(id *)(a1 + 32), "setUiWindow:", v8);
  -[_SCNSnapshotWindow setPosition:](v8, "setPosition:", -10000.0, 0.0);
  -[_SCNSnapshotWindow setHidden:](v8, "setHidden:", 0);

}

- (id)textureSource
{
  SCNTextureUIKitSource *v3;

  if (!-[SCNUIKitSource prepareWindowIfNeeded](self, "prepareWindowIfNeeded"))
    return 0;
  v3 = objc_alloc_init(SCNTextureUIKitSource);
  -[SCNTextureUIKitSource setUiView:](v3, "setUiView:", -[SCNUIKitSource uiView](self, "uiView"));
  -[SCNTextureUIKitSource setUiWindow:](v3, "setUiWindow:", -[SCNUIKitSource uiWindow](self, "uiWindow"));
  -[SCNTextureUIKitSource setUiWindowLayer:](v3, "setUiWindowLayer:", self->_uiWindowLayer);
  -[SCNTextureUIKitSource setIsOpaque:](v3, "setIsOpaque:", self->_isOpaque);
  -[SCNTextureUIKitSource setSource:](v3, "setSource:", self);
  -[SCNTextureUIKitSource setup](v3, "setup");
  return v3;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)dealloc
{
  id uiWindow;
  id uiView;
  objc_super v5;
  _QWORD block[6];

  uiWindow = self->_uiWindow;
  uiView = self->_uiView;
  self->_uiWindow = 0;
  self->_uiView = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SCNUIKitSource_dealloc__block_invoke;
  block[3] = &unk_1EA59F420;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v5.receiver = self;
  v5.super_class = (Class)SCNUIKitSource;
  -[SCNUIKitSource dealloc](&v5, sel_dealloc);
}

void __25__SCNUIKitSource_dealloc__block_invoke(uint64_t a1)
{

}

- (UIView)uiView
{
  return (UIView *)self->_uiView;
}

- (void)setUiView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIWindow)uiWindow
{
  return (UIWindow *)self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
