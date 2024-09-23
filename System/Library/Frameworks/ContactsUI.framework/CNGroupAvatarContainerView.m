@implementation CNGroupAvatarContainerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CNGroupAvatarContainerView underlyingContainerView](self, "underlyingContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CNVisualIdentityAvatarContainerView)underlyingContainerView
{
  return self->_underlyingContainerView;
}

- (void)setUnderlyingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContainerView, 0);
}

@end
