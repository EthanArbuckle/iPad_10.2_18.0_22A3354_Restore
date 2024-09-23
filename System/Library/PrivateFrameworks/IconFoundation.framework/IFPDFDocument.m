@implementation IFPDFDocument

- (IFPDFDocument)initWithURL:(id)a3
{
  const __CFURL *v5;
  IFPDFDocument *v6;
  IFPDFDocument *v7;
  objc_super v9;

  v5 = (const __CFURL *)a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPDFDocument;
  v6 = -[IFPDFDocument init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_pdfDocument = CGPDFDocumentCreateWithURL(v5);
  }

  return v7;
}

- (void)dealloc
{
  CGPDFDocument *pdfDocument;
  objc_super v4;

  pdfDocument = self->_pdfDocument;
  if (pdfDocument)
    CFRelease(pdfDocument);
  v4.receiver = self;
  v4.super_class = (Class)IFPDFDocument;
  -[IFPDFDocument dealloc](&v4, sel_dealloc);
}

- (unint64_t)numberOfPages
{
  return CGPDFDocumentGetNumberOfPages(self->_pdfDocument);
}

- (id)pageAtIndex:(unint64_t)a3
{
  IFPDFPage *Page;

  if (-[IFPDFDocument numberOfPages](self, "numberOfPages") <= a3)
  {
    Page = 0;
  }
  else
  {
    Page = (IFPDFPage *)CGPDFDocumentGetPage(self->_pdfDocument, a3 + 1);
    if (Page)
      Page = -[IFPDFPage initWithCGPDFPage:]([IFPDFPage alloc], "initWithCGPDFPage:", Page);
  }
  return Page;
}

- (id)firstPage
{
  return -[IFPDFDocument pageAtIndex:](self, "pageAtIndex:", 0);
}

- (CGPDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (void)setPdfDocument:(CGPDFDocument *)a3
{
  self->_pdfDocument = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
