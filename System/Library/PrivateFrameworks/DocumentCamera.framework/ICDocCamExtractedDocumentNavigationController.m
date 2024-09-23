@implementation ICDocCamExtractedDocumentNavigationController

- (ICDocCamExtractedDocumentNavigationController)initWithDelegate:(id)a3 documentInfoCollection:(id)a4 imageCache:(id)a5 currentIndex:(int64_t)a6 mode:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  ICDocCamExtractedDocumentViewController *v15;
  ICDocCamExtractedDocumentNavigationController *v16;
  ICDocCamExtractedDocumentNavigationController *v17;
  objc_super v19;

  v7 = *(_QWORD *)&a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[ICDocCamExtractedDocumentViewController initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:]([ICDocCamExtractedDocumentViewController alloc], "initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:", v14, v13, v12, a6, v7);

  v19.receiver = self;
  v19.super_class = (Class)ICDocCamExtractedDocumentNavigationController;
  v16 = -[ICDocCamExtractedDocumentNavigationController initWithRootViewController:](&v19, sel_initWithRootViewController_, v15);
  v17 = v16;
  if (v16)
    -[ICDocCamExtractedDocumentNavigationController setModalPresentationCapturesStatusBarAppearance:](v16, "setModalPresentationCapturesStatusBarAppearance:", 1);

  return v17;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICDocCamExtractedDocumentNavigationController;
  -[ICDocCamExtractedDocumentNavigationController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)prepareForDismissal
{
  void *v3;
  char v4;
  id v5;

  -[ICDocCamExtractedDocumentNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ICDocCamExtractedDocumentNavigationController topViewController](self, "topViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForDismissal");

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
