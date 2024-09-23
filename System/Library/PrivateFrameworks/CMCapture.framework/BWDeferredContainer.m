@implementation BWDeferredContainer

- (FigCaptureStillImageSettings)settings
{
  _opaque_pthread_rwlock_t *p_lock;
  FigCaptureStillImageSettings *v4;

  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v4 = self->_stillImageSettings;
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (BWStillImageCaptureSettings)captureSettings
{
  _opaque_pthread_rwlock_t *p_lock;
  BWStillImageCaptureSettings *v4;

  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v4 = self->_stillImageCaptureSettings;
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (uint64_t)_intermediateForTag:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  if (a1
    && (v3 = *(void **)(a1 + 272),
        v6[0] = MEMORY[0x1E0C809B0],
        v6[1] = 3221225472,
        v6[2] = __43__BWDeferredContainer__intermediateForTag___block_invoke,
        v6[3] = &unk_1E4923A30,
        v6[4] = a2,
        v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v6),
        v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return objc_msgSend(*(id *)(a1 + 272), "objectAtIndexedSubscript:", v4);
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_getUUIDBytes:(int)a3 high:
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9[0] = 0;
  v9[1] = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a2);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getUUIDBytes:", v9);
    v6 = 1;
    if (!a3)
      v6 = 0;
    v7 = v9[v6];
  }
  else
  {
    FigDebugAssert3();
    v7 = 0;
  }

  return v7;
}

uint64_t __43__BWDeferredContainer__intermediateForTag___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "tag"));
}

- (BOOL)hasTag:(id)a3
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  intermediates = self->_intermediates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(intermediates);
        if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "tag")) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:
  pthread_rwlock_unlock(p_lock);
  return v11;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
  if (initialize_sContainerDateFormatterToken != -1)
    dispatch_once(&initialize_sContainerDateFormatterToken, &__block_literal_global_75);
}

uint64_t __33__BWDeferredContainer_initialize__block_invoke()
{
  uint64_t v0;

  sContainerDateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]), "timeZone");
  objc_msgSend((id)sContainerDateFormatter, "setTimeZone:", v0);
  return objc_msgSend((id)sContainerDateFormatter, "setFormatOptions:", objc_msgSend((id)sContainerDateFormatter, "formatOptions") | 0x800);
}

- (BWDeferredPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (BWDeferredContainer)init
{
  BWDeferredContainer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWDeferredContainer;
  v2 = -[BWDeferredContainer init](&v4, sel_init);
  if (v2)
  {
    v2->_creationTimeNS = FigGetUpTimeNanoseconds();
    v2->_manifestVersion = 8;
  }
  return v2;
}

- (BWDeferredContainer)initWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8
{
  BWDeferredContainer *v14;
  BWDeferredContainer *v15;

  v14 = -[BWDeferredContainer init](self, "init");
  v15 = v14;
  if (v14)
  {
    pthread_rwlock_init(&v14->_lock, 0);
    v15->_baseFolderURL = 0;
    v15->_applicationID = (NSString *)objc_msgSend(a3, "copy");
    v15->_captureRequestIdentifier = 0;
    v15->_stillImageCaptureSettings = (BWStillImageCaptureSettings *)a4;
    v15->_stillImageSettings = (FigCaptureStillImageSettings *)a5;
    v15->_pipelineParameters = (BWDeferredPipelineParameters *)a6;
    v15->_intermediates = (NSMutableArray *)objc_msgSend(a7, "copy");
    v15->_photoDescriptors = (NSMutableArray *)objc_msgSend(a8, "copy");
  }
  return v15;
}

- (unint64_t)captureRequestIdentifierBytesLow
{
  return -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)self->_captureRequestIdentifier, 0);
}

- (unint64_t)captureRequestIdentifierBytesHigh
{
  return -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)self->_captureRequestIdentifier, 1);
}

- (BWDeferredContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 queuePriority:(unsigned int)a6 err:(int *)a7
{
  BWDeferredContainer *v11;
  BWDeferredContainer *v12;

  v11 = -[BWDeferredContainer init](self, "init", a3, a4, a5, *(_QWORD *)&a6);
  v12 = v11;
  if (v11)
  {
    pthread_rwlock_init(&v11->_lock, 0);
    v12->_baseFolderURL = (NSURL *)objc_msgSend(a5, "copy");
    v12->_applicationID = (NSString *)objc_msgSend(a3, "copy");
    v12->_captureRequestIdentifier = (NSString *)objc_msgSend(a4, "copy");
  }
  if (a7)
    *a7 = 0;
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->_lock);

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredContainer;
  -[BWDeferredContainer dealloc](&v3, sel_dealloc);
}

