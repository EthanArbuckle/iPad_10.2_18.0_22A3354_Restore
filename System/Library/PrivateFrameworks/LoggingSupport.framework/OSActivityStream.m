@implementation OSActivityStream

- (void)setDelegate:(id)a3
{
  char v4;
  id obj;

  obj = a3;
  self->_delegateHasDidFail = objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_WORD *)&self->_delegateStreamErrorLess = 1;
  }
  else
  {
    v4 = objc_opt_respondsToSelector();
    self->_delegateStreamErrorLess = 0;
    self->_delegateStreamWithError = (v4 & 1) != 0;
  }
  objc_storeWeak((id *)&self->_delegate, obj);

}

- (OSActivityStream)init
{
  OSActivityStream *v2;
  uint64_t v3;
  NSMutableSet *pids;
  uint64_t v5;
  NSMutableSet *uids;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSActivityStream;
  v2 = -[OSActivityStream init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    pids = v2->_pids;
    v2->_pids = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    uids = v2->_uids;
    v2->_uids = (NSMutableSet *)v5;

    *(_OWORD *)&v2->_options = xmmword_19EA7F260;
    v2->_deviceSearchSession = 0;
    v2->_deviceEventSession = 0;
  }
  return v2;
}

- (void)dealloc
{
  os_activity_stream_s *stream;
  objc_super v4;

  stream = self->_stream;
  if (stream)
  {
    *((_DWORD *)stream + 20) = 89;
    xpc_connection_cancel(*((xpc_connection_t *)stream + 2));
    xpc_release(*((xpc_object_t *)stream + 2));
  }
  v4.receiver = self;
  v4.super_class = (Class)OSActivityStream;
  -[OSActivityStream dealloc](&v4, sel_dealloc);
}

- (void)setEvents:(unint64_t)a3
{
  unint64_t v3;

  v3 = (a3 & 0x203) != 0;
  if ((a3 & 0x400) != 0)
    v3 = 4;
  if ((a3 & 0x300) != 0)
    v3 = 2;
  if (v3)
    self->_eventFilter = v3;
}

- (unint64_t)events
{
  if ((self->_eventFilter & 2) != 0)
    return ((uint64_t)(self->_eventFilter << 63) >> 63) & 0x203 | self->_eventFilter & 0x400 | 0x300;
  else
    return ((uint64_t)(self->_eventFilter << 63) >> 63) & 0x203 | self->_eventFilter & 0x400;
}

- (void)addProcessID:(int)a3
{
  NSMutableSet *pids;
  id v4;

  pids = self->_pids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](pids, "addObject:", v4);

}

- (void)addUserID:(unsigned int)a3
{
  NSMutableSet *uids;
  id v4;

  uids = self->_uids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](uids, "addObject:", v4);

}

