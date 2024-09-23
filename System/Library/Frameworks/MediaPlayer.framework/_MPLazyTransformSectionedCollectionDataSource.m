@implementation _MPLazyTransformSectionedCollectionDataSource

- (_MPLazyTransformSectionedCollectionDataSource)initWithSectionedCollection:(id)a3 sectionTransform:(id)a4 itemTransform:(id)a5
{
  id v9;
  id v10;
  id v11;
  _MPLazyTransformSectionedCollectionDataSource *v12;
  _MPLazyTransformSectionedCollectionDataSource *v13;
  uint64_t v14;
  id sectionTransform;
  uint64_t v16;
  id itemTransform;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_MPLazyTransformSectionedCollectionDataSource;
  v12 = -[_MPLazyTransformSectionedCollectionDataSource init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collection, a3);
    v14 = MEMORY[0x19403A810](v10);
    sectionTransform = v13->_sectionTransform;
    v13->_sectionTransform = (id)v14;

    v16 = MEMORY[0x19403A810](v11);
    itemTransform = v13->_itemTransform;
    v13->_itemTransform = (id)v16;

  }
  return v13;
}

- (id)itemAtIndexPath:(id)a3
{
  void (**itemTransform)(id, void *, id);
  MPSectionedCollection *collection;
  id v5;
  void *v6;
  void *v7;

  itemTransform = (void (**)(id, void *, id))self->_itemTransform;
  collection = self->_collection;
  v5 = a3;
  -[MPSectionedCollection itemAtIndexPath:](collection, "itemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  itemTransform[2](itemTransform, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return -[MPSectionedCollection numberOfItemsInSection:](self->_collection, "numberOfItemsInSection:", a3);
}

- (unint64_t)numberOfSections
{
  return -[MPSectionedCollection numberOfSections](self->_collection, "numberOfSections");
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void (**sectionTransform)(id, void *, unint64_t);
  void *v5;
  void *v6;

  sectionTransform = (void (**)(id, void *, unint64_t))self->_sectionTransform;
  -[MPSectionedCollection sectionAtIndex:](self->_collection, "sectionAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sectionTransform[2](sectionTransform, v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MPSectionedCollection)collection
{
  return self->_collection;
}

- (id)sectionTransform
{
  return self->_sectionTransform;
}

- (id)itemTransform
{
  return self->_itemTransform;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemTransform, 0);
  objc_storeStrong(&self->_sectionTransform, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
