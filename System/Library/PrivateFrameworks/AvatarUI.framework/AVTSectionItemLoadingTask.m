@implementation AVTSectionItemLoadingTask

- (AVTSectionItemLoadingTask)initWithSectionItem:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  AVTSectionItemLoadingTask *v9;
  AVTSectionItemLoadingTask *v10;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTSectionItemLoadingTask;
  v9 = -[AVTSectionItemLoadingTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionItem, a3);
    v11 = objc_msgSend(v8, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

  }
  return v10;
}

- (void)cancel
{
  -[AVTSectionItemLoadingTask setCanceled:](self, "setCanceled:", 1);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)isCanceled
{
  return self->canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->canceled = a3;
}

- (AVTAvatarAttributeEditorSectionItemPrefetching)sectionItem
{
  return self->_sectionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionItem, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
