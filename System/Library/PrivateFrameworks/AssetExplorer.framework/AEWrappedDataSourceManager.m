@implementation AEWrappedDataSourceManager

- (void)attachDataSourceManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "assetsDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AEWrappedDataSourceManager _createDataSourceFromAssetsDataSource:changeDetails:](self, "_createDataSourceFromAssetsDataSource:changeDetails:", v5, 0);
  -[AEWrappedDataSourceManager _setAttachedDataSourceManager:](self, "_setAttachedDataSourceManager:", v4);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setReviewDelegate:", self);

}

- (void)detachCurrentDataSourceManager
{
  id v3;

  -[AEWrappedDataSourceManager _attachedDataSourceManager](self, "_attachedDataSourceManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);
  -[AEWrappedDataSourceManager _setAttachedDataSourceManager:](self, "_setAttachedDataSourceManager:", 0);

}

- (void)_createDataSourceFromAssetsDataSource:(id)a3 changeDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AEWrappedAssetsDataSource *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AEWrappedAssetsDataSource initWithReviewAssetsDataSource:]([AEWrappedAssetsDataSource alloc], "initWithReviewAssetsDataSource:", v7);

  if (!v6)
  {
    v10 = 0;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v16 = &unk_24E244138;
  v17[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v11 = objc_msgSend(v8, "identifier");
LABEL_6:
  v12 = -[AEWrappedAssetsDataSource identifier](v9, "identifier");
  v13 = objc_alloc(MEMORY[0x24BE72780]);
  objc_msgSend(MEMORY[0x24BE72730], "changeDetailsWithNoChanges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v11, v12, v14, v10, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v9, v15);
}

- (id)createInitialDataSource
{
  return (id)objc_msgSend(MEMORY[0x24BE72778], "emptyDataSource");
}

- (void)assetsDataSourceManager:(id)a3 didChangeAssetsDataSource:(id)a4 changeDetails:(id)a5
{
  -[AEWrappedDataSourceManager _createDataSourceFromAssetsDataSource:changeDetails:](self, "_createDataSourceFromAssetsDataSource:changeDetails:", a4, a5);
}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  return 0;
}

- (PUReviewAssetsDataSourceManager)_attachedDataSourceManager
{
  return self->__attachedDataSourceManager;
}

- (void)_setAttachedDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->__attachedDataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__attachedDataSourceManager, 0);
}

@end
