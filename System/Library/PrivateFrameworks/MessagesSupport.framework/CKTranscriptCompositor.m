@implementation CKTranscriptCompositor

- (CKTranscriptCompositor)initWithLayoutContext:(int64_t)a3 datasource:(id)a4
{
  id v6;
  CKTranscriptCompositor *v7;
  CKTranscriptCompositorSwift *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKTranscriptCompositor;
  v7 = -[CKTranscriptCompositor init](&v10, sel_init);
  if (v7)
  {
    v8 = -[CKTranscriptCompositorSwift initWithLayoutContext:datasource:]([CKTranscriptCompositorSwift alloc], "initWithLayoutContext:datasource:", a3, v6);
    -[CKTranscriptCompositor setRepresentedObject:](v7, "setRepresentedObject:", v8);

  }
  return v7;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutSectionForSection:layoutEnvironment:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (CKTranscriptCompositorDatasourceDelegate)delegate
{
  void *v2;
  void *v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKTranscriptCompositorDatasourceDelegate *)v3;
}

- (int64_t)layoutContext
{
  void *v2;
  int64_t v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutContext");

  return v3;
}

- (id)datasource
{
  void *v2;
  void *v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "datasource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCollectionView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollectionView:", v4);

}

- (UICollectionView)collectionView
{
  void *v2;
  void *v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICollectionView *)v3;
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  void *v2;
  void *v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICollectionViewCompositionalLayout *)v3;
}

- (void)setScrollDirection:(int64_t)a3
{
  id v4;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollDirection:", a3);

}

- (int64_t)scrollDirection
{
  void *v2;
  int64_t v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrollDirection");

  return v3;
}

- (void)setInterSectionSpacing:(double)a3
{
  id v4;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterSectionSpacing:", a3);

}

- (double)interSectionSpacing
{
  void *v2;
  double v3;
  double v4;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interSectionSpacing");
  v4 = v3;

  return v4;
}

- (void)setBoundarySupplementaryItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBoundarySupplementaryItems:", v4);

}

- (NSArray)boundarySupplementaryItems
{
  void *v2;
  void *v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundarySupplementaryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setContentsInsetReference:(int64_t)a3
{
  id v4;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsInsetReference:", a3);

}

- (int64_t)contentsInsetReference
{
  void *v2;
  int64_t v3;

  -[CKTranscriptCompositor representedObject](self, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentsInsetReference");

  return v3;
}

- (CKTranscriptCompositorSwift)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeStrong((id *)&self->_representedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedObject, 0);
}

@end
