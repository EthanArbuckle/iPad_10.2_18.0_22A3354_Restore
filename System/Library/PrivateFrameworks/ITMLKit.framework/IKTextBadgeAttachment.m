@implementation IKTextBadgeAttachment

- (IKTextBadgeAttachment)initWithBadgeElement:(id)a3
{
  id v4;
  IKTextBadgeAttachment *v5;
  IKTextBadgeAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKTextBadgeAttachment;
  v5 = -[IKTextBadgeAttachment init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_badge, v4);

  return v6;
}

- (IKBadgeElement)badge
{
  return (IKBadgeElement *)objc_loadWeakRetained((id *)&self->_badge);
}

- (IKColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_badge);
}

@end
