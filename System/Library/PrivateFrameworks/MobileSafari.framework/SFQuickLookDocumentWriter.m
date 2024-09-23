@implementation SFQuickLookDocumentWriter

- (void)setFilePathAccessedOnDispatchQueue:(id)a3
{
  NSString *v4;
  NSString *filePathAccessedOnDispatchQueue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  filePathAccessedOnDispatchQueue = self->_filePathAccessedOnDispatchQueue;
  self->_filePathAccessedOnDispatchQueue = v4;

}

- (NSString)filePathAccessedOnDispatchQueue
{
  return self->_filePathAccessedOnDispatchQueue;
}

- (SFQuickLookDocumentWriter)initWithFileName:(id)a3 uti:(id)a4
{
  id v6;
  __CFString *v7;
  SFQuickLookDocumentWriter *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  CFStringRef *v16;
  const __CFString *PreferredIdentifierForTag;
  __CFString *v18;
  __CFString *v19;
  SFQuickLookDocument *v20;
  void *v21;
  uint64_t v22;
  SFQuickLookDocument *quickLookDocument;
  dispatch_queue_t v24;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v26;
  SFQuickLookDocumentWriter *v27;
  SFQuickLookDocumentWriter *v28;
  _QWORD v30[4];
  SFQuickLookDocumentWriter *v31;
  id v32;
  objc_super v33;

  v6 = a3;
  v7 = (__CFString *)a4;
  v33.receiver = self;
  v33.super_class = (Class)SFQuickLookDocumentWriter;
  v8 = -[SFQuickLookDocumentWriter init](&v33, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "safari_lastPathComponentWithoutZipExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    v12 = v10;
    v13 = (const __CFString *)*MEMORY[0x1E0CA5B20];
    if (UTTypeConformsTo(v11, (CFStringRef)*MEMORY[0x1E0CA5B20]))
    {
      v7 = v11;
      v14 = v12;
    }
    else
    {
      v15 = -[__CFString length](v12, "length");
      v16 = (CFStringRef *)MEMORY[0x1E0CA5A88];
      v14 = v12;
      if (!v15)
      {
        v14 = (__CFString *)UTTypeCopyPreferredTagWithClass(v11, (CFStringRef)*MEMORY[0x1E0CA5A88]);

      }
      if (-[__CFString length](v14, "length"))
      {
        PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(*v16, v14, v13);
        v18 = (__CFString *)PreferredIdentifierForTag;
        v19 = v11;
        if (PreferredIdentifierForTag)
        {
          if (UTTypeIsDynamic(PreferredIdentifierForTag))
            v19 = v11;
          else
            v19 = v18;
        }
        v7 = v19;

      }
      else
      {
        v7 = v11;
      }
    }

    v8->_hasFinishedWriting = 0;
    v20 = [SFQuickLookDocument alloc];
    objc_msgSend(v6, "safari_lastPathComponentWithoutZipExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SFQuickLookDocument initWithFileName:mimeType:uti:needsQuickLookDocumentView:](v20, "initWithFileName:mimeType:uti:needsQuickLookDocumentView:", v21, 0, v7, 0);
    quickLookDocument = v8->_quickLookDocument;
    v8->_quickLookDocument = (SFQuickLookDocument *)v22;

    v24 = dispatch_queue_create("com.apple.mobilesafari.QuickLookDocumentWriterQueue", 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v24;

    v26 = v8->_dispatchQueue;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __50__SFQuickLookDocumentWriter_initWithFileName_uti___block_invoke;
    v30[3] = &unk_1E21E2258;
    v27 = v8;
    v31 = v27;
    v32 = v6;
    dispatch_async(v26, v30);
    v28 = v27;

  }
  return v8;
}

void __50__SFQuickLookDocumentWriter_initWithFileName_uti___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3620], "_web_createTemporaryFileForQuickLook:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFilePathAccessedOnDispatchQueue:", v2);

}

- (void)writeDataAndClose:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke;
  block[3] = &unk_1E21E2280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "filePathAccessedOnDispatchQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "closeFile");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke_2;
  block[3] = &unk_1E21E2280;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = *(id *)(a1 + 48);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(a1[4] + 24) = 1;
  objc_msgSend(*(id *)(a1[4] + 32), "setSavedPath:shouldDelete:", a1[5], 0);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[5]);
  return result;
}

- (SFQuickLookDocument)quickLookDocument
{
  return self->_quickLookDocument;
}

- (BOOL)hasFinishedWriting
{
  return self->_hasFinishedWriting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_storeStrong((id *)&self->_filePathAccessedOnDispatchQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
