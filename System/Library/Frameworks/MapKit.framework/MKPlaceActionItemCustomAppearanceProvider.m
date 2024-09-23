@implementation MKPlaceActionItemCustomAppearanceProvider

- (MKPlaceActionItemCustomAppearanceProvider)initWithActionType:(unint64_t)a3 overrideTitle:(id)a4 symbolName:(id)a5
{
  id v9;
  id v10;
  MKPlaceActionItemCustomAppearanceProvider *v11;
  MKPlaceActionItemCustomAppearanceProvider *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MKPlaceActionItemCustomAppearanceProvider;
  v11 = -[MKPlaceActionItemAppearanceProvider initWithActionType:dataProvider:](&v14, sel_initWithActionType_dataProvider_, a3, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_overrideTitle, a4);
    objc_storeStrong((id *)&v12->_overrideSymbolName, a5);
  }

  return v12;
}

- (id)bestTitleForDisplayStyle:(unint64_t)a3
{
  objc_super v6;

  if (-[NSString length](self->_overrideTitle, "length"))
    return self->_overrideTitle;
  v6.receiver = self;
  v6.super_class = (Class)MKPlaceActionItemCustomAppearanceProvider;
  -[MKPlaceActionItemAppearanceProvider bestTitleForDisplayStyle:](&v6, sel_bestTitleForDisplayStyle_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bestSymbolNameForDisplayStyle:(unint64_t)a3
{
  objc_super v6;

  if (-[NSString length](self->_overrideSymbolName, "length"))
    return self->_overrideSymbolName;
  v6.receiver = self;
  v6.super_class = (Class)MKPlaceActionItemCustomAppearanceProvider;
  -[MKPlaceActionItemAppearanceProvider bestSymbolNameForDisplayStyle:](&v6, sel_bestSymbolNameForDisplayStyle_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSymbolName, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
}

@end