- (void)setPredicate:(id)a3
{
  _OSLogPredicateMapper *v4;
  _OSLogLegacyPredicateMapper *v5;
  void *v6;
  _OSLogLegacyPredicateMapper *v7;
  void *v8;
  NSCompoundPredicate *v9;
  NSCompoundPredicate *predicate;
  _OSLogStreamFilter *v11;
  _OSLogStreamFilter *streamFilter;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (v17)
  {
    v4 = -[_OSLogPredicateMapper initWithPredicate:andValidate:]([_OSLogPredicateMapper alloc], "initWithPredicate:andValidate:", v17, 0);
    v5 = [_OSLogLegacyPredicateMapper alloc];
    -[_OSLogPredicateMapper mappedPredicate](v4, "mappedPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_OSLogPredicateMapper initWithPredicate:](v5, "initWithPredicate:", v6);

    -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      -[_OSLogPredicateMapper validationErrors](v7, "validationErrors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "exceptionWithName:reason:userInfo:", CFSTR("OSLogInvalidPredicateException"), v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(objc_retainAutorelease(v16));
    }
    -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
    v9 = (NSCompoundPredicate *)objc_claimAutoreleasedReturnValue();
    predicate = self->_predicate;
    self->_predicate = v9;

    if ((-[_OSLogPredicateMapper flags](v4, "flags") & 1) != 0)
      self->_options |= 0x300uLL;
    if ((-[_OSLogPredicateMapper flags](v4, "flags") & 2) != 0)
      self->_options |= 0x100uLL;

  }
  else
  {
    v4 = (_OSLogPredicateMapper *)self->_predicate;
    self->_predicate = 0;
  }

  v11 = -[_OSLogStreamFilter initWithPredicate:]([_OSLogStreamFilter alloc], "initWithPredicate:", self->_predicate);
  streamFilter = self->_streamFilter;
  self->_streamFilter = v11;

}

- (void)start
{
  if (self->_device)
    -[OSActivityStream startRemote](self, "startRemote");
  else
    -[OSActivityStream startLocal](self, "startLocal");
}

- (BOOL)streamEvent:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  OSActivityStream *v13;
  id v14;
  char v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (!v7)
  {
    if (self->_delegateStreamErrorLess)
    {
      if (!v6)
      {
        v15 = objc_msgSend(WeakRetained, "activityStream:results:", self, 0);
        goto LABEL_16;
      }
      v18[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "activityStream:results:", self, v11);
    }
    else
    {
      if (!self->_delegateStreamWithError)
        goto LABEL_4;
      if (!v6)
      {
        v13 = self;
        v14 = 0;
LABEL_10:
        v15 = objc_msgSend(WeakRetained, "activityStream:results:error:", v13, 0, v14);
LABEL_16:
        v10 = v15;
        goto LABEL_17;
      }
      v17 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "activityStream:results:error:", self, v11, 0);
    }
    v10 = v12;

    goto LABEL_17;
  }
  if (!self->_delegateHasDidFail)
  {
    if (!self->_delegateStreamWithError)
      goto LABEL_4;
    v13 = self;
    v14 = v7;
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "streamDidFail:error:", self, v7);
LABEL_4:
  v10 = 1;
LABEL_17:

  return v10;
}

