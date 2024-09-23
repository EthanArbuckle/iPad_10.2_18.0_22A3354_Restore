@implementation BWDeferredCaptureContainer

+ (id)captureRequestIdentifierForManifest:(id)a3
{
  if (a3)
    return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CaptureRequestIdentifier"));
  FigDebugAssert3();
  return 0;
}

+ (id)timeForManifest:(id)a3 index:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (a3
    && (v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Photos"))) != 0
    && (v6 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", a4)) != 0)
  {
    v7 = v6;
    if (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Time")))
      return (id)objc_msgSend((id)sContainerDateFormatter, "dateFromString:", objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Time")));
  }
  else
  {
    FigDebugAssert3();
  }
  return 0;
}

- (BWDeferredCaptureContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 flushBuffersUponCommit:(BOOL)a6 err:(int *)a7
{
  _DWORD *v13;
  BWDeferredCaptureContainer *v14;
  objc_super v16;
  int v17;

  v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 0);
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 1);
    kdebug_trace();
  }
  v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)BWDeferredCaptureContainer;
  v14 = -[BWDeferredContainer initWithApplicationID:captureRequestIdentifier:baseFolderURL:queuePriority:err:](&v16, sel_initWithApplicationID_captureRequestIdentifier_baseFolderURL_queuePriority_err_, a3, a4, a5, 14, &v17);
  if (v14)
  {
    -[BWDeferredTransactionBroker openTransaction:name:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance"), "openTransaction:name:", 3, a4);
    v14->_flushQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v14->_flushGroup = (OS_dispatch_group *)dispatch_group_create();
    v14->_flushBuffersUponCommit = a6;
    v14->_committed = 0;
    v14->_preflushed = 0;
    v14->_cacheExpiryTime = -1;
    v14->super._intermediates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14->super._photoDescriptors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14->super._pipelineParameters = objc_alloc_init(BWDeferredPipelineParameters);
  }
  if (a7)
    *a7 = v17;
  if (*v13 == 1)
    kdebug_trace();
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_flushQueue);
  dispatch_release((dispatch_object_t)self->_flushGroup);
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredCaptureContainer;
  -[BWDeferredContainer dealloc](&v3, sel_dealloc);
}

- (uint64_t)_addIntermediateObjectToXPCDictionary:(void *)a3 xpcDictionary:
{
  xpc_object_t v5;
  void *v6;
  unsigned int v7;

  if (result)
  {
    v7 = 0;
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5
      && (xpc_dictionary_set_value(a3, (const char *)objc_msgSend((id)objc_msgSend(a2, "tag"), "UTF8String"), v5),
          (v6 = (void *)objc_msgSend(a2, "archive:", &v7)) != 0))
    {
      xpc_dictionary_set_value(v5, "Object", v6);
    }
    else
    {
      FigDebugAssert3();
      v7 = -16133;
    }
    xpc_release(v5);
    return v7;
  }
  return result;
}

- (id)copyXPCEncoding:(int *)a3
{
  _opaque_pthread_rwlock_t *p_lock;
  xpc_object_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  NSMutableArray *intermediates;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  int v19;
  int v20;
  int *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6 || (v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1)) == 0)
  {
    FigDebugAssert3();
    v9 = 0;
LABEL_22:
    pthread_rwlock_unlock(p_lock);

    v20 = -16133;
LABEL_16:
    xpc_release(v6);
    v6 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  objc_msgSend(v7, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->super._manifestVersion), CFSTR("Version"));
  objc_msgSend(v8, "encodeObject:forKey:", self->super._applicationID, CFSTR("ApplicationID"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_commitTime, CFSTR("CommitTime"));
  objc_msgSend(v8, "encodeObject:forKey:", self->super._baseFolderURL, CFSTR("BaseFolder"));
  objc_msgSend(v8, "encodeObject:forKey:", self->super._captureRequestIdentifier, CFSTR("CaptureRequestIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->super._stillImageCaptureSettings, CFSTR("StillImageCaptureSettings"));
  objc_msgSend(v8, "encodeObject:forKey:", self->super._stillImageSettings, CFSTR("StillImageSettings"));
  objc_msgSend(v8, "encodeObject:forKey:", self->super._intermediates, CFSTR("Intermediates"));
  objc_msgSend(v8, "encodeObject:forKey:", self->super._photoDescriptors, CFSTR("PhotoDescriptors"));
  objc_msgSend(v8, "finishEncoding");
  v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "encodedData"), "copy");

  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!v10
    || (v11 = v10,
        xpc_dictionary_set_value(v6, "Container", v10),
        xpc_release(v11),
        (v12 = xpc_dictionary_create(0, 0, 0)) == 0))
  {
    FigDebugAssert3();
    goto LABEL_22;
  }
  v13 = v12;
  v22 = a3;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  intermediates = self->super._intermediates;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(intermediates);
        v19 = -[BWDeferredCaptureContainer _addIntermediateObjectToXPCDictionary:xpcDictionary:]((uint64_t)self, *(void **)(*((_QWORD *)&v23 + 1) + 8 * i), v13);
        if (v19)
        {
          v20 = v19;
          FigDebugAssert3();
          goto LABEL_15;
        }
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
        continue;
      break;
    }
  }
  xpc_dictionary_set_value(v6, "IntermediateObjects", v13);
  v20 = 0;
