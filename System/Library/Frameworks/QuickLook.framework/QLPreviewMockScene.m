@implementation QLPreviewMockScene

+ (id)requestPreviewMockSceneActivation
{
  return 0;
}

- (QLPreviewMockScene)init
{

  return 0;
}

+ (BOOL)canPreviewItem:(id)a3
{
  return 0;
}

- (QLPreviewItem)currentPreviewItem
{
  return 0;
}

- (int64_t)currentPreviewItemIndex
{
  return self->currentPreviewItemIndex;
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3
{
  self->currentPreviewItemIndex = a3;
}

- (QLPreviewControllerConformingDataSource)dataSource
{
  return (QLPreviewControllerConformingDataSource *)objc_loadWeakRetained((id *)&self->dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->dataSource, a3);
}

- (QLPreviewControllerConformingDelegate)delegate
{
  return (QLPreviewControllerConformingDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->dataSource);
}

@end
