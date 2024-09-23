@implementation MUPDFView

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MUPDFView **v9;
  MUPDFView *v10;
  MUPDFView *v11;

  v6 = a3;
  v7 = a4;
  -[MUPDFView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v10 = self;
    v9 = &v10;
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "PDFView:shouldHandleLink:", v6, v7))
  {
    v11 = self;
    v9 = &v11;
LABEL_5:
    v9[1] = (MUPDFView *)MUPDFView;
    objc_msgSendSuper2((objc_super *)v9, sel_PDFViewWillClickOnLink_withURL_, v6, v7, v10);
  }

}

@end
