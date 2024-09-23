@implementation ICSynapseLinkPreviewLoadingOperation

- (ICSynapseLinkPreviewLoadingOperation)initWithSynapseItem:(id)a3
{
  id v4;
  ICSynapseLinkPreviewLoadingOperation *v5;
  uint64_t v6;
  SYContentItem *synapseItem;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSynapseLinkPreviewLoadingOperation;
  v5 = -[ICSynapseLinkPreviewLoadingOperation init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    synapseItem = v5->_synapseItem;
    v5->_synapseItem = (SYContentItem *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel_linkPreviewDidFinishLoading_, *MEMORY[0x1E0DB0760], v5->_synapseItem);

  }
  return v5;
}

- (void)loadPreviewWithCompletionBlock:(id)a3
{
  void *v4;
  id completionBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v4;

  -[SYContentItem loadFullPreviewIfNeeded](self->_synapseItem, "loadFullPreviewIfNeeded");
}

- (void)linkPreviewDidFinishLoading:(id)a3
{
  SYContentItem *synapseItem;
  SYContentItem *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICSynapseLinkPreviewLoadingOperation linkPreviewDidFinishLoading:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (self->_completionBlock)
  {
    synapseItem = self->_synapseItem;
    objc_msgSend(v6, "object");
    v5 = (SYContentItem *)objc_claimAutoreleasedReturnValue();

    if (synapseItem == v5)
      (*((void (**)(void))self->_completionBlock + 2))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_synapseItem, 0);
}

@end
