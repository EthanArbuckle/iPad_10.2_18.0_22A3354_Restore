@implementation MRUActivityMirroringViewController

- (MRUActivityMirroringViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MRUActivityMirroringViewController *v4;
  MRUMirroringController *v5;
  MRUMirroringController *mirroringController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUActivityMirroringViewController;
  v4 = -[MRUActivityMirroringViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MRUMirroringController);
    mirroringController = v4->_mirroringController;
    v4->_mirroringController = v5;

    -[MRUMirroringController setDelegate:](v4->_mirroringController, "setDelegate:", v4);
  }
  return v4;
}

- (void)loadView
{
  MRUActivityMirroringView *v3;

  v3 = objc_alloc_init(MRUActivityMirroringView);
  -[MRUActivityMirroringViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUActivityMirroringViewController;
  -[MRUActivityMirroringViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[MRUActivityMirroringViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_stopMirroring_, 64);

  -[MRUActivityMirroringViewController updateState](self, "updateState");
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
  v9.super_class = (Class)MRUActivityMirroringViewController;
  v7 = a4;
  -[MRUActivityMirroringViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__MRUActivityMirroringViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5819C40;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global_47);

}

void __89__MRUActivityMirroringViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateState");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)stopMirroring:(id)a3
{
  MRUMirroringController *mirroringController;
  _QWORD v4[5];

  mirroringController = self->_mirroringController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MRUActivityMirroringViewController_stopMirroring___block_invoke;
  v4[3] = &unk_1E5819AA0;
  v4[4] = self;
  -[MRUMirroringController stopMirroringWithCompletion:](mirroringController, "stopMirroringWithCompletion:", v4);
}

void __52__MRUActivityMirroringViewController_stopMirroring___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestTransitionToPreferredLayoutMode");

}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->_activeLayoutMode = a3;
  -[MRUActivityMirroringViewController updateState](self, "updateState");
}

- (int64_t)contentRole
{
  return 2;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (NSString)elementIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0DAC978];
}

- (double)preferredHeightForBottomSafeArea
{
  void *v2;
  double v3;
  double v4;

  -[MRUActivityMirroringViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredHeightForBottomSafeArea");
  v4 = v3;

  return v4;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  void *v2;
  void *v3;

  -[MRUActivityMirroringViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  void *v2;
  void *v3;

  -[MRUActivityMirroringViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  void *v2;
  void *v3;

  -[MRUActivityMirroringViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DB0BC0], *MEMORY[0x1E0DB0C08], 0);
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.246, 0.6, 1.0, 1.0);
}

- (void)updateState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[MRUMirroringController selectedOutputDevice](self->_mirroringController, "selectedOutputDevice");
  v3 = objc_claimAutoreleasedReturnValue();
  v19 = (id)v3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    +[MRUMirroringController symbolNameForOutputDevice:](MRUMirroringController, "symbolNameForOutputDevice:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUActivityMirroringViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceImage:", v6);

    objc_msgSend(v19, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUActivityMirroringViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityLabel:", v8);

    objc_msgSend(v19, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUActivityMirroringViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDeviceName:", v11);

    if (self->_activeLayoutMode == 4)
      v13 = CFSTR("zoom");
    else
      v13 = CFSTR("breathe");
    -[MRUActivityMirroringViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setState:", v13);

  }
  else
  {
    -[MRUActivityMirroringViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDeviceImage:", 0);

    -[MRUActivityMirroringViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeviceName:", 0);

    -[MRUActivityMirroringViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setState:", &stru_1E581FBA8);

  }
  if (self->_activeLayoutMode == 4)
  {
    -[MRUActivityMirroringViewController systemApertureElementContext](self, "systemApertureElementContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setElementNeedsUpdate");

  }
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return self->associatedScenePersistenceIdentifier;
}

- (MRUMirroringController)mirroringController
{
  return self->_mirroringController;
}

- (void)setMirroringController:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringController, 0);
  objc_storeStrong((id *)&self->associatedScenePersistenceIdentifier, 0);
}

@end
