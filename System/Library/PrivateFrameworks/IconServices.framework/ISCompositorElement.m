@implementation ISCompositorElement

- (ISCompositorElement)initWithRecipe:(id)a3 resourceProvider:(id)a4
{
  id v7;
  id v8;
  ISCompositorElement *v9;
  ISCompositorElement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISCompositorElement;
  v9 = -[ISCompositorElement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recipe, a3);
    objc_storeStrong((id *)&v10->_resourceProvider, a4);
  }

  return v10;
}

- (ISCompositorElement)initWithRecipe:(id)a3 resourceProvider:(id)a4 additionalResources:(id)a5
{
  id v9;
  id v10;
  id v11;
  ISCompositorElement *v12;
  ISCompositorElement *v13;
  uint64_t v14;
  NSDictionary *additionalResources;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ISCompositorElement;
  v12 = -[ISCompositorElement init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recipe, a3);
    objc_storeStrong((id *)&v13->_resourceProvider, a4);
    v14 = objc_msgSend(v11, "copy");
    additionalResources = v13->_additionalResources;
    v13->_additionalResources = (NSDictionary *)v14;

  }
  return v13;
}

- (ISCompositorResourceProvider)resourceProvider
{
  if (!self->_additionalResources)
    self = (ISCompositorElement *)self->_resourceProvider;
  return (ISCompositorResourceProvider *)self;
}

- (id)resourceForKey:(id)a3
{
  id v4;
  char v5;
  ISCompositorResourceProvider *resourceProvider;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_opt_respondsToSelector();
  resourceProvider = self->_resourceProvider;
  if ((v5 & 1) != 0)
  {
    -[ISCompositorResourceProvider resourceForKey:](resourceProvider, "resourceForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "name");
    v8 = objc_claimAutoreleasedReturnValue();

    -[ISCompositorResourceProvider resourceNamed:](resourceProvider, "resourceNamed:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v8;
  }

  return v7;
}

- (id)resourceNamed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ISCompositorResourceProvider resourceNamed:](self->_resourceProvider, "resourceNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSDictionary _IS_resourceNamed:](self->_additionalResources, "_IS_resourceNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (ISCompositorRecipe)recipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)additionalResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalResources, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
