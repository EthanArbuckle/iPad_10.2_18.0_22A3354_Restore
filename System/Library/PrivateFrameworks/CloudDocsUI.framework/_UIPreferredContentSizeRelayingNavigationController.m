@implementation _UIPreferredContentSizeRelayingNavigationController

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  objc_super v13;

  height = a3.height;
  width = a3.width;
  -[_UIPreferredContentSizeRelayingNavigationController preferredContentSize](self, "preferredContentSize");
  v7 = v6;
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)_UIPreferredContentSizeRelayingNavigationController;
  -[_UIPreferredContentSizeRelayingNavigationController setPreferredContentSize:](&v13, sel_setPreferredContentSize_, width, height);
  if (width != v7 || height != v9)
  {
    -[_UIPreferredContentSizeRelayingNavigationController preferredContentSizeDidChange](self, "preferredContentSizeDidChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_UIPreferredContentSizeRelayingNavigationController preferredContentSizeDidChange](self, "preferredContentSizeDidChange");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _UIPreferredContentSizeRelayingNavigationController *))v12)[2](v12, self);

    }
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_msgSend(a3, "preferredContentSize");
  -[_UIPreferredContentSizeRelayingNavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (id)preferredContentSizeDidChange
{
  return self->_preferredContentSizeDidChange;
}

- (void)setPreferredContentSizeDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preferredContentSizeDidChange, 0);
}

@end
