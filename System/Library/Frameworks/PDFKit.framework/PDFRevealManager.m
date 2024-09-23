@implementation PDFRevealManager

- (PDFRevealManager)initWithPDFView:(id)a3
{
  id v4;
  PDFRevealManager *v5;
  PDFRevealManagerPrivate *v6;
  PDFRevealManagerPrivate *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDFRevealManager;
  v5 = -[PDFRevealManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(PDFRevealManagerPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pdfView, v4);
  }

  return v5;
}

- (id)PDFRVPresentingContextAtPoint:(CGPoint)a3
{

  return 0;
}

- (id)PDFRVPresenter
{
  RVPresenter *rvPresenter;
  RVPresenter *v4;
  PDFRevealManagerPrivate *v5;
  RVPresenter *v6;

  rvPresenter = self->_private->rvPresenter;
  if (!rvPresenter)
  {
    if (loadReveal_onceToken != -1)
      dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
    v4 = (RVPresenter *)objc_alloc_init(0);
    v5 = self->_private;
    v6 = v5->rvPresenter;
    v5->rvPresenter = v4;

    rvPresenter = self->_private->rvPresenter;
  }
  return rvPresenter;
}

- (id)PDFRVDocumentContextForPage:(id)a3
{

  return 0;
}

- (void)reset
{
  PDFRevealManagerPrivate *v2;
  RVPresenter *rvPresenter;

  v2 = self->_private;
  rvPresenter = v2->rvPresenter;
  v2->rvPresenter = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
