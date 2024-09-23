@implementation BWDeferredProcessingContainerManager

BWDeferredProcessingContainerManager *__54__BWDeferredProcessingContainerManager_sharedInstance__block_invoke()
{
  BWDeferredProcessingContainerManager *result;

  result = objc_alloc_init(BWDeferredProcessingContainerManager);
  sharedInstance_sharedInstance_162 = (uint64_t)result;
  return result;
}

- (BWDeferredProcessingContainerManager)init
{
  BWDeferredProcessingContainerManager *v2;
  const void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredProcessingContainerManager;
  v2 = -[BWDeferredContainerManagerBase initWithQueuePriority:](&v5, sel_initWithQueuePriority_, 39);
  if (v2)
  {
    v3 = (const void *)FigCaptureDeferredContainerManagerRemoteCopyContainerManager();
    -[BWDeferredProcessingContainerManager _setXPCContainerManager:]((uint64_t)v2, v3);
    if (v3)
      CFRelease(v3);
  }
  return v2;
}

- (id)createTransientContainerWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8
{
  return -[BWDeferredProcessingContainer initWithApplicationID:resolvedSettings:unresolvedSettings:pipelineParameters:intermediates:photoDescriptors:]([BWDeferredProcessingContainer alloc], "initWithApplicationID:resolvedSettings:unresolvedSettings:pipelineParameters:intermediates:photoDescriptors:", a3, a4, a5, a6, a7, a8);
}

- (void)_setXPCContainerManager:(uint64_t)a1
{
  CFTypeRef v4;

  if (a1)
  {
    v4 = *(CFTypeRef *)(a1 + 216);
    if (v4 != cf)
    {
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(a1 + 216) = 0;
      }
      if (cf)
        *(_QWORD *)(a1 + 216) = CFRetain(cf);
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_once_163 != -1)
    dispatch_once(&sharedInstance_once_163, &__block_literal_global_164);
  return (id)sharedInstance_sharedInstance_162;
}

- (uint64_t)_copyXPCContainerManager
{
  uint64_t v1;
  pthread_rwlock_t *v2;
  const void *v3;
  const void *v4;

  if (result)
  {
    v1 = result;
    v2 = (pthread_rwlock_t *)(result + 8);
    pthread_rwlock_wrlock((pthread_rwlock_t *)(result + 8));
    if (FigCaptureDeferredContainerManagerRemoteIsConnectionValid(*(_QWORD *)(v1 + 216)))
    {
      v3 = *(const void **)(v1 + 216);
      if (v3)
        CFRetain(v3);
    }
    else
    {
      v4 = (const void *)FigCaptureDeferredContainerManagerRemoteCopyContainerManager();
      -[BWDeferredProcessingContainerManager _setXPCContainerManager:](v1, v4);
    }
    pthread_rwlock_unlock(v2);
    return *(_QWORD *)(v1 + 216);
  }
  return result;
}

- (uint64_t)_queryContainerStatus:(uint64_t)a3 captureRequestIdentifier:(_DWORD *)a4 status:
{
  _DWORD *v8;
  uint64_t v9;
  const void *v10;
  uint64_t (*v11)(const void *, uint64_t, uint64_t, int *);
  uint64_t v12;
  int v14;

  if (!a1)
    return 0;
  v14 = 0;
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!FigCaptureCurrentProcessIsDeferredmediad())
  {
    v12 = -[BWDeferredCaptureContainerManager queryContainerStatusForApplicationID:captureRequestIdentifier:status:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "queryContainerStatusForApplicationID:captureRequestIdentifier:status:", a2, a3, &v14);
    if (!a4)
      goto LABEL_13;
LABEL_12:
    *a4 = v14;
    goto LABEL_13;
  }
  v9 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager](a1);
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = *(uint64_t (**)(const void *, uint64_t, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 16);
    if (v11)
      v12 = v11(v10, a2, a3, &v14);
    else
      v12 = 4294954514;
    CFRelease(v10);
    if (!a4)
      goto LABEL_13;
    goto LABEL_12;
  }
  FigDebugAssert3();
  v12 = 4294951159;
  if (a4)
    goto LABEL_12;
LABEL_13:
  if (*v8 == 1)
    kdebug_trace();
  return v12;
}

- (BWDeferredProcessingContainer)_copyRemoteContainer:(uint64_t)a3 captureRequestIdentifier:(uint64_t)a4 baseFolderURL:(int *)a5 err:
{
  _DWORD *v10;
  uint64_t v11;
  const void *v12;
  uint64_t (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  void *v15;
  BWDeferredProcessingContainer *v16;
  int v18;

  if (!a1)
    return 0;
  v18 = 0;
  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v11 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager](a1);
  if (v11)
  {
    v12 = (const void *)v11;
    v13 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v13 && (v14 = v13(v12, a2, a3)) != 0)
    {
      v15 = (void *)v14;
      v16 = -[BWDeferredProcessingContainer initWithXPCEncoding:applicationID:captureRequestIdentifier:baseFolderURL:err:]([BWDeferredProcessingContainer alloc], "initWithXPCEncoding:applicationID:captureRequestIdentifier:baseFolderURL:err:", v14, a2, a3, a4, &v18);
      if (!v16)
      {
        FigDebugAssert3();
        v18 = -16133;
      }
      CFRelease(v12);
      xpc_release(v15);
      if (!a5)
        goto LABEL_13;
    }
    else
    {
      FigDebugAssert3();
      v18 = -16132;
      CFRelease(v12);
      v16 = 0;
      if (!a5)
        goto LABEL_13;
    }
    goto LABEL_12;
  }
  FigDebugAssert3();
  v16 = 0;
  v18 = -16137;
  if (a5)
