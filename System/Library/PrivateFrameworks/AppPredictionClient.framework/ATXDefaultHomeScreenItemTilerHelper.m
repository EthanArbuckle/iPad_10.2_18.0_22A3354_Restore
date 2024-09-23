@implementation ATXDefaultHomeScreenItemTilerHelper

- (ATXDefaultHomeScreenItemTilerHelper)init
{
  ATXDefaultHomeScreenItemTilerHelper *v2;
  uint64_t v3;
  NSMutableSet *usedBundleIds;
  uint64_t v5;
  NSMutableSet *usedSpecialKinds;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXDefaultHomeScreenItemTilerHelper;
  v2 = -[ATXDefaultHomeScreenItemTilerHelper init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    usedBundleIds = v2->_usedBundleIds;
    v2->_usedBundleIds = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    usedSpecialKinds = v2->_usedSpecialKinds;
    v2->_usedSpecialKinds = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)unmarkWidgetAsUsed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSMutableSet *usedSpecialKinds;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend(v4, "appBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableSet removeObject:](self->_usedBundleIds, "removeObject:", v5);
    }
    else
    {
      objc_msgSend(v12, "avocadoDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "kind");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[ATXDefaultHomeScreenItemTilerHelper _isSpecialAvocadoDescriptorKind:](self, "_isSpecialAvocadoDescriptorKind:", v7);

      if (v8)
      {
        usedSpecialKinds = self->_usedSpecialKinds;
        objc_msgSend(v12, "avocadoDescriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "kind");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](usedSpecialKinds, "removeObject:", v11);

      }
    }

    v4 = v12;
  }

}

- (id)filterForNextUnusedWidgetDescriptor:(id)a3
{
  id v4;
  void *i;
  void *v6;
  void *v7;

  v4 = a3;
  for (i = v4; ; v4 = i)
  {
    if (!objc_msgSend(v4, "count"))
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend(i, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "removeObjectAtIndex:", 0);
    objc_msgSend(v6, "avocadoDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!-[ATXDefaultHomeScreenItemTilerHelper _isWidgetAlreadyUsed:](self, "_isWidgetAlreadyUsed:", v6))
        break;
    }

  }
  -[ATXDefaultHomeScreenItemTilerHelper _markWidgetAsUsed:](self, "_markWidgetAsUsed:", v6);
LABEL_8:

  return v6;
}

- (BOOL)_isSpecialAvocadoDescriptorKind:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSiri")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindFiles")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSmartStack")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions"));
  }

  return v4;
}

- (BOOL)_isWidgetAlreadyUsed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSMutableSet *usedSpecialKinds;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_msgSend(v4, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((-[NSMutableSet containsObject:](self->_usedBundleIds, "containsObject:", v5) & 1) == 0)
    {
LABEL_7:
      v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v4, "avocadoDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ATXDefaultHomeScreenItemTilerHelper _isSpecialAvocadoDescriptorKind:](self, "_isSpecialAvocadoDescriptorKind:", v7);

    if (!v8)
      goto LABEL_7;
    usedSpecialKinds = self->_usedSpecialKinds;
    objc_msgSend(v4, "avocadoDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "kind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(usedSpecialKinds) = -[NSMutableSet containsObject:](usedSpecialKinds, "containsObject:", v11);

    if ((usedSpecialKinds & 1) == 0)
      goto LABEL_7;
  }
  v12 = 1;
LABEL_8:

  return v12;
}

- (void)_markWidgetAsUsed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSMutableSet *usedSpecialKinds;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableSet addObject:](self->_usedBundleIds, "addObject:", v4);
  }
  else
  {
    objc_msgSend(v11, "avocadoDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ATXDefaultHomeScreenItemTilerHelper _isSpecialAvocadoDescriptorKind:](self, "_isSpecialAvocadoDescriptorKind:", v6);

    if (v7)
    {
      usedSpecialKinds = self->_usedSpecialKinds;
      objc_msgSend(v11, "avocadoDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "kind");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](usedSpecialKinds, "addObject:", v10);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedSpecialKinds, 0);
  objc_storeStrong((id *)&self->_usedBundleIds, 0);
}

@end
