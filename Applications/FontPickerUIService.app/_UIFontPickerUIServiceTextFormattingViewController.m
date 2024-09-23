@implementation _UIFontPickerUIServiceTextFormattingViewController

- (void)loadView
{
  UIView *v3;
  void *v4;
  void *v5;
  id v6;
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
  _UITextFormattingRemoteViewController *contentViewController;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _UIFontPickerUIServiceTextFormattingViewController *v31;
  objc_super v32;
  _QWORD v33[4];

  v32.receiver = self;
  v32.super_class = (Class)_UIFontPickerUIServiceTextFormattingViewController;
  -[_UIFontPickerUIServiceTextFormattingViewController loadView](&v32, "loadView");
  v3 = objc_opt_new(UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[_UIFontPickerUIServiceTextFormattingViewController setView:](self, "setView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerUIServiceTextFormattingViewController view](self, "view"));
  objc_msgSend(v5, "setOpaque:", 0);

  v6 = objc_alloc_init(NSClassFromString(CFSTR("_UITextFormattingServiceViewController")));
  objc_msgSend(v6, "willMoveToParentViewController:", self);
  v31 = self;
  -[_UIFontPickerUIServiceTextFormattingViewController addChildViewController:](self, "addChildViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  -[UIView addSubview:](v3, "addSubview:", v7);

  objc_msgSend(v6, "didMoveToParentViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v33[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v33[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v9));
  v33[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v33[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  contentViewController = v31->_contentViewController;
  v31->_contentViewController = (_UITextFormattingRemoteViewController *)v6;

}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)_UIFontPickerUIServiceTextFormattingViewController;
  -[_UIFontPickerUIServiceTextFormattingViewController setPreferredContentSize:](&v7, "setPreferredContentSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerUIServiceTextFormattingViewController _hostedWindowScene](self, "_hostedWindowScene"));
  objc_msgSend(v6, "_setPreferredContentSize:", width, height);

}

- (void)_setConfiguration:(id)a3
{
  -[_UITextFormattingRemoteViewController _setConfiguration:](self->_contentViewController, "_setConfiguration:", a3);
}

- (void)_setFormattingDescriptor:(id)a3
{
  -[_UITextFormattingRemoteViewController _setFormattingDescriptor:](self->_contentViewController, "_setFormattingDescriptor:", a3);
}

- (void)_setDisabledComponents:(id)a3
{
  -[_UITextFormattingRemoteViewController _setDisabledComponents:](self->_contentViewController, "_setDisabledComponents:", a3);
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[_UITextFormattingActionClientToHost actionForChangeValue:textAttributesData:](_UITextFormattingActionClientToHost, "actionForChangeValue:textAttributesData:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerUIServiceTextFormattingViewController _hostedWindowScene](self, "_hostedWindowScene"));
  objc_msgSend(v5, "sendAction:", v6);

}

- (void)_textFormattingDidFinish
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[_UIFontPickerUIServiceTextFormattingViewController _hostedWindowScene](self, "_hostedWindowScene"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_UITextFormattingActionClientToHost actionForDidFinish](_UITextFormattingActionClientToHost, "actionForDidFinish"));
  objc_msgSend(v3, "sendAction:", v2);

}

- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[_UITextFormattingActionClientToHost actionForPresentColorPickerWithRect:selectedColor:](_UITextFormattingActionClientToHost, "actionForPresentColorPickerWithRect:selectedColor:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerUIServiceTextFormattingViewController _hostedWindowScene](self, "_hostedWindowScene"));
  objc_msgSend(v5, "sendAction:", v6);

}

- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[_UITextFormattingActionClientToHost actionForPresentFontPickerWithConfiguration:selectedFonts:](_UITextFormattingActionClientToHost, "actionForPresentFontPickerWithConfiguration:selectedFonts:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerUIServiceTextFormattingViewController _hostedWindowScene](self, "_hostedWindowScene"));
  objc_msgSend(v5, "sendAction:", v6);

}

- (void)_presentTypographySettingsForFont:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[_UITextFormattingActionClientToHost actionForPresentTypographySettingsForFont:](_UITextFormattingActionClientToHost, "actionForPresentTypographySettingsForFont:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerUIServiceTextFormattingViewController _hostedWindowScene](self, "_hostedWindowScene"));
  objc_msgSend(v4, "sendAction:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
