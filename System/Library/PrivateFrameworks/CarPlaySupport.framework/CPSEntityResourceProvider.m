@implementation CPSEntityResourceProvider

- (CPSEntityResourceProvider)initWithTemplateEnvironment:(id)a3 entityTemplate:(id)a4 templateDelegate:(id)a5 actionDelegate:(id)a6
{
  CPSEntityResourceProvider *v6;
  CPSEntityResourceProvider *v8;
  objc_super v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  CPSEntityResourceProvider *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v6 = v17;
  v17 = 0;
  v12.receiver = v6;
  v12.super_class = (Class)CPSEntityResourceProvider;
  v17 = -[CPSEntityResourceProvider init](&v12, sel_init);
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    objc_storeWeak((id *)&v17->_templateEnvironment, location[0]);
    objc_storeWeak((id *)&v17->_entityTemplate, v15);
    objc_storeWeak((id *)&v17->_templateDelegate, v14);
    objc_storeWeak((id *)&v17->_actionDelegate, v13);
  }
  v8 = v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v8;
}

- (NSString)description
{
  void *v3;
  CPSEntityActionDelegate *v4;
  CPEntityClientTemplateDelegate *v5;
  CPEntityProviding *v6;
  CPSTemplateEnvironment *v7;
  NSString *v8;
  id v9;
  objc_super v10;
  SEL v11;
  CPSEntityResourceProvider *v12;

  v12 = self;
  v11 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)CPSEntityResourceProvider;
  v8 = -[CPSEntityResourceProvider description](&v10, sel_description);
  v7 = -[CPSEntityResourceProvider templateEnvironment](v12, "templateEnvironment");
  v6 = -[CPSEntityResourceProvider entityTemplate](v12, "entityTemplate");
  v5 = -[CPSEntityResourceProvider templateDelegate](v12, "templateDelegate");
  v4 = -[CPSEntityResourceProvider actionDelegate](v12, "actionDelegate");
  v9 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\t%@\n\t%@\n\t%@\n\t%@"), v8, v7, v6, v5, v4);

  return (NSString *)v9;
}

- (void)updateEntityTemplate:(id)a3 withProxyDelegate:(id)a4
{
  id v5;
  id location[2];
  CPSEntityResourceProvider *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSEntityResourceProvider setEntityTemplate:](v7, "setEntityTemplate:", location[0]);
  -[CPSEntityResourceProvider setTemplateDelegate:](v7, "setTemplateDelegate:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (CPSTemplateEnvironment)templateEnvironment
{
  return (CPSTemplateEnvironment *)objc_loadWeakRetained((id *)&self->_templateEnvironment);
}

- (CPEntityProviding)entityTemplate
{
  return (CPEntityProviding *)objc_loadWeakRetained((id *)&self->_entityTemplate);
}

- (void)setEntityTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_entityTemplate, a3);
}

- (CPEntityClientTemplateDelegate)templateDelegate
{
  return (CPEntityClientTemplateDelegate *)objc_loadWeakRetained((id *)&self->_templateDelegate);
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_templateDelegate, a3);
}

- (CPSEntityActionDelegate)actionDelegate
{
  return (CPSEntityActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_templateDelegate);
  objc_destroyWeak((id *)&self->_entityTemplate);
  objc_destroyWeak((id *)&self->_templateEnvironment);
}

@end
