@implementation CKTranscriptStickerDropProposal

- (CKTranscriptStickerDropProposal)initWithDragItem:(id)a3 previewCenter:(CGPoint)a4 targetBalloonIndex:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  CKTranscriptStickerDropProposal *v12;
  CKTranscriptStickerDropProposal *v13;
  objc_super v15;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptStickerDropProposal;
  v12 = -[CKTranscriptStickerDropProposal init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dragItem, a3);
    v13->_previewCenter.x = x;
    v13->_previewCenter.y = y;
    objc_storeStrong((id *)&v13->_targetBalloonIndex, a5);
  }

  return v13;
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
  objc_storeStrong((id *)&self->_dragItem, a3);
}

- (CGPoint)previewCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_previewCenter.x;
  y = self->_previewCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviewCenter:(CGPoint)a3
{
  self->_previewCenter = a3;
}

- (NSIndexPath)targetBalloonIndex
{
  return self->_targetBalloonIndex;
}

- (void)setTargetBalloonIndex:(id)a3
{
  objc_storeStrong((id *)&self->_targetBalloonIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetBalloonIndex, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end
