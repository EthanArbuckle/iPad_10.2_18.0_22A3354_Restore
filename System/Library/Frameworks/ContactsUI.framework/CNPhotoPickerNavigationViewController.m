@implementation CNPhotoPickerNavigationViewController

- (CNPhotoPickerNavigationViewController)initWithRootViewController:(id)a3
{
  char *v3;
  CNPhotoPickerNavigationViewController *v4;
  void *v5;
  void *v6;
  CNPhotoPickerNavigationViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerNavigationViewController;
  v3 = -[CNPhotoPickerNavigationViewController initWithRootViewController:](&v9, sel_initWithRootViewController_, a3);
  v4 = (CNPhotoPickerNavigationViewController *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 1432) = *MEMORY[0x1E0C9D820];
    v3[1409] = 0;
    v3[1410] = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

    v7 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerNavigationViewController;
  -[CNPhotoPickerNavigationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNPhotoPickerNavigationViewController;
  -[CNPhotoPickerNavigationViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    if (-[CNPhotoPickerNavigationViewController disablingRotation](self, "disablingRotation"))
    {
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v8, "interfaceOrientation") - 3) > 1)
      {

      }
      else
      {
        v9 = -[CNPhotoPickerNavigationViewController _isInterfaceAutorotationDisabled](self, "_isInterfaceAutorotationDisabled");

        if (v9)
          -[CNPhotoPickerNavigationViewController endDisablingAutorotation](self, "endDisablingAutorotation");
      }
    }
    else if (!-[CNPhotoPickerNavigationViewController allowRotation](self, "allowRotation"))
    {
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "interfaceOrientation");

      if (v13 == 1)
        -[CNPhotoPickerNavigationViewController beginDisablingAutorotation](self, "beginDisablingAutorotation");
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerNavigationViewController;
  -[CNPhotoPickerNavigationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[CNPhotoPickerNavigationViewController disablingRotation](self, "disablingRotation")
    && -[CNPhotoPickerNavigationViewController _isInterfaceAutorotationDisabled](self, "_isInterfaceAutorotationDisabled"))
  {
    -[CNPhotoPickerNavigationViewController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[CNPhotoPickerNavigationViewController endDisablingAutorotation](self, "endDisablingAutorotation");
  }
}

- (void)setAllowRotation:(BOOL)a3
{
  if (self->_allowRotation != a3)
  {
    self->_allowRotation = a3;
    -[CNPhotoPickerNavigationViewController updateTrapOverlayViewIfNecessaryWithCoordinator:](self, "updateTrapOverlayViewIfNecessaryWithCoordinator:", 0);
  }
}

- (void)endDisablingAutorotationIfNeeded
{
  if (-[CNPhotoPickerNavigationViewController disablingRotation](self, "disablingRotation"))
    -[CNPhotoPickerNavigationViewController endDisablingAutorotation](self, "endDisablingAutorotation");
}

- (void)endDisablingAutorotation
{
  -[CNPhotoPickerNavigationViewController setDisablingRotation:](self, "setDisablingRotation:", 0);
  -[CNPhotoPickerNavigationViewController _endDisablingInterfaceAutorotation](self, "_endDisablingInterfaceAutorotation");
}

- (void)beginDisablingAutorotation
{
  -[CNPhotoPickerNavigationViewController setDisablingRotation:](self, "setDisablingRotation:", 1);
  -[CNPhotoPickerNavigationViewController _beginDisablingInterfaceAutorotation](self, "_beginDisablingInterfaceAutorotation");
}

- (void)keyboardWillShow:(id)a3
{
  -[CNPhotoPickerNavigationViewController setIsShowingKeyboard:](self, "setIsShowingKeyboard:", 1);
}

