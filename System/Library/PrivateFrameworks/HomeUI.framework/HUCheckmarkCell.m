@implementation HUCheckmarkCell

- (HUCheckmarkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUCheckmarkCell *v4;
  HUCheckmarkCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCheckmarkCell;
  v4 = -[HUActivityIndicatorCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HUCheckmarkCell setChecked:](v4, "setChecked:", 0);
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCheckmarkCell;
  -[HUActivityIndicatorCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUCheckmarkCell setChecked:](self, "setChecked:", 0);
}

- (UIImage)checkedImage
{
  UIImage *checkedImage;

  checkedImage = self->_checkedImage;
  if (checkedImage)
    return checkedImage;
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_cellCheckmarkImage");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIImage)uncheckedImage
{
  UIImage *uncheckedImage;

  uncheckedImage = self->_uncheckedImage;
  if (uncheckedImage)
    return uncheckedImage;
  objc_msgSend((id)objc_opt_class(), "hu_emptyCheckmarkPlaceholderImage");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setChecked:(BOOL)a3
{
  id v4;

  if (self->_checked != a3)
  {
    self->_checked = a3;
    if (a3)
      -[HUCheckmarkCell checkedImage](self, "checkedImage");
    else
      -[HUCheckmarkCell uncheckedImage](self, "uncheckedImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[HUActivityIndicatorCell setIcon:](self, "setIcon:", v4);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityIndicatorCell titleText](self, "titleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p \"%@\" (animating=%d, checked=%d)>"), v5, self, v6, -[HUActivityIndicatorCell isAnimating](self, "isAnimating"), -[HUCheckmarkCell checked](self, "checked"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setCheckedImage:(id)a3
{
  objc_storeStrong((id *)&self->_checkedImage, a3);
}

- (void)setUncheckedImage:(id)a3
{
  objc_storeStrong((id *)&self->_uncheckedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncheckedImage, 0);
  objc_storeStrong((id *)&self->_checkedImage, 0);
}

@end
