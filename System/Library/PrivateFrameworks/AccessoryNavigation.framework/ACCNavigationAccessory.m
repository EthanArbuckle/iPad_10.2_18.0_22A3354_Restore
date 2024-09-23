@implementation ACCNavigationAccessory

- (ACCNavigationAccessory)initWithAccessoryUID:(id)a3 provider:(id)a4
{
  id v7;
  id v8;
  ACCNavigationAccessory *v9;
  ACCNavigationAccessory *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *componentListInternal;
  NSMutableDictionary *v13;
  NSMutableDictionary *objectDetectionComponentListInternal;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ACCNavigationAccessory;
  v9 = -[ACCNavigationAccessory init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUID, a3);
    objc_storeWeak((id *)&v10->_provider, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    componentListInternal = v10->_componentListInternal;
    v10->_componentListInternal = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    objectDetectionComponentListInternal = v10->_objectDetectionComponentListInternal;
    v10->_objectDetectionComponentListInternal = v13;

  }
  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCNavigationAccessory - %@ components: count=%lu objectDetectionComponents: count=%lu>"), self->_accessoryUID, -[NSMutableDictionary count](self->_componentListInternal, "count"), -[NSMutableDictionary count](self->_objectDetectionComponentListInternal, "count"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accessoryUID;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessoryUID = self->_accessoryUID;
    objc_msgSend(v4, "accessoryUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](accessoryUID, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_accessoryUID, "hash");
}

- (NSDictionary)componentList
{
  return (NSDictionary *)self->_componentListInternal;
}

- (id)objectDetectionComponentList
{
  return self->_objectDetectionComponentListInternal;
}

- (id)componentListForIdList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = v4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_componentListInternal, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v12, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "containsObject:", v13);

        if (v14)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }

  return v5;
}

- (void)iterateComponentIdList:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  v26 = 0;
  if (v6)
  {
    v24 = 0uLL;
    v25 = 0uLL;
    v22 = 0uLL;
    v23 = 0uLL;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v6);
          -[NSMutableDictionary objectForKey:](self->_componentListInternal, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v12, &v26);

        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v9);
    }
  }
  else
  {
    v20 = 0uLL;
    v21 = 0uLL;
    v18 = 0uLL;
    v19 = 0uLL;
    -[NSMutableDictionary allValues](self->_componentListInternal, "allValues", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          v7[2](v7, *(void **)(*((_QWORD *)&v18 + 1) + 8 * j), &v26);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v15);
    }

  }
}

