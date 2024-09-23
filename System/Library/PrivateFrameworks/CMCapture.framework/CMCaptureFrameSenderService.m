@implementation CMCaptureFrameSenderService

- (int)sendFrame:(opaqueCMSampleBuffer *)a3
{
  NSObject *clientQueue;
  _QWORD block[4];
  id v8[2];
  id location;

  if (a3)
  {
    objc_initWeak(&location, self);
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__CMCaptureFrameSenderService_sendFrame___block_invoke;
    block[3] = &unk_1E491E8C0;
    objc_copyWeak(v8, &location);
    v8[1] = a3;
    dispatch_async_and_wait(clientQueue, block);
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
  return 0;
}

void __41__CMCaptureFrameSenderService_sendFrame___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  opaqueCMSampleBuffer *v8;
  xpc_object_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  int SerializedAtomDataBlockBufferForSampleBuffer;
  int IsRangeContiguous;
  OpaqueCMBlockBuffer *v18;
  OSStatus v19;
  OSStatus DataPointer;
  xpc_object_t v21;
  __CVBuffer *ImageBuffer;
  __IOSurface *IOSurface;
  xpc_object_t XPCObject;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  const __CFAllocator *blockAllocator;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CMBlockBufferRef blockBufferOut;
  size_t totalLengthOut;
  char *dataPointerOut;
  CMBlockBufferRef theBuffer;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    return;
  v3 = WeakRetained;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = (void *)WeakRetained[10];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_49;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v42;
  blockAllocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v35 = v4;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(v4);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
      if (objc_msgSend(v13, "connectionIsValid", v32, v33))
      {
        if ((v10 & 1) != 0)
          goto LABEL_31;
        v14 = *((_QWORD *)v3 + 16);
        v15 = dispatch_time(0, (uint64_t)(*((double *)v3 + 17) * 1000000000.0));
        dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
        v8 = (opaqueCMSampleBuffer *)objc_msgSend(v3, "_newSampleBufferToSendFromSampleBuffer:", *(_QWORD *)(a1 + 40));
        if (!v8)
          goto LABEL_30;
        dataPointerOut = 0;
        theBuffer = 0;
        totalLengthOut = 0;
        v9 = xpc_dictionary_create(0, 0, 0);
        SerializedAtomDataBlockBufferForSampleBuffer = FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer();
        if (SerializedAtomDataBlockBufferForSampleBuffer)
        {
          v33 = v1;
          LODWORD(v32) = SerializedAtomDataBlockBufferForSampleBuffer;
        }
        else
        {
          IsRangeContiguous = CMBlockBufferIsRangeContiguous(theBuffer, 0, 0);
          v18 = theBuffer;
          if (IsRangeContiguous)
            goto LABEL_16;
          blockBufferOut = 0;
          v19 = CMBlockBufferCreateContiguous(blockAllocator, theBuffer, blockAllocator, 0, 0, 0, 0, &blockBufferOut);
          if (v19)
          {
            v33 = v1;
            LODWORD(v32) = v19;
          }
          else
          {
            if (theBuffer)
              CFRelease(theBuffer);
            v18 = blockBufferOut;
            theBuffer = blockBufferOut;
LABEL_16:
            DataPointer = CMBlockBufferGetDataPointer(v18, 0, 0, &totalLengthOut, &dataPointerOut);
            if (!DataPointer)
            {
              v21 = xpc_data_create(dataPointerOut, totalLengthOut);
              xpc_dictionary_set_value(v9, "sample-buffer-basic-fields", v21);
              ImageBuffer = CMSampleBufferGetImageBuffer(v8);
              if (ImageBuffer)
              {
                IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
                if (IOSurface)
                {
                  XPCObject = IOSurfaceCreateXPCObject(IOSurface);
                  xpc_dictionary_set_value(v9, "sample-buffer-iosurface", XPCObject);
                  xpc_release(XPCObject);
                }
              }
              v25 = 0;
LABEL_21:
              if (theBuffer)
                CFRelease(theBuffer);
              if (v21)
                xpc_release(v21);
              if (v9)
                v26 = v25;
              else
                v26 = 0;
              if (v26 == 1)
              {
                xpc_release(v9);
                v9 = 0;
              }
LABEL_30:
              v4 = v35;
LABEL_31:
              if (v9)
                objc_msgSend(v13, "sendXCPSampleBuffer:", v9);
              v10 = 1;
              goto LABEL_37;
            }
            v33 = v1;
            LODWORD(v32) = DataPointer;
          }
        }
        FigDebugAssert3();
        v21 = 0;
        v25 = 1;
        goto LABEL_21;
      }
      if (!v7)
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "addObject:", v13);
LABEL_37:
      ++v12;
    }
    while (v6 != v12);
    v27 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    v6 = v27;
  }
  while (v27);
  if (v8)
    CFRelease(v8);
  if (v9)
    xpc_release(v9);
