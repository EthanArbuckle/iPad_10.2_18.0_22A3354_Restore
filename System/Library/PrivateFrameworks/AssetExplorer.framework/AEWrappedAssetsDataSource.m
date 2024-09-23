@implementation AEWrappedAssetsDataSource

- (AEWrappedAssetsDataSource)initWithReviewAssetsDataSource:(id)a3
{
  id v5;
  AEWrappedAssetsDataSource *v6;
  AEWrappedAssetsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEWrappedAssetsDataSource;
  v6 = -[AEWrappedAssetsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__reviewAssetsDataSource, a3);

  return v7;
}

- (int64_t)numberOfSections
{
  void *v2;
  id v3;
  int64_t v4;

  -[AEWrappedAssetsDataSource _reviewAssetsDataSource](self, "_reviewAssetsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDD15D8]);
  v4 = objc_msgSend(v2, "numberOfSubItemsAtIndexPath:", v3);

  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AEWrappedAssetsDataSource _reviewAssetsDataSource](self, "_reviewAssetsDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15D8]), "initWithIndex:", 0);
  v5 = objc_msgSend(v3, "numberOfSubItemsAtIndexPath:", v4);

  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  void *v6;
  PXSimpleIndexPath v8;

  -[AEWrappedAssetsDataSource _reviewAssetsDataSource](self, "_reviewAssetsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  PXIndexPathFromSimpleIndexPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetAtIndexPath:", v5, *(_OWORD *)&v8.dataSourceIdentifier, *(_OWORD *)&v8.item);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PXSimpleIndexPath *result;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v6 = a4;
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v15.receiver = self;
  v15.super_class = (Class)AEWrappedAssetsDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v15, sel_indexPathForObjectReference_, v6);
  if (retstr->dataSourceIdentifier == *MEMORY[0x24BE72800])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "itemObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AEWrappedAssetsDataSource _reviewAssetsDataSource](self, "_reviewAssetsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "indexPathForAssetWithIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          -[AEWrappedAssetsDataSource identifier](self, "identifier");
          PXSimpleIndexPathFromIndexPath();
          *(_OWORD *)&retstr->dataSourceIdentifier = v13;
          *(_OWORD *)&retstr->item = v14;

        }
      }

    }
  }

  return result;
}

- (PUAssetsDataSource)_reviewAssetsDataSource
{
  return self->__reviewAssetsDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reviewAssetsDataSource, 0);
}

@end
