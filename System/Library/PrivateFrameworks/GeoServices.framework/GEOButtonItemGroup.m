@implementation GEOButtonItemGroup

- (GEOButtonItemGroup)initWithGroupParams:(id)a3
{
  id v5;
  GEOButtonItemGroup *v6;
  GEOButtonItemGroup *v7;
  GEOButtonItemGroup *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOButtonItemGroup;
    v6 = -[GEOButtonItemGroup init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_params, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)buttonItems
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOPDGroupParams groupData](self->_params, "groupData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOButtonItem buttonItemsFromPDButtonItems:](GEOButtonItem, "buttonItemsFromPDButtonItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (int)buttonType
{
  return 7;
}

- (int)groupType
{
  int v2;

  v2 = -[GEOPDGroupParams groupButtonType](self->_params, "groupButtonType");
  if (v2)
    return v2 == 1;
  else
    return 2;
}

- (unint64_t)actionDataIndex
{
  return -[GEOPDGroupParams actionDataItemIndex](self->_params, "actionDataItemIndex");
}

- (id)description
{
  return -[GEOPDGroupParams description](self->_params, "description");
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[GEOPDGroupParams debugDescription](self->_params, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
}

@end
