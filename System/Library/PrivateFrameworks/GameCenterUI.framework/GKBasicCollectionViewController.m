@implementation GKBasicCollectionViewController

- (GKBasicCollectionViewController)initWithDataSource:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  GKGridLayout *v8;
  GKBasicCollectionViewController *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(GKGridLayout);
  v12.receiver = self;
  v12.super_class = (Class)GKBasicCollectionViewController;
  v9 = -[GKCollectionViewController initWithCollectionViewLayout:](&v12, sel_initWithCollectionViewLayout_, v8);

  if (v9)
  {
    -[GKBasicCollectionViewController navigationItem](v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v7);

    -[GKBasicCollectionViewController setInitialDataSource:](v9, "setInitialDataSource:", v6);
  }

  return v9;
}

- (void)setDataSource:(id)a3
{
  GKCollectionViewDataSource *v5;
  objc_super v6;

  v5 = (GKCollectionViewDataSource *)a3;
  if (self->_initialDataSource != v5)
    objc_storeStrong((id *)&self->_initialDataSource, a3);
  v6.receiver = self;
  v6.super_class = (Class)GKBasicCollectionViewController;
  -[GKCollectionViewController setDataSource:](&v6, sel_setDataSource_, v5);

}

- (void)configureDataSource
{
  GKCollectionViewDataSource *v3;
  GKCollectionViewDataSource *initialDataSource;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKBasicCollectionViewController;
  -[GKCollectionViewController configureDataSource](&v5, sel_configureDataSource);
  if (self->_initialDataSource)
  {
    -[GKCollectionViewController dataSource](self, "dataSource");
    v3 = (GKCollectionViewDataSource *)objc_claimAutoreleasedReturnValue();
    initialDataSource = self->_initialDataSource;

    if (v3 != initialDataSource)
      -[GKBasicCollectionViewController setDataSource:](self, "setDataSource:", self->_initialDataSource);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_target, "collectionViewController:didSelectItemAtIndexPath:", self, v5);

}

- (CGSize)preferredContentSize
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    v9 = v6 > 1024.0;
    if (v8 > 1024.0)
      v9 = 1;
    v10 = 320.0;
    if (v9)
      v10 = 375.0;
  }
  else
  {
    v10 = 320.0;
  }
  v11 = 440.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (NSArray)metricsForSections
{
  return self->_metricsForSections;
}

- (void)setMetricsForSections:(id)a3
{
  objc_storeStrong((id *)&self->_metricsForSections, a3);
}

- (GKCollectionViewDataSource)initialDataSource
{
  return self->_initialDataSource;
}

- (void)setInitialDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_initialDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDataSource, 0);
  objc_storeStrong((id *)&self->_metricsForSections, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
