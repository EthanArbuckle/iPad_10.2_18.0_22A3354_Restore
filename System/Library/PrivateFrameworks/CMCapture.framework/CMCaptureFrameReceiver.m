@implementation CMCaptureFrameReceiver

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (NSDictionary)availableFrameSenderEndpointsByPID
{
  NSDictionary *v2;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = a1;
  if (availableFrameSenderEndpointsByPID_initFrameSenderEndpoints != -1)
    dispatch_once(&availableFrameSenderEndpointsByPID_initFrameSenderEndpoints, block);
  if (!availableFrameSenderEndpointsByPID_sIsEntitledToReceiveFrames)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  v2 = (NSDictionary *)(id)objc_msgSend((id)availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  return v2;
}

void __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke(uint64_t a1)
{
  __SecTask *v2;
  __SecTask *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  _QWORD v7[5];

  availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v2)
  {
    v3 = v2;
    v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.private.cmcapture.frame-receiver"), 0);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 == CFBooleanGetTypeID())
        availableFrameSenderEndpointsByPID_sIsEntitledToReceiveFrames = CFBooleanGetValue(v5) != 0;
      CFRelease(v5);
    }
    CFRelease(v3);
  }
  if (availableFrameSenderEndpointsByPID_sIsEntitledToReceiveFrames)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_2;
    v7[3] = &unk_1E491E770;
    v7[4] = *(_QWORD *)(a1 + 32);
    availableFrameSenderEndpointsByPID_sFrameSenderEndpointObserver = -[CMCaptureFrameSenderEndpointObserver initWithEndpointsChangedHandler:]([CMCaptureFrameSenderEndpointObserver alloc], "initWithEndpointsChangedHandler:", v7);
  }
}

void __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_3;
  v3[3] = &unk_1E491E748;
  v2 = *(_QWORD *)(a1 + 32);
  v3[4] = a2;
  v3[5] = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __60__CMCaptureFrameReceiver_availableFrameSenderEndpointsByPID__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t j;
  CMCaptureFrameSenderEndpoint *v11;
  CMCaptureFrameSenderEndpoint *v12;
  char v13;
  id obj;
  uint64_t v15;
  void *v16;
  uint64_t v17;
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
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v23;
    v16 = v2;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v6)
        {
          v7 = v6;
          v8 = 0;
          v9 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v5);
              v11 = -[CMCaptureFrameSenderEndpoint initWithDictionary:]([CMCaptureFrameSenderEndpoint alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
              if (v11)
              {
                v12 = v11;
                if (!v8)
                  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v8, "addObject:", v12);

              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v7);
        }
        else
        {
          v8 = 0;
        }
        v2 = v16;
        if (v16)
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, v4);

        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v17);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  v13 = objc_msgSend(v2, "isEqual:", availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID);
  os_unfair_lock_unlock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
  if ((v13 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", CFSTR("availableFrameSenderEndpointsByPID"));
    os_unfair_lock_lock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);

    availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPID = objc_msgSend(v2, "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)&availableFrameSenderEndpointsByPID_sAvailableFrameSenderEndpointsByPIDLock);
    objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", CFSTR("availableFrameSenderEndpointsByPID"));
  }

}

