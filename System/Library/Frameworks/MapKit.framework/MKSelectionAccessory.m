@implementation MKSelectionAccessory

- (MKSelectionAccessory)initWithMapItemDetailPresentationStyle:(id)a3
{
  id v5;
  MKSelectionAccessory *v6;
  MKSelectionAccessory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKSelectionAccessory;
  v6 = -[MKSelectionAccessory init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_style = 0;
    objc_storeStrong((id *)&v6->_mapItemDetailPresentationStyle, a3);
  }

  return v7;
}

+ (id)mapItemDetailWithPresentationStyle:(id)a3
{
  id v3;
  MKSelectionAccessory *v4;

  v3 = a3;
  v4 = -[MKSelectionAccessory initWithMapItemDetailPresentationStyle:]([MKSelectionAccessory alloc], "initWithMapItemDetailPresentationStyle:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MKSelectionAccessory *v4;
  MKSelectionAccessory *v5;
  BOOL v6;

  v4 = (MKSelectionAccessory *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MKSelectionAccessory isEqualToSelectionAccessory:](self, "isEqualToSelectionAccessory:", v5);

  return v6;
}

- (BOOL)isEqualToSelectionAccessory:(id)a3
{
  MKSelectionAccessory *v4;
  MKSelectionAccessory *v5;
  int64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (MKSelectionAccessory *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_7;
  }
  v6 = -[MKSelectionAccessory _style](self, "_style");
  if (v6 == -[MKSelectionAccessory _style](v5, "_style"))
  {
    -[MKSelectionAccessory _mapItemDetailPresentationStyle](self, "_mapItemDetailPresentationStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSelectionAccessory _mapItemDetailPresentationStyle](v5, "_mapItemDetailPresentationStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == v8;

  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (int64_t)_style
{
  return self->_style;
}

- (MKMapItemDetailSelectionAccessoryPresentationStyle)_mapItemDetailPresentationStyle
{
  return self->_mapItemDetailPresentationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemDetailPresentationStyle, 0);
}

@end
