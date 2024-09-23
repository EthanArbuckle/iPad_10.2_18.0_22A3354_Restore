@implementation CLSSummaryClusteringItem

- (CLSSummaryClusteringItem)initWithCluster:(id)a3 numberOfItemsToElect:(unint64_t)a4
{
  id v7;
  CLSSummaryClusteringItem *v8;
  CLSSummaryClusteringItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSSummaryClusteringItem;
  v8 = -[CLSSummaryClusteringItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cluster, a3);
    v9->_numberOfItemsToElect = a4;
  }

  return v9;
}

- (PLDataCluster)cluster
{
  return (PLDataCluster *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)numberOfItemsToElect
{
  return self->_numberOfItemsToElect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cluster, 0);
}

@end
