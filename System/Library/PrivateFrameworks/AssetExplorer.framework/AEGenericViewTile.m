@implementation AEGenericViewTile

- (AEGenericViewTile)initWithView:(id)a3
{
  id v5;
  AEGenericViewTile *v6;
  AEGenericViewTile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEGenericViewTile;
  v6 = -[AEGenericViewTile init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_view, a3);

  return v7;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