- (unsigned)processingType
{
  int v3;

  v3 = -[BWStillImageCaptureSettings captureType](self->_stillImageCaptureSettings, "captureType");
  if (v3 == 1)
  {
    if ((-[BWStillImageCaptureSettings captureFlags](self->_stillImageCaptureSettings, "captureFlags") & 0x80) != 0)
      return 3;
    else
      return 0;
  }
  else if (v3 == 12)
  {
    return 2;
  }
  else
  {
    return v3 == 10;
  }
}

+ (id)archiveObject:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id result;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = 0;
  if (a3)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v9);
    if (!result)
    {
      LODWORD(v8) = 0;
      FigDebugAssert3();
      objc_msgSend(v9, "code", v8, v4);
      FigSignalErrorAt();
      result = 0;
    }
  }
  else
  {
    LODWORD(v8) = 0;
    FigDebugAssert3();
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -16134, 0, v8, v4);
    result = 0;
    v9 = v7;
  }
  if (a4)
    *a4 = v9;
  return result;
}

+ (BOOL)archiveObjectWithURL:(id)a3 object:(id)a4 error:(id *)a5
{
  uint64_t v5;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  void *v12;

  v12 = 0;
  if (a3)
  {
    v8 = (void *)objc_msgSend(a1, "archiveObject:error:", a4, &v12);
    if (v8)
      LOBYTE(v8) = objc_msgSend(v8, "writeToURL:options:error:", a3, 1, &v12);
    if (a5)
      goto LABEL_5;
  }
  else
  {
    LODWORD(v11) = 0;
    FigDebugAssert3();
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -16134, 0, v11, v5);
    LOBYTE(v8) = 0;
    v12 = (void *)v9;
    if (a5)
LABEL_5:
      *a5 = v12;
  }
  return (char)v8;
}

+ (id)unarchiveObject:(id)a3 classes:(id)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v9;
  uint64_t v11;
  void *v12;

  v7 = a3;
  v12 = 0;
  if (a3)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, &v12);
    if (v7)
    {
      objc_msgSend(v7, "setDelegate:", +[FigCaptureCIFilterUnarchiverDelegate sharedInstance](FigCaptureCIFilterUnarchiverDelegate, "sharedInstance"));
      v9 = (void *)objc_msgSend(v7, "decodeTopLevelObjectOfClasses:forKey:error:", a4, *MEMORY[0x1E0CB2CD0], &v12);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    LODWORD(v11) = 0;
    FigDebugAssert3();
    v9 = 0;
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -16134, 0, v11, v5);
  }

  if (a5)
    *a5 = v12;
  return v9;
}

+ (id)unarchiveObjectWithURL:(id)a3 classes:(id)a4 error:(id *)a5
{
  uint64_t v5;
  id result;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v12 = 0;
  if (!a3)
  {
    LODWORD(v11) = 0;
    FigDebugAssert3();
    v10 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -16134, 0, v11, v5);
    result = 0;
    v12 = (void *)v10;
    if (!a5)
      return result;
    goto LABEL_5;
  }
  result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0, &v12);
  if (result)
    result = (id)objc_msgSend(a1, "unarchiveObject:classes:error:", result, a4, a5);
  if (a5)
LABEL_5:
    *a5 = v12;
  return result;
}

+ (int)validateManifestURLSize:(id)a3
{
  void *v3;
  BOOL v4;
  int v5;
  id v7;

  if (!a3)
  {
    FigDebugAssert3();
    return -16134;
  }
  v7 = 0;
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v7);
  if (v3)
    v4 = v7 == 0;
  else
    v4 = 0;
  if (v4)
  {
    v5 = 0;
LABEL_12:
    if ((unint64_t)objc_msgSend(v3, "fileSize") > 0x100000)
      return -16132;
    return v5;
  }
  if (objc_msgSend(v7, "code") == 260)
    v5 = -16131;
  else
    v5 = -16132;
  if (v3)
    goto LABEL_12;
  return v5;
}

