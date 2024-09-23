@implementation CKWolfEntryBackgroundView

- (CKWolfEntryBackgroundView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKWolfEntryBackgroundView;
  return -[CKWolfEntryBackgroundView init](&v3, sel_init);
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKWolfEntryBackgroundView;
  -[CKWolfEntryBackgroundView layoutSubviews](&v12, sel_layoutSubviews);
  -[CKWolfEntryBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKWolfEntryBackgroundView blurView](self, "blurView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (id)inputAccessoryViewBackdropColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)style
{
  return self->style;
}

- (void)setStyle:(int64_t)a3
{
  self->style = a3;
}

- (NSString)backdropGroupName
{
  return self->backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_storeStrong((id *)&self->backdropGroupName, a3);
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->entryViewTraitCollection;
}

- (void)setEntryViewTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->entryViewTraitCollection, a3);
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->entryViewTraitCollection, 0);
  objc_storeStrong((id *)&self->backdropGroupName, 0);
}

@end