- (CMCaptureFrameReceiver)initWithFrameSenderServerEndpoint:(id)a3 frameReceiverHandler:(id)a4
{
  uint64_t v7;
  CMCaptureFrameReceiver *v8;
  xpc_connection_t v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  NSObject *v12;
  pid_t v13;
  uint64_t v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  xpc_object_t v16;
  _xpc_connection_s *connection;
  NSObject *queue;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  _QWORD v23[5];
  id v24;
  pid_t v25;
  os_log_type_t type;
  unsigned int v27;
  _QWORD handler[5];
  id v29;
  id location;
  objc_super v31;
  int v32;
  const char *v33;
  __int16 v34;
  pid_t v35;
  __int16 v36;
  CMCaptureFrameReceiver *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "endpoint");
  v8 = 0;
  if (a4)
  {
    if (v7)
    {
      v31.receiver = self;
      v31.super_class = (Class)CMCaptureFrameReceiver;
      v8 = -[CMCaptureFrameReceiver init](&v31, sel_init);
      if (v8)
      {
        v9 = xpc_connection_create_from_endpoint((xpc_endpoint_t)objc_msgSend(a3, "endpoint"));
        v10 = v9;
        if (v9)
        {
          v8->_connection = v9;
          v8->_endpointUniqueID = (NSString *)(id)objc_msgSend(a3, "endpointUniqueID");
          v8->_endpointAuditToken = (NSData *)(id)objc_msgSend(a3, "endpointAuditToken");
          v8->_endpointProxyAuditToken = (NSData *)(id)objc_msgSend(a3, "endpointProxyAuditToken");
          v8->_frameReceiverHandler = (id)objc_msgSend(a4, "copy");
          v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v12 = dispatch_queue_create("com.apple.cmio.frame-capture-receiver", v11);
          v8->_queue = (OS_dispatch_queue *)v12;
          v8->_connectionIsValid = 1;
          xpc_connection_set_target_queue(v8->_connection, v12);
          v13 = getpid();
          objc_initWeak(&location, v8);
          v14 = MEMORY[0x1E0C809B0];
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke;
          handler[3] = &unk_1E491E798;
          objc_copyWeak(&v29, &location);
          handler[4] = v10;
          xpc_connection_set_event_handler(v10, handler);
          xpc_connection_activate(v8->_connection);
          v8->_endpointPID = objc_msgSend(a3, "endpointPID");
          if (dword_1EE6BE8F8)
          {
            v27 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v16 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v16, "call", "Ping");
          connection = v8->_connection;
          queue = v8->_queue;
          v23[0] = v14;
          v23[1] = 3221225472;
          v23[2] = __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke_91;
          v23[3] = &unk_1E491E7C0;
          objc_copyWeak(&v24, &location);
          v25 = v13;
          v23[4] = v8;
          xpc_connection_send_message_with_reply(connection, v16, queue, v23);
          xpc_release(v16);
          objc_destroyWeak(&v24);
          if (dword_1EE6BE8F8)
          {
            v27 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v20 = v27;
            if (os_log_type_enabled(v19, type))
              v21 = v20;
            else
              v21 = v20 & 0xFFFFFFFE;
            if (v21)
            {
              v32 = 136315651;
              v33 = "-[CMCaptureFrameReceiver initWithFrameSenderServerEndpoint:frameReceiverHandler:]";
              v34 = 1025;
              v35 = v13;
              v36 = 2112;
              v37 = v8;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_destroyWeak(&v29);
          objc_destroyWeak(&location);
        }
        else
        {

          return 0;
        }
      }
    }
  }
  return v8;
}

void __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v5;
  const char *string;
  xpc_object_t value;
  void *v8;
  xpc_object_t v9;
  void *v10;
  void *bytes_ptr;
  size_t length;
  const __CFAllocator *v13;
  OSStatus v14;
  int SampleBufferFromSerializedAtomDataBlockBuffer;
  xpc_object_t v16;
  __IOSurface *v17;
  CVReturn v18;
  OSStatus v19;
  OSStatus SampleTimingInfoArray;
  BOOL v21;
  NSObject *v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMSampleBufferRef v24;
  xpc_object_t v25;
  int v26;
  xpc_object_t reply;
  CMSampleBufferRef sampleBufferOut;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CVPixelBufferRef pixelBufferOut;
  CMSampleBufferRef sbuf;
  CMBlockBufferRef blockBufferOut;
  CMSampleTimingInfo timingArrayOut;
  CMBlockBufferCustomBlockSource customBlockSource;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1A858E754](a2);
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  if (v5 != MEMORY[0x1E0C81310])
  {
    if (v5 != MEMORY[0x1E0C812F8])
      goto LABEL_53;
    string = xpc_dictionary_get_string(a2, "call");
    if (!string || strncmp("frame-output-notification", string, 0x19uLL))
      goto LABEL_53;
    value = xpc_dictionary_get_value(a2, "sample-buffer");
    if (!value)
      goto LABEL_46;
    v8 = value;
    sbuf = 0;
    blockBufferOut = 0;
    formatDescriptionOut = 0;
    pixelBufferOut = 0;
    sampleBufferOut = 0;
    v9 = xpc_dictionary_get_value(value, "sample-buffer-basic-fields");
    if (v9)
    {
      v10 = v9;
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
      if (bytes_ptr)
      {
        length = xpc_data_get_length(v10);
        HIDWORD(customBlockSource.AllocateBlock) = 0;
        *(_QWORD *)&customBlockSource.version = 0;
        customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))cfr_bbufUtilXPCObjectReleaser;
        customBlockSource.refCon = v10;
        v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v14 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes_ptr, length, 0, &customBlockSource, 0, length, 0, &blockBufferOut);
        if (v14)
        {
          LODWORD(bytes_ptr) = v14;
        }
        else
        {
          xpc_retain(v10);
          SampleBufferFromSerializedAtomDataBlockBuffer = FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer();
          if (!SampleBufferFromSerializedAtomDataBlockBuffer)
          {
            v16 = xpc_dictionary_get_value(v8, "sample-buffer-iosurface");
            if (v16)
            {
              v17 = IOSurfaceLookupFromXPCObject(v16);
              if (!v17)
              {
                FigDebugAssert3();
                LODWORD(bytes_ptr) = 0;
                goto LABEL_33;
              }
              v18 = CVPixelBufferCreateWithIOSurface(v13, v17, 0, &pixelBufferOut);
              if (v18)
              {
                LODWORD(bytes_ptr) = v18;
              }
              else
              {
                v19 = CMVideoFormatDescriptionCreateForImageBuffer(v13, pixelBufferOut, &formatDescriptionOut);
                if (v19)
                {
                  LODWORD(bytes_ptr) = v19;
                }
                else
                {
                  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
                  SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(sbuf, 1, &timingArrayOut, 0);
                  if (SampleTimingInfoArray)
                  {
                    LODWORD(bytes_ptr) = SampleTimingInfoArray;
                  }
                  else
                  {
                    LODWORD(bytes_ptr) = CMSampleBufferCreateForImageBuffer(v13, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, &timingArrayOut, &sampleBufferOut);
                    if (!(_DWORD)bytes_ptr)
                    {
                      CMPropagateAttachments(sbuf, sampleBufferOut);
                      CFRelease(sbuf);
                      sbuf = sampleBufferOut;
                      sampleBufferOut = 0;
LABEL_33:
                      if (blockBufferOut)
                        CFRelease(blockBufferOut);
                      if (v17)
                        CFRelease(v17);
                      goto LABEL_37;
                    }
                  }
                }
              }
              FigDebugAssert3();
              goto LABEL_33;
            }
            LODWORD(bytes_ptr) = 0;
LABEL_32:
            v17 = 0;
            goto LABEL_33;
          }
          LODWORD(bytes_ptr) = SampleBufferFromSerializedAtomDataBlockBuffer;
        }
        FigDebugAssert3();
        goto LABEL_32;
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      LODWORD(bytes_ptr) = 0;
    }