+ (id)manifestDictionaryForURL:(id)a3 err:(int *)a4
{
  uint64_t v4;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v19;
  id v20;

  v20 = 0;
  if (!a3)
  {
    FigDebugAssert3();
    v16 = 0;
    v8 = 0;
    v17 = -16134;
    goto LABEL_10;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), objc_msgSend(a3, "path"), CFSTR("manifest.plist")));
  if (!v8)
    goto LABEL_16;
  v9 = +[BWDeferredContainer validateManifestURLSize:](BWDeferredProcessingContainer, "validateManifestURLSize:", v8);
  if (v9)
  {
    v17 = v9;
    v16 = 0;
    v8 = 0;
    goto LABEL_10;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
  if (!v8)
  {
    FigDebugAssert3();
    goto LABEL_16;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v20);
  if (!v8)
  {
    LODWORD(v19) = 0;
    FigDebugAssert3();
    objc_msgSend(v20, "code", v19, v4);
    v17 = FigSignalErrorAt();
LABEL_19:
    v16 = 0;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v8, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("CaptureRequestIdentifier"), &v20);
  if (!v10)
  {
    v17 = objc_msgSend(v20, "code");
    goto LABEL_19;
  }
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
  if (!v11)
  {
LABEL_16:
    v16 = 0;
    v17 = -16132;
    goto LABEL_10;
  }
  v12 = v11;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_msgSend(v8, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), CFSTR("PhotoDescriptors"), &v20);
  if (v15)
  {
    v16 = (void *)objc_msgSend(a1, "manifestDictionaryForApplicationIdentifier:captureRequestIdentifier:photoDescriptors:", objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v12, "UUIDString"), v15);
    v17 = 0;
  }
  else
  {
    v16 = 0;
    v17 = objc_msgSend(v20, "code");
  }
LABEL_10:

  if (a4)
    *a4 = v17;
  return v16;
}

+ (id)manifestDictionaryForApplicationIdentifier:(id)a3 captureRequestIdentifier:(id)a4 photoDescriptors:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CFDictionaryRef v10;
  uint64_t v11;
  void *v12;
  id obj;
  const __CFAllocator *allocator;
  uint64_t v18;
  id v19;
  CMTime time;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[5];
  _QWORD v28[5];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 && a5)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v6)
    {
      v7 = v6;
      v18 = *(_QWORD *)v22;
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      obj = a5;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (v9)
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "presentationTimeStamp");
          else
            memset(&time, 0, sizeof(time));
          v10 = CMTimeCopyAsDictionary(&time, allocator);
          v11 = objc_msgSend((id)sContainerDateFormatter, "stringFromDate:", objc_msgSend(v9, "time"));
          v27[0] = CFSTR("PhotoIdentifier");
          v28[0] = objc_msgSend(v9, "photoIdentifier");
          v28[1] = v11;
          v27[1] = CFSTR("Time");
          v27[2] = CFSTR("TimeZone");
          v28[2] = objc_msgSend((id)objc_msgSend(v9, "timeZone"), "name");
          v28[3] = v10;
          v27[3] = CFSTR("PTS");
          v27[4] = CFSTR("ProcessingFlags");
          v28[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "processingFlags"));
          objc_msgSend(v19, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5));

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v7);
    }
    v25[0] = CFSTR("ApplicationIdentifier");
    v25[1] = CFSTR("CaptureRequestIdentifier");
    v26[0] = a3;
    v26[1] = a4;
    v25[2] = CFSTR("Photos");
    v26[2] = v19;
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);

  }
  else
  {
    FigDebugAssert3();
    return 0;
  }
  return v12;
}

+ (id)buildArchiveClasses:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  return (id)objc_msgSend((id)objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0), "setByAddingObjectsFromSet:", a3);
}

- (uint64_t)_validate
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(uint64_t *)(result + 240) < 7)
    {
      return 4294951166;
    }
    else if (*(_QWORD *)(result + 232)
           && *(_QWORD *)(result + 248)
           && *(_QWORD *)(result + 256)
           && objc_msgSend(*(id *)(result + 272), "count")
           && objc_msgSend(*(id *)(v1 + 280), "count"))
    {
      return 0;
    }
    else
    {
      FigDebugAssert3();
      return 4294951164;
    }
  }
  return result;
}

- (BOOL)valid:(int *)a3
{
  _opaque_pthread_rwlock_t *p_lock;
  int v6;

  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v6 = -[BWDeferredContainer _validate]((uint64_t)self);
  pthread_rwlock_unlock(p_lock);
  if (a3)
    *a3 = v6;
  return v6 == 0;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

- (int64_t)manifestVersion
{
  return self->_manifestVersion;
}

- (NSDictionary)manifest
{
  _opaque_pthread_rwlock_t *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v4 = +[BWDeferredContainer manifestDictionaryForApplicationIdentifier:captureRequestIdentifier:photoDescriptors:](BWDeferredContainer, "manifestDictionaryForApplicationIdentifier:captureRequestIdentifier:photoDescriptors:", self->_applicationID, self->_captureRequestIdentifier, self->_photoDescriptors);
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (NSArray)intermediates
{
  _opaque_pthread_rwlock_t *p_lock;
  void *v4;

  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_intermediates);
  pthread_rwlock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)prettyDescription
{
  id v2;
  NSString *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v3 = (NSString *)(id)objc_msgSend(v2, "copy");

  return v3;
}

- (id)description
{
  void *v3;
  _opaque_pthread_rwlock_t *p_lock;
  uint64_t v5;
  void *v6;
  NSMutableArray *photoDescriptors;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *intermediates;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p> captureRequestIdentifier:%@ version:%ld\n"), objc_opt_class(), self, self->_captureRequestIdentifier, self->_manifestVersion);
  p_lock = &self->_lock;
  v5 = pthread_rwlock_rdlock(&self->_lock);
  v6 = (void *)MEMORY[0x1A858DD40](v5);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  photoDescriptors = self->_photoDescriptors;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(photoDescriptors);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoDescriptors, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  intermediates = self->_intermediates;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(intermediates);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }
  objc_autoreleasePoolPop(v6);
  pthread_rwlock_unlock(p_lock);
  return (id)objc_msgSend(v3, "copy");
}