- (void)startRemote
{
  int64_t v3;
  void *v4;
  OSActivityStream *v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  OSLogDevice *device;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFDictionaryRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  const char *v28;
  const void *v29;
  uint32_t v30;
  _QWORD *v31;
  NSObject *global_queue;
  NSObject *v33;
  CFTypeID TypeID;
  const void *Value;
  uint64_t v36;
  int v37;
  int v38;
  _QWORD *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  const __CFNumber *cf;
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[6];
  CFTypeRef v47;
  int v48;
  int v49;
  int valuePtr;
  _QWORD v51[3];
  char v52;
  void *values[4];
  _OWORD keys[2];
  _QWORD handler[6];
  __int128 buf;
  void *v57;
  void *v58;
  _QWORD *v59;
  _QWORD *v60;
  NSObject *v61;
  CFTypeRef v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = -[OSLogDevice devType](self->_device, "devType");
  if (v3 == 2)
  {
    -[OSActivityStream startLocal](self, "startLocal");
    return;
  }
  if (v3 == 1)
  {
    v4 = -[OSLogDevice mobileDeviceRef](self->_device, "mobileDeviceRef");
    v5 = self;
    if (_logdev_mobdev_vtable_onceToken != -1)
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2510);
    v6 = 0;
    v7 = &_logdev_mobdev_vtable_vtab;
    if (!_logdev_mobdev_vtable_valid)
      v7 = 0;
    mobdevtab = (uint64_t)v7;
    if (!_logdev_mobdev_vtable_valid)
      goto LABEL_51;
    v8 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 0x40000000;
    v44[2] = __logdev_stream_events_block_invoke;
    v44[3] = &__block_descriptor_tmp_2538;
    v44[4] = logdev_message_callback;
    v44[5] = v5;
    v49 = 0xFFFF;
    valuePtr = -1;
    v48 = 60;
    v47 = 0;
    if (_CopyOTRServiceConnectionForDevice((uint64_t)v4, &v47, CFSTR("com.apple.os_trace_relay")))
    {
      if (_CopyOTRServiceConnectionForDevice((uint64_t)v4, &v47, CFSTR("com.apple.syslog_relay")))
      {
        v6 = 0;
LABEL_51:
        v5->_deviceEventSession = v6;
        return;
      }
      v18 = 0;
      v17 = 0;
      cf = 0;
      v14 = v47;
      goto LABEL_21;
    }
    v10 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    v11 = CFNumberCreate(0, kCFNumberIntType, &v49);
    v12 = CFNumberCreate(0, kCFNumberIntType, &v48);
    keys[0] = xmmword_1E4157D60;
    keys[1] = *(_OWORD *)off_1E4157D70;
    values[0] = CFSTR("StartActivity");
    values[1] = v10;
    values[2] = v11;
    values[3] = v12;
    v13 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v14 = v47;
    v15 = (*(uint64_t (**)(CFTypeRef, CFDictionaryRef, uint64_t, _QWORD))(mobdevtab + 72))(v47, v13, 200, 0);
    if (v15)
    {
      if (v15 == -402653139)
      {
        if (v14)
        {
          (*(void (**)(CFTypeRef))(mobdevtab + 88))(v14);
          CFRelease(v14);
          v47 = 0;
        }
        v16 = _CopyOTRServiceConnectionForDevice((uint64_t)v4, &v47, CFSTR("com.apple.syslog_relay"));
        v14 = v47;
        if (!v16)
        {
          cf = v12;
          v17 = v11;
          v18 = v10;
LABEL_21:
          v51[0] = 0;
          v51[1] = v51;
          v51[2] = 0x2000000000;
          v52 = 1;
          v19 = dispatch_queue_create("com.apple.os_trace_relay.queue", MEMORY[0x1E0C80D50]);
          v20 = (*(uint64_t (**)(CFTypeRef))(mobdevtab + 80))(v14);
          v21 = dispatch_source_create(MEMORY[0x1E0C80DB8], v20, 0, v19);
          v6 = (_QWORD *)_os_trace_calloc();
          *v6 = v14;
          v6[1] = v21;
          *(_QWORD *)&buf = v8;
          *((_QWORD *)&buf + 1) = 0x40000000;
          v57 = __OTRStartLegacyStreaming_block_invoke;
          v58 = &unk_1E4157DD8;
          v61 = v21;
          v62 = v14;
          v59 = v44;
          v60 = v51;
          dispatch_source_set_event_handler(v21, &buf);
          v22 = dispatch_semaphore_create(0);
          v6[3] = v22;
          if (v22)
          {
            v23 = v6[1];
            handler[0] = v8;
            handler[1] = 0x40000000;
            handler[2] = __OTRStartLegacyStreaming_block_invoke_2;
            handler[3] = &unk_1E4157E00;
            handler[4] = v44;
            handler[5] = v6;
            dispatch_source_set_cancel_handler(v23, handler);
            dispatch_activate(v21);
            _Block_object_dispose(v51, 8);
            v10 = v18;
            v11 = v17;
            v12 = cf;
LABEL_43:
            if (v10)
              CFRelease(v10);
            if (v11)
              CFRelease(v11);
            if (v12)
              CFRelease(v12);
            if (v6)
            {
              signal(2, (void (__cdecl *)(int))1);
              global_queue = dispatch_get_global_queue(21, 0);
              v33 = dispatch_source_create(MEMORY[0x1E0C80DC0], 2uLL, 0, global_queue);
              v6[2] = v33;
              *(_QWORD *)&buf = v8;
              *((_QWORD *)&buf + 1) = 0x40000000;
              v57 = __logdev_stream_events_block_invoke_2;
              v58 = &__block_descriptor_tmp_4;
              v59 = v6;
              dispatch_source_set_event_handler(v33, &buf);
              dispatch_activate(v33);
            }
            goto LABEL_51;
          }
          free(v6);
          _Block_object_dispose(v51, 8);
          v29 = 0;
          v10 = v18;
          v11 = v17;
          v12 = cf;
          goto LABEL_39;
        }
      }
      goto LABEL_38;
    }
    CFRelease(v13);
    LOBYTE(v51[0]) = 0;
    *(_QWORD *)&buf = 0;
    if ((*(unsigned int (**)(CFTypeRef, _QWORD *, uint64_t))(mobdevtab + 8))(v14, v51, 1) == 1)
    {
      v24 = LOBYTE(v51[0]);
      if (LOBYTE(v51[0]) != 1)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        LODWORD(handler[0]) = 67109120;
        HIDWORD(handler[0]) = v24;
        v27 = MEMORY[0x1E0C81028];
        v28 = "Got incorrect response type: %hhu";
        goto LABEL_34;
      }
      v25 = (*(uint64_t (**)(CFTypeRef, __int128 *, _QWORD, _QWORD))(mobdevtab + 16))(v14, &buf, 0, 0);
      if (v25)
      {
        v26 = v25;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        LODWORD(handler[0]) = 67109120;
        HIDWORD(handler[0]) = v26;
        v27 = MEMORY[0x1E0C81028];
        v28 = "Failed to receive response: %x";
LABEL_34:
        v30 = 8;
        goto LABEL_35;
      }
      if ((_QWORD)buf)
      {
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID((CFTypeRef)buf))
        {
          v29 = (const void *)buf;
          if ((_QWORD)buf)
          {
            Value = CFDictionaryGetValue((CFDictionaryRef)buf, CFSTR("Status"));
            if (CFEqual(Value, CFSTR("RequestSuccessful")))
            {
              v36 = v8;
              v37 = (*(uint64_t (**)(CFTypeRef))(mobdevtab + 80))(v14);
              if (v37 != -1)
              {
                v38 = v37;
                v39 = (_QWORD *)_os_trace_calloc();
                *v39 = v14;
                v31 = v39;
                v40 = dispatch_queue_create("com.apple.os_trace_relay_client", 0);
                v31[3] = dispatch_semaphore_create(0);
                v41 = dispatch_source_create(MEMORY[0x1E0C80DB8], v38, 0, v40);
                v31[1] = v41;
                v46[0] = v36;
                v46[1] = 0x40000000;
                v46[2] = __OTRCreateActivityStreamForPID_block_invoke;
                v46[3] = &unk_1E4157D88;
                v46[4] = v44;
                v46[5] = v31;
                dispatch_source_set_event_handler(v41, v46);
                v42 = v31[1];
                v45[0] = v36;
                v45[1] = 0x40000000;
                v45[2] = __OTRCreateActivityStreamForPID_block_invoke_2;
                v45[3] = &unk_1E4157DB0;
                v45[4] = v44;
                v45[5] = v31;
                dispatch_source_set_cancel_handler(v42, v45);
                dispatch_activate((dispatch_object_t)v31[1]);
                if (v40)
                  dispatch_release(v40);
                v8 = v36;
LABEL_42:
                CFRelease(v29);
                v6 = v31;
                goto LABEL_43;
              }
            }
LABEL_39:
            if (v14)
            {
              (*(void (**)(CFTypeRef))(mobdevtab + 88))(v14);
              CFRelease(v14);
              v47 = 0;
            }
            v31 = 0;
            v6 = 0;
            if (!v29)
              goto LABEL_43;
            goto LABEL_42;
          }
LABEL_38:
          v29 = 0;
          goto LABEL_39;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
LABEL_36:
          if ((_QWORD)buf)
            CFRelease((CFTypeRef)buf);
          goto LABEL_38;
        }
        LOWORD(handler[0]) = 0;
        v27 = MEMORY[0x1E0C81028];
        v28 = "Incorrect response type";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_38;
        LOWORD(handler[0]) = 0;
        v27 = MEMORY[0x1E0C81028];
        v28 = "Got NULL response dictionary";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      LOWORD(handler[0]) = 0;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Failed to get message type response";
    }
    v30 = 2;
