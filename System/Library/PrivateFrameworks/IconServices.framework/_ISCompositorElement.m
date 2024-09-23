@implementation _ISCompositorElement

- (_ISCompositorElement)init
{
  ISGenericRecipe *v3;
  void *v4;
  _ISCompositorElement *v5;

  v3 = objc_alloc_init(ISGenericRecipe);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_ISCompositorElement initWithRecipe:resources:](self, "initWithRecipe:resources:", v3, v4);

  return v5;
}

- (_ISCompositorElement)initWithRecipe:(id)a3 resources:(id)a4
{
  id v7;
  id v8;
  _ISCompositorElement *v9;
  uint64_t v10;
  NSMutableDictionary *resourceByName;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_ISCompositorElement;
  v9 = -[_ISCompositorElement init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    resourceByName = v9->_resourceByName;
    v9->_resourceByName = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_recipe, a3);
  }

  return v9;
}

- (void)setResource:(id)a3 forName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[_ISCompositorElement resourceByName](self, "resourceByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)addResourcesFromDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ISCompositorElement resourceByName](self, "resourceByName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

- (void)clearResources
{
  NSMutableDictionary *v3;
  NSMutableDictionary *resourceByName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  resourceByName = self->_resourceByName;
  self->_resourceByName = v3;

}

- (id)resourceNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ISCompositorElement resourceByName](self, "resourceByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_IS_resourceNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ISCompositorRecipe)recipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecipe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)resourceByName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceByName, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
