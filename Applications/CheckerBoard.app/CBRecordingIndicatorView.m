@implementation CBRecordingIndicatorView

- (CBRecordingIndicatorView)initWithFrame:(CGRect)a3
{
  CBRecordingIndicatorView *v3;
  CBRecordingIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBRecordingIndicatorView;
  v3 = -[CBRecordingIndicatorView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    sub_10001CBBC((id *)&v3->super.super.super.isa);
  return v4;
}

- (CBRecordingIndicatorView)initWithCoder:(id)a3
{
  CBRecordingIndicatorView *v3;
  CBRecordingIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBRecordingIndicatorView;
  v3 = -[CBRecordingIndicatorView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    sub_10001CBBC((id *)&v3->super.super.super.isa);
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(CASecureIndicatorLayer, a2);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CBRecordingIndicatorView;
  -[CBRecordingIndicatorView layoutSubviews](&v8, "layoutSubviews");
  if (-[CBRecordingIndicatorView indicatorType](self, "indicatorType") > 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorView layer](self, "layer"));
    v6 = v5;
    v7 = 0.0;
  }
  else
  {
    -[CBRecordingIndicatorView bounds](self, "bounds");
    v4 = v3 * 0.5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorView layer](self, "layer"));
    v6 = v5;
    v7 = v4;
  }
  objc_msgSend(v5, "setCornerRadius:", v7);

  -[CBRecordingIndicatorView _setAllowsHighContrastForBackgroundColor:](self, "_setAllowsHighContrastForBackgroundColor:", 1);
}

- (void)setIndicatorType:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;

  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorView layer](self, "layer"));
    v6 = sub_10001CB30((id)a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "privacyIndicatorType"));

    if (v7 != v8)
    {
      v9 = CheckerBoardLogHandleForCategory(6);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for view-dot to %@", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(v5, "setPrivacyIndicatorType:", v7);
      -[CBRecordingIndicatorView setNeedsLayout](self, "setNeedsLayout");
      -[CBRecordingIndicatorView layoutIfNeeded](self, "layoutIfNeeded");
    }

  }
}

- (unint64_t)indicatorType
{
  return self->_indicatorType;
}

@end
