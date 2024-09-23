@implementation NotesQuickLookActivityItem

- (NSArray)previewItems
{
  return self->_previewItems;
}

- (void)setPreviewItems:(id)a3
{
  objc_storeStrong((id *)&self->_previewItems, a3);
}

- (unint64_t)firstItemIndex
{
  return self->_firstItemIndex;
}

- (void)setFirstItemIndex:(unint64_t)a3
{
  self->_firstItemIndex = a3;
}

- (NotesQuickLookActivityItemDelegate)delegate
{
  return (NotesQuickLookActivityItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewItems, 0);
}

@end
