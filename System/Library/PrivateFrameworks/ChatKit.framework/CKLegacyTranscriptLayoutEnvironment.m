@implementation CKLegacyTranscriptLayoutEnvironment

- (CKLegacyTranscriptLayoutEnvironment)init
{
  CKLegacyTranscriptLayoutEnvironment *v2;
  CKLegacyTranscriptLayoutEnvironment *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKLegacyTranscriptLayoutEnvironment;
  v2 = -[CKLegacyTranscriptLayoutEnvironment init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKLegacyTranscriptLayoutEnvironment setMarginInsets:](v2, "setMarginInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[CKLegacyTranscriptLayoutEnvironment setLayoutContext:](v3, "setLayoutContext:", 0);
  }
  return v3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
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

- (CKChatItem)previousItem
{
  return self->_previousItem;
}

- (void)setPreviousItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionLayoutEnvironment, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
