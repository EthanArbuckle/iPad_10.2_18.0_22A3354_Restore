@implementation HKInfographicTableItem

- (HKInfographicTableItem)initWithTitle:(id)a3 value:(id)a4
{
  return -[HKInfographicTableItem initWithTitle:value:separatorHidden:](self, "initWithTitle:value:separatorHidden:", a3, a4, 0);
}

- (HKInfographicTableItem)initWithTitle:(id)a3 value:(id)a4 separatorHidden:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  HKInfographicTableItem *v10;
  HKInfographicTableItem *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKInfographicTableItem;
  v10 = -[HKInfographicTableItem init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[HKInfographicTableItem setTitleString:](v10, "setTitleString:", v8);
    -[HKInfographicTableItem setValueString:](v11, "setValueString:", v9);
    -[HKInfographicTableItem setSeparatorHidden:](v11, "setSeparatorHidden:", v5);
  }

  return v11;
}

- (NSAttributedString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (NSAttributedString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
  objc_storeStrong((id *)&self->_valueString, a3);
}

- (BOOL)separatorHidden
{
  return self->_separatorHidden;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  self->_separatorHidden = a3;
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
