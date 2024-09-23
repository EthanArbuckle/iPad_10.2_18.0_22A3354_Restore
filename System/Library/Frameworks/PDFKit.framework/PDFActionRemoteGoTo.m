@implementation PDFActionRemoteGoTo

- (PDFActionRemoteGoTo)initWithPageIndex:(NSUInteger)pageIndex atPoint:(CGPoint)point fileURL:(NSURL *)url
{
  CGFloat y;
  CGFloat x;
  NSURL *v10;
  PDFActionRemoteGoTo *v11;
  PDFActionRemoteGoTo *v12;
  PDFActionRemoteGoToPrivateVars *private2;
  objc_super v15;

  y = point.y;
  x = point.x;
  v10 = url;
  v15.receiver = self;
  v15.super_class = (Class)PDFActionRemoteGoTo;
  v11 = -[PDFAction init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PDFActionRemoteGoTo commonInit](v11, "commonInit");
    -[PDFAction setType:](v12, "setType:", CFSTR("GoToR"));
    v12->_private2->pageIndex = pageIndex;
    private2 = v12->_private2;
    private2->point.x = x;
    private2->point.y = y;
    objc_storeStrong((id *)&v12->_private2->url, url);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PDFActionRemoteGoToPrivateVars *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PDFActionRemoteGoTo;
  v5 = -[PDFAction copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionRemoteGoToPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    *(_QWORD *)(v5[2] + 8) = self->_private2->pageIndex;
    *(CGPoint *)(v5[2] + 16) = self->_private2->point;
    v8 = -[NSURL copyWithZone:](self->_private2->url, "copyWithZone:", a3);
    v9 = v5[2];
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    v11 = -[PDFDestination copyWithZone:](self->_private2->destination, "copyWithZone:", a3);
    v12 = v5[2];
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  return v5;
}

- (NSUInteger)pageIndex
{
  return self->_private2->pageIndex;
}

- (void)setPageIndex:(NSUInteger)pageIndex
{
  self->_private2->pageIndex = pageIndex;
}

- (CGPoint)point
{
  PDFActionRemoteGoToPrivateVars *private2;
  double x;
  double y;
  CGPoint result;

  private2 = self->_private2;
  x = private2->point.x;
  y = private2->point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)point
{
  self->_private2->point = point;
}

- (NSURL)URL
{
  return self->_private2->url;
}

- (void)setURL:(NSURL *)URL
{
  uint64_t v4;
  PDFActionRemoteGoToPrivateVars *private2;
  NSURL *v6;

  v4 = -[NSURL copy](URL, "copy");
  private2 = self->_private2;
  v6 = private2->url;
  private2->url = (NSURL *)v4;

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[PDFActionRemoteGoTo toolTip](self, "toolTip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("GoToR Action - %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PDFActionRemoteGoTo)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8;
  PDFActionRemoteGoTo *v9;
  CGPDFObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PDFActionRemoteGoToPrivateVars *private2;
  NSURL *url;
  PDFDocument *v17;
  PDFDestination *v18;
  PDFActionRemoteGoToPrivateVars *v19;
  PDFDestination *destination;
  PDFDestination *v21;
  void *v22;
  PDFActionRemoteGoToPrivateVars *v23;
  CGFloat v24;
  CGFloat v25;
  PDFActionRemoteGoTo *v26;
  CGPDFObjectRef value;
  objc_super v29;

  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PDFActionRemoteGoTo;
  v9 = -[PDFAction initWithActionDictionary:forDocument:forPage:](&v29, sel_initWithActionDictionary_forDocument_forPage_, a3, v8, a5);
  if (v9)
  {
    value = 0;
    if (CGPDFDictionaryGetObject(a3, "F", &value))
    {
      v10 = value;
      objc_msgSend(v8, "documentURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      getFilepathFromObjectDetermineEncoding(v10, (const __CFString *)objc_msgSend(v12, "stringByDeletingLastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        private2 = v9->_private2;
        url = private2->url;
        private2->url = (NSURL *)v14;

      }
    }
    if (v9->_private2->url)
    {
      v17 = -[PDFDocument initWithURL:]([PDFDocument alloc], "initWithURL:", v9->_private2->url);
      if (v17)
      {
        v18 = -[PDFDestination initWithDictionary:forDocument:]([PDFDestination alloc], "initWithDictionary:forDocument:", a3, v17);
        v19 = v9->_private2;
        destination = v19->destination;
        v19->destination = v18;

        v21 = v9->_private2->destination;
        if (v21)
        {
          -[PDFDestination page](v21, "page");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v9->_private2->pageIndex = -[PDFDocument indexForPage:](v17, "indexForPage:", v22);

          v23 = v9->_private2;
          -[PDFDestination point](v23->destination, "point");
          v23->point.x = v24;
          v23->point.y = v25;
        }
      }

    }
    v26 = v9;
  }

  return v9;
}

- (void)commonInit
{
  PDFActionRemoteGoToPrivateVars *v3;
  PDFActionRemoteGoToPrivateVars *private2;
  PDFActionRemoteGoToPrivateVars *v5;
  CGFloat v6;
  PDFActionRemoteGoToPrivateVars *v7;
  NSURL *url;
  PDFActionRemoteGoToPrivateVars *v9;
  PDFDestination *destination;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PDFActionRemoteGoTo;
  -[PDFAction commonInit](&v11, sel_commonInit);
  v3 = objc_alloc_init(PDFActionRemoteGoToPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  self->_private2->pageIndex = 0;
  v5 = self->_private2;
  v5->point.x = PDFPointMake(3.40282347e38, 3.40282347e38);
  v5->point.y = v6;
  v7 = self->_private2;
  url = v7->url;
  v7->url = 0;

  v9 = self->_private2;
  destination = v9->destination;
  v9->destination = 0;

}

- (__CFDictionary)createDictionaryRef
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("/S"), CFSTR("/GoToR"));
  -[PDFActionRemoteGoTo addDestinationToDictionaryRef:](self, "addDestinationToDictionaryRef:", Mutable);
  return Mutable;
}

- (void)addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  PDFDestination *v4;
  __CFArray *v5;
  PDFDestination *v6;

  v4 = self->_private2->destination;
  if (v4)
  {
    v6 = v4;
    v5 = -[PDFDestination createArrayRef](v4, "createArrayRef");
    v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, CFSTR("/D"), v5);
      CFRelease(v5);
      v4 = v6;
    }
  }

}

- (id)toolTipNoLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PDFActionRemoteGoTo URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    PDFKitLocalizedString(CFSTR("Go to file %@, page %lu"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFActionRemoteGoTo URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v8, self->_private2->pageIndex + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PDFKitLocalizedString(CFSTR("Broken link"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private2, 0);
}

@end
