@implementation BuddyTestFundamentalFlow

- (BuddyTestFundamentalFlow)init
{
  id v3;
  BuddyTestFundamentalFlow *v4;
  id location;

  v3 = +[BuddyTestFundamentalFlow classes](BuddyTestFundamentalFlow, "classes", a2, self);
  location = -[BuddyTestFundamentalFlow initWithClasses:](self, "initWithClasses:", v3);
  objc_storeStrong(&location, location);

  v4 = (BuddyTestFundamentalFlow *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyTestFundamentalFlow)initWithClasses:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t i;
  NSString *v8;
  id v9;
  BuddyTestFundamentalFlow *v10;
  _QWORD __b[8];
  Class aClass;
  id obj;
  id v15;
  objc_super v16;
  id location[2];
  id v18;
  _BYTE v19[128];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v18;
  v18 = 0;
  v16.receiver = v3;
  v16.super_class = (Class)BuddyTestFundamentalFlow;
  v18 = -[BuddyTestFundamentalFlow init](&v16, "init");
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    objc_storeStrong((id *)v18 + 2, location[0]);
    v15 = 0;
    obj = objc_alloc_init((Class)NSMutableDictionary);
    memset(__b, 0, sizeof(__b));
    v4 = location[0];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
    if (v5)
    {
      v6 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v5; ++i)
        {
          if (*(_QWORD *)__b[2] != v6)
            objc_enumerationMutation(v4);
          aClass = 0;
          aClass = *(Class *)(__b[1] + 8 * i);
          if (v15)
            objc_msgSend(obj, "setObject:forKeyedSubscript:", aClass, v15);
          v8 = NSStringFromClass(aClass);
          v9 = v15;
          v15 = v8;

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
      }
      while (v5);
    }

    objc_storeStrong((id *)v18 + 3, obj);
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v15, 0);
  }
  v10 = (BuddyTestFundamentalFlow *)v18;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v10;
}

+ (id)classes
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  _QWORD v9[8];
  NSString *aClassName;
  id location;
  id v12[3];
  _BYTE v13[128];

  v12[2] = a1;
  v12[1] = (id)a2;
  v2 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v12[0] = objc_msgSend(v2, "objectForKey:", CFSTR("DebugFlowItemClassNames"));

  location = objc_alloc_init((Class)NSMutableArray);
  memset(v9, 0, sizeof(v9));
  v3 = v12[0];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v9[2] != v5)
          objc_enumerationMutation(v3);
        aClassName = *(NSString **)(v9[1] + 8 * i);
        objc_msgSend(location, "addObject:", NSClassFromString(aClassName));
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v9, v13, 16);
    }
    while (v4);
  }

  v7 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v12, 0);
  return v7;
}

- (void)prepareWithCompletion:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
    (*((void (**)(void))location[0] + 2))();
  objc_storeStrong(location, 0);
}

- (Class)initialFlowItemClass
{
  NSArray *v2;
  BOOL v3;
  void (**v4)(id, id);
  char v6;
  id v7;
  id v8;

  v2 = -[BuddyTestFundamentalFlow classes](self, "classes");
  v8 = -[NSArray firstObject](v2, "firstObject");

  v6 = 0;
  v3 = 0;
  if (v8)
  {
    v7 = -[BuddyTestFundamentalFlow willSupplyInitialFlowItemClass](self, "willSupplyInitialFlowItemClass");
    v6 = 1;
    v3 = v7 != 0;
  }
  if ((v6 & 1) != 0)

  if (v3)
  {
    v4 = (void (**)(id, id))-[BuddyTestFundamentalFlow willSupplyInitialFlowItemClass](self, "willSupplyInitialFlowItemClass");
    v4[2](v4, v8);

  }
  return (Class)v8;
}

- (Class)debutFlowItemClass
{
  return 0;
}

- (void)configureFlowItem:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (Class)potentialNextFlowItemClassFollowingFlowItemClass:(Class)a3
{
  NSDictionary *v3;
  NSString *v4;
  id v5;

  v3 = -[BuddyTestFundamentalFlow nextClassByCurrentClassNameMap](self, "nextClassByCurrentClassNameMap");
  v4 = NSStringFromClass(a3);
  v5 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v4);

  return (Class)v5;
}

+ (id)allowedFlowItems
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEBD8;
  location = 0;
  objc_storeStrong(&location, &stru_100284100);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEBD0;
}

- (id)willSupplyInitialFlowItemClass
{
  return self->willSupplyInitialFlowItemClass;
}

- (void)setWillSupplyInitialFlowItemClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)classes
{
  return self->_classes;
}

- (void)setClasses:(id)a3
{
  objc_storeStrong((id *)&self->_classes, a3);
}

- (NSDictionary)nextClassByCurrentClassNameMap
{
  return self->_nextClassByCurrentClassNameMap;
}

- (void)setNextClassByCurrentClassNameMap:(id)a3
{
  objc_storeStrong((id *)&self->_nextClassByCurrentClassNameMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextClassByCurrentClassNameMap, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong(&self->willSupplyInitialFlowItemClass, 0);
}

@end
