@implementation NTKPigmentEditOptionProvider

- (NTKPigmentEditOptionProvider)initWithFace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTKPigmentEditOptionProvider *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKPigmentEditOptionProvider initWithDomain:bundle:](self, "initWithDomain:bundle:", v5, v6);

  if (v7)
    objc_storeWeak((id *)&v7->_face, v4);

  return v7;
}

- (NTKPigmentEditOptionProvider)initWithDomain:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  NTKPigmentEditOptionProvider *v9;
  NTKPigmentEditOptionProvider *v10;
  uint64_t v11;
  NTKPigmentEditOptionStore *store;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKPigmentEditOptionProvider;
  v9 = -[NTKPigmentEditOptionProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundle, a4);
    objc_storeStrong((id *)&v10->_domain, a3);
    +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    store = v10->_store;
    v10->_store = (NTKPigmentEditOptionStore *)v11;

    -[NTKPigmentEditOptionStore addListener:forDomain:](v10->_store, "addListener:forDomain:", v10, v10->_domain);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKPigmentEditOptionStore removeListener:forDomain:](self->_store, "removeListener:forDomain:", self, self->_domain);
  v3.receiver = self;
  v3.super_class = (Class)NTKPigmentEditOptionProvider;
  -[NTKPigmentEditOptionProvider dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_destroyWeak((id *)&self->_face);
}

- (id)defaultColorOptionForSlot:(id)a3
{
  return -[NTKPigmentEditOptionStore defaultColorOptionForDomain:bundle:slot:](self->_store, "defaultColorOptionForDomain:bundle:slot:", self->_domain, self->_bundle, a3);
}

- (unint64_t)numberOfOptionsForSlot:(id)a3
{
  return -[NTKPigmentEditOptionStore numberOfOptionsForDomain:bundle:slot:](self->_store, "numberOfOptionsForDomain:bundle:slot:", self->_domain, self->_bundle, a3);
}

- (unint64_t)indexOfOption:(id)a3 slot:(id)a4
{
  return -[NTKPigmentEditOptionStore indexOfOption:domain:bundle:slot:](self->_store, "indexOfOption:domain:bundle:slot:", a3, self->_domain, self->_bundle, a4);
}

- (id)optionAtIndex:(unint64_t)a3 slot:(id)a4
{
  return -[NTKPigmentEditOptionStore optionAtIndex:domain:bundle:slot:](self->_store, "optionAtIndex:domain:bundle:slot:", a3, self->_domain, self->_bundle, a4);
}

- (id)fulfilledOptionForOption:(id)a3 slot:(id)a4
{
  return -[NTKPigmentEditOptionStore fulfilledOptionForOption:domain:bundle:slot:](self->_store, "fulfilledOptionForOption:domain:bundle:slot:", a3, self->_domain, self->_bundle, a4);
}

- (id)migratedOptionForInvalidOption:(id)a3 slot:(id)a4
{
  return -[NTKPigmentEditOptionStore migratedOptionForInvalidOption:domain:bundle:slot:](self->_store, "migratedOptionForInvalidOption:domain:bundle:slot:", a3, self->_domain, self->_bundle, a4);
}

- (id)availableColorsForSlot:(id)a3
{
  return -[NTKPigmentEditOptionStore colorOptionsForDomain:bundle:slot:](self->_store, "colorOptionsForDomain:bundle:slot:", self->_domain, self->_bundle, a3);
}

- (BOOL)hasAddableCollectionsForSlot:(id)a3
{
  return -[NTKPigmentEditOptionStore hasAddableCollectionsForDomain:bundle:slot:](self->_store, "hasAddableCollectionsForDomain:bundle:slot:", self->_domain, self->_bundle, a3);
}

- (void)colorEditOptionStore:(id)a3 didChangeForDomain:(id)a4
{
  void *v5;
  id v6;

  if (objc_msgSend(a4, "isEqualToString:", self->_domain))
  {
    -[NTKPigmentEditOptionProvider face](self, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NTKPigmentEditOptionProvider face](self, "face");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleColorEditOptionsChanged");

    }
  }
}

- (NTKFace)face
{
  return (NTKFace *)objc_loadWeakRetained((id *)&self->_face);
}

- (void)setFace:(id)a3
{
  objc_storeWeak((id *)&self->_face, a3);
}

- (uint64_t)bundle
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setBundle:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (uint64_t)domain
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)setDomain:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setStore:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

@end
