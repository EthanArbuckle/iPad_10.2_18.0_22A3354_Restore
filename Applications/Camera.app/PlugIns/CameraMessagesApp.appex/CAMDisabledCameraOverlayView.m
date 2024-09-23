@implementation CAMDisabledCameraOverlayView

- (CAMDisabledCameraOverlayView)initWithFrame:(CGRect)a3
{
  CAMDisabledCameraOverlayView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIButton *doneButton;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *messageLabel;
  void *v15;
  CAMDisabledCameraOverlayView *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CAMDisabledCameraOverlayView;
  v3 = -[CAMDisabledCameraOverlayView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[CAMDisabledCameraOverlayView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CAMDisabledCameraOverlayView _accessibilitySetInterfaceStyleIntent:](v3, "_accessibilitySetInterfaceStyleIntent:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100014940, CFSTR("CameraMessagesApp")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESSAGES_CAMERA_DISABLED_FOR_MULTITASKING_MESSAGE"), &stru_100014940, CFSTR("CameraMessagesApp")));
    v8 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    doneButton = v3->_doneButton;
    v3->_doneButton = (UIButton *)v8;

    -[UIButton setTitle:forState:](v3->_doneButton, "setTitle:forState:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
    -[UIButton setTintColor:](v3->_doneButton, "setTintColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_doneButton, "titleLabel"));
    objc_msgSend(v12, "setFont:", v11);

    -[CAMDisabledCameraOverlayView addSubview:](v3, "addSubview:", v3->_doneButton);
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    messageLabel = v3->__messageLabel;
    v3->__messageLabel = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->__messageLabel, "setTextColor:", v15);

    -[UILabel setTextAlignment:](v3->__messageLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->__messageLabel, "setNumberOfLines:", 0);
    -[UILabel setText:](v3->__messageLabel, "setText:", v7);
    -[CAMDisabledCameraOverlayView addSubview:](v3, "addSubview:", v3->__messageLabel);
    -[CAMDisabledCameraOverlayView _updateFonts](v3, "_updateFonts");
    v16 = v3;

  }
  return v3;
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0, 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMDisabledCameraOverlayView _messageLabel](self, "_messageLabel"));
  objc_msgSend(v4, "setFont:", v3);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CAMDisabledCameraOverlayView;
  -[CAMDisabledCameraOverlayView layoutSubviews](&v15, "layoutSubviews");
  -[CAMDisabledCameraOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMDisabledCameraOverlayView doneButton](self, "doneButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMDisabledCameraOverlayView _messageLabel](self, "_messageLabel"));
  objc_msgSend(v11, "intrinsicContentSize");
  objc_msgSend(v11, "setFrame:", v8 - v13 + -16.0 + -10.0, 21.0, v13 + 20.0, v14 + 20.0);
  objc_msgSend(v12, "setFrame:", v4 + 15.0, v6 + 0.0, v8 + -30.0, v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMDisabledCameraOverlayView traitCollection](self, "traitCollection"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMDisabledCameraOverlayView _updateFonts](self, "_updateFonts");
    -[CAMDisabledCameraOverlayView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UILabel)_messageLabel
{
  return self->__messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__messageLabel, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

@end
