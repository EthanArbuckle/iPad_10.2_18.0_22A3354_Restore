@implementation CKInlineReplyGradientReferenceView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKInlineReplyGradientReferenceView;
  -[CKInlineReplyGradientReferenceView layoutSubviews](&v13, sel_layoutSubviews);
  -[CKInlineReplyGradientReferenceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[CKInlineReplyGradientReferenceView safeAreaInsets](self, "safeAreaInsets");
  v10 = v9;
  v11 = v8 - v9;
  -[CKInlineReplyGradientReferenceView collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v10, v6, v11);

}

- (CKTranscriptCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
