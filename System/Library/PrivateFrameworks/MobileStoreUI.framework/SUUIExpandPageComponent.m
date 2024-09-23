@implementation SUUIExpandPageComponent

- (SUUIExpandPageComponent)initWithViewElement:(id)a3
{
  id v5;
  SUUIExpandPageComponent *v6;
  NSMutableArray *v7;
  NSMutableArray *childComponents;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  objc_class *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIExpandPageComponent;
  v6 = -[SUUIPageComponent initWithViewElement:](&v22, sel_initWithViewElement_, v5);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    childComponents = v6->_childComponents;
    v6->_childComponents = v7;

    objc_storeStrong((id *)&v6->_viewElement, a3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "flattenedChildren", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v15 = (objc_class *)SUUIPageComponentClassForComponentType(objc_msgSend(v14, "pageComponentType"));
          if (v15)
          {
            v16 = (void *)objc_msgSend([v15 alloc], "initWithViewElement:", v14);
            if (v16)
              -[NSMutableArray addObject:](v6->_childComponents, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

  }
  return v6;
}

- (id)childComponentForIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_childComponents, "objectAtIndex:", a3);
}

- (id)childComponents
{
  return self->_childComponents;
}

- (int64_t)componentType
{
  return 19;
}

- (id)metricsElementName
{
  return CFSTR("expand");
}

- (SUUIExpandViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_childComponents, 0);
}

@end