LABEL_49:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v49, 16, v32);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v7);
        objc_msgSend(*((id *)v3 + 10), "removeObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v29);
  }

}

- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3 endpointPID:(int)a4 endpointProxyPID:(int)a5 endpointAuditToken:(id)a6 endpointProxyAuditToken:(id)a7 endpointCameraUniqueID:(id)a8
{
  unsigned int *v14;
  id v15;
  const __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  _xpc_connection_s *v19;
  NSObject *v20;
  _xpc_connection_s *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  _QWORD handler[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CMCaptureFrameSenderService;
  v14 = -[CMCaptureFrameSenderService init](&v31, sel_init);
  if (v14)
  {
    *((_QWORD *)v14 + 1) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    *((_QWORD *)v14 + 2) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", a3);
    v14[12] = a4;
    v14[13] = a5;
    *((_QWORD *)v14 + 4) = a6;
    *((_QWORD *)v14 + 5) = a7;
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (a8)
      v16 = (const __CFString *)a8;
    else
      v16 = CFSTR("unknown");
    *((_QWORD *)v14 + 3) = objc_msgSend(v15, "initWithString:", v16);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_create("com.apple.CMCapture.CMCaptureFrameSender", v17);
    *((_QWORD *)v14 + 7) = v18;
    v19 = xpc_connection_create(0, v18);
    *((_QWORD *)v14 + 8) = v19;
    *((_QWORD *)v14 + 9) = xpc_endpoint_create(v19);
    *((_QWORD *)v14 + 10) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v14 + 11) = dispatch_queue_create("com.apple.CMCapture.CMCaptureFrameSender.clients", v20);
    objc_initWeak(&location, v14);
    v21 = (_xpc_connection_s *)*((_QWORD *)v14 + 8);
    v22 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke;
    handler[3] = &unk_1E491E828;
    objc_copyWeak(&v29, &location);
    xpc_connection_set_event_handler(v21, handler);
    xpc_connection_activate(*((xpc_connection_t *)v14 + 8));
    if (initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID__initAtExitHandler != -1)
      dispatch_once(&initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID__initAtExitHandler, &__block_literal_global_2);
    if (sRunningInsideCameracaptured)
    {
      if (+[CMCaptureFrameSenderEndpointsServerSideSingleton addEndpoint:endpointUniqueID:endpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:](CMCaptureFrameSenderEndpointsServerSideSingleton, "addEndpoint:endpointUniqueID:endpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:", *((_QWORD *)v14 + 9), *((_QWORD *)v14 + 1), *((_QWORD *)v14 + 2), v14[12], v14[13], *((_QWORD *)v14 + 4), *((_QWORD *)v14 + 5), *((_QWORD *)v14 + 3)))
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "postNotificationName:object:", CFSTR("FrameServerEndpointsChanged"), 0);
      }
    }
    else
    {
      FigCaptureSourceRemotePublishFrameSenderServerEndpoint(*((void **)v14 + 9), *((void **)v14 + 1), *((void **)v14 + 2), v14[12], v14[13], *((_QWORD *)v14 + 4), *((_QWORD *)v14 + 5), *((void **)v14 + 3));
    }
    *((_QWORD *)v14 + 12) = 0;
    *((_QWORD *)v14 + 13) = 0;
    *((_QWORD *)v14 + 19) = 0;
    *((_QWORD *)v14 + 20) = 0;
    v14[42] = 5;
    *((_BYTE *)v14 + 172) = 0;
    *((_QWORD *)v14 + 14) = 0;
    *((_QWORD *)v14 + 15) = 0;
    *((_QWORD *)v14 + 17) = 0x4014000000000000;
    *((_QWORD *)v14 + 18) = 0;
    v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v14 + 11));
    *((_QWORD *)v14 + 16) = v23;
    dispatch_source_set_timer(v23, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v24 = *((_QWORD *)v14 + 16);
    v26[0] = v22;
    v26[1] = 3221225472;
    v26[2] = __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke_3;
    v26[3] = &unk_1E491E870;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v24, v26);
    dispatch_activate(*((dispatch_object_t *)v14 + 16));
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return (CMCaptureFrameSenderService *)v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (CMCaptureFrameSenderService)init
{
  return -[CMCaptureFrameSenderService initWithEndpointType:](self, "initWithEndpointType:", CFSTR("ApplicationVideo"));
}

- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3
{
  return -[CMCaptureFrameSenderService initWithEndpointType:endpointCameraUniqueID:](self, "initWithEndpointType:endpointCameraUniqueID:", a3, CFSTR("unkown"));
}

- (CMCaptureFrameSenderService)initWithEndpointType:(id)a3 endpointCameraUniqueID:(id)a4
{
  uint64_t v7;
  _OWORD v9[2];

  memset(v9, 0, sizeof(v9));
  v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, 32, FigCaptureGetCurrentProcessAuditToken(v9));
  return -[CMCaptureFrameSenderService initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:](self, "initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:", a3, getpid(), 0, v7, 0, a4);
}

void __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  if (a2 && MEMORY[0x1A858E754](a2) == MEMORY[0x1E0C812E0])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "_addConnection:", a2);

    }
  }
}

uint64_t __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke_2()
{
  BOOL v0;

  if (FigCaptureCurrentProcessIsCameracaptured())
    v0 = 1;
  else
    v0 = FigCaptureCurrentProcessIsMediaserverd() != 0;
  sRunningInsideCameracaptured = v0;
  return atexit((void (*)(void))cfss_atExitHandler);
}

void __147__CMCaptureFrameSenderService_initWithEndpointType_endpointPID_endpointProxyPID_endpointAuditToken_endpointProxyAuditToken_endpointCameraUniqueID___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (dword_1ECFE9790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v2, "_cleanupSendingPixelBufferMachinery", v4, v5);

  }
}

- (void)dealloc
{
  NSObject *reapSendingPixelTransferSessionTimer;
  OS_xpc_object *listener;
  objc_super v5;

  if (sRunningInsideCameracaptured)
  {
    if (+[CMCaptureFrameSenderEndpointsServerSideSingleton removeEndpointWithUniqueID:](CMCaptureFrameSenderEndpointsServerSideSingleton, "removeEndpointWithUniqueID:", self->_endpointUniqueID))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "postNotificationName:object:", CFSTR("FrameServerEndpointsChanged"), 0);
    }
  }
  else
  {
    FigCaptureSourceRemoteSuppressFrameSenderServerEndpoint(self->_endpointUniqueID);
  }
  reapSendingPixelTransferSessionTimer = self->_reapSendingPixelTransferSessionTimer;
  if (reapSendingPixelTransferSessionTimer)
  {
    dispatch_source_cancel(reapSendingPixelTransferSessionTimer);

    self->_reapSendingPixelTransferSessionTimer = 0;
  }

  listener = self->_listener;
  if (listener)
  {
    xpc_connection_cancel(listener);

  }
  -[CMCaptureFrameSenderService _cleanupSendingPixelBufferMachinery](self, "_cleanupSendingPixelBufferMachinery");
  v5.receiver = self;
  v5.super_class = (Class)CMCaptureFrameSenderService;
  -[CMCaptureFrameSenderService dealloc](&v5, sel_dealloc);
}