LABEL_12:
    *a5 = v18;
LABEL_13:
  if (*v10 == 1)
    kdebug_trace();
  return v16;
}

- (uint64_t)_releaseRemoteContainer:(uint64_t)a3 captureRequestIdentifier:
{
  _DWORD *v6;
  uint64_t v7;
  const void *v8;
  uint64_t (*v9)(const void *, uint64_t, uint64_t);
  uint64_t v10;

  if (!a1)
    return 0;
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v7 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager](a1);
  if (v7)
  {
    v8 = (const void *)v7;
    v9 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v9)
      v10 = v9(v8, a2, a3);
    else
      v10 = 4294954514;
    CFRelease(v8);
  }
  else
  {
    FigDebugAssert3();
    v10 = 4294951159;
  }
  if (*v6 == 1)
    kdebug_trace();
  return v10;
}

- (id)manifestsForApplicationID:(id)a3 err:(int *)a4
{
  _DWORD *v7;
  uint64_t v8;
  const void *v9;
  uint64_t (*v10)(const void *, id);
  void *v11;
  int v12;

  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (a3)
  {
    v8 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager]((uint64_t)self);
    if (v8)
    {
      v9 = (const void *)v8;
      v10 = *(uint64_t (**)(const void *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (v10 && (v11 = (void *)v10(v9, a3)) != 0)
      {
        a3 = v11;
        v12 = 0;
      }
      else
      {
        FigDebugAssert3();
        a3 = 0;
        v12 = -16134;
      }
      CFRelease(v9);
    }
    else
    {
      FigDebugAssert3();
      a3 = 0;
      v12 = -16137;
    }
  }
  else
  {
    FigDebugAssert3();
    v12 = -16134;
  }
  if (a4)
    *a4 = v12;
  if (*v7 == 1)
    kdebug_trace();
  return a3;
}

- (id)createProcessingContainerWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 openForPeeking:(BOOL)a5 err:(int *)a6
{
  _BOOL8 v7;
  _DWORD *v11;
  int v12;
  BWDeferredProcessingContainer *v13;
  int v14;
  void *v16;
  BWDeferredProcessingContainer *v17;
  __int16 v18;
  id v19;
  int v20;
  int v21;

  v7 = a5;
  v20 = 0;
  v19 = 0;
  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!a3 || !a4)
  {
    FigDebugAssert3();
    v13 = 0;
    v14 = -16134;
    goto LABEL_7;
  }
  v12 = -[BWDeferredProcessingContainerManager _queryContainerStatus:captureRequestIdentifier:status:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, &v20);
  v21 = v12;
  if ((v12 + 16157) < 5 || v12 == -16159)
  {
    v13 = 0;
    v14 = -16138;
LABEL_7:
    v21 = v14;
    goto LABEL_8;
  }
  if (v12)
  {
    if (v12 == -16138)
    {
      v13 = 0;
      goto LABEL_8;
    }
    FigDebugAssert3();
  }
  v18 = 0;
  v16 = -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 1, (char *)&v18 + 1, &v18, &v19);
  if (v20 != 1
    || (v13 = -[BWDeferredProcessingContainerManager _copyRemoteContainer:captureRequestIdentifier:baseFolderURL:err:]((uint64_t)self, (uint64_t)v19, (uint64_t)a4, (uint64_t)v16, &v21)) == 0)
  {
    if (HIBYTE(v18) && (_BYTE)v18)
    {
      v17 = [BWDeferredProcessingContainer alloc];
      v13 = -[BWDeferredProcessingContainer initWithApplicationID:captureRequestIdentifier:baseFolderURL:openForPeeking:err:](v17, "initWithApplicationID:captureRequestIdentifier:baseFolderURL:openForPeeking:err:", v19, a4, v16, v7, &v21);
    }
    else
    {
      v13 = 0;
      v21 = FigSignalErrorAt();
    }
  }
LABEL_8:

  if (a6)
    *a6 = v21;
  if (*v11 == 1)
    kdebug_trace();
  return v13;
}

- (void)releaseProcessingContainer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;

  if (a3)
  {
    v5 = objc_msgSend(a3, "applicationID");
    v6 = objc_msgSend(a3, "captureRequestIdentifier");
    v7 = objc_msgSend(a3, "isRemote");

    if (v7)
      -[BWDeferredProcessingContainerManager _releaseRemoteContainer:captureRequestIdentifier:]((uint64_t)self, v5, v6);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  _DWORD *v7;
  uint64_t v8;
  const void *v9;
  uint64_t (*v10)(const void *, id, id);
  int v11;

  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v8 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager]((uint64_t)self);
  if (v8)
  {
    v9 = (const void *)v8;
    v10 = *(uint64_t (**)(const void *, id, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v10)
      v11 = v10(v9, a3, a4);
    else
      v11 = -12782;
    CFRelease(v9);
  }
  else
  {
    FigDebugAssert3();
    v11 = -16137;
  }
  if (*v7 == 1)
    kdebug_trace();
  return v11;
}

- (int)waitForShaderCompilation
{
  _DWORD *v3;
  uint64_t v4;
  const void *v5;
  uint64_t (*v6)(const void *);
  int v7;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v4 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager]((uint64_t)self);
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v6)
      v7 = v6(v5);
    else
      v7 = -12782;
    CFRelease(v5);
  }
  else
  {
    FigDebugAssert3();
    v7 = -16137;
  }
  if (*v3 == 1)
    kdebug_trace();
  return v7;
}

@end
