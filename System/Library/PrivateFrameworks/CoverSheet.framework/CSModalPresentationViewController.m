@implementation CSModalPresentationViewController

- (CSModalPresentationViewController)init
{
  CSModalPresentationViewController *v2;
  CSModalPresentationViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSModalPresentationViewController;
  v2 = -[CSModalPresentationViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSModalPresentationViewController _addStateCaptureHandlers](v2, "_addStateCaptureHandlers");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureBlock, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSModalPresentationViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (void)_addStateCaptureHandlers
{
  id v3;
  BSInvalidatable *v4;
  BSInvalidatable *stateCaptureBlock;
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v6, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureBlock = self->_stateCaptureBlock;
  self->_stateCaptureBlock = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __61__CSModalPresentationViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionWithMultilinePrefix:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureBlock, 0);
}

@end
