@implementation DKReportPlanner

+ (DKReportPlanner)plannerWithReportGeneratorRegistry:(id)a3
{
  id v3;
  DKReportPlanner *v4;

  v3 = a3;
  v4 = -[DKReportPlanner initWithReportGeneratorRegistry:]([DKReportPlanner alloc], "initWithReportGeneratorRegistry:", v3);

  return v4;
}

- (DKReportPlanner)initWithReportGeneratorRegistry:(id)a3
{
  id v5;
  DKReportPlanner *v6;
  DKReportPlanner *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DKReportPlanner;
  v6 = -[DKReportPlanner init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_registry, a3);

  return v7;
}

- (id)requestGroupsForPredicateManifest:(id)a3
{
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v20;
  id obj;
  id v22;
  uint64_t v23;
  DKReportPlanner *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v24 = self;
  v20 = v4;
  -[DKReportPlanner _resolveComponentIdentityManifest:](self, "_resolveComponentIdentityManifest:", v4);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[DKReportPlanner registry](v24, "registry");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "generatorForComponentIdentity:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v26 = i;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = v22;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v28;
LABEL_9:
            v13 = 0;
            while (1)
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
              objc_msgSend(v14, "requestLookupByGenerator");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "allKeys");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "count");

              if (v17 <= 3 && (objc_msgSend(v14, "addComponentIdentity:usingGenerator:", v6, v8) & 1) != 0)
                break;
              if (v11 == ++v13)
              {
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                if (v11)
                  goto LABEL_9;
                goto LABEL_16;
              }
            }
          }
          else
          {
LABEL_16:

            v18 = (void *)objc_opt_new();
            objc_msgSend(v18, "addComponentIdentity:usingGenerator:", v6, v8);
            objc_msgSend(v9, "addObject:", v18);
            v9 = v18;
          }

          i = v26;
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }

  return v22;
}

- (id)_resolveComponentIdentityManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKReportPlanner registry](self, "registry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v4)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = v4;
    obj = v4;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          v10 = v5;
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v8, "count", v20));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v13 = v8;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                if (objc_msgSend(v11, "matchesComponentIdentity:", v18))
                  objc_msgSend(v12, "addObject:", v18);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v15);
          }

          objc_msgSend(v13, "minusSet:", v12);
          v5 = v10;
          objc_msgSend(v10, "unionSet:", v12);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v23);
    }

    v4 = v20;
  }
  else
  {
    objc_msgSend(v5, "unionSet:", v8);
  }

  return v5;
}

- (DKReporterRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
