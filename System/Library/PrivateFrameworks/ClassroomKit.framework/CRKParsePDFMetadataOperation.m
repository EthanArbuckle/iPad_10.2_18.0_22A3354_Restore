@implementation CRKParsePDFMetadataOperation

- (CRKParsePDFMetadataOperation)initWithPDFBook:(id)a3 filePath:(id)a4 parseImage:(BOOL)a5
{
  id v9;
  id v10;
  CRKParsePDFMetadataOperation *v11;
  CRKParsePDFMetadataOperation *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKParsePDFMetadataOperation;
  v11 = -[CRKParsePDFMetadataOperation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_book, a3);
    objc_storeStrong((id *)&v12->_filePath, a4);
    v12->_parseImage = a5;
  }

  return v12;
}

- (void)main
{
  void *v3;
  void *v4;
  const __CFURL *v5;
  CGPDFDocument *v6;
  CGPDFDictionary *Info;
  __CFString *v8;
  CGPDFPage *Page;
  CGPDFPage *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGContext *v15;
  CGContext *v16;
  CGImageRef Image;
  CGImage *v18;
  void *v19;
  void *v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGPDFStringRef value;
  CGRect BoxRect;
  CGRect v25;
  CGRect v26;

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[CRKParsePDFMetadataOperation filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v6 = CGPDFDocumentCreateWithURL(v5);

  if (v6)
  {
    Info = CGPDFDocumentGetInfo(v6);
    -[CRKParsePDFMetadataOperation updateTitleWithDictionaryRef:](self, "updateTitleWithDictionaryRef:", Info);
    value = 0;
    CGPDFDictionaryGetString(Info, "Author", &value);
    v8 = (__CFString *)CGPDFStringCopyTextString(value);
    -[CRKParsePDFMetadataOperation updateAuthor:](self, "updateAuthor:", v8);

    if (!-[CRKParsePDFMetadataOperation parseImage](self, "parseImage"))
      goto LABEL_7;
    Page = CGPDFDocumentGetPage(v6, 1uLL);
    if (!Page)
      goto LABEL_7;
    v10 = Page;
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    v15 = +[CRKCoreGraphicsUtilities createImageContextForSize:](CRKCoreGraphicsUtilities, "createImageContextForSize:", 70.0, 100.0);
    if (v15)
    {
      v16 = v15;
      CGContextTranslateCTM(v15, 0.0, 100.0);
      CGContextScaleCTM(v16, 1.0, -1.0);
      memset(&v22, 0, sizeof(v22));
      v25.origin.x = 0.0;
      v25.origin.y = 0.0;
      v25.size.width = 70.0;
      v25.size.height = 100.0;
      CGPDFPageGetDrawingTransform(&v22, v10, kCGPDFCropBox, v25, 0, 1);
      v21 = v22;
      CGContextConcatCTM(v16, &v21);
      CGContextSetRGBFillColor(v16, 1.0, 1.0, 1.0, 1.0);
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      CGContextFillRect(v16, v26);
      CGContextDrawPDFPage(v16, v10);
      Image = CGBitmapContextCreateImage(v16);
      if (Image)
      {
        v18 = Image;
        +[CRKCoreGraphicsUtilities imageDataFromImage:](CRKCoreGraphicsUtilities, "imageDataFromImage:", Image);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v6);
        CGImageRelease(v18);
        CGContextRelease(v16);
        -[CRKParsePDFMetadataOperation book](self, "book");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setImage:", v19);

        return;
      }
      CFRelease(v6);
      CGContextRelease(v16);
    }
    else
    {
LABEL_7:
      CFRelease(v6);
    }
    -[CRKParsePDFMetadataOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    -[CRKParsePDFMetadataOperation updateTitleWithDictionaryRef:](self, "updateTitleWithDictionaryRef:", 0);
    -[CRKParsePDFMetadataOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void)updateTitleWithDictionaryRef:(CGPDFDictionary *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[CRKParsePDFMetadataOperation titleFromDictionaryRef:](self, "titleFromDictionaryRef:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v13 = v4;
  }
  else
  {
    -[CRKParsePDFMetadataOperation book](self, "book");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v13 = v7;
    }
    else
    {
      -[CRKParsePDFMetadataOperation fileName](self, "fileName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v13 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Untitled"), &stru_24D9CB490, 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  -[CRKParsePDFMetadataOperation book](self, "book");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v13);

}

- (id)titleFromDictionaryRef:(CGPDFDictionary *)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  CGPDFStringRef value;

  if (!a3)
    return 0;
  value = 0;
  if (!CGPDFDictionaryGetString(a3, "Title", &value))
    return 0;
  v3 = (__CFString *)CGPDFStringCopyTextString(value);
  if (-[__CFString length](v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)fileName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CRKParsePDFMetadataOperation filePath](self, "filePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)updateAuthor:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[CRKParsePDFMetadataOperation book](self, "book");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthor:", v4);

  }
}

- (CRKBook)book
{
  return self->_book;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (BOOL)parseImage
{
  return self->_parseImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_book, 0);
}

@end
