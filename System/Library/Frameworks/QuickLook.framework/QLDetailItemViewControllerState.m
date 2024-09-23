@implementation QLDetailItemViewControllerState

+ (id)detailItemViewControllerStateWithActionButtonTitle:(id)a3 actionButtonView:(id)a4 informationVisible:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setActionButtonTitle:", v8);

  objc_msgSend(v9, "setActionButtonView:", v7);
  objc_msgSend(v9, "setInformationVisible:", v5);
  return v9;
}

- (NSString)actionButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActionButtonTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UIView)actionButtonView
{
  return (UIView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionButtonView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isInformationVisible
{
  return self->_informationVisible;
}

- (void)setInformationVisible:(BOOL)a3
{
  self->_informationVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonView, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
}

@end