LABEL_35:
    _os_log_impl(&dword_19EA26000, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)handler, v30);
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = device;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown logging device type %@", (uint8_t *)&buf, 0xCu);
  }
}

- (void)startLocal
{
  unint64_t options;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  OSLogDevice *device;
  id v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  os_activity_stream_s *stream;
  int v18;
  NSMutableSet *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  os_activity_stream_s *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  os_activity_stream_s *v29;
  id v30;
  uint64_t v31;
  size_t v32;
  uint64_t v33;
  const void *v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD aBlock[5];
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  options = self->_options;
  if ((options & 4) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__OSActivityStream_startLocal__block_invoke;
  aBlock[3] = &unk_1E4156998;
  aBlock[4] = self;
  v6 = v4;
  v45 = v6;
  v7 = _Block_copy(aBlock);
  v8 = options & 0x100;
  if ((options & 0x200) != 0)
    v8 = 288;
  v9 = options & 1 | (4 * ((options >> 1) & 1)) | v8 | (options >> 31 << 7);
  device = self->_device;
  if (device && -[OSLogDevice devType](device, "devType") == 2)
  {
    -[OSLogDevice uid](self->_device, "uid");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    self->_stream = (os_activity_stream_s *)os_activity_stream_for_simulator((const char *)objc_msgSend(v11, "UTF8String"), v9, v7);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = self->_pids;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        stream = self->_stream;
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "intValue");
        if (stream)
          os_activity_stream_add_pid((uint64_t)stream, v18);
        else
          self->_stream = (os_activity_stream_s *)os_activity_stream_for_pid(v18, v9, v7);
      }
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v14);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = self->_uids;
  v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = self->_stream;
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "unsignedIntValue");
        if (v24)
          os_activity_stream_add_uid((uint64_t)v24, v25);
        else
          self->_stream = (os_activity_stream_s *)os_activity_stream_for_uid(v25, v9, v7);
      }
      v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v21);
  }

  v26 = (uint64_t)self->_stream;
  if (!v26)
  {
    v26 = os_activity_stream_for_pid(-1, v9, v7);
    self->_stream = (os_activity_stream_s *)v26;
  }
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __30__OSActivityStream_startLocal__block_invoke_2;
  v35[3] = &unk_1E41569C0;
  v35[4] = self;
  *(_QWORD *)(v26 + 8) = _Block_copy(v35);
  *((_DWORD *)self->_stream + 16) |= LODWORD(self->_eventFilter);
  -[_OSLogStreamFilter data](self->_streamFilter, "data");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v29 = self->_stream;
  if (v27)
  {
    v30 = objc_retainAutorelease(v27);
    v31 = objc_msgSend(v30, "bytes");
    v32 = objc_msgSend(v30, "length");
    v33 = (uint64_t)v29;
    v34 = (const void *)v31;
  }
  else
  {
    v33 = (uint64_t)v29;
    v34 = 0;
    v32 = 0;
  }
  _os_activity_stream_resume_with_filter(v33, v34, v32);

}