LABEL_15:
  pthread_rwlock_unlock(p_lock);
  xpc_release(v13);

  a3 = v22;
  if (v20)
    goto LABEL_16;
LABEL_17:
  if (a3)
    *a3 = v20;
  return v6;
}

- (uint64_t)_createFolders
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (*(_BYTE *)(result + 313))
      return 0;
    v7 = 0;
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if ((objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(*(id *)(v2 + 216), "path"), 1, 0, &v7) & 1) != 0)
    {
      v4 = (void *)MEMORY[0x1E0C99E98];
      v8[0] = objc_msgSend(*(id *)(v2 + 216), "path");
      v8[1] = CFSTR("Intermediates");
      if ((objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend((id)objc_msgSend(v4, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2)), "path"), 1, 0, &v7) & 1) != 0)
      {
        result = 0;
        *(_BYTE *)(v2 + 313) = 1;
        return result;
      }
      v6 = v1;
      LODWORD(v5) = 0;
    }
    else
    {
      v6 = v1;
      LODWORD(v5) = 0;
    }
    FigDebugAssert3();
    objc_msgSend(v7, "code", v5, v6);
    return FigSignalErrorAt();
  }
  return result;
}

- (int)commitCaptureSettings:(id)a3 settings:(id)a4
{
  _DWORD *v7;
  int v8;

  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3 && a4)
  {
    if (self->_committed)
    {
      FigDebugAssert3();
      v8 = -16135;
    }
    else
    {
      self->super._stillImageCaptureSettings = (BWStillImageCaptureSettings *)a3;
      self->super._stillImageSettings = (FigCaptureStillImageSettings *)objc_msgSend(a4, "copy");
      pthread_rwlock_unlock(&self->super._lock);
      v8 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v8 = -16134;
  }
  if (*v7 == 1)
    kdebug_trace();
  return v8;
}

- (int)commitPhotoDescriptor:(id)a3
{
  uint64_t v5;
  _DWORD *v6;
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *photoDescriptors;
  uint64_t v9;
  BWPhotoDescriptor *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BWPhotoDescriptor *v14;
  int v15;
  _BYTE v17[24];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t v20;

  v5 = objc_msgSend(a3, "photoIdentifier");
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  if (!v5)
    goto LABEL_14;
  if (!a3)
  {
    v18[5] = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_14;
  }
  objc_msgSend(a3, "presentationTimeStamp");
  if ((v19 & 0x100000000) == 0)
  {
LABEL_14:
    FigDebugAssert3();
    v15 = -16134;
    goto LABEL_9;
  }
  if (self->_committed)
  {
    FigDebugAssert3();
  }
  else
  {
    photoDescriptors = self->super._photoDescriptors;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__BWDeferredCaptureContainer_commitPhotoDescriptor___block_invoke;
    v18[3] = &unk_1E4923A58;
    v18[4] = a3;
    if (-[NSMutableArray indexOfObjectPassingTest:](photoDescriptors, "indexOfObjectPassingTest:", v18) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = objc_msgSend(a3, "processingFlags") & 0xFFFFCFFF | 0x2000;
      v10 = [BWPhotoDescriptor alloc];
      v11 = objc_msgSend(a3, "photoIdentifier");
      v12 = objc_msgSend(a3, "time");
      v13 = objc_msgSend(a3, "timeZone");
      objc_msgSend(a3, "presentationTimeStamp");
      v14 = -[BWPhotoDescriptor initWithPhotoIdentifier:processingFlags:time:timeZone:presentationTimeStamp:](v10, "initWithPhotoIdentifier:processingFlags:time:timeZone:presentationTimeStamp:", v11, v9, v12, v13, v17);
      -[NSMutableArray addObject:](self->super._photoDescriptors, "addObject:", v14);

      v15 = 0;
      goto LABEL_9;
    }
  }
  v15 = -16135;
LABEL_9:
  pthread_rwlock_unlock(p_lock);
  if (*v6 == 1)
    kdebug_trace();
  return v15;
}

