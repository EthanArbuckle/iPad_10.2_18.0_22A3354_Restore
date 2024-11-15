@implementation CKMediaObjectTapbackUserData

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[CKMediaObjectTapbackUserData asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsset:", v5);

  -[CKMediaObjectTapbackUserData gradientReferenceView](self, "gradientReferenceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGradientReferenceView:", v6);

  objc_msgSend(v4, "setShouldAnimate:", -[CKMediaObjectTapbackUserData shouldAnimate](self, "shouldAnimate"));
  objc_msgSend(v4, "setInvertTailDirection:", -[CKMediaObjectTapbackUserData invertTailDirection](self, "invertTailDirection"));
  objc_msgSend(v4, "setDisplayedInGridView:", -[CKMediaObjectTapbackUserData isDisplayedInGridView](self, "isDisplayedInGridView"));
  return v4;
}

- (CKMediaObjectBackedAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (CKGradientReferenceView)gradientReferenceView
{
  return (CKGradientReferenceView *)objc_loadWeakRetained((id *)&self->_gradientReferenceView);
}

- (void)setGradientReferenceView:(id)a3
{
  objc_storeWeak((id *)&self->_gradientReferenceView, a3);
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (BOOL)invertTailDirection
{
  return self->_invertTailDirection;
}

- (void)setInvertTailDirection:(BOOL)a3
{
  self->_invertTailDirection = a3;
}

- (BOOL)isDisplayedInGridView
{
  return self->_displayedInGridView;
}

- (void)setDisplayedInGridView:(BOOL)a3
{
  self->_displayedInGridView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gradientReferenceView);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
