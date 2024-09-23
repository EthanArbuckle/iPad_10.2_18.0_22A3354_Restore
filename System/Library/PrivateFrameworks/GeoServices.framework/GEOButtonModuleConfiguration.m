@implementation GEOButtonModuleConfiguration

- (GEOButtonModuleConfiguration)initWithButtonModuleConfiguration:(id)a3
{
  id v5;
  GEOButtonModuleConfiguration *v6;
  GEOButtonModuleConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOButtonModuleConfiguration;
  v6 = -[GEOButtonModuleConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_buttonModuleConfig, a3);

  return v7;
}

- (NSArray)buttonItems
{
  void *v2;
  void *v3;

  -[GEOPDButtonModuleConfiguration buttonItems]((id *)&self->_buttonModuleConfig->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOButtonItem buttonItemsFromPDButtonItems:](GEOButtonItem, "buttonItemsFromPDButtonItems:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)description
{
  return -[GEOPDButtonModuleConfiguration description](self->_buttonModuleConfig, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonModuleConfig, 0);
}

@end
