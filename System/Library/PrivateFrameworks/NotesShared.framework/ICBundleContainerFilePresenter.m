@implementation ICBundleContainerFilePresenter

- (ICBundleContainerFilePresenter)initWithURL:(id)a3
{
  id v4;
  ICBundleContainerFilePresenter *v5;
  uint64_t v6;
  NSURL *url;
  NSOperationQueue *v8;
  NSOperationQueue *operationQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICBundleContainerFilePresenter;
  v5 = -[ICBundleContainerFilePresenter init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v8;

    -[NSOperationQueue setName:](v5->_operationQueue, "setName:", CFSTR("com.apple.notes.bundle-container-file-presenter"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v5->_operationQueue, "setQualityOfService:", 17);
  }

  return v5;
}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  performBlockOnMainThread();

}

void __65__ICBundleContainerFilePresenter_presentedSubitemDidChangeAtURL___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "subitemBundleDidChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "subitemBundleDidChange");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)subitemBundleDidChange
{
  return self->_subitemBundleDidChange;
}

- (void)setSubitemBundleDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_subitemBundleDidChange, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
