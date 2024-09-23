@implementation PFUbiquityMetadataFactoryFilePresenter

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
    _sharedQueue = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3828]);
}

- (PFUbiquityMetadataFactoryFilePresenter)init
{
  PFUbiquityMetadataFactoryFilePresenter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryFilePresenter;
  result = -[PFUbiquityMetadataFactoryFilePresenter init](&v3, sel_init);
  if (result)
  {
    result->_presentedItemURL = 0;
    result->_presentedItemLocation = 0;
  }
  return result;
}

- (PFUbiquityMetadataFactoryFilePresenter)initWithMetadataStoreFileLocation:(id)a3
{
  PFUbiquityMetadataFactoryFilePresenter *v4;

  v4 = -[PFUbiquityMetadataFactoryFilePresenter init](self, "init");
  if (v4)
  {
    v4->_presentedItemLocation = (PFUbiquityLocation *)a3;
    v4->_presentedItemURL = (NSURL *)-[PFUbiquityLocation createFullURL]((uint64_t)a3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_presentedItemURL = 0;
  self->_presentedItemLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryFilePresenter;
  -[PFUbiquityMetadataFactoryFilePresenter dealloc](&v3, sel_dealloc);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)_sharedQueue;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got delete for metadata store: %@"), "-[PFUbiquityMetadataFactoryFilePresenter accommodatePresentedItemDeletionWithCompletionHandler:]", 78, self->_presentedItemURL);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PFUbiquityMetadataFactoryFilePresenter_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke;
  block[3] = &unk_1E1EDD520;
  block[4] = self;
  dispatch_async(global_queue, block);
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

void __96__PFUbiquityMetadataFactoryFilePresenter_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_self();
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (!v3)
    {
      v4 = 0;
      v5 = 0;
      goto LABEL_6;
    }
    v4 = *(_QWORD *)(v3 + 32);
  }
  else
  {
    v4 = 0;
    v3 = MEMORY[0x10];
    if (!MEMORY[0x10])
    {
      v5 = 0;
      v3 = 0;
      goto LABEL_6;
    }
  }
  v5 = *(_QWORD *)(v3 + 40);
  if (*(_DWORD *)(v3 + 24) != 1)
    v3 = *(_QWORD *)(v3 + 8);
LABEL_6:
  -[PFUbiquityMetadataFactory removeCachedCoordinatorsForLocalPeerID:storeName:andUbiquityRootLocation:]((id *)_sharedFactory, v4, v5, v3);
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

@end