- (void)keyboardWillHide:(id)a3
{
  -[CNPhotoPickerNavigationViewController setIsShowingKeyboard:](self, "setIsShowingKeyboard:", 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  _BOOL4 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNPhotoPickerNavigationViewController;
  -[CNPhotoPickerNavigationViewController viewWillLayoutSubviews](&v11, sel_viewWillLayoutSubviews);
  -[CNPhotoPickerNavigationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  if (self->_previousSize.width == v5 && self->_previousSize.height == v7)
  {
    -[CNPhotoPickerNavigationViewController trapOverlayView](self, "trapOverlayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (((v10 ^ -[CNPhotoPickerNavigationViewController shouldDisplayTrapOverlayView](self, "shouldDisplayTrapOverlayView")) & 1) != 0)return;
  }
  else
  {
    -[CNPhotoPickerNavigationViewController setPreviousSize:](self, "setPreviousSize:", v5, v7);
  }
  -[CNPhotoPickerNavigationViewController updateTrapOverlayViewIfNecessaryWithCoordinator:](self, "updateTrapOverlayViewIfNecessaryWithCoordinator:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerNavigationViewController;
  v7 = a4;
  -[CNPhotoPickerNavigationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CNPhotoPickerNavigationViewController setPreviousSize:](self, "setPreviousSize:", width, height, v8.receiver, v8.super_class);
  -[CNPhotoPickerNavigationViewController updateTrapOverlayViewIfNecessaryWithCoordinator:](self, "updateTrapOverlayViewIfNecessaryWithCoordinator:", v7);

}

- (BOOL)shouldDisplayTrapOverlayView
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  if (-[CNPhotoPickerNavigationViewController allowRotation](self, "allowRotation"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[CNPhotoPickerNavigationViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerNavigationViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CNVisualIdentityPickerViewController canShowPhotoPickerForView:withTraitCollection:](CNPhotoPickerViewController, "canShowPhotoPickerForView:withTraitCollection:", v4, v5))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v3 = !-[CNPhotoPickerNavigationViewController isShowingKeyboard](self, "isShowingKeyboard");
    }

  }
  return v3;
}

- (BOOL)isDisplayingTrapView
{
  void *v2;
  BOOL v3;

  -[CNPhotoPickerNavigationViewController trapOverlayView](self, "trapOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setupTrapOverlayView
{
  void *v3;
  CNPhotoPickerTrapView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNPhotoPickerTrapView *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  if (-[CNPhotoPickerNavigationViewController shouldDisplayTrapOverlayView](self, "shouldDisplayTrapOverlayView"))
  {
    -[CNPhotoPickerNavigationViewController trapOverlayView](self, "trapOverlayView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v4 = (CNPhotoPickerTrapView *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerTrapView bringSubviewToFront:](v4, "bringSubviewToFront:", self->_trapOverlayView);
    }
    else
    {
      v10 = [CNPhotoPickerTrapView alloc];
      v4 = -[CNPhotoPickerTrapView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      +[CNUIColorRepository photoPickerBackgroundColor](CNUIColorRepository, "photoPickerBackgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerTrapView setBackgroundColor:](v4, "setBackgroundColor:", v11);

      +[CNUIColorRepository photoPickerTrapViewMessageTextColor](CNUIColorRepository, "photoPickerTrapViewMessageTextColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerTrapView label](v4, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextColor:", v12);

      -[CNPhotoPickerTrapView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v4);

      -[CNPhotoPickerTrapView leadingAnchor](v4, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "leadingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v40);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v39;
      -[CNPhotoPickerTrapView trailingAnchor](v4, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v36);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v35;
      -[CNPhotoPickerTrapView topAnchor](v4, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "safeAreaLayoutGuide");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v17;
      -[CNPhotoPickerTrapView bottomAnchor](v4, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerNavigationViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v43[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerNavigationViewController setTrapOverlayConstraints:](self, "setTrapOverlayConstraints:", v22);

      v23 = (void *)MEMORY[0x1E0CB3718];
      -[CNPhotoPickerNavigationViewController trapOverlayConstraints](self, "trapOverlayConstraints");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateConstraints:", v24);

      -[CNPhotoPickerNavigationViewController setTrapOverlayView:](self, "setTrapOverlayView:", v4);
    }

    v25 = -[CNPhotoPickerNavigationViewController interfaceOrientation](self, "interfaceOrientation") - 3;
    CNContactsUIBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25 > 1)
      v28 = CFSTR("PHOTO_TRAP_VIEW_MESSAGE");
    else
      v28 = CFSTR("PHOTO_TRAP_VIEW_LANDSCAPE_MESSAGE");
    objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E20507A8, CFSTR("Localized"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerNavigationViewController trapOverlayView](self, "trapOverlayView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "label");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v29);

    -[CNPhotoPickerNavigationViewController trapOverlayView](self, "trapOverlayView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutIfNeeded");

  }
  else
  {
    -[CNPhotoPickerNavigationViewController trapOverlayConstraints](self, "trapOverlayConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3718];
      -[CNPhotoPickerNavigationViewController trapOverlayConstraints](self, "trapOverlayConstraints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deactivateConstraints:", v7);

      -[CNPhotoPickerNavigationViewController setTrapOverlayConstraints:](self, "setTrapOverlayConstraints:", 0);
    }
    -[CNPhotoPickerNavigationViewController trapOverlayView](self, "trapOverlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CNPhotoPickerNavigationViewController trapOverlayView](self, "trapOverlayView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[CNPhotoPickerNavigationViewController setTrapOverlayView:](self, "setTrapOverlayView:", 0);
    }
  }
}

- (void)updateTrapOverlayViewIfNecessaryWithCoordinator:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (a3)
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke;
    v4[3] = &unk_1E204B480;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_3;
    v3[3] = &unk_1E204B480;
    objc_msgSend(a3, "animateAlongsideTransition:completion:", v4, v3);
  }
  else
  {
    -[CNPhotoPickerNavigationViewController setupTrapOverlayView](self, "setupTrapOverlayView");
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 30;
  else
    return 26;
}

- (BOOL)allowRotation
{
  return self->_allowRotation;
}

- (CNPhotoPickerTrapView)trapOverlayView
{
  return self->_trapOverlayView;
}

- (void)setTrapOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_trapOverlayView, a3);
}

- (NSArray)trapOverlayConstraints
{
  return self->_trapOverlayConstraints;
}

- (void)setTrapOverlayConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_trapOverlayConstraints, a3);
}

- (CGSize)previousSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousSize.width;
  height = self->_previousSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (BOOL)disablingRotation
{
  return self->_disablingRotation;
}

- (void)setDisablingRotation:(BOOL)a3
{
  self->_disablingRotation = a3;
}

- (BOOL)isShowingKeyboard
{
  return self->_isShowingKeyboard;
}

- (void)setIsShowingKeyboard:(BOOL)a3
{
  self->_isShowingKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trapOverlayConstraints, 0);
  objc_storeStrong((id *)&self->_trapOverlayView, 0);
}

void __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (objc_msgSend(*(id *)(a1 + 32), "shouldDisplayTrapOverlayView"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_2;
    v6[3] = &unk_1E204F648;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
    objc_msgSend(*(id *)(a1 + 32), "trapOverlayView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "label");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 1.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "trapOverlayView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

  }
}

uint64_t __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupTrapOverlayView");
}

void __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setupTrapOverlayView");
  objc_msgSend(*(id *)(a1 + 32), "trapOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

@end
