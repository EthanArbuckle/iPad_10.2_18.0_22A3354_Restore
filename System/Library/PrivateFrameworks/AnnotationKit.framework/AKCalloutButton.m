@implementation AKCalloutButton

- (AKCalloutButton)initWithFrame:(CGRect)a3
{
  AKCalloutButton *v3;
  AKCalloutButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKCalloutButton;
  v3 = -[AKCalloutButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AKCalloutButton setAdjustsImageWhenHighlighted:](v3, "setAdjustsImageWhenHighlighted:", 0);
    -[AKCalloutButton setShowsTouchWhenHighlighted:](v4, "setShowsTouchWhenHighlighted:", 0);
    v4->_position = -1;
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AKCalloutButton;
  -[AKCalloutButton setHighlighted:](&v6, sel_setHighlighted_);
  -[AKCalloutButton bar](self, "bar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:forControl:", v3, self);

}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (AKCalloutBar)bar
{
  return (AKCalloutBar *)objc_loadWeakRetained((id *)&self->_bar);
}

- (void)setBar:(id)a3
{
  objc_storeWeak((id *)&self->_bar, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bar);
}

@end
