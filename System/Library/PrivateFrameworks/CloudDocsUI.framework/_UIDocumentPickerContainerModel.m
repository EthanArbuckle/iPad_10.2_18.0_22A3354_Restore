@implementation _UIDocumentPickerContainerModel

- (_UIDocumentPickerContainerModel)init
{
  _UIDocumentPickerContainerModel *v2;
  NSOperationQueue *v3;
  NSOperationQueue *thumbnailQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *underlyingQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerContainerModel;
  v2 = -[_UIDocumentPickerContainerModel init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    thumbnailQueue = v2->_thumbnailQueue;
    v2->_thumbnailQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_thumbnailQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_thumbnailQueue, "setName:", CFSTR("Thumbnail loading queue"));
    -[NSOperationQueue setQualityOfService:](v2->_thumbnailQueue, "setQualityOfService:", 17);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(0, v5);
    underlyingQueue = v2->_underlyingQueue;
    v2->_underlyingQueue = (OS_dispatch_queue *)v6;

    -[NSOperationQueue setUnderlyingQueue:](v2->_thumbnailQueue, "setUnderlyingQueue:", v2->_underlyingQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_thumbnailQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerContainerModel;
  -[_UIDocumentPickerContainerModel dealloc](&v3, sel_dealloc);
}

- (NSArray)modelObjects
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (id)displayTitle
{
  return &stru_24E43B9D8;
}

- (BOOL)afterInitialUpdate
{
  return 0;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
  -[_UIDocumentPickerContainerModel updateSortDescriptors](self, "updateSortDescriptors");
}

- (NSArray)pickableTypes
{
  return 0;
}

- (unint64_t)pickerMode
{
  return 1;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (NSMutableArray)updateHandlers
{
  return self->_updateHandlers;
}

- (void)setUpdateHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_updateHandlers, a3);
}

- (NSOperationQueue)thumbnailQueue
{
  return self->_thumbnailQueue;
}

- (void)setThumbnailQueue:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailQueue, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_underlyingQueue, 0);
}

@end
