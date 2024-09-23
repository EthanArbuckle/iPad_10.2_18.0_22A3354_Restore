@implementation _SUUIDynamicGridTemplateDefinitionModeValueMap

- (void)addTemplateDefinitionViewElement:(id)a3 forMode:(id)a4
{
  id v6;
  NSMutableDictionary *modeToTemplateDefinitionViewElements;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableArray *defaultTemplateDefinitionViewElements;
  NSMutableArray *v12;
  NSMutableArray *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14)
  {
    if (objc_msgSend(v6, "length"))
    {
      modeToTemplateDefinitionViewElements = self->_modeToTemplateDefinitionViewElements;
      if (!modeToTemplateDefinitionViewElements)
      {
        v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
        v9 = self->_modeToTemplateDefinitionViewElements;
        self->_modeToTemplateDefinitionViewElements = v8;

        modeToTemplateDefinitionViewElements = self->_modeToTemplateDefinitionViewElements;
      }
      -[NSMutableDictionary objectForKey:](modeToTemplateDefinitionViewElements, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
        -[NSMutableDictionary setObject:forKey:](self->_modeToTemplateDefinitionViewElements, "setObject:forKey:", v10, v6);
      }
      objc_msgSend(v10, "addObject:", v14);

    }
    else
    {
      defaultTemplateDefinitionViewElements = self->_defaultTemplateDefinitionViewElements;
      if (!defaultTemplateDefinitionViewElements)
      {
        v12 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
        v13 = self->_defaultTemplateDefinitionViewElements;
        self->_defaultTemplateDefinitionViewElements = v12;

        defaultTemplateDefinitionViewElements = self->_defaultTemplateDefinitionViewElements;
      }
      -[NSMutableArray addObject:](defaultTemplateDefinitionViewElements, "addObject:", v14);
    }
  }

}

- (id)templateDefinitionViewElementsForMode:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_modeToTemplateDefinitionViewElements, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v6 = self->_defaultTemplateDefinitionViewElements;

    v5 = v6;
  }
  if (!objc_msgSend(v4, "length") && !objc_msgSend(v5, "count"))
  {
    -[NSMutableDictionary allValues](self->_modeToTemplateDefinitionViewElements, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeToTemplateDefinitionViewElements, 0);
  objc_storeStrong((id *)&self->_defaultTemplateDefinitionViewElements, 0);
}

@end