- (void)_addConnection:(id)a3
{
  NSObject *clientQueue;
  _QWORD block[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CMCaptureFrameSenderService__addConnection___block_invoke;
  block[3] = &unk_1E491E898;
  objc_copyWeak(&v7, &location);
  block[4] = a3;
  dispatch_async(clientQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__CMCaptureFrameSenderService__addConnection___block_invoke(uint64_t a1)
{
  CMCaptureFrameSenderClient *v2;
  CMCaptureFrameSenderClient *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = -[CMCaptureFrameSenderClient initWithConnection:queue:]([CMCaptureFrameSenderClient alloc], "initWithConnection:queue:", *(_QWORD *)(a1 + 32), *((_QWORD *)WeakRetained + 11));
    if (v2)
    {
      v3 = v2;
      objc_msgSend(*((id *)WeakRetained + 10), "addObject:", v2);

    }
  }
}

- (void)_cleanupSendingPixelBufferMachinery
{
  NSObject *reapSendingPixelTransferSessionTimer;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CVPixelBufferPool *sendingPixelBufferPool;
  opaqueCMFormatDescription *sendingSampleBufferFormatDescription;
  OpaqueVTPixelTransferSession *sendingPixelTransferSession;
  OpaqueVTPixelTransferSession *v8;
  OpaqueVTPixelRotationSession *sendingPixelRotationSession;
  OpaqueVTPixelRotationSession *v10;

  reapSendingPixelTransferSessionTimer = self->_reapSendingPixelTransferSessionTimer;
  if (reapSendingPixelTransferSessionTimer)
  {
    if (dword_1ECFE9790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      reapSendingPixelTransferSessionTimer = self->_reapSendingPixelTransferSessionTimer;
    }
    dispatch_source_set_timer(reapSendingPixelTransferSessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  self->_sendingPixelBufferIsAWeirdSize = 0;
  self->_sendingPixelBufferHeight = 0;
  *(_QWORD *)&self->_sendingPixelBufferPixelFormatType = 0;
  self->_sendingPixelBufferWidth = 0;
  sendingPixelBufferPool = self->_sendingPixelBufferPool;
  if (sendingPixelBufferPool)
  {
    CFRelease(sendingPixelBufferPool);
    self->_sendingPixelBufferPool = 0;
  }
  sendingSampleBufferFormatDescription = self->_sendingSampleBufferFormatDescription;
  if (sendingSampleBufferFormatDescription)
  {
    CFRelease(sendingSampleBufferFormatDescription);
    self->_sendingSampleBufferFormatDescription = 0;
  }
  sendingPixelTransferSession = self->_sendingPixelTransferSession;
  if (sendingPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(sendingPixelTransferSession);
    v8 = self->_sendingPixelTransferSession;
    if (v8)
    {
      CFRelease(v8);
      self->_sendingPixelTransferSession = 0;
    }
  }
  sendingPixelRotationSession = self->_sendingPixelRotationSession;
  if (sendingPixelRotationSession)
  {
    VTPixelRotationSessionInvalidate(sendingPixelRotationSession);
    v10 = self->_sendingPixelRotationSession;
    if (v10)
    {
      CFRelease(v10);
      self->_sendingPixelRotationSession = 0;
    }
  }
}

- (opaqueCMSampleBuffer)_newSampleBufferToSendFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v3;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v7;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  int v11;
  int v12;
  _BOOL4 v13;
  __CVPixelBufferPool *sendingPixelBufferPool;
  CFAllocatorRef *v15;
  size_t v16;
  size_t v17;
  size_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  uint64_t v21;
  CVReturn v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 v24;
  NSObject *v25;
  OpaqueVTPixelTransferSession **p_sendingPixelTransferSession;
  const __CFAllocator *v27;
  OSStatus v28;
  OpaqueVTPixelRotationSession *sendingPixelRotationSession;
  const __CFString *v30;
  const void *v31;
  OSStatus v32;
  OSStatus v33;
  const __CFAllocator *v34;
  opaqueCMFormatDescription **p_sendingSampleBufferFormatDescription;
  OSStatus v36;
  __int128 v37;
  __int128 v38;
  OSStatus v39;
  const __CFString *v40;
  CFTypeRef v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  BOOL IsExtensionDeviceType;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t j;
  __CFString *v63;
  void *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *key;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  os_log_type_t type;
  int v79;
  CMSampleBufferRef sampleBufferOut;
  CVPixelBufferRef pixelBufferOut;
  _BYTE v82[128];
  _QWORD v83[3];
  _BYTE v84[128];
  _QWORD v85[2];
  CMItemCount timingArrayEntriesNeededOut;
  CMSampleTimingInfo timingArrayOut;
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[4];
  _QWORD v91[7];

  v91[4] = *MEMORY[0x1E0C80C00];
  sampleBufferOut = 0;
  pixelBufferOut = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    sampleBufferOut = (CMSampleBufferRef)CFRetain(a3);
    goto LABEL_91;
  }
  v7 = ImageBuffer;
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(v7);
  PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
  v11 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("CrossPlatformRotationDegrees"), 0), "intValue");
  v12 = v11;
  v13 = self->_sendingPixelBufferWidth != Width
     || self->_sendingPixelBufferHeight != Height
     || self->_sendingPixelBufferPixelFormatType != PixelFormatType
     || self->_crossPlatformRotationDegrees != v11;
  sendingPixelBufferPool = self->_sendingPixelBufferPool;
  if (sendingPixelBufferPool && v13)
  {
    -[CMCaptureFrameSenderService _cleanupSendingPixelBufferMachinery](self, "_cleanupSendingPixelBufferMachinery");
    sendingPixelBufferPool = self->_sendingPixelBufferPool;
  }
  v15 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (!sendingPixelBufferPool)
  {
    self->_sendingPixelBufferWidth = Width;
    self->_sendingPixelBufferHeight = Height;
    self->_sendingPixelBufferPixelFormatType = PixelFormatType;
    self->_crossPlatformRotationDegrees = v12;
    if (v12 == 270)
      v16 = Width;
    else
      v16 = Height;
    if (v12 == 270)
      v17 = Height;
    else
      v17 = Width;
    if (v12 == 90)
    {
      v18 = Height;
    }
    else
    {
      Width = v16;
      v18 = v17;
    }
    v90[0] = *MEMORY[0x1E0CA90E0];
    v91[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v18);
    v90[1] = *MEMORY[0x1E0CA8FD8];
    v91[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Width);
    v90[2] = *MEMORY[0x1E0CA9040];
    v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sendingPixelBufferPixelFormatType);
    v90[3] = *MEMORY[0x1E0CA8FF0];
    v91[2] = v19;
    v91[3] = MEMORY[0x1E0C9AA70];
    v20 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 4);
    v88[0] = *MEMORY[0x1E0CA9060];
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sendingPixelBufferPoolSize);
    v88[1] = *MEMORY[0x1E0CA9058];
    v89[0] = v21;
    v89[1] = &unk_1E49F7F50;
    v22 = CVPixelBufferPoolCreate(*v15, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 2), v20, &self->_sendingPixelBufferPool);
    if (dword_1ECFE9790)
    {
      v79 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v15 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    }
    if (v22)
    {
      LODWORD(v66) = v22;
      goto LABEL_97;
    }
    v24 = self->_sendingPixelBufferWidth >= 0x4000 && self->_sendingPixelBufferHeight < 0x21;
    self->_sendingPixelBufferIsAWeirdSize = v24;
    if (!v24)
      goto LABEL_32;
    goto LABEL_30;
  }
  if (self->_sendingPixelBufferIsAWeirdSize)
  {
LABEL_30:
    if (dword_1ECFE9790)
    {
      v79 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
LABEL_32:
  p_sendingPixelTransferSession = &self->_sendingPixelTransferSession;
  if (!self->_sendingPixelTransferSession && !self->_sendingPixelRotationSession)
  {
    v27 = *v15;
    if (self->_crossPlatformRotationDegrees)
    {
      v28 = VTPixelRotationSessionCreate(v27, &self->_sendingPixelRotationSession);
      if (v28)
      {
        LODWORD(v66) = v28;
        goto LABEL_97;
      }
      sendingPixelRotationSession = self->_sendingPixelRotationSession;
      v30 = (const __CFString *)*MEMORY[0x1E0CED7A0];
      v31 = (const void *)FigCaptureVTRotationFromDegrees(360 - self->_crossPlatformRotationDegrees);
      v32 = VTSessionSetProperty(sendingPixelRotationSession, v30, v31);
      if (v32)
      {
        LODWORD(v66) = v32;
LABEL_97:
        FigDebugAssert3();
        -[CMCaptureFrameSenderService _cleanupSendingPixelBufferMachinery](self, "_cleanupSendingPixelBufferMachinery", v66, v3);
        goto LABEL_91;
      }
    }
    else
    {
      v33 = VTPixelTransferSessionCreate(v27, &self->_sendingPixelTransferSession);
      if (v33)
      {
        LODWORD(v66) = v33;
        goto LABEL_97;
      }
    }
  }
  v34 = *v15;
  if (CVPixelBufferPoolCreatePixelBuffer(*v15, self->_sendingPixelBufferPool, &pixelBufferOut))
    goto LABEL_94;
  if (*p_sendingPixelTransferSession)
  {
    if (VTPixelTransferSessionTransferImage(*p_sendingPixelTransferSession, v7, pixelBufferOut))
      goto LABEL_94;
  }
  else if (VTPixelRotationSessionRotateImage(self->_sendingPixelRotationSession, v7, pixelBufferOut))
  {
    goto LABEL_94;
  }
  p_sendingSampleBufferFormatDescription = &self->_sendingSampleBufferFormatDescription;
  if (!self->_sendingSampleBufferFormatDescription)
  {
    v36 = CMVideoFormatDescriptionCreateForImageBuffer(v34, pixelBufferOut, &self->_sendingSampleBufferFormatDescription);
    if (v36)
    {
      LODWORD(v66) = v36;
      goto LABEL_97;
    }
  }
  timingArrayEntriesNeededOut = 0;
  v37 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&timingArrayOut.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&timingArrayOut.decodeTimeStamp.value = v37;
  timingArrayOut.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v38 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&timingArrayOut.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&timingArrayOut.duration.epoch = v38;
  if (CMSampleBufferGetSampleTimingInfoArray(a3, 1, 0, &timingArrayEntriesNeededOut)
    || timingArrayEntriesNeededOut
    && CMSampleBufferGetSampleTimingInfoArray(a3, timingArrayEntriesNeededOut, &timingArrayOut, &timingArrayEntriesNeededOut))
  {
    goto LABEL_94;
  }
  v39 = CMSampleBufferCreateForImageBuffer(v34, pixelBufferOut, 1u, 0, 0, *p_sendingSampleBufferFormatDescription, &timingArrayOut, &sampleBufferOut);
  if (v39 == -12743)
  {
    if (*p_sendingSampleBufferFormatDescription)
    {
      CFRelease(*p_sendingSampleBufferFormatDescription);
      *p_sendingSampleBufferFormatDescription = 0;
    }
    if (CMVideoFormatDescriptionCreateForImageBuffer(v34, pixelBufferOut, &self->_sendingSampleBufferFormatDescription))
      goto LABEL_94;
    v39 = CMSampleBufferCreateForImageBuffer(v34, pixelBufferOut, 1u, 0, 0, *p_sendingSampleBufferFormatDescription, &timingArrayOut, &sampleBufferOut);
  }
  if (v39)
  {
LABEL_94:
    FigDebugAssert3();
    goto LABEL_91;
  }
  v40 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v41 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  key = v40;
  if (v41)
  {
    v42 = (void *)v41;
    v43 = *MEMORY[0x1E0D06D00];
    v44 = *MEMORY[0x1E0D069B8];
    v85[0] = *MEMORY[0x1E0D06D00];
    v85[1] = v44;
    v68 = v44;
    v45 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    if (v46)
    {
      v47 = v46;
      v48 = 0;
      v49 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v75 != v49)
            objc_enumerationMutation(v45);
          v51 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
          v52 = objc_msgSend(v42, "objectForKeyedSubscript:", v51, v66, v67);
          if (v52)
          {
            v53 = v52;
            if (!v48)
              v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v48, "setObject:forKeyedSubscript:", v53, v51);
          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      }
      while (v47);
    }
    else
    {
      v48 = 0;
    }
    v56 = (void *)objc_msgSend(v42, "objectForKeyedSubscript:", v43, v66);
    if ((objc_msgSend(v56, "isEqualToString:", *MEMORY[0x1E0D05A50]) & 1) != 0)
      v54 = 1;
    else
      v54 = objc_msgSend(v56, "isEqualToString:", *MEMORY[0x1E0D05A38]);
    IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v68), "integerValue"));
  }
  else
  {
    v48 = 0;
    v54 = 0;
    IsExtensionDeviceType = 0;
  }
  v83[0] = 0x1E493E838;
  v83[1] = CFSTR("MirroredVertical");
  v83[2] = CFSTR("MirroredHorizontal");
  v57 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3, v66);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v71;
    v61 = v54 ^ 1 | IsExtensionDeviceType;
    do
    {
      for (j = 0; j != v59; ++j)
      {
        if (*(_QWORD *)v71 != v60)
          objc_enumerationMutation(v57);
        v63 = *(__CFString **)(*((_QWORD *)&v70 + 1) + 8 * j);
        v64 = (void *)CMGetAttachment(v7, v63, 0);
        if ((v61 & 1) == 0
          && -[__CFString isEqualToString:](v63, "isEqualToString:", 0x1E493E838)
          && (FigCaptureCameraRequires180DegreesRotation(1, 0) & 1) == 0)
        {
          v64 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureNormalizeAngle(objc_msgSend(v64, "intValue") + 180));
        }
        if (v64)
        {
          if (!v48)
            v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v64, v63);
        }
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v59);
  }
  if (v48)
  {
    CMSetAttachment(sampleBufferOut, key, v48, 1u);

  }
LABEL_91:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  return sampleBufferOut;
}

@end
