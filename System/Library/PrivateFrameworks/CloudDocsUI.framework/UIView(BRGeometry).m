@implementation UIView(BRGeometry)

+ (id)br_behaviourMap
{
  if (br_behaviourMap_onceToken != -1)
    dispatch_once(&br_behaviourMap_onceToken, &__block_literal_global_1);
  return (id)br_behaviourMap_behaviourMap;
}

+ (void)br_gatherBehaviour
{
  id v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "br_behaviourMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v3 = (void *)objc_msgSend(v4, "unsignedIntegerValue");

  objc_sync_exit(v2);
  if (!v4)
  {
    if ((void *)objc_opt_class() == a1)
      v3 = 0;
    else
      v3 = (void *)objc_msgSend((id)objc_msgSend(a1, "superclass"), "br_gatherBehaviour");
  }

  return v3;
}

+ (void)br_setGatherBehaviour:()BRGeometry
{
  void *v5;
  void *v6;
  id obj;

  objc_msgSend(a1, "br_behaviourMap");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setObject:forKey:", v5, v6);

  objc_sync_exit(obj);
}

+ (void)br_setGatherBehaviour:()BRGeometry forClassesNamed:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "br_behaviourMap");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v13, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)br_setLayerNames
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = a1;
  v5.super_class = (Class)UIView_0;
  objc_msgSendSuper2(&v5, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v3);

  objc_msgSend(a1, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_br_setLayerNames);

}

- (uint64_t)br_contentDescription
{
  return 0;
}

- (void)br_ignoreClipping
{
  objc_setAssociatedObject(a1, &BRIgnoreClippingKey, MEMORY[0x24BDBD1C8], (void *)3);
}

- (uint64_t)br_viewIsClipped
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, &BRIgnoreClippingKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "BOOLValue") & 1) != 0)
  {
LABEL_33:
    v23 = 0;
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(a1, "constraintsAffectingLayoutForAxis:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v30;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
          objc_msgSend(v9, "firstItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 == a1 && objc_msgSend(v9, "firstAttribute") == 8 && !objc_msgSend(v9, "secondAttribute"))
          {
            objc_msgSend(v9, "constant");
            v12 = v11;

            if (v12 == 0.0)
            {
LABEL_32:

              goto LABEL_33;
            }
          }
          else
          {

          }
          ++v8;
        }
        while (v6 != v8);
        v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        v6 = v13;
      }
      while (v13);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(a1, "constraintsAffectingLayoutForAxis:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v4);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
          objc_msgSend(v18, "firstItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 == a1 && objc_msgSend(v18, "firstAttribute") == 7 && !objc_msgSend(v18, "secondAttribute"))
          {
            objc_msgSend(v18, "constant");
            v21 = v20;

            if (v21 == 0.0)
              goto LABEL_32;
          }
          else
          {

          }
          ++v17;
        }
        while (v15 != v17);
        v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        v15 = v22;
      }
      while (v22);
    }

    v23 = objc_msgSend(a1, "_UIViewDebuggingIsViewClipping");
  }

  return v23;
}

@end
