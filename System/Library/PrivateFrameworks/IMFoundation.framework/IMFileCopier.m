@implementation IMFileCopier

- (IMFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unint64_t)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  IMFileCopierDelegate *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  IMFileCopier *v19;
  uint64_t v20;
  NSURL *inputURL;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSURL *outputURL;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (IMFileCopierDelegate *)a7;
  v31.receiver = self;
  v31.super_class = (Class)IMFileCopier;
  v19 = -[IMFileCopier init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v12, v16, v17, v18);
    inputURL = v19->_inputURL;
    v19->_inputURL = (NSURL *)v20;

    v25 = objc_msgSend_copy(v13, v22, v23, v24);
    outputURL = v19->_outputURL;
    v19->_outputURL = (NSURL *)v25;

    objc_storeStrong(&v19->_identifier, a5);
    if (!v19->_outputURL)
      objc_msgSend__fillOutputURLFromInputURL(v19, v27, v28, v29);
    v19->_operation = a6;
    v19->_delegate = v15;
  }

  return v19;
}

- (IMFileCopier)initWithInputURL:(id)a3 outputURL:(id)a4 identifier:(id)a5 operation:(unint64_t)a6 completionBlock:(id)a7 queue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  IMFileCopier *v22;
  uint64_t v23;
  NSURL *inputURL;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSURL *outputURL;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id callback;
  OS_dispatch_queue *v35;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v37;
  id v38;
  objc_super v40;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v40.receiver = self;
  v40.super_class = (Class)IMFileCopier;
  v22 = -[IMFileCopier init](&v40, sel_init);
  if (v22)
  {
    v23 = objc_msgSend_copy(v14, v19, v20, v21);
    inputURL = v22->_inputURL;
    v22->_inputURL = (NSURL *)v23;

    v28 = objc_msgSend_copy(v15, v25, v26, v27);
    outputURL = v22->_outputURL;
    v22->_outputURL = (NSURL *)v28;

    objc_storeStrong(&v22->_identifier, a5);
    if (!v22->_outputURL)
      objc_msgSend__fillOutputURLFromInputURL(v22, v30, v31, v32);
    v22->_operation = a6;
    v33 = objc_msgSend_copy(v17, v30, v31, v32);
    callback = v22->_callback;
    v22->_callback = (id)v33;

    if (v18)
    {
      v35 = (OS_dispatch_queue *)v18;
      queue = v22->_queue;
      v22->_queue = v35;
    }
    else
    {
      v37 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v38 = MEMORY[0x1E0C80D38];
      queue = v22->_queue;
      v22->_queue = v37;
    }

  }
  return v22;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_BOMCopier)
  {
    if (self->_inProgress)
    {
      if (qword_1EE1DDAE0 != -1)
        dispatch_once(&qword_1EE1DDAE0, &unk_1E2C42D28);
      off_1EE1DDAD8(self->_BOMCopier);
    }
    if (qword_1EE1DD398 != -1)
      dispatch_once(&qword_1EE1DD398, &unk_1E2C43408);
    off_1EE1DD478(self->_BOMCopier);
  }
  v3.receiver = self;
  v3.super_class = (Class)IMFileCopier;
  -[IMFileCopier dealloc](&v3, sel_dealloc);
}

- (id)_temporaryCopierPath
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  IMTemporaryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v2, v3, (uint64_t)CFSTR("IMFileCopier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_fillOutputURLFromInputURL
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  NSURL *inited;
  NSURL *outputURL;
  __CFString *v55;
  __CFString *v56;

  objc_msgSend_inputURL(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_invalidCharactersForFileTransferName(MEMORY[0x1E0CB3500], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByRemovingCharactersFromSet_(v13, v18, (uint64_t)v17, v19);
  v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v55, v20, v21, v22))
  {
    v25 = v55;
  }
  else
  {

    v25 = CFSTR("Archive");
  }
  v56 = v25;
  objc_msgSend_stringByAppendingPathExtension_(v25, v23, (uint64_t)CFSTR("zip"), v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__temporaryCopierPath(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v31, v32, v33);
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v30, v35, v34, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v34) = objc_msgSend_fileExistsAtPath_(v41, v42, (uint64_t)v37, v43);

  if ((v34 & 1) == 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v47, v48, (uint64_t)v37, 1, 0, 0);

  }
  objc_msgSend_stringByAppendingPathComponent_(v37, v44, (uint64_t)v26, v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_alloc(MEMORY[0x1E0C99E98]);
  inited = (NSURL *)objc_msgSend_initFileURLWithPath_(v50, v51, (uint64_t)v49, v52);
  outputURL = self->_outputURL;
  self->_outputURL = inited;

}

- (void)start
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  if (!self->_inProgress)
  {
    objc_msgSend_delegate(self, a2, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileCopierDidStart_(v5, v6, (uint64_t)self, v7);

    self->_inProgress = 1;
    MEMORY[0x1E0DE7D20](MEMORY[0x1E0CB3978], sel_detachNewThreadSelector_toTarget_withObject_, sel__worker_doCopy, self);
  }
}

- (void)cancel
{
  IMFileCopier *v2;

  if (!self->_shouldCancel)
  {
    self->_shouldCancel = 1;
    if (self->_BOMCopier)
    {
      if (self->_inProgress)
      {
        if (qword_1EE1DDAF0 != -1)
        {
          v2 = self;
          dispatch_once(&qword_1EE1DDAF0, &unk_1E2C43308);
          self = v2;
        }
        off_1EE1DDAE8(self->_BOMCopier);
      }
    }
  }
}

