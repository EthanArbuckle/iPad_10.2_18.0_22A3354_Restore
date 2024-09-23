@implementation PDFActionURL

- (PDFActionURL)initWithURL:(NSURL *)url
{
  NSURL *v5;
  PDFActionURL *v6;
  PDFActionURL *v7;
  objc_super v9;

  v5 = url;
  v9.receiver = self;
  v9.super_class = (Class)PDFActionURL;
  v6 = -[PDFAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PDFActionURL commonInit](v6, "commonInit");
    -[PDFAction setType:](v7, "setType:", CFSTR("URI"));
    objc_storeStrong((id *)&v7->_private2->url, url);
    v7->_private2->suspiciousURL = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PDFActionURLPrivateVars *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PDFActionURL;
  v5 = -[PDFAction copyWithZone:](&v12, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionURLPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSURL copyWithZone:](self->_private2->url, "copyWithZone:", a3);
    v9 = v5[2];
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = v8;

    *(_BYTE *)(v5[2] + 16) = self->_private2->suspiciousURL;
  }
  return v5;
}

- (NSURL)URL
{
  return self->_private2->url;
}

- (void)setURL:(NSURL *)URL
{
  uint64_t v4;
  PDFActionURLPrivateVars *private2;
  NSURL *v6;

  v4 = -[NSURL copy](URL, "copy");
  private2 = self->_private2;
  v6 = private2->url;
  private2->url = (NSURL *)v4;

}

- (BOOL)isSuspiciousURL
{
  return self->_private2->suspiciousURL;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[PDFActionURL toolTip](self, "toolTip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("URL Action - %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PDFActionURL)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8;
  PDFActionURL *v9;
  CGPDFObject *UnresolvedObject;
  const unsigned __int8 *BytePtr;
  const unsigned __int8 *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PDFActionURLPrivateVars *private2;
  NSURL *url;
  NSURL *v19;
  void *v20;
  NSURL *v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  CGPDFObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  PDFActionURLPrivateVars *v32;
  NSURL *v33;
  PDFActionURL *v34;
  int v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  _QWORD value[2];
  CGPDFObjectRef v42;
  CGPDFStringRef string;
  objc_super v44;

  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PDFActionURL;
  v9 = -[PDFAction initWithActionDictionary:forDocument:forPage:](&v44, sel_initWithActionDictionary_forDocument_forPage_, a3, v8, a5);
  if (!v9)
    goto LABEL_29;
  v42 = 0;
  string = 0;
  if (CGPDFDocumentIsEncrypted((CGPDFDocumentRef)objc_msgSend(v8, "documentRef")))
  {
    UnresolvedObject = (CGPDFObject *)CGPDFDictionaryGetUnresolvedObject();
    if (UnresolvedObject)
    {
      value[0] = 0;
      value[1] = 0;
      if (CGPDFObjectGetValue(UnresolvedObject, kCGPDFObjectTypeDictionary|kCGPDFObjectTypeBoolean, value))
      {
        v39 = 0u;
        v40 = 0u;
        CGPDFDocumentGetXRef();
        CGPDFXRefGetEntry();
      }
    }
  }
  if (CGPDFDictionaryGetString(a3, "URI", &string))
  {
    BytePtr = CGPDFStringGetBytePtr(string);
    if (BytePtr)
    {
      v12 = BytePtr;
      if (CGPDFStringGetLength(string))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("%20"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v15);
            private2 = v9->_private2;
            url = private2->url;
            private2->url = (NSURL *)v16;

          }
          v9->_private2->suspiciousURL = 0;
          v19 = v9->_private2->url;
          if (v19)
          {
            -[NSURL scheme](v19, "scheme");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BDD1338]))
            {
              v26 = 0;
LABEL_22:

              v23 = v26;
              goto LABEL_23;
            }
            v21 = v9->_private2->url;
            v38 = 0;
            v22 = -[NSURL checkResourceIsReachableAndReturnError:](v21, "checkResourceIsReachableAndReturnError:", &v38);
            v23 = v38;

            if (!v22)
            {
              -[PDFAction baseURLForDocument:](v9, "baseURLForDocument:", v8);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:relativeToURL:", v15, v20);
              v25 = v24;
              if (v24)
              {
                v37 = v23;
                v36 = objc_msgSend(v24, "checkResourceIsReachableAndReturnError:", &v37);
                v26 = v37;

                if (v36)
                  objc_storeStrong((id *)&v9->_private2->url, v25);
              }
              else
              {
                v26 = v23;
              }

              goto LABEL_22;
            }
          }
          else
          {
            v23 = 0;
          }
LABEL_23:

        }
      }
    }
  }
  if (CGPDFDictionaryGetObject(a3, "F", &v42))
  {
    v27 = v42;
    objc_msgSend(v8, "documentURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    getFilepathFromObjectDetermineEncoding(v27, (const __CFString *)objc_msgSend(v29, "stringByDeletingLastPathComponent"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v9->_private2;
      v33 = v32->url;
      v32->url = (NSURL *)v31;

    }
  }
  v34 = v9;
LABEL_29:

  return v9;
}

- (void)commonInit
{
  PDFActionURLPrivateVars *v3;
  PDFActionURLPrivateVars *private2;
  PDFActionURLPrivateVars *v5;
  NSURL *url;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFActionURL;
  -[PDFAction commonInit](&v7, sel_commonInit);
  v3 = objc_alloc_init(PDFActionURLPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  v5 = self->_private2;
  url = v5->url;
  v5->url = 0;

  self->_private2->suspiciousURL = 0;
}

- (__CFDictionary)createDictionaryRef
{
  void *Mutable;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[PDFActionURL URL](self, "URL");
  Mutable = (void *)objc_claimAutoreleasedReturnValue();
  if (Mutable)
  {
    -[PDFActionURL URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      return 0;
    }
    else
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, CFSTR("/S"), CFSTR("/URI"));
      -[PDFActionURL URL](self, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, CFSTR("/URI"), v8);

      }
    }
  }
  return (__CFDictionary *)Mutable;
}

- (id)toolTip
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PDFActionURL URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isFileURL"))
  {
    objc_msgSend(v2, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "standardizedURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private2, 0);
}

@end
