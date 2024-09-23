@implementation CKTranscriptLayoutEnvironment

- (CKTranscriptLayoutEnvironment)initWithDatasource:(id)a3 collectionLayoutEnvironment:(id)a4 collectionView:(id)a5 marginInsets:(UIEdgeInsets)a6 layoutContext:(int64_t)a7 messageEditingContext:(id)a8
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v18;
  id v19;
  id v20;
  id v21;
  CKTranscriptLayoutEnvironment *v22;
  CKTranscriptLayoutEnvironment *v23;
  objc_super v25;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CKTranscriptLayoutEnvironment;
  v22 = -[CKTranscriptLayoutEnvironment init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong(&v22->_datasource, a3);
    objc_storeStrong((id *)&v23->_collectionLayoutEnvironment, a4);
    objc_storeStrong((id *)&v23->_collectionView, a5);
    v23->_marginInsets.top = top;
    v23->_marginInsets.left = left;
    v23->_marginInsets.bottom = bottom;
    v23->_marginInsets.right = right;
    v23->_layoutContext = a7;
    objc_storeStrong((id *)&v23->_messageEditingContext, a8);
  }

  return v23;
}

- (id)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
  objc_storeStrong(&self->_datasource, a3);
}

- (NSCollectionLayoutEnvironment)collectionLayoutEnvironment
{
  return self->_collectionLayoutEnvironment;
}

- (void)setCollectionLayoutEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLayoutEnvironment, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marginInsets.top;
  left = self->_marginInsets.left;
  bottom = self->_marginInsets.bottom;
  right = self->_marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (int64_t)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(int64_t)a3
{
  self->_layoutContext = a3;
}

- (CKTranscriptLayoutMessageEditingContext)messageEditingContext
{
  return self->_messageEditingContext;
}

- (void)setMessageEditingContext:(id)a3
{
  objc_storeStrong((id *)&self->_messageEditingContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageEditingContext, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionLayoutEnvironment, 0);
  objc_storeStrong(&self->_datasource, 0);
}

@end