- (void)cleanup
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int hasPrefix;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  if (self->_inProgress)
  {
    ((void (*)(IMFileCopier *, char *))MEMORY[0x1E0DE7D20])(self, sel_cancel);
  }
  else
  {
    objc_msgSend_path(self->_outputURL, a2, v2, v3);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__temporaryCopierPath(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    hasPrefix = objc_msgSend_hasPrefix_(v17, v9, (uint64_t)v8, v10);

    if (hasPrefix)
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeItemAtPath_error_(v15, v16, (uint64_t)v17, 0);

    }
  }
}

- (void)_main_copierFinishedWithResult:(id)a3
{
  uint64_t v3;
  char v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 shouldCancel;
  char v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *queue;
  _QWORD block[5];

  v5 = objc_msgSend_BOOLValue(a3, a2, (uint64_t)a3, v3);
  shouldCancel = self->_shouldCancel;
  v10 = v5 ^ 1;
  if (self->_shouldCancel)
    v10 = 0;
  self->_didErrorOccur = v10;
  self->_inProgress = 0;
  if (shouldCancel)
    objc_msgSend_cleanup(self, v6, v7, v8);
  objc_msgSend_delegate(self, v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileCopierDidFinish_(v11, v12, (uint64_t)self, v13);

  if (self->_callback)
  {
    queue = self->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1906963B0;
      block[3] = &unk_1E2C44580;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

- (void)_worker_doCopy
{
  void *v3;
  void *v4;
  __CFDictionary *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  unint64_t operation;
  const void *v11;
  const __CFString *v12;
  _BOOL8 v13;
  const void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v3 = (void *)MEMORY[0x19400E788](self, a2);
  if (qword_1EE1DD390 != -1)
    dispatch_once(&qword_1EE1DD390, &unk_1E2C43348);
  if (qword_1EE1DD440 != -1)
    dispatch_once(&qword_1EE1DD440, &unk_1E2C45308);
  if (qword_1EE1DD470 != -1)
    dispatch_once(&qword_1EE1DD470, &unk_1E2C45328);
  if (qword_1EE1DD450 != -1)
    dispatch_once(&qword_1EE1DD450, &unk_1E2C43388);
  if (qword_1EE1DD458 != -1)
    dispatch_once(&qword_1EE1DD458, &unk_1E2C45348);
  if (qword_1EE1DD468 != -1)
    dispatch_once(&qword_1EE1DD468, &unk_1E2C45368);
  if (qword_1EE1DD460 != -1)
    dispatch_once(&qword_1EE1DD460, &unk_1E2C434A8);
  if (qword_1EE1DD448 != -1)
    dispatch_once(&qword_1EE1DD448, &unk_1E2C43508);
  if (qword_1EE1DD438 != -1)
    dispatch_once(&qword_1EE1DD438, &unk_1E2C45388);
  v4 = (void *)off_1EE1DD400();
  self->_BOMCopier = v4;
  if (v4)
  {
    off_1EE1DD430(v4, self);
    off_1EE1DD408(self->_BOMCopier, sub_190696958);
    off_1EE1DD428(self->_BOMCopier, sub_1906969D4);
    off_1EE1DD420(self->_BOMCopier, sub_190696AE4);
    off_1EE1DD410(self->_BOMCopier, sub_190696BE4);
    off_1EE1DD418(self->_BOMCopier, sub_190696C70);
    v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = v5;
    operation = self->_operation;
    if (operation)
    {
      if (operation == 1)
      {
        v14 = (const void *)*MEMORY[0x1E0C9AE50];
        v12 = CFSTR("extractPKZip");
        goto LABEL_28;
      }
      if (operation != 2)
      {
LABEL_29:
        objc_msgSend_inputURL(self, v6, v7, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v15, v16, v17, v18);
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = objc_msgSend_fileSystemRepresentation(v19, v20, v21, v22);

        objc_msgSend_outputURL(self, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v27, v28, v29, v30);
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = objc_msgSend_fileSystemRepresentation(v31, v32, v33, v34);

        v13 = off_1EE1DD3F0(self->_BOMCopier, v23, v35, v9) == 0;
        off_1EE1DD430(self->_BOMCopier, 0);

        goto LABEL_30;
      }
      v11 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionarySetValue(v5, CFSTR("createCPIO"), (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionarySetValue(v9, CFSTR("sequesterResources"), v11);
      v12 = CFSTR("createPKZip");
    }
    else
    {
      v11 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionarySetValue(v5, CFSTR("createCPIO"), (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionarySetValue(v9, CFSTR("sequesterResources"), v11);
      CFDictionarySetValue(v9, CFSTR("createPKZip"), v11);
      CFDictionarySetValue(v9, CFSTR("keepParent"), v11);
      v12 = CFSTR("copyResources");
    }
    v5 = v9;
    v14 = v11;
LABEL_28:
    CFDictionarySetValue(v5, v12, v14);
    goto LABEL_29;
  }
  v13 = 0;
LABEL_30:
  v36 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v39 = (void *)objc_msgSend_initWithBool_(v36, v37, v13, v38);
  objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v40, (uint64_t)sel__main_copierFinishedWithResult_, (uint64_t)v39, 0);

  objc_autoreleasePoolPop(v3);
}

- (IMFileCopierDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IMFileCopierDelegate *)a3;
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

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
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

- (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)_callback
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)set_callback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
}

@end