- (void)stop
{
  if (self->_device)
    -[OSActivityStream stopRemote](self, "stopRemote");
  else
    -[OSActivityStream stopLocal](self, "stopLocal");
}

- (void)stopLocal
{
  os_activity_stream_s *stream;

  stream = self->_stream;
  if (stream)
  {
    *((_DWORD *)stream + 20) = 89;
    xpc_connection_cancel(*((xpc_connection_t *)stream + 2));
    xpc_release(*((xpc_object_t *)stream + 2));
    self->_stream = 0;
  }
}

- (void)stopRemote
{
  int64_t v3;
  OSActivityStream *v4;
  uint64_t deviceEventSession;
  uint64_t *v6;
  OSLogDevice *device;
  void *v8;
  OSActivityStream *obj;
  uint8_t buf[4];
  OSLogDevice *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[OSLogDevice devType](self->_device, "devType");
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      obj = self;
      objc_sync_enter(obj);
      v4 = obj;
      deviceEventSession = (uint64_t)obj->_deviceEventSession;
      if (deviceEventSession)
      {
        if (_logdev_mobdev_vtable_onceToken != -1)
        {
          v8 = obj->_deviceEventSession;
          dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2510);
          v4 = obj;
          deviceEventSession = (uint64_t)v8;
        }
        v6 = &_logdev_mobdev_vtable_vtab;
        if (!_logdev_mobdev_vtable_valid)
          v6 = 0;
        mobdevtab = (uint64_t)v6;
        if (_logdev_mobdev_vtable_valid)
        {
          OTRCancelAndFreeActivityStream(deviceEventSession);
          v4 = obj;
        }
        v4->_deviceEventSession = 0;
      }
      objc_sync_exit(v4);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      device = self->_device;
      *(_DWORD *)buf = 138412290;
      v11 = device;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown logging device type %@", buf, 0xCu);
    }
  }
}

