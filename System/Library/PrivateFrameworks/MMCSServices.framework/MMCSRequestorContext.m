@implementation MMCSRequestorContext

- (MMCSRequestorContext)initWithController:(id)a3 transferID:(id)a4
{
  MMCSRequestorContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MMCSRequestorContext;
  v6 = -[MMCSRequestorContext init](&v8, sel_init);
  v6->_controller = (MMCSController *)a3;
  v6->_transferID = (NSString *)a4;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MMCSRequestorContext;
  -[MMCSRequestorContext dealloc](&v3, sel_dealloc);
}

- (void)_removeFromController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  NSString *transferID;
  MMCSController *controller;

  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  transferID = self->_transferID;
  if (transferID)
  {
    controller = self->_controller;
    if (controller)
      MEMORY[0x24BEDD108](controller, sel__removeRequestorContext_transferID_, self, transferID, v7);
  }
}

- (MMCSController)controller
{
  return (MMCSController *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)transferID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end
