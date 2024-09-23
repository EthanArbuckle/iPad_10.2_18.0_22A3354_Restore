@implementation SFContactAutoFillPropertyValues

- (SFContactAutoFillPropertyValues)initWithValues:(id)a3 property:(id)a4
{
  id v6;
  id v7;
  SFContactAutoFillPropertyValues *v8;
  uint64_t v9;
  NSArray *values;
  uint64_t v11;
  NSString *property;
  SFContactAutoFillPropertyValues *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFContactAutoFillPropertyValues;
  v8 = -[SFContactAutoFillPropertyValues init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    values = v8->_values;
    v8->_values = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    property = v8->_property;
    v8->_property = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (SFContactAutoFillValue)selectedValue
{
  return (SFContactAutoFillValue *)-[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", self->_selectedIndex);
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
