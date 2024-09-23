@implementation QLPreviewPrinter

- (QLPreviewPrinter)initWithPreviewPrinter:(id)a3
{
  id v5;
  QLPreviewPrinter *v6;
  QLPreviewPrinter *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)QLPreviewPrinter,
        v6 = -[QLPreviewPrinter init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_printer, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfPages
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[QLPreviewPrinter printer](self, "printer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPageRenderer printableRect](self, "printableRect");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__QLPreviewPrinter_numberOfPages__block_invoke;
  v8[3] = &unk_24C726098;
  v8[4] = &v9;
  objc_msgSend(v3, "numberOfPagesWithSize:completionHandler:", v8, v4, v5);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __33__QLPreviewPrinter_numberOfPages__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double v6;
  double v7;
  id v8;

  length = a3.length;
  location = a3.location;
  -[QLPreviewPrinter printer](self, "printer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrintPageRenderer printableRect](self, "printableRect");
  objc_msgSend(v8, "prepareForDrawingPages:ofSize:", location, length, v6, v7);

}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  void *v6;
  CGContext *CurrentContext;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGDataProvider *v12;
  CGPDFDocument *v13;
  CGPDFPage *Page;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  -[QLPreviewPrinter printer](self, "printer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__QLPreviewPrinter_drawPageAtIndex_inRect___block_invoke;
  v15[3] = &unk_24C7260C0;
  v15[4] = &v16;
  objc_msgSend(v6, "pdfDataForPageAtIndex:withCompletionHandler:", a3, v15);

  if (v17[5])
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    -[UIPrintPageRenderer paperRect](self, "paperRect");
    CGContextTranslateCTM(CurrentContext, 0.0, v8);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    -[UIPrintPageRenderer printableRect](self, "printableRect");
    v10 = v9;
    -[UIPrintPageRenderer printableRect](self, "printableRect");
    CGContextTranslateCTM(CurrentContext, v10, v11);
    v12 = CGDataProviderCreateWithCFData((CFDataRef)v17[5]);
    v13 = CGPDFDocumentCreateWithProvider(v12);
    Page = CGPDFDocumentGetPage(v13, 1uLL);
    CGContextDrawPDFPage(CurrentContext, Page);
    CGPDFDocumentRelease(v13);
    CGDataProviderRelease(v12);
    CGContextRestoreGState(CurrentContext);
  }
  _Block_object_dispose(&v16, 8);

}

void __43__QLPreviewPrinter_drawPageAtIndex_inRect___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (QLPrintingProtocol)printer
{
  return (QLPrintingProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printer, 0);
}

@end
