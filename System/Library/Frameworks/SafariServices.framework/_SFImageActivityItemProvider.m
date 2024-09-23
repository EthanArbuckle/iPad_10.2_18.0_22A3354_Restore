@implementation _SFImageActivityItemProvider

- (_SFImageActivityItemProvider)initWithWebView:(id)a3
{
  id v4;
  void *v5;
  _SFImageActivityItemProvider *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  CFStringRef PreferredIdentifierForTag;
  NSString *documentUTI;
  _SFImageActivityItemProvider *v12;
  objc_super v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)_SFImageActivityItemProvider;
  v6 = -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v14, sel_initWithPlaceholderItem_URL_pageTitle_webView_, v5, 0, 0, v4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CEB1B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivityItemProvider setExcludedActivityTypes:](v6, "setExcludedActivityTypes:", v7);

    v8 = (const __CFString *)*MEMORY[0x1E0CA5A90];
    objc_msgSend(v4, "_MIMEType");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(v8, v9, 0);
    documentUTI = v6->_documentUTI;
    v6->_documentUTI = &PreferredIdentifierForTag->isa;

    v12 = v6;
  }

  return v6;
}

- (id)item
{
  NSData *imageOnlyDocumentData;
  NSData *v4;
  NSData *v5;

  imageOnlyDocumentData = self->_imageOnlyDocumentData;
  if (!imageOnlyDocumentData)
  {
    -[_SFImageActivityItemProvider _imageData](self, "_imageData");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_imageOnlyDocumentData;
    self->_imageOnlyDocumentData = v4;

    imageOnlyDocumentData = self->_imageOnlyDocumentData;
  }
  return imageOnlyDocumentData;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return self->_documentUTI;
}

- (id)_imageData
{
  const __CFString *documentUTI;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  documentUTI = (const __CFString *)self->_documentUTI;
  if (!documentUTI || !UTTypeConformsTo(documentUTI, (CFStringRef)*MEMORY[0x1E0CA5B90]))
    return 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  v16 = 0;
  -[_SFActivityItemProvider webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42___SFImageActivityItemProvider__imageData__block_invoke;
  v10[3] = &unk_1E4AC7E70;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v4, "_getMainResourceDataWithCompletionHandler:", v10);

  if (!*((_BYTE *)v18 + 24))
  {
    v5 = *MEMORY[0x1E0C99748];
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "runMode:beforeDate:", v5, v7);

    }
    while (!*((_BYTE *)v18 + 24));
  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentUTI, 0);
  objc_storeStrong((id *)&self->_imageOnlyDocumentData, 0);
}

@end
