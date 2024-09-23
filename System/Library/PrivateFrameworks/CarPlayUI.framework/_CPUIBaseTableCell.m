@implementation _CPUIBaseTableCell

+ (id)cellForTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:reuseIdentifier:", 3, v5);
    objc_msgSend(v6, "configureCell");
  }

  return v6;
}

- (void)_updateTintColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  else
    +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPUIBaseTableCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  else
    +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPUIBaseTableCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightedTextColor:", v5);

  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  else
    +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPUIBaseTableCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  else
    +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_CPUIBaseTableCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHighlightedTextColor:", v10);

}

+ (double)minimumHeight
{
  return 44.0;
}

+ (double)rowHeight
{
  return 44.0;
}

+ (UIColor)disabledColor
{
  if (disabledColor_onceToken != -1)
    dispatch_once(&disabledColor_onceToken, &__block_literal_global_3);
  return (UIColor *)(id)disabledColor_disabled;
}

+ (UIColor)disabledHighlightedColor
{
  if (disabledHighlightedColor_onceToken != -1)
    dispatch_once(&disabledHighlightedColor_onceToken, &__block_literal_global_4);
  return (UIColor *)(id)disabledHighlightedColor_disabled;
}

- (BOOL)itemEnabled
{
  return self->_itemEnabled;
}

- (void)setItemEnabled:(BOOL)a3
{
  self->_itemEnabled = a3;
}

@end
