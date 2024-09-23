@implementation SUUISettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  return 0;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (UIEdgeInsets)layoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  UIEdgeInsets result;

  v17.receiver = self;
  v17.super_class = (Class)SUUISettingDescriptionView;
  -[SUUISettingDescriptionView layoutMargins](&v17, sel_layoutMargins);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SUUISettingDescriptionView hasDisclosureChevron](self, "hasDisclosureChevron");
  v12 = fmax(v10, 36.0);
  if (v11)
    v13 = v12;
  else
    v13 = v10;
  v14 = v4;
  v15 = v6;
  v16 = v8;
  result.right = v13;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

@end
