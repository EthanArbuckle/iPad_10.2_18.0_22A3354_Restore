@implementation _SFSettingsAlertControl

- (_SFSettingsAlertControl)initWithFrame:(CGRect)a3
{
  _SFSettingsAlertControl *v3;
  _SFSettingsAlertControl *v4;
  _SFSettingsAlertItemBackgroundView *v5;
  uint64_t v6;
  _SFSettingsAlertItemBackgroundView *backgroundView;
  _SFSettingsAlertControl *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFSettingsAlertControl;
  v3 = -[_SFSettingsAlertControl initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_defaultBackgroundMode = 4;
    v5 = [_SFSettingsAlertItemBackgroundView alloc];
    -[_SFSettingsAlertControl bounds](v4, "bounds");
    v6 = -[_SFSettingsAlertItemBackgroundView initWithFrame:](v5, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (_SFSettingsAlertItemBackgroundView *)v6;

    -[_SFSettingsAlertItemBackgroundView setAutoresizingMask:](v4->_backgroundView, "setAutoresizingMask:", 18);
    -[_SFSettingsAlertControl addSubview:](v4, "addSubview:", v4->_backgroundView);
    -[_SFSettingsAlertControl _updateBackgroundView](v4, "_updateBackgroundView");
    -[_SFSettingsAlertControl setFocusGroupIdentifier:](v4, "setFocusGroupIdentifier:", 0);
    v8 = v4;
  }

  return v4;
}

- (void)setHidesSeparator:(BOOL)a3
{
  if (self->_hidesSeparator != a3)
  {
    self->_hidesSeparator = a3;
    -[_SFSettingsAlertControl _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSettingsAlertControl;
  -[_SFSettingsAlertControl setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[_SFSettingsAlertControl _updateBackgroundView](self, "_updateBackgroundView");
}

- (void)setDefaultBackgroundMode:(int64_t)a3
{
  if (self->_defaultBackgroundMode != a3)
  {
    self->_defaultBackgroundMode = a3;
    -[_SFSettingsAlertControl _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)_updateBackgroundView
{
  int64_t v3;

  if ((-[_SFSettingsAlertControl isHighlighted](self, "isHighlighted") & 1) != 0
    || (-[_SFSettingsAlertControl isFocused](self, "isFocused") & 1) != 0)
  {
    v3 = 1;
  }
  else if (self->_hidesSeparator)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[_SFSettingsAlertControl defaultBackgroundMode](self, "defaultBackgroundMode");
  }
  -[_SFSettingsAlertItemBackgroundView setMode:](self->_backgroundView, "setMode:", v3);
}

- (int64_t)backgroundMode
{
  return -[_SFSettingsAlertItemBackgroundView mode](self->_backgroundView, "mode");
}

- (SFSettingsAlertItemViewDelegate)delegate
{
  return (SFSettingsAlertItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFSettingsAlertItem)item
{
  return (_SFSettingsAlertItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (BOOL)hidesSeparator
{
  return self->_hidesSeparator;
}

- (_SFSettingsAlertItemBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)defaultBackgroundMode
{
  return self->_defaultBackgroundMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