uint64_t __52__BWDeferredCaptureContainer_commitPhotoDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "photoIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "photoIdentifier"));
}

- (int)commitArray:(id)a3 tag:(id)a4
{
  _DWORD *v7;
  void *v8;
  int v9;
  BWDeferredArrayIntermediate *v10;

  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  v8 = 0;
  v9 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      v8 = 0;
    }
    else
    {
      v8 = (void *)objc_msgSend(a3, "copy");
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        v10 = -[BWDeferredArrayIntermediate initWithArray:tag:URL:]([BWDeferredArrayIntermediate alloc], "initWithArray:tag:URL:", v8, a4, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        -[BWDeferredIntermediate setSettingsID:](v10, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](self->super._stillImageSettings, "settingsID"));
        -[NSMutableArray addObject:](self->super._intermediates, "addObject:", v10);

        v9 = 0;
        goto LABEL_8;
      }
    }
    v9 = -16135;
  }
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v7 == 1)
    kdebug_trace();
  return v9;
}

- (int)commitInference:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6
{
  _DWORD *v11;
  void *v12;
  int v13;
  id v14;
  BWDeferredInferenceArrayIntermediate *v15;
  BWDeferredInferenceArrayIntermediate *v16;
  void *v18;

  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  v12 = 0;
  v13 = -16134;
  if (a3 && a4 && a5)
  {
    if (self->_committed)
    {
      v12 = 0;
    }
    else
    {
      if (objc_msgSend(a3, "conformsToProtocol:", &unk_1EE6C3050))
        v14 = (id)objc_msgSend(a3, "copy");
      else
        v14 = a3;
      v12 = v14;
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = -[BWDeferredInferenceArrayIntermediate initWithArray:tag:inferenceAttachmentKey:portType:URL:]([BWDeferredInferenceArrayIntermediate alloc], "initWithArray:tag:inferenceAttachmentKey:portType:URL:", v12, a4, a5, a6, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Committing a deferred inference for key '%@' of type %@ must be implemented."), a5, objc_opt_class()), 0);
            objc_exception_throw(v18);
          }
          v15 = -[BWDeferredInferenceDictionaryIntermediate initWithDictionary:tag:inferenceAttachmentKey:portType:URL:]([BWDeferredInferenceDictionaryIntermediate alloc], "initWithDictionary:tag:inferenceAttachmentKey:portType:URL:", v12, a4, a5, a6, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        }
        v16 = v15;
        if (v15)
        {
          -[BWDeferredIntermediate setSettingsID:](v15, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](self->super._stillImageSettings, "settingsID"));
          -[NSMutableArray addObject:](self->super._intermediates, "addObject:", v16);

        }
        v13 = 0;
        goto LABEL_18;
      }
    }
    v13 = -16135;
  }
LABEL_18:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v11 == 1)
    kdebug_trace();
  return v13;
}

