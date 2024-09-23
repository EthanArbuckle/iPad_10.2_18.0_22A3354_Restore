@implementation ICBundleChangeFilePresenter

- (ICBundleChangeFilePresenter)initWithObjectID:(id)a3 url:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICBundleChangeFilePresenter *v11;
  uint64_t v12;
  NSManagedObjectID *objectID;
  uint64_t v14;
  NSURL *url;
  NSOperationQueue *v16;
  NSOperationQueue *operationQueue;
  uint64_t v18;
  ICSelectorDelayer *applyChangesSelectorDelayer;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ICBundleChangeFilePresenter;
  v11 = -[ICBundleChangeFilePresenter init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    objectID = v11->_objectID;
    v11->_objectID = (NSManagedObjectID *)v12;

    v14 = objc_msgSend(v9, "copy");
    url = v11->_url;
    v11->_url = (NSURL *)v14;

    objc_storeStrong((id *)&v11->_managedObjectContext, a5);
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v11->_operationQueue;
    v11->_operationQueue = v16;

    -[NSOperationQueue setName:](v11->_operationQueue, "setName:", CFSTR("com.apple.notes.bundle-change-file-presenter"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v11->_operationQueue, "setQualityOfService:", 17);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v11, sel_applyChanges, 1, 0, 2.0);
    applyChangesSelectorDelayer = v11->_applyChangesSelectorDelayer;
    v11->_applyChangesSelectorDelayer = (ICSelectorDelayer *)v18;

  }
  return v11;
}

- (void)presentedItemDidChange
{
  id v2;

  -[ICBundleChangeFilePresenter applyChangesSelectorDelayer](self, "applyChangesSelectorDelayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestFire");

}

- (void)applyChanges
{
  void *v3;
  _QWORD v4[5];

  -[ICBundleChangeFilePresenter managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__ICBundleChangeFilePresenter_applyChanges__block_invoke;
  v4[3] = &unk_1E76C73F8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __43__ICBundleChangeFilePresenter_applyChanges__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "attachmentType") == 13)
      objc_msgSend(v5, "setPreviewUpdateDate:", 0);

  }
  objc_msgSend(v4, "updateChangeCountWithReason:", CFSTR("Applied changes from bundle"));
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_save");

  performBlockOnMainThread();
}

void __43__ICBundleChangeFilePresenter_applyChanges__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "presentedItemDidApplyChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedItemDidApplyChanges");
    v3 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 1);

  }
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)presentedItemDidApplyChanges
{
  return self->_presentedItemDidApplyChanges;
}

- (void)setPresentedItemDidApplyChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (ICSelectorDelayer)applyChangesSelectorDelayer
{
  return self->_applyChangesSelectorDelayer;
}

- (void)setApplyChangesSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_applyChangesSelectorDelayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyChangesSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_presentedItemDidApplyChanges, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
