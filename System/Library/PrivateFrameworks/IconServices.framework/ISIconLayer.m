@implementation ISIconLayer

- (ISIconLayer)init
{
  return -[ISIconLayer initWithIcon:](self, "initWithIcon:", 0);
}

- (ISIconLayer)initWithIcon:(id)a3
{
  id v5;
  ISIconLayer *v6;
  ISIconLayer *v7;
  id *p_icon;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconLayer;
  v6 = -[ISIconLayer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    p_icon = (id *)&v6->_icon;
    objc_storeStrong((id *)&v6->_icon, a3);
    objc_msgSend(*p_icon, "displayLayer:", v7);
    v7->_shouldApplyMask = 1;
    -[ISIconLayer setDelegate:](v7, "setDelegate:", *p_icon);
  }

  return v7;
}

- (void)setIcon:(id)a3
{
  ISIcon *v5;
  ISIcon **p_icon;
  ISIcon *v7;

  v5 = (ISIcon *)a3;
  p_icon = &self->_icon;
  if (self->_icon != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    -[ISIcon displayLayer:](*p_icon, "displayLayer:", self);
    -[ISIconLayer setDelegate:](self, "setDelegate:", *p_icon);
    v5 = v7;
  }

}

- (void)iconManager:(id)a3 didInvalidateIcons:(id)a4
{
  if (objc_msgSend(a4, "containsObject:", self->_icon))
    -[ISIconLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (unint64_t)badgeOptions
{
  return self->_badgeOptions;
}

- (void)setBadgeOptions:(unint64_t)a3
{
  self->_badgeOptions = a3;
}

- (unint64_t)variantOptions
{
  return self->_variantOptions;
}

- (void)setVariantOptions:(unint64_t)a3
{
  self->_variantOptions = a3;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (ISIcon)icon
{
  return self->_icon;
}

- (unint64_t)iconShape
{
  return self->_iconShape;
}

- (void)setIconShape:(unint64_t)a3
{
  self->_iconShape = a3;
}

- (BOOL)shouldApplyMask
{
  return self->_shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->_shouldApplyMask = a3;
}

- (BOOL)drawBorder
{
  return self->_drawBorder;
}

- (void)setDrawBorder:(BOOL)a3
{
  self->_drawBorder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