- (void)setDeviceDelegate:(id)a3
{
  id v4;
  void *deviceSearchSession;
  uint64_t *v6;
  OSActivityStream *v7;
  void *v8;
  uint64_t *v9;
  _QWORD *v10;
  __CFDictionary *Mutable;
  __CFDictionary *v12;
  OSActivityStream *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  OSActivityStream *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  OSActivityStream *v37;
  id v38;
  id v39;
  uint8_t buf[136];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  deviceSearchSession = self->_deviceSearchSession;
  if (deviceSearchSession)
  {
    if (_logdev_mobdev_vtable_onceToken != -1)
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2510);
    if (_logdev_mobdev_vtable_valid)
      v6 = &_logdev_mobdev_vtable_vtab;
    else
      v6 = 0;
    mobdevtab = (uint64_t)v6;
    if (_logdev_mobdev_vtable_valid)
      off_1EE52EC40(deviceSearchSession);
    self->_deviceSearchSession = 0;
  }
  objc_storeWeak((id *)&self->_deviceDelegate, v4);
  if (v4)
  {
    v7 = self;
    if (_logdev_mobdev_vtable_onceToken != -1)
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2510);
    v8 = 0;
    if (_logdev_mobdev_vtable_valid)
      v9 = &_logdev_mobdev_vtable_vtab;
    else
      v9 = 0;
    mobdevtab = (uint64_t)v9;
    if (_logdev_mobdev_vtable_valid)
    {
      *(_QWORD *)buf = 0;
      v10 = (_QWORD *)_os_trace_calloc();
      *v10 = logdev_notification_callback;
      v10[1] = v7;
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (Mutable)
      {
        v12 = Mutable;
        CFDictionarySetValue(Mutable, CFSTR("NotificationOptionSearchForPairedDevices"), (const void *)*MEMORY[0x1E0C9AE50]);
        (*(void (**)(void (*)(uint64_t, uint64_t), _QWORD, _QWORD, _QWORD *, uint8_t *, __CFDictionary *))(mobdevtab + 104))(observation_callback, 0, 0, v10, buf, v12);
        CFRelease(v12);
        v8 = *(void **)buf;
      }
      else
      {
        free(v10);
        v8 = 0;
      }
    }
    self->_deviceSearchSession = v8;
    v13 = v7;
    if (watchForSims_onceToken != -1)
      dispatch_once(&watchForSims_onceToken, &__block_literal_global_283);
    if (watchForSims_SimServiceContextClass && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1A1AEC1C8]();
      v39 = 0;
      objc_msgSend((id)watchForSims_SimServiceContextClass, "sharedServiceContextForDeveloperDir:error:", 0, &v39);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v39;
      v17 = v16;
      if (v15)
      {
        v38 = v16;
        objc_msgSend(v15, "defaultDeviceSetWithError:", &v38);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v38;

        if (v18)
        {
          context = v14;
          dispatch_get_global_queue(17, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __watchForSims_block_invoke_2;
          v36[3] = &unk_1E4156A08;
          v21 = v13;
          v37 = v21;
          objc_msgSend(v18, "registerNotificationHandlerOnQueue:handler:", v20, v36);

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v18, "devices");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, buf, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v33 != v25)
                  objc_enumerationMutation(v22);
                _simDeviceUpdate(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i), v21);
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, buf, 16);
            }
            while (v24);
          }

          v14 = context;
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "localizedDescription");
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v30 = objc_msgSend(v29, "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "watchForSims error: %s", buf, 0xCu);

        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "localizedDescription");
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v28 = objc_msgSend(v27, "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v28;
          _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "watchForSims error: %s", buf, 0xCu);

        }
        v19 = v17;
      }
      objc_autoreleasePoolPop(v14);

    }
  }

}