- (BOOL)componentIdListIsEnabled:(id)a3
{
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__ACCNavigationAccessory_componentIdListIsEnabled___block_invoke;
  v6[3] = &unk_24DC30920;
  v6[4] = &v7;
  -[ACCNavigationAccessory iterateComponentIdList:block:](self, "iterateComponentIdList:block:", v4, v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __51__ACCNavigationAccessory_componentIdListIsEnabled___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (objc_msgSend(v5, "isEnabled"))
    {
      *a3 = 0;
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
  {
    goto LABEL_5;
  }

}

- (BOOL)requestedSourceSupportsRouteGuidanceForAnyComponent
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__ACCNavigationAccessory_requestedSourceSupportsRouteGuidanceForAnyComponent__block_invoke;
  v4[3] = &unk_24DC30920;
  v4[4] = &v5;
  -[ACCNavigationAccessory iterateComponentIdList:block:](self, "iterateComponentIdList:block:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __77__ACCNavigationAccessory_requestedSourceSupportsRouteGuidanceForAnyComponent__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (objc_msgSend(v5, "requestSourceSupportsRouteGuidance"))
    {
      *a3 = 0;
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else if ((objc_msgSend(v5, "requestSourceSupportsRouteGuidance") & 1) != 0)
  {
    goto LABEL_5;
  }

}

- (BOOL)requestedSourceNameForAnyComponent
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__ACCNavigationAccessory_requestedSourceNameForAnyComponent__block_invoke;
  v4[3] = &unk_24DC30920;
  v4[4] = &v5;
  -[ACCNavigationAccessory iterateComponentIdList:block:](self, "iterateComponentIdList:block:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __60__ACCNavigationAccessory_requestedSourceNameForAnyComponent__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (objc_msgSend(v5, "requestSourceName"))
    {
      *a3 = 0;
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else if ((objc_msgSend(v5, "requestSourceName") & 1) != 0)
  {
    goto LABEL_5;
  }

}

- (BOOL)supportsExitInfoForAnyComponent
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__ACCNavigationAccessory_supportsExitInfoForAnyComponent__block_invoke;
  v4[3] = &unk_24DC30920;
  v4[4] = &v5;
  -[ACCNavigationAccessory iterateComponentIdList:block:](self, "iterateComponentIdList:block:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __57__ACCNavigationAccessory_supportsExitInfoForAnyComponent__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (objc_msgSend(v5, "supportsExitInfo"))
    {
      *a3 = 0;
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else if ((objc_msgSend(v5, "supportsExitInfo") & 1) != 0)
  {
    goto LABEL_5;
  }

}

- (BOOL)supportsLaneGuidanceForAnyComponent
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__ACCNavigationAccessory_supportsLaneGuidanceForAnyComponent__block_invoke;
  v4[3] = &unk_24DC30920;
  v4[4] = &v5;
  -[ACCNavigationAccessory iterateComponentIdList:block:](self, "iterateComponentIdList:block:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__ACCNavigationAccessory_supportsLaneGuidanceForAnyComponent__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (objc_msgSend(v5, "supportsLaneGuidance"))
    {
      *a3 = 0;
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else if ((objc_msgSend(v5, "supportsLaneGuidance") & 1) != 0)
  {
    goto LABEL_5;
  }

}

- (BOOL)supportsTimeZoneOffsetForAnyComponent
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__ACCNavigationAccessory_supportsTimeZoneOffsetForAnyComponent__block_invoke;
  v4[3] = &unk_24DC30920;
  v4[4] = &v5;
  -[ACCNavigationAccessory iterateComponentIdList:block:](self, "iterateComponentIdList:block:", 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __63__ACCNavigationAccessory_supportsTimeZoneOffsetForAnyComponent__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    *a3 = 1;
    if (objc_msgSend(v5, "supportsTimeZoneOffset"))
    {
      *a3 = 0;
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else if ((objc_msgSend(v5, "supportsTimeZoneOffset") & 1) != 0)
  {
    goto LABEL_5;
  }

}

- (void)updateRouteGuidanceInfo:(id)a3 componentList:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "identifier", (_QWORD)v16));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "routeGuidance:updateInfo:componentIdList:", self, v6, v8);

}

- (void)updateManeuverInfo:(id)a3 componentList:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "identifier", (_QWORD)v16));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "routeGuidance:maneuverUpdateInfo:componentIdList:", self, v6, v8);

}

- (void)updateLaneGuidanceInfo:(id)a3 componentList:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "identifier", (_QWORD)v16));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "routeGuidance:laneGuidanceInfo:componentIdList:", self, v6, v8);

}

- (id)objectDetectionComponentListForIdList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_objectDetectionComponentListInternal, "allValues", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "identifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v6, "containsObject:", v13);

          if (!v14)
            continue;
        }
        objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationAccessory objectDetectionComponentListForIdList:].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(_QWORD *)(v19 + 16);
    *(_DWORD *)buf = 138412802;
    v26 = v18;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v5;
    _os_log_debug_impl(&dword_219FB5000, v15, OS_LOG_TYPE_DEBUG, "[#Navigation] NavigationAccessory objectDetectionComponentListForIdList: accessoryUID %@, componentIdList %@, componentList %@", buf, 0x20u);
  }

  return v5;
}

