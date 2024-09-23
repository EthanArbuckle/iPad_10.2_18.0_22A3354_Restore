@implementation CPSBaseEntityContentViewController

- (CPSBaseEntityContentViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  CPSBaseEntityContentViewController *v4;
  CPSBaseEntityContentViewController *v6;
  CPSBaseEntityContentViewController *v8;
  objc_super v9;
  id v10;
  id location[2];
  CPSBaseEntityContentViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)CPSBaseEntityContentViewController;
  v8 = -[CPSBaseEntityContentViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v12->_resourceProvider, v10);
    -[CPSBaseEntityContentViewController updateWithEntity:](v12, "updateWithEntity:", location[0]);
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)updateWithEntity:(id)a3
{
  id location[2];
  CPSBaseEntityContentViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[CPEntity isEqual:](v4->_entity, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_entity, location[0]);
    -[CPSBaseEntityContentViewController didUpdateEntity:](v4, "didUpdateEntity:", v4->_entity);
  }
  objc_storeStrong(location, 0);
}

- (void)didUpdateEntity:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAppearInUnsafeArea
{
  return 0;
}

- (BOOL)viewController:(id)a3 didPressButton:(id)a4
{
  CPSBaseEntityContentViewController *v5;
  id v6;
  CPEntity *v7;
  CPSEntityActionDelegate *v8;
  CPSEntityResourceProvider *v9;
  CPSEntityActionDelegate *v11;
  CPSEntityResourceProvider *v12;
  char v13;
  id v14;
  id location[2];
  CPSBaseEntityContentViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v12 = -[CPSBaseEntityContentViewController resourceProvider](v16, "resourceProvider");
  v11 = -[CPSEntityResourceProvider actionDelegate](v12, "actionDelegate");
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v9 = -[CPSBaseEntityContentViewController resourceProvider](v16, "resourceProvider");
    v8 = -[CPSEntityResourceProvider actionDelegate](v9, "actionDelegate");
    v5 = v16;
    v6 = v14;
    v7 = -[CPSBaseEntityContentViewController entity](v16, "entity");
    -[CPSEntityActionDelegate entityContentViewController:didPressButton:forEntity:](v8, "entityContentViewController:didPressButton:forEntity:", v5, v6);

  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (CPEntity)entity
{
  return self->_entity;
}

- (CPSEntityResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (void)setResourceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_resourceProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