- (id)getInfoForDevice:(id)a3 andKey:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Invalid input.";
      v12 = 2;
LABEL_16:
      _os_log_impl(&dword_19EA26000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v12);
    }
LABEL_17:
    v8 = 0;
    goto LABEL_27;
  }
  v7 = objc_msgSend(v5, "devType");
  if (v7 == 2)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceName")))
    {
      objc_msgSend(v5, "simDev");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("UniqueDeviceID")))
      {
        objc_msgSend(v5, "simDev");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UDID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("ProductType")))
        {
          objc_msgSend(v5, "simDev");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deviceType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v6, "isEqualToString:", CFSTR("ProductName")))
            goto LABEL_17;
          objc_msgSend(v5, "simDev");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "runtime");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v14 = v16;
        objc_msgSend(v16, "name");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (void *)v15;

    }
    goto LABEL_27;
  }
  if (v7 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = objc_msgSend(v5, "devType");
      v10 = MEMORY[0x1E0C81028];
      v11 = "Unknown logging device type %ld";
      v12 = 12;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_msgSend(v5, "mobileDeviceRef");
  if (_logdev_mobdev_vtable_onceToken != -1)
    dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2510);
  v8 = 0;
  v9 = &_logdev_mobdev_vtable_vtab;
  if (!_logdev_mobdev_vtable_valid)
    v9 = 0;
  mobdevtab = (uint64_t)v9;
  if (_logdev_mobdev_vtable_valid)
    v8 = (void *)off_1EE52EC30();
LABEL_27:

  return v8;
}

- (BOOL)establishTrust:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  OSActivityStream *v8;
  OSActivityStream *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  int v13;
  const void *v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  int v19;
  int v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const void *v30;
  char buffer[56];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "devType");
    if (v6 == 2)
    {
      v15 = 1;
    }
    else
    {
      if (v6 == 1)
      {
        v7 = objc_msgSend(v5, "mobileDeviceRef");
        v8 = self;
        strcpy(buffer, "0000000000000000000000000000000000000000");
        buffer[41] = unk_19EA7F1E8;
        if (!v7)
        {
          v13 = 0;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v25) = 0;
            _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid inputs", (uint8_t *)&v25, 2u);
            v13 = 0;
          }
          goto LABEL_26;
        }
        v9 = v8;
        v10 = (const __CFString *)(*(uint64_t (**)(uint64_t))(mobdevtab + 128))(v7);
        v11 = v10;
        if (v10)
          CFStringGetCString(v10, buffer, 42, 0x8000100u);
        v12 = (*(uint64_t (**)(uint64_t))(mobdevtab + 32))(v7);
        if (v12)
        {
          v13 = v12;
          v14 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315650;
            v26 = buffer;
            v27 = 1024;
            v28 = v13;
            v29 = 2112;
            v30 = v14;
            _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%s) AMDeviceConnect failed with %08x (%@)\n", (uint8_t *)&v25, 0x1Cu);
          }
          goto LABEL_22;
        }
        v19 = (*(uint64_t (**)(uint64_t))(mobdevtab + 40))(v7);
        if (v19 == -402653155 || !v19)
          goto LABEL_20;
        v21 = (*(uint64_t (**)(uint64_t))(mobdevtab + 120))(v7);
        if (v21)
        {
          v13 = v21;
          v14 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          v25 = 136315650;
          v26 = buffer;
          v27 = 1024;
          v28 = v13;
          v29 = 2112;
          v30 = v14;
          v22 = MEMORY[0x1E0C81028];
          v23 = "(%s) AMDevicePair failed with %08x (%@)\n";
        }
        else
        {
          v24 = (*(uint64_t (**)(uint64_t))(mobdevtab + 40))(v7);
          if ((_DWORD)v24 == -402653155 || (v13 = v24) == 0)
          {
LABEL_20:
            logdev_notification_callback(0, (uint64_t)buffer, v7, v9);
            v13 = 0;
            v14 = 0;
LABEL_21:
            (*(void (**)(uint64_t))(mobdevtab + 64))(v7);
LABEL_22:
            if (v11)
              CFRelease(v11);
            if (v14)
              CFRelease(v14);
LABEL_26:
            v15 = v13 == 0;
            goto LABEL_27;
          }
          v14 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v24);
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          v25 = 136315650;
          v26 = buffer;
          v27 = 1024;
          v28 = v13;
          v29 = 2112;
          v30 = v14;
          v22 = MEMORY[0x1E0C81028];
          v23 = "(%s) AMDeviceStartSession failed with %08x (%@)\n";
        }
        _os_log_impl(&dword_19EA26000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 0x1Cu);
        goto LABEL_21;
      }
      v15 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 134217984;
        *(_QWORD *)&buffer[4] = objc_msgSend(v5, "devType");
        v16 = MEMORY[0x1E0C81028];
        v17 = "Unknown logging device type %ld";
        v18 = 12;
        goto LABEL_15;
      }
    }
  }
  else
  {
    v15 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buffer = 0;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Invalid input.";
      v18 = 2;
LABEL_15:
      _os_log_impl(&dword_19EA26000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)buffer, v18);
      v15 = 0;
    }
  }