- (BOOL)objectDetectionComponentIdListIsEnabled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  NSString *accessoryUID;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  NSString *v31;
  BOOL v32;
  id v33;
  NSObject *v34;
  NSString *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  obj = v4;
  if (v4)
  {
    v5 = v4;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v44;
      v10 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(obj);
          -[NSMutableDictionary objectForKey:](self->_objectDetectionComponentListInternal, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = gLogObjects;
          v14 = gNumLogObjects;
          if (gLogObjects)
            v15 = gNumLogObjects < 1;
          else
            v15 = 1;
          if (v15)
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v48 = v13;
              v49 = 1024;
              LODWORD(v50) = v14;
              _os_log_error_impl(&dword_219FB5000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v16 = v10;
            v17 = v10;
          }
          else
          {
            v17 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            accessoryUID = self->_accessoryUID;
            *(_DWORD *)buf = 138412546;
            v48 = (uint64_t)accessoryUID;
            v49 = 2112;
            v50 = v12;
            _os_log_debug_impl(&dword_219FB5000, v17, OS_LOG_TYPE_DEBUG, "[#Navigation] NavigationAccessory objectDetectionComponentIdListIsEnabled: accessoryUID %@, select components, component %@", buf, 0x16u);
          }

          if (objc_msgSend(v12, "isEnabled"))
            v8 = 1;

        }
        v5 = obj;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v7);
      LOBYTE(v19) = v8 & 1;
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSMutableDictionary allValues](self->_objectDetectionComponentListInternal, "allValues");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    if (v20)
    {
      v21 = v20;
      v19 = 0;
      v22 = *(_QWORD *)v40;
      v23 = MEMORY[0x24BDACB70];
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v37);
          v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          v26 = gLogObjects;
          v27 = gNumLogObjects;
          if (gLogObjects)
            v28 = gNumLogObjects < 1;
          else
            v28 = 1;
          if (v28)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v48 = v26;
              v49 = 1024;
              LODWORD(v50) = v27;
              _os_log_error_impl(&dword_219FB5000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v29 = v23;
            v30 = v23;
          }
          else
          {
            v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v31 = self->_accessoryUID;
            *(_DWORD *)buf = 138412546;
            v48 = (uint64_t)v31;
            v49 = 2112;
            v50 = v25;
            _os_log_debug_impl(&dword_219FB5000, v30, OS_LOG_TYPE_DEBUG, "[#Navigation] NavigationAccessory objectDetectionComponentIdListIsEnabled: accessoryUID %@, all components, component %@", buf, 0x16u);
          }

          v19 |= objc_msgSend(v25, "isEnabled");
        }
        v21 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      }
      while (v21);
    }
    else
    {
      LOBYTE(v19) = 0;
    }

    v5 = 0;
  }
  if (gLogObjects)
    v32 = gNumLogObjects < 1;
  else
    v32 = 1;
  if (v32)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationAccessory objectDetectionComponentListForIdList:].cold.1();
    v34 = MEMORY[0x24BDACB70];
    v33 = MEMORY[0x24BDACB70];
  }
  else
  {
    v34 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v36 = self->_accessoryUID;
    *(_DWORD *)buf = 138412802;
    v48 = (uint64_t)v36;
    v49 = 2112;
    v50 = v5;
    v51 = 1024;
    v52 = v19 & 1;
    _os_log_debug_impl(&dword_219FB5000, v34, OS_LOG_TYPE_DEBUG, "[#Navigation] Navigation objectDetectionComponentIdListIsEnabled: accessoryUID %@, componentIDList %@, isEnabled=%d", buf, 0x1Cu);
  }

  return v19 & 1;
}

- (ACCNavigationProvider)provider
{
  return (ACCNavigationProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUID, a3);
}

- (NSMutableDictionary)componentListInternal
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComponentListInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)objectDetectionComponentListInternal
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObjectDetectionComponentListInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectDetectionComponentListInternal, 0);
  objc_storeStrong((id *)&self->_componentListInternal, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
  objc_destroyWeak((id *)&self->_provider);
}

- (void)objectDetectionComponentListForIdList:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219FB5000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end
