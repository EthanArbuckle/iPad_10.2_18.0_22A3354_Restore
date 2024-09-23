@implementation SUUIGalleryPageComponent

- (SUUIGalleryPageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUIGalleryPageComponent *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *childComponents;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUUIGalleryPageComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v31, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("cycleInterval"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      v5->_cycleInterval = v8;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("hidesPageIndicator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_hidesPageIndicator = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("children"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v9;
      v25 = v6;
      v11 = (void *)objc_msgSend(v4, "copy");
      v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v23 = v10;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "objectForKey:", CFSTR("type"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && SUUIPageComponentTypeForBlockType(v18) == 10)
              {
                objc_msgSend(v11, "setComponentDictionary:", v17);
                v19 = (void *)objc_msgSend(objc_alloc((Class)SUUIPageComponentClassForComponentType(10)), "initWithCustomPageContext:", v11);
                if (v19)
                  objc_msgSend(v26, "addObject:", v19);

              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v14);
      }

      v20 = objc_msgSend(v26, "copy");
      childComponents = v5->_childComponents;
      v5->_childComponents = (NSArray *)v20;

      v9 = v24;
      v6 = v25;
      v10 = v23;
    }

  }
  return v5;
}

- (int64_t)componentType
{
  return 7;
}

- (id)metricsElementName
{
  return CFSTR("gallery");
}

- (NSArray)childComponents
{
  return self->_childComponents;
}

- (double)cycleInterval
{
  return self->_cycleInterval;
}

- (void)setCycleInterval:(double)a3
{
  self->_cycleInterval = a3;
}

- (BOOL)hidesPageIndicator
{
  return self->_hidesPageIndicator;
}

- (void)setHidesPageIndicator:(BOOL)a3
{
  self->_hidesPageIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childComponents, 0);
}

@end