LABEL_27:

  return v15;
}

- (OSDeviceDelegate)deviceDelegate
{
  return (OSDeviceDelegate *)objc_loadWeakRetained((id *)&self->_deviceDelegate);
}

- (OSActivityStreamDelegate)delegate
{
  return (OSActivityStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)eventFilter
{
  return self->_eventFilter;
}

- (void)setEventFilter:(unint64_t)a3
{
  self->_eventFilter = a3;
}

- (NSCompoundPredicate)predicate
{
  return self->_predicate;
}

- (OSLogDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_deviceDelegate);
  objc_storeStrong((id *)&self->_streamFilter, 0);
  objc_storeStrong((id *)&self->_uids, 0);
  objc_storeStrong((id *)&self->_pids, 0);
}

uint64_t __30__OSActivityStream_startLocal__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (!a2)
  {
    v8 = 1;
    if (!a3)
      return v8;
    goto LABEL_9;
  }
  +[OSActivityEvent activityEventFromStreamEntry:](OSActivityEvent, "activityEventFromStreamEntry:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v6)
  {
    if ((objc_msgSend(v6, "evaluateWithObject:", v5) & 1) == 0)
      goto LABEL_7;
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v7, "addObject:", v5);
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "streamEvent:error:", v5, 0);
LABEL_8:

  if (a3)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "streamEvent:error:", 0, v9) & v8;

  }
  return v8;
}

void __30__OSActivityStream_startLocal__block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v6 = WeakRetained;
  switch(a3)
  {
    case 3:
      v10 = WeakRetained;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "streamEvent:error:", 0, v8);
      objc_msgSend(*(id *)(a1 + 32), "stop");

      goto LABEL_11;
    case 2:
      v10 = WeakRetained;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "streamDidStop:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 89, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "streamEvent:error:", 0, v9);

      }
      objc_msgSend(*(id *)(a1 + 32), "stop");
      goto LABEL_11;
    case 1:
      v10 = WeakRetained;
      v7 = objc_opt_respondsToSelector();
      v6 = v10;
      if ((v7 & 1) != 0)
      {
        objc_msgSend(v10, "streamDidStart:", *(_QWORD *)(a1 + 32));
LABEL_11:
        v6 = v10;
      }
      break;
  }

}

@end