- (int)commitBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 compressionProfile:(int)a7 metadataTag:(id)a8 rawThumbnailsBufferTag:(id)a9 rawThumbnailsMetadataTag:(id)a10 mainRawThumbnailBufferTag:(id)a11 mainRawThumbnailMetadataTag:(id)a12 sifrRawThumbnailBufferTag:(id)a13 sifrRawThumbnailMetadataTag:(id)a14 portType:(id)a15
{
  _DWORD *v21;
  _opaque_pthread_rwlock_t *p_lock;
  int v23;
  BWDeferredBufferIntermediate *v24;
  NSObject *flushGroup;
  NSObject *flushQueue;
  uint64_t v28;
  _QWORD block[6];

  v21 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  v23 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      v23 = -16135;
    }
    else
    {
      LODWORD(v28) = a7;
      v24 = -[BWDeferredBufferIntermediate initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:compressionProfile:URL:]([BWDeferredBufferIntermediate alloc], "initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:compressionProfile:URL:", a3, a4, a5, a6, a8, a9, a10, a11, a12, a13, a14, a15, v28, -[BWDeferredContainer _intermediateBufferURLForTag:compressionProfile:]((uint64_t)self, (uint64_t)a4, a7));
      -[BWDeferredIntermediate setSettingsID:](v24, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](self->super._stillImageSettings, "settingsID"));
      -[NSMutableArray addObject:](self->super._intermediates, "addObject:", v24);

      if (self->_flushBuffersUponCommit)
      {
        v23 = -[BWDeferredCaptureContainer _createFolders]((uint64_t)self);
        v21 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        p_lock = &self->super._lock;
        if (v23)
        {
          FigDebugAssert3();
        }
        else
        {
          flushGroup = self->_flushGroup;
          flushQueue = self->_flushQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __272__BWDeferredCaptureContainer_commitBuffer_tag_bufferType_captureFrameFlags_compressionProfile_metadataTag_rawThumbnailsBufferTag_rawThumbnailsMetadataTag_mainRawThumbnailBufferTag_mainRawThumbnailMetadataTag_sifrRawThumbnailBufferTag_sifrRawThumbnailMetadataTag_portType___block_invoke;
          block[3] = &unk_1E491E720;
          block[4] = v24;
          dispatch_group_async(flushGroup, flushQueue, block);
        }
      }
      else
      {
        v23 = 0;
        v21 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        p_lock = &self->super._lock;
      }
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (*v21 == 1)
    kdebug_trace();
  return v23;
}

uint64_t __272__BWDeferredCaptureContainer_commitBuffer_tag_bufferType_captureFrameFlags_compressionProfile_metadataTag_rawThumbnailsBufferTag_rawThumbnailsMetadataTag_mainRawThumbnailBufferTag_mainRawThumbnailMetadataTag_sifrRawThumbnailBufferTag_sifrRawThumbnailMetadataTag_portType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flush");
}

- (int)commitBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 compressionProfile:(int)a7 metadataTag:(id)a8 portType:(id)a9
{
  return -[BWDeferredCaptureContainer commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:](self, "commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:", a3, a4, a5, a6, *(_QWORD *)&a7, a8, 0, 0, 0, 0, 0, 0, a9);
}

- (int)commitMetadata:(id)a3 tag:(id)a4 bufferTag:(id)a5
{
  _DWORD *v9;
  void *v10;
  int v11;
  BWDeferredMetadataIntermediate *v12;

  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  v10 = 0;
  v11 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      v10 = 0;
    }
    else
    {
      v10 = (void *)objc_msgSend(a3, "copy");
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        v12 = -[BWDeferredMetadataIntermediate initWithMetadata:tag:bufferTag:URL:]([BWDeferredMetadataIntermediate alloc], "initWithMetadata:tag:bufferTag:URL:", v10, a4, a5, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        -[BWDeferredIntermediate setSettingsID:](v12, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](self->super._stillImageSettings, "settingsID"));
        -[NSMutableArray addObject:](self->super._intermediates, "addObject:", v12);

        v11 = 0;
        goto LABEL_8;
      }
    }
    v11 = -16135;
  }
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v9 == 1)
    kdebug_trace();
  return v11;
}

- (int)commitInferenceBuffer:(__CVBuffer *)a3 tag:(id)a4 metadataTag:(id)a5 inferenceAttachedMediaKey:(id)a6 compressionProfile:(int)a7 portType:(id)a8
{
  uint64_t v9;
  _DWORD *v15;
  int v16;
  BWDeferredInferenceBufferIntermediate *v17;
  NSObject *flushGroup;
  NSObject *flushQueue;
  _QWORD block[5];

  v9 = *(_QWORD *)&a7;
  v15 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  v16 = -16134;
  if (a3 && a4 && a6)
  {
    if (self->_committed)
    {
      v16 = -16135;
    }
    else
    {
      v17 = -[BWDeferredInferenceBufferIntermediate initWithBuffer:tag:metadataTag:inferenceAttachedMediaKey:portType:compressionProfile:URL:]([BWDeferredInferenceBufferIntermediate alloc], "initWithBuffer:tag:metadataTag:inferenceAttachedMediaKey:portType:compressionProfile:URL:", a3, a4, a5, a6, a8, v9, -[BWDeferredContainer _intermediateBufferURLForTag:compressionProfile:]((uint64_t)self, (uint64_t)a4, v9));
      -[BWDeferredIntermediate setSettingsID:](v17, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](self->super._stillImageSettings, "settingsID"));
      -[NSMutableArray addObject:](self->super._intermediates, "addObject:", v17);

      if (self->_flushBuffersUponCommit)
      {
        v16 = -[BWDeferredCaptureContainer _createFolders]((uint64_t)self);
        if (v16)
        {
          FigDebugAssert3();
        }
        else
        {
          flushGroup = self->_flushGroup;
          flushQueue = self->_flushQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __122__BWDeferredCaptureContainer_commitInferenceBuffer_tag_metadataTag_inferenceAttachedMediaKey_compressionProfile_portType___block_invoke;
          block[3] = &unk_1E491E720;
          block[4] = v17;
          dispatch_group_async(flushGroup, flushQueue, block);
        }
      }
      else
      {
        v16 = 0;
      }
    }
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v15 == 1)
    kdebug_trace();
  return v16;
}

