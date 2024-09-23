@implementation CNXPCDataMapperProgressiveHandler

- (CNXPCDataMapperProgressiveHandler)initWithProgressBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  CNXPCDataMapperProgressiveHandler *v8;
  uint64_t v9;
  id progressBlock;
  uint64_t v11;
  id completionBlock;
  CNXPCDataMapperProgressiveHandler *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNXPCDataMapperProgressiveHandler;
  v8 = -[CNXPCDataMapperProgressiveHandler init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    progressBlock = v8->_progressBlock;
    v8->_progressBlock = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    completionBlock = v8->_completionBlock;
    v8->_completionBlock = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (void)completedWithError:(id)a3
{
  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void)receiveProgressiveContacts:(id)a3 matchInfos:(id)a4
{
  (*((void (**)(void))self->_progressBlock + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
}

@end
