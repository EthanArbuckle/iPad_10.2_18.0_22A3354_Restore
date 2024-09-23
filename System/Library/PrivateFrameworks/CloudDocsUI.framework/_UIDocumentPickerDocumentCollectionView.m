@implementation _UIDocumentPickerDocumentCollectionView

- (void)_performWhileAvoidingNegativeContentOffset:(id)a3
{
  BOOL avoidNegativeContentOffset;

  avoidNegativeContentOffset = self->_avoidNegativeContentOffset;
  self->_avoidNegativeContentOffset = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_avoidNegativeContentOffset = avoidNegativeContentOffset;
}

- (void)setAdjustedContentSize:(CGSize)a3 withFrameSize:(CGSize)a4
{
  double height;
  double v5;
  double width;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  height = a4.height;
  v5 = a3.height;
  width = a3.width;
  -[_UIDocumentPickerDocumentCollectionView contentSizeAdjustment](self, "contentSizeAdjustment", a3.width, a3.height, a4.width);
  v9 = height + v8;
  if (v5 >= v9)
    v10 = v5;
  else
    v10 = v9;
  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerDocumentCollectionView;
  -[_UIDocumentPickerDocumentCollectionView setContentSize:](&v11, sel_setContentSize_, width, v10);
}

- (void)setFrame:(CGRect)a3
{
  _QWORD v3[5];
  CGRect v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52___UIDocumentPickerDocumentCollectionView_setFrame___block_invoke;
  v3[3] = &unk_24E43B300;
  v3[4] = self;
  v4 = a3;
  -[_UIDocumentPickerDocumentCollectionView _performWhileAvoidingNegativeContentOffset:](self, "_performWhileAvoidingNegativeContentOffset:", v3);
}

- (void)setBounds:(CGRect)a3
{
  _QWORD v3[5];
  CGRect v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53___UIDocumentPickerDocumentCollectionView_setBounds___block_invoke;
  v3[3] = &unk_24E43B300;
  v3[4] = self;
  v4 = a3;
  -[_UIDocumentPickerDocumentCollectionView _performWhileAvoidingNegativeContentOffset:](self, "_performWhileAvoidingNegativeContentOffset:", v3);
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  -[_UIDocumentPickerDocumentCollectionView frame](self, "frame");
  -[_UIDocumentPickerDocumentCollectionView setAdjustedContentSize:withFrameSize:](self, "setAdjustedContentSize:withFrameSize:", width, height);
}

- (CGPoint)_updatedContentOffsetForOffset:(CGPoint)a3 avoidNegativeContentOffset:(BOOL)a4
{
  double y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    -[_UIDocumentPickerDocumentCollectionView contentOffset](self, "contentOffset");
    v7 = fmin(v6, 0.0);
    if (v7 >= y)
      y = v7;
  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v4;

  -[_UIDocumentPickerDocumentCollectionView _updatedContentOffsetForOffset:avoidNegativeContentOffset:](self, "_updatedContentOffsetForOffset:avoidNegativeContentOffset:", self->_avoidNegativeContentOffset, a3.x, a3.y);
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerDocumentCollectionView;
  -[_UIDocumentPickerDocumentCollectionView setContentOffset:](&v4, sel_setContentOffset_);
}

- (double)contentSizeAdjustment
{
  return self->_contentSizeAdjustment;
}

- (void)setContentSizeAdjustment:(double)a3
{
  self->_contentSizeAdjustment = a3;
}

@end