uint64_t __122__BWDeferredCaptureContainer_commitInferenceBuffer_tag_metadataTag_inferenceAttachedMediaKey_compressionProfile_portType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flush");
}

- (int)commitDictionary:(id)a3 tag:(id)a4
{
  _DWORD *v7;
  void *v8;
  int v9;
  BWDeferredDictionaryIntermediate *v10;

  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  v8 = 0;
  v9 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      v8 = 0;
    }
    else
    {
      v8 = (void *)objc_msgSend(a3, "copy");
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        v10 = -[BWDeferredDictionaryIntermediate initWithDictionary:tag:URL:]([BWDeferredDictionaryIntermediate alloc], "initWithDictionary:tag:URL:", v8, a4, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        -[BWDeferredIntermediate setSettingsID:](v10, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](self->super._stillImageSettings, "settingsID"));
        -[NSMutableArray addObject:](self->super._intermediates, "addObject:", v10);

        v9 = 0;
        goto LABEL_8;
      }
    }
    v9 = -16135;
  }
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v7 == 1)
    kdebug_trace();
  return v9;
}

- (int)commit
{
  _DWORD *v3;
  int v4;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  if (self->_committed)
  {
    FigDebugAssert3();
    v4 = -16135;
  }
  else
  {
    self->_committed = 1;
    self->_cacheExpiryTime = dispatch_time(0, 0);
    self->_commitTime = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = 0;
    self->_commitDurationNS = FigGetUpTimeNanoseconds() - self->super._creationTimeNS;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v3 == 1)
    kdebug_trace();
  return v4;
}

