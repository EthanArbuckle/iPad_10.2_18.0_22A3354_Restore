@implementation FCAssetHandleDownloadRequest

- (void)cancel
{
  void (**cancelHandler)(void);

  if (self)
  {
    cancelHandler = (void (**)(void))self->_cancelHandler;
    if (cancelHandler)
      cancelHandler[2]();
  }
}

- (void)setRelativePriority:(int64_t)a3
{
  void (**priorityHandler)(void);

  self->_relativePriority = a3;
  priorityHandler = (void (**)(void))self->_priorityHandler;
  if (priorityHandler)
    priorityHandler[2]();
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_priorityHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
}

@end
