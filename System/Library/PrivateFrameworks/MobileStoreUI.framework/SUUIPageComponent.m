@implementation SUUIPageComponent

- (SUUIPageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  SUUIPageComponent *v15;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "componentDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("startTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "pageGenerationTime");
    v8 = v7;
    objc_msgSend(v6, "doubleValue");
    v10 = v8 < v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("endTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v10)
      goto LABEL_6;
LABEL_8:

    v15 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "pageGenerationTime");
  v13 = v12;
  objc_msgSend(v11, "doubleValue");
  if (v13 > v14)
    goto LABEL_8;
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)SUUIPageComponent;
  v15 = -[SUUIPageComponent init](&v17, sel_init);
LABEL_9:

  return v15;
}

- (SUUIPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIPageComponent;
  return -[SUUIPageComponent init](&v5, sel_init, a3, a4);
}

- (SUUIPageComponent)initWithViewElement:(id)a3
{
  id v5;
  SUUIPageComponent *v6;
  SUUIPageComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIPageComponent;
  v6 = -[SUUIPageComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewElement, a3);

  return v7;
}

- (int64_t)componentType
{
  int64_t result;

  result = (int64_t)self->_viewElement;
  if (result)
    return objc_msgSend((id)result, "pageComponentType");
  return result;
}

- (BOOL)isMissingItemData
{
  return 0;
}

- (NSString)metricsElementName
{
  return 0;
}

- (id)valueForMetricsField:(id)a3
{
  return 0;
}

- (void)_enumerateMissingItemIdentifiersFromBricks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, int64_t, _BYTE *);
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unsigned __int8 v17;

  v7 = a3;
  v8 = (void (**)(id, void *, int64_t, _BYTE *))a5;
  v9 = objc_msgSend(v7, "count");
  if (v9 > a4)
  {
    v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x2426A2860]();
      v17 = 0;
      objc_msgSend(v7, "objectAtIndex:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "link");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isActionable") & 1) == 0 && v14)
        v8[2](v8, v14, a4, &v17);
      v15 = v17;

      objc_autoreleasePoolPop(v11);
      if (v15)
        break;
    }
    while (v10 != a4++);
  }

}

- (void)_enumerateMissingItemIdentifiersFromLinks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, int64_t, _BYTE *);
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unsigned __int8 v16;

  v7 = a3;
  v8 = (void (**)(id, void *, int64_t, _BYTE *))a5;
  v9 = objc_msgSend(v7, "count");
  if (v9 > a4)
  {
    v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x2426A2860]();
      v16 = 0;
      objc_msgSend(v7, "objectAtIndex:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isActionable") & 1) == 0 && v13)
        v8[2](v8, v13, a4, &v16);
      v14 = v16;

      objc_autoreleasePoolPop(v11);
      if (v14)
        break;
    }
    while (v10 != a4++);
  }

}

- (void)_enumerateMissingItemIdentifiersFromLockups:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, int64_t, _BYTE *);
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  unsigned __int8 v18;

  v7 = a3;
  v8 = (void (**)(id, void *, int64_t, _BYTE *))a5;
  v9 = objc_msgSend(v7, "count");
  if (v9 > a4)
  {
    v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x2426A2860]();
      v18 = 0;
      objc_msgSend(v7, "objectAtIndex:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "itemIdentifier");
      if (v13)
      {
        v14 = v13;
        if (objc_msgSend(v12, "_needsItemData"))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", v14);
          v8[2](v8, v15, a4, &v18);

        }
      }
      v16 = v18;

      objc_autoreleasePoolPop(v11);
      if (v16)
        break;
    }
    while (v10 != a4++);
  }

}

- (int64_t)metricsLocationPosition
{
  return self->_metricsLocationPosition;
}

- (void)_setMetricsLocationPosition:(int64_t)a3
{
  self->_metricsLocationPosition = a3;
}

- (SUUIViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
