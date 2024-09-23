@implementation CPSNavigationBar

- (CPSNavigationBar)initWithFrame:(CGRect)a3
{
  NSMapTable *v3;
  NSMapTable *lastFocusedItems;
  CPSNavigationBar *v6;
  objc_super v7;
  SEL v8;
  CPSNavigationBar *v9;
  CGRect v10;

  v10 = a3;
  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CPSNavigationBar;
  v9 = -[CPSNavigationBar initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v3 = (NSMapTable *)(id)objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 517);
    lastFocusedItems = v9->_lastFocusedItems;
    v9->_lastFocusedItems = v3;

  }
  v6 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (void)didMoveToSuperview
{
  -[CPSNavigationBar setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  -[CPSNavigationBar updateFocusIfNeeded](self, "updateFocusIfNeeded");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v4;
  id v5;
  NSMapTable *v6;
  id v8;
  char v9;
  char v10;
  id v11;
  objc_super v12;
  id v13;
  id location[2];
  CPSNavigationBar *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12.receiver = v15;
  v12.super_class = (Class)CPSNavigationBar;
  -[CPSNavigationBar didUpdateFocusInContext:withAnimationCoordinator:](&v12, sel_didUpdateFocusInContext_withAnimationCoordinator_, location[0], v13);
  v8 = (id)objc_msgSend(location[0], "nextFocusedView");
  v10 = 0;
  v9 = 0;
  if (v8)
  {
    v11 = (id)objc_msgSend(location[0], "nextFocusedView");
    v10 = 1;
    v9 = objc_msgSend(v11, "isDescendantOfView:", v15);
  }
  if ((v10 & 1) != 0)

  if ((v9 & 1) != 0)
  {
    v6 = -[CPSNavigationBar lastFocusedItems](v15, "lastFocusedItems");
    v5 = (id)objc_msgSend(location[0], "nextFocusedItem");
    v4 = (id)-[CPSNavigationBar topItem](v15, "topItem");
    -[NSMapTable setObject:forKey:](v6, "setObject:forKey:", v5);

  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (id)popNavigationItemAnimated:(BOOL)a3
{
  NSMapTable *v4;
  id v5;
  objc_super v6;
  id v7;
  BOOL v8;
  SEL v9;
  CPSNavigationBar *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CPSNavigationBar;
  v7 = -[CPSNavigationBar popNavigationItemAnimated:](&v6, sel_popNavigationItemAnimated_, a3);
  v4 = -[CPSNavigationBar lastFocusedItems](v10, "lastFocusedItems");
  -[NSMapTable removeObjectForKey:](v4, "removeObjectForKey:", v7);

  v5 = v7;
  objc_storeStrong(&v7, 0);
  return v5;
}

- (id)preferredFocusEnvironments
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSMapTable *v8;
  id v9;
  NSMapTable *v10;
  id v11;
  id v12[2];
  CPSNavigationBar *v13;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = -[CPSNavigationBar lastFocusedItems](v13, "lastFocusedItems");
  v9 = (id)-[CPSNavigationBar topItem](v13, "topItem");
  v11 = -[NSMapTable objectForKey:](v10, "objectForKey:");

  if (v11)
  {
    v8 = -[CPSNavigationBar lastFocusedItems](v13, "lastFocusedItems");
    v7 = (id)-[CPSNavigationBar topItem](v13, "topItem");
    v6 = -[NSMapTable objectForKey:](v8, "objectForKey:");
    objc_msgSend(v12[0], "addObject:");

  }
  v3 = v12[0];
  v4 = -[CPSNavigationBar _linearFocusItems](v13, "_linearFocusItems");
  objc_msgSend(v3, "addObjectsFromArray:");

  v5 = (id)objc_msgSend(v12[0], "copy");
  objc_storeStrong(v12, 0);
  return v5;
}

- (id)_linearFocusItems
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15[2];
  CPSNavigationBar *v16;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (id)-[CPSNavigationBar items](v16, "items");
  v4 = (id)objc_msgSend(v5, "firstObject");
  v3 = (id)objc_msgSend(v4, "leftBarButtonItems");
  v14 = (id)objc_msgSend(v3, "cps_map:", &__block_literal_global_18);

  v8 = (id)-[CPSNavigationBar items](v16, "items");
  v7 = (id)objc_msgSend(v8, "firstObject");
  v6 = (id)objc_msgSend(v7, "rightBarButtonItems");
  v13 = (id)objc_msgSend(v6, "cps_map:", &__block_literal_global_6);

  objc_msgSend(v15[0], "addObjectsFromArray:", v14);
  v9 = v15[0];
  v11 = (id)objc_msgSend(v13, "reverseObjectEnumerator");
  v10 = (id)objc_msgSend(v11, "allObjects");
  objc_msgSend(v9, "addObjectsFromArray:");

  v12 = v15[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
  return v12;
}

id __37__CPSNavigationBar__linearFocusItems__block_invoke(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "customView");
  objc_storeStrong(location, 0);
  return v3;
}

id __37__CPSNavigationBar__linearFocusItems__block_invoke_2(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "customView");
  objc_storeStrong(location, 0);
  return v3;
}

- (NSMapTable)lastFocusedItems
{
  return self->_lastFocusedItems;
}

- (void)setLastFocusedItems:(id)a3
{
  objc_storeStrong((id *)&self->_lastFocusedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusedItems, 0);
}

@end