LABEL_37:
    if (pixelBufferOut)
      CFRelease(pixelBufferOut);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    if (sampleBufferOut)
      CFRelease(sampleBufferOut);
    v24 = sbuf;
    if (!(_DWORD)bytes_ptr)
    {
      reply = xpc_dictionary_create_reply(a2);
      v25 = reply;
      if (v24)
      {
        xpc_dictionary_set_int64(reply, "errorReturn", 0);
        v26 = 1;
LABEL_48:
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v25);
        xpc_release(v25);
        if (WeakRetained && v26)
          (*(void (**)(_QWORD, CMSampleBufferRef))(WeakRetained[2] + 16))(WeakRetained[2], v24);
        if (v24)
          CFRelease(v24);
        goto LABEL_53;
      }
LABEL_47:
      xpc_dictionary_set_int64(v25, "errorReturn", -50);
      v26 = 0;
      v24 = 0;
      goto LABEL_48;
    }
    if (sbuf)
      CFRelease(sbuf);
LABEL_46:
    v25 = xpc_dictionary_create_reply(a2);
    goto LABEL_47;
  }
  if (a2 == (void *)MEMORY[0x1E0C81260])
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    if (!WeakRetained)
      goto LABEL_53;
    if (*((_BYTE *)WeakRetained + 64))
    {
      if (dword_1EE6BE8F8)
      {
        LODWORD(blockBufferOut) = 0;
        LOBYTE(sbuf) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      *((_BYTE *)WeakRetained + 64) = 0;
      (*(void (**)(_QWORD, _QWORD))(WeakRetained[2] + 16))(WeakRetained[2], 0);
    }
  }
  v21 = a2 != (void *)MEMORY[0x1E0C81258] || WeakRetained == 0;
  if (!v21 && *((_BYTE *)WeakRetained + 64))
  {
    if (dword_1EE6BE8F8)
    {
      LODWORD(blockBufferOut) = 0;
      LOBYTE(sbuf) = 0;
      v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    *((_BYTE *)WeakRetained + 64) = 0;
    (*(void (**)(_QWORD, _QWORD))(WeakRetained[2] + 16))(WeakRetained[2], 0);
  }
LABEL_53:

}

void __81__CMCaptureFrameReceiver_initWithFrameSenderServerEndpoint_frameReceiverHandler___block_invoke_91(uint64_t a1, uint64_t a2)
{
  xpc_connection_t *WeakRetained;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  pid_t pid;
  pid_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (xpc_connection_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (dword_1EE6BE8F8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (WeakRetained)
  {
    if (a2 && MEMORY[0x1A858E754](a2) != MEMORY[0x1E0C81310])
    {
      pid = xpc_connection_get_pid(WeakRetained[3]);
      v7 = *((_DWORD *)WeakRetained + 10) == pid ? 0 : pid;
      if (*((_DWORD *)WeakRetained + 11) != v7)
      {
        -[xpc_connection_t willChangeValueForKey:](WeakRetained, "willChangeValueForKey:", CFSTR("endpointProxyPID"));
        if (dword_1EE6BE8F8)
        {
          v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *((_DWORD *)WeakRetained + 11) = v7;
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("endpointProxyPID"), v9, v10);
      }
    }

  }
}

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);

  }
  dispatch_release((dispatch_object_t)self->_queue);

  v4.receiver = self;
  v4.super_class = (Class)CMCaptureFrameReceiver;
  -[CMCaptureFrameReceiver dealloc](&v4, sel_dealloc);
}

- (NSString)endpointUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int)endpointPID
{
  return self->_endpointPID;
}

- (int)endpointProxyPID
{
  return self->_endpointProxyPID;
}

- (NSData)endpointAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)endpointProxyAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

@end