- (int)abort
{
  _DWORD *v3;
  _opaque_pthread_rwlock_t *p_lock;
  NSObject *flushGroup;
  dispatch_time_t v6;
  int v7;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  if (self->_committed)
  {
    FigDebugAssert3();
    v7 = -16135;
  }
  else
  {
    self->_committed = 1;
    flushGroup = self->_flushGroup;
    v6 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(flushGroup, v6))
    {
      FigDebugAssert3();
      v7 = -16138;
    }
    else
    {
      v7 = 0;
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (*v3 == 1)
    kdebug_trace();
  return v7;
}

- (int)preflush
{
  int v3;

  if (self->_committed)
  {
    if (self->_preflushed)
    {
      FigDebugAssert3();
      v3 = -16135;
    }
    else
    {
      pthread_rwlock_wrlock(&self->super._lock);
      self->_preflushed = 1;
      dispatch_group_enter((dispatch_group_t)self->_flushGroup);
      v3 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v3 = -16131;
  }
  pthread_rwlock_unlock(&self->super._lock);
  return v3;
}

- (int)flush
{
  uint64_t v2;
  _DWORD *v4;
  uint64_t UpTimeNanoseconds;
  _DWORD *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v8;
  int v9;
  _DWORD *v10;
  NSMutableArray *intermediates;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  NSObject *flushGroup;
  dispatch_time_t v18;
  int v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  int64_t v23;
  NSString *v24;
  NSString *captureRequestIdentifier;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  os_log_type_t type;
  unsigned int v35;
  id v36;
  _BYTE v37[128];
  int v38;
  const char *v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  NSString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_rdlock(&self->super._lock);
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  v6 = &unk_1ECFE9000;
  if (!self->_committed || !self->_preflushed)
  {
    v19 = -16131;
LABEL_26:
    pthread_rwlock_unlock(&self->super._lock);
LABEL_27:
    -[BWDeferredCaptureContainerManager deleteContainerForApplicationID:captureRequestIdentifier:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance", v27, v28), "deleteContainerForApplicationID:captureRequestIdentifier:", -[BWStillImageCaptureSettings applicationID](self->super._stillImageCaptureSettings, "applicationID"), self->super._captureRequestIdentifier);
    goto LABEL_28;
  }
  v29 = UpTimeNanoseconds;
  if (dword_1ECFE99F0)
  {
    v35 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = -[BWDeferredCaptureContainer _createFolders]((uint64_t)self);
  if (v8)
  {
    v19 = v8;
    v28 = v2;
    LODWORD(v27) = v8;
LABEL_42:
    FigDebugAssert3();
    goto LABEL_26;
  }
  v9 = -[BWDeferredContainer _writeManifest]((uint64_t)self);
  if (v9)
  {
    v19 = v9;
    v28 = v2;
    LODWORD(v27) = v9;
    goto LABEL_42;
  }
  if (+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _pipelineParametersURL]((uint64_t)self), self->super._pipelineParameters, &v36))
  {
    if (+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _stillImageCaptureSettingsURL]((uint64_t)self), self->super._stillImageCaptureSettings, &v36)&& +[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _stillImageSettingsURL]((uint64_t)self), self->super._stillImageSettings, &v36))
    {
      v10 = v4;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      intermediates = self->super._intermediates;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(intermediates);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "flush", v27, v28);
            if (v16)
            {
              v19 = v16;
              v28 = v2;
              LODWORD(v27) = v16;
              FigDebugAssert3();
              v4 = v10;
              v6 = &unk_1ECFE9000;
              goto LABEL_26;
            }
          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
          if (v13)
            continue;
          break;
        }
      }
      dispatch_group_leave((dispatch_group_t)self->_flushGroup);
      flushGroup = self->_flushGroup;
      v18 = dispatch_time(0, 10000000000);
      if (dispatch_group_wait(flushGroup, v18))
      {
        v28 = v2;
        LODWORD(v27) = 0;
        FigDebugAssert3();
        v19 = -16138;
      }
      else
      {
        v19 = 0;
      }
      v4 = v10;
      self->_flushDurationNS = FigGetUpTimeNanoseconds() - v29;
      v6 = (_DWORD *)&unk_1ECFE9000;
    }
    else
    {
      v19 = objc_msgSend(v36, "code", v27, v28);
    }
  }
  else
  {
    v19 = objc_msgSend(v36, "code");
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (v19)
    goto LABEL_27;
LABEL_28:
  if (v6[636])
  {
    v35 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v21 = v35;
    if (os_log_type_enabled(v20, type))
      v22 = v21;
    else
      v22 = v21 & 0xFFFFFFFE;
    if (v22)
    {
      v23 = -[BWStillImageCaptureSettings settingsID](self->super._stillImageCaptureSettings, "settingsID");
      v24 = -[BWStillImageCaptureSettings applicationID](self->super._stillImageCaptureSettings, "applicationID");
      captureRequestIdentifier = self->super._captureRequestIdentifier;
      v38 = 136315907;
      v39 = "-[BWDeferredCaptureContainer flush]";
      v40 = 2048;
      v41 = v23;
      v42 = 2113;
      v43 = v24;
      v44 = 2113;
      v45 = captureRequestIdentifier;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*v4 == 1)
    kdebug_trace();
  return v19;
}

- (int)waitForFlush
{
  return -[BWDeferredCaptureContainer waitForFlushWithTimeoutInSeconds:](self, "waitForFlushWithTimeoutInSeconds:", 10);
}

- (int)waitForFlushWithTimeoutInSeconds:(int)a3
{
  _DWORD *v5;
  NSObject *flushGroup;
  dispatch_time_t v7;
  int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  flushGroup = self->_flushGroup;
  v7 = dispatch_time(0, 1000000000 * a3);
  if (dispatch_group_wait(flushGroup, v7))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v8 = -16138;
  }
  else
  {
    v8 = 0;
  }
  if (*v5 == 1)
    kdebug_trace();
  return v8;
}

- (BOOL)cached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (unint64_t)cacheExpiryTime
{
  return self->_cacheExpiryTime;
}

- (void)setCacheExpiryTime:(unint64_t)a3
{
  self->_cacheExpiryTime = a3;
}

- (int64_t)commitDurationNS
{
  return self->_commitDurationNS;
}

- (int64_t)flushDurationNS
{
  return self->_flushDurationNS;
}

- (BOOL)committed
{
  return self->_committed;
}

@end
