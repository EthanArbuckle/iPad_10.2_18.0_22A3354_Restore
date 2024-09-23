@implementation HUServicePlaceholderItemModuleController

- (HUServicePlaceholderItemModuleController)initWithModule:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HUServicePlaceholderItemModuleController *v11;
  HUCollectionLayoutManager *v12;
  objc_super v14;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v6;
    if (v7)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

  }
  v8 = 0;
LABEL_8:

  v14.receiver = self;
  v14.super_class = (Class)HUServicePlaceholderItemModuleController;
  v11 = -[HUItemModuleController initWithModule:](&v14, sel_initWithModule_, v6);
  if (v11)
  {
    v12 = objc_alloc_init(HUCollectionLayoutManager);
    -[HUServicePlaceholderItemModuleController setCollectionLayoutManager:](v11, "setCollectionLayoutManager:", v12);

  }
  return v11;
}

- (void)setCollectionLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLayoutManager, a3);
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v5 = a4;
  -[HUServicePlaceholderItemModuleController collectionLayoutManager](self, "collectionLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildAdaptiveTileSectionFor:layoutEnvironment:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contentInsets");
  v12 = v11;
  objc_msgSend(v10, "contentInsets");
  objc_msgSend(v10, "setContentInsets:", v12, 0.0);
  return v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUServicePlaceholderItemModuleController;
  v7 = a4;
  -[HUItemModuleController configureCell:forItem:](&v18, sel_configureCell_forItem_, v6, v7);
  v8 = objc_opt_class();
  v9 = v6;
  if (!v9)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v9;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class(), v18.receiver, v18.super_class);

LABEL_7:
    v11 = 0;
  }

  objc_msgSend(v11, "setItem:", v7);
  objc_msgSend(v11, "setToggleable:", 0);
  -[HUServicePlaceholderItemModuleController collectionLayoutManager](self, "collectionLayoutManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "gridSizeForItem:", v7);
  v17 = v16;

  objc_msgSend(v11, "setGridSize:", v15, v17);
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (HUCollectionLayoutManager)collectionLayoutManager
{
  return self->_collectionLayoutManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionLayoutManager, 0);
}

@end