- (uint64_t)_writeManifest
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  if (v3)
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 16));
    objc_msgSend(v3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(a1 + 240)), CFSTR("Version"));
    objc_msgSend(v3, "encodeObject:forKey:", *(_QWORD *)(a1 + 232), CFSTR("CaptureRequestIdentifier"));
    objc_msgSend(v3, "encodeObject:forKey:", *(_QWORD *)(a1 + 272), CFSTR("Intermediates"));
    objc_msgSend(v3, "encodeObject:forKey:", *(_QWORD *)(a1 + 280), CFSTR("PhotoDescriptors"));
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 16));
    objc_msgSend(v3, "finishEncoding");
    v4 = (void *)objc_msgSend(v3, "encodedData");
    v5 = (void *)MEMORY[0x1E0C99E98];
    v10[0] = objc_msgSend(*(id *)(a1 + 216), "path");
    v10[1] = CFSTR("manifest.plist");
    if ((objc_msgSend(v4, "writeToURL:options:error:", objc_msgSend(v5, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2)), 1, &v9) & 1) == 0)
    {
      LODWORD(v8) = 0;
      FigDebugAssert3();
      objc_msgSend(v9, "code", v8, v1);
      FigSignalErrorAt();
    }
    v6 = 0;
  }
  else
  {
    FigDebugAssert3();
    v6 = 4294951163;
  }

  return v6;
}

- (uint64_t)_containerManifestURL
{
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E98];
    v2[0] = objc_msgSend(*(id *)(result + 216), "path");
    v2[1] = CFSTR("manifest.plist");
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_containerSessionDataURL
{
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E98];
    v2[0] = objc_msgSend(*(id *)(result + 216), "path");
    v2[1] = CFSTR("session.plist");
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_pipelineParametersURL
{
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E98];
    v2[0] = objc_msgSend(*(id *)(result + 216), "path");
    v2[1] = CFSTR("BWDeferredPipelineParameters.plist");
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_stillImageCaptureSettingsURL
{
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E98];
    v2[0] = objc_msgSend(*(id *)(result + 216), "path");
    v2[1] = CFSTR("BWStillImageCaptureSettings.plist");
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_stillImageSettingsURL
{
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E98];
    v2[0] = objc_msgSend(*(id *)(result + 216), "path");
    v2[1] = CFSTR("FigCaptureStillImageSettings.plist");
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_intermediateFolderURL
{
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)MEMORY[0x1E0C99E98];
    v2[0] = objc_msgSend(*(id *)(result + 216), "path");
    v2[1] = CFSTR("Intermediates");
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_intermediateArrayURLForTag:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    v4 = objc_msgSend(*(id *)(result + 216), "path");
    v5[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a2, CFSTR("plist"), v4, CFSTR("Intermediates"));
    return objc_msgSend(v3, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3));
  }
  return result;
}

- (uint64_t)_intermediateBufferURLForTag:(int)a3 compressionProfile:
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (a3 == 1)
    {
      v4 = CFSTR("heif");
    }
    else
    {
      if (a3 != 2)
        return 0;
      v4 = CFSTR("jpeg");
    }
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a2, v4);
    if (result)
    {
      v5 = result;
      v6 = (void *)MEMORY[0x1E0C99E98];
      v7[0] = objc_msgSend(*(id *)(v3 + 216), "path");
      v7[1] = CFSTR("Intermediates");
      v7[2] = v5;
      return objc_msgSend(v6, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3));
    }
  }
  return result;
}

- (NSArray)photoDescriptors
{
  return &self->_photoDescriptors->super;
}

- (NSArray)bufferAttributes
{
  return self->_bufferAttributes;
}

@end
