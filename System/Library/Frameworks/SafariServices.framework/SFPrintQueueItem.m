@implementation SFPrintQueueItem

- (SFPrintQueueItem)initWithFrameHandle:(id)a3 initiatedByWebContent:(BOOL)a4 completionHandler:(id)a5
{
  _WKFrameHandle *v8;
  id v9;
  SFPrintQueueItem *v10;
  _WKFrameHandle *frameHandle;
  _WKFrameHandle *v12;
  uint64_t v13;
  id completionHandler;
  objc_super v16;

  v8 = (_WKFrameHandle *)a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPrintQueueItem;
  v9 = a5;
  v10 = -[SFPrintQueueItem init](&v16, sel_init);
  frameHandle = v10->_frameHandle;
  v10->_frameHandle = v8;
  v12 = v8;

  v10->_initiatedByWebContent = a4;
  v13 = MEMORY[0x1A8598C40](v9);

  completionHandler = v10->_completionHandler;
  v10->_completionHandler = (id)v13;

  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFPrintQueueItem;
  -[SFPrintQueueItem dealloc](&v2, sel_dealloc);
}

- (void)completeWithResult:(int64_t)a3
{
  void (**completionHandler)(id, int64_t);

  if (!self->_completed)
  {
    completionHandler = (void (**)(id, int64_t))self->_completionHandler;
    if (completionHandler)
      completionHandler[2](completionHandler, a3);
    self->_completed = 1;
  }
}

- (_WKFrameHandle)frameHandle
{
  return self->_frameHandle;
}

- (BOOL)initiatedByWebContent
{
  return self->_initiatedByWebContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameHandle, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
