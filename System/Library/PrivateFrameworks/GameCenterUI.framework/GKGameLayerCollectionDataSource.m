@implementation GKGameLayerCollectionDataSource

- (GKGameLayerCollectionDataSource)initWithGameRecord:(id)a3
{
  id v4;
  GKGameLayerCollectionDataSource *v5;
  GKGameLayerCollectionDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKGameLayerCollectionDataSource;
  v5 = -[GKGameLayerCollectionDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[GKGameLayerCollectionDataSource setGameRecord:](v5, "setGameRecord:", v4);

  return v6;
}

- (NSString)title
{
  return (NSString *)&stru_1E59EB978;
}

- (CGSize)standardCellSizeForCollectionView:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)cellSpacing
{
  return 0.0;
}

- (int64_t)itemCount
{
  return 0;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  return objc_alloc_init(MEMORY[0x1E0DC35C0]);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
  objc_storeStrong((id *)&self->_gameRecord, a3);
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentationViewController);
}

- (void)setPresentationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentationViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationViewController);
  objc_storeStrong((id *)&self->_gameRecord, 0);
}

@end
