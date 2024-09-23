@implementation CUTFileCopier

- (CUTFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unsigned int)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CUTFileCopier *v16;
  uint64_t v17;
  NSURL *inputURL;
  uint64_t v19;
  NSURL *outputURL;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CUTFileCopier;
  v16 = -[CUTFileCopier init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    inputURL = v16->_inputURL;
    v16->_inputURL = (NSURL *)v17;

    v19 = objc_msgSend(v13, "copy");
    outputURL = v16->_outputURL;
    v16->_outputURL = (NSURL *)v19;

    objc_storeStrong(&v16->_identifier, a5);
    if (!v16->_outputURL)
      -[CUTFileCopier _fillOutputURLFromInputURL](v16, "_fillOutputURLFromInputURL");
    v16->_operation = a6;
    objc_storeWeak((id *)&v16->_delegate, v15);
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_BOMCopier)
  {
    if (self->_inProgress)
      BOMCopierCancelCopy();
    BOMCopierFree();
  }
  v3.receiver = self;
  v3.super_class = (Class)CUTFileCopier;
  -[CUTFileCopier dealloc](&v3, sel_dealloc);
}

- (id)_temporaryCopierPath
{
  void *v2;
  void *v3;

  CUTTemporaryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("CUTFileCopier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_fillOutputURLFromInputURL
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSURL *v13;
  NSURL *outputURL;
  __CFString *v15;
  __CFString *v16;

  -[CUTFileCopier inputURL](self, "inputURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v15, "length"))
  {
    v5 = v15;
  }
  else
  {

    v5 = CFSTR("Archive");
  }
  v16 = v5;
  -[__CFString stringByAppendingPathExtension:](v5, "stringByAppendingPathExtension:", CFSTR("zip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUTFileCopier _temporaryCopierPath](self, "_temporaryCopierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "cutStringGUID");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

  }
  objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v12);
  outputURL = self->_outputURL;
  self->_outputURL = v13;

}

- (void)start
{
  void *v3;

  if (!self->_inProgress)
  {
    -[CUTFileCopier delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileCopierDidStart:", self);

    self->_inProgress = 1;
    MEMORY[0x1E0DE7D20](MEMORY[0x1E0CB3978], sel_detachNewThreadSelector_toTarget_withObject_);
  }
}

- (void)cancel
{
  if (!self->_shouldCancel)
  {
    self->_shouldCancel = 1;
    if (self->_BOMCopier)
    {
      if (self->_inProgress)
        BOMCopierCancelCopy();
    }
  }
}

- (void)cleanup
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if (self->_inProgress)
  {
    -[CUTFileCopier cancel](self, "cancel");
  }
  else
  {
    -[NSURL path](self->_outputURL, "path");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CUTFileCopier _temporaryCopierPath](self, "_temporaryCopierPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "hasPrefix:", v3);

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

    }
  }
}

- (void)_main_copierFinishedWithResult:(id)a3
{
  char v4;
  _BOOL4 shouldCancel;
  char v6;
  id v7;

  v4 = objc_msgSend(a3, "BOOLValue");
  shouldCancel = self->_shouldCancel;
  v6 = v4 ^ 1;
  if (self->_shouldCancel)
    v6 = 0;
  self->_didErrorOccur = v6;
  self->_inProgress = 0;
  if (shouldCancel)
    -[CUTFileCopier cleanup](self, "cleanup");
  -[CUTFileCopier delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileCopierDidFinish:", self);

}

- (void)_worker_doCopy
{
  void *v3;
  void *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  unsigned int operation;
  const void *v8;
  const __CFString *v9;
  _BOOL8 v10;
  const void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v3 = (void *)MEMORY[0x1A1B01454](self, a2);
  v4 = (void *)BOMCopierNew();
  self->_BOMCopier = v4;
  if (v4)
  {
    BOMCopierSetUserData();
    BOMCopierSetCopyFileStartedHandler();
    BOMCopierSetFileErrorHandler();
    BOMCopierSetFileConflictErrorHandler();
    BOMCopierSetFatalErrorHandler();
    BOMCopierSetFatalFileErrorHandler();
    v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = v5;
    operation = self->_operation;
    if (operation)
    {
      if (operation == 1)
      {
        v11 = (const void *)*MEMORY[0x1E0C9AE50];
        v9 = CFSTR("extractPKZip");
        goto LABEL_10;
      }
      if (operation != 2)
      {
LABEL_11:
        -[CUTFileCopier inputURL](self, "inputURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "fileSystemRepresentation");

        -[CUTFileCopier outputURL](self, "outputURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v15, "fileSystemRepresentation");

        v10 = BOMCopierCopyWithOptions() == 0;
        BOMCopierSetUserData();

        goto LABEL_12;
      }
      v8 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionarySetValue(v5, CFSTR("createCPIO"), (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionarySetValue(v6, CFSTR("sequesterResources"), v8);
      v9 = CFSTR("createPKZip");
    }
    else
    {
      v8 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionarySetValue(v5, CFSTR("createCPIO"), (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionarySetValue(v6, CFSTR("sequesterResources"), v8);
      CFDictionarySetValue(v6, CFSTR("createPKZip"), v8);
      CFDictionarySetValue(v6, CFSTR("keepParent"), v8);
      v9 = CFSTR("copyResources");
    }
    v5 = v6;
    v11 = v8;
LABEL_10:
    CFDictionarySetValue(v5, v9, v11);
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v10);
  -[CUTFileCopier performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__main_copierFinishedWithResult_, v16, 0);

  objc_autoreleasePoolPop(v3);
}

- (CUTFileCopierDelegate)delegate
{
  return (CUTFileCopierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)inputURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (id)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (BOOL)wasCancelled
{
  return self->_shouldCancel;
}

- (BOOL)didErrorOccur
{
  return self->_didErrorOccur;
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (unsigned)operation
{
  return self->_operation;
}

- (void)setOperation:(unsigned int)a3
{
  self->_operation = a3;
}

- (void)_BOMCopier
{
  return self->_BOMCopier;
}

- (void)set_BOMCopier:(void *)a3
{
  self->_BOMCopier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
