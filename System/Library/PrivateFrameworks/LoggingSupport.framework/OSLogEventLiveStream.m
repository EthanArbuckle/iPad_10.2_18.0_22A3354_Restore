@implementation OSLogEventLiveStream

- (OSLogEventLiveStream)initWithLiveSource:(id)a3
{
  id v5;
  OSLogEventLiveStream *v6;
  OSLogEventLiveStream *v7;

  v5 = a3;
  v6 = -[OSLogEventStreamBase init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_source, a3);

  return v7;
}

- (void)setDroppedEventHandler:(id)a3
{
  void *v4;
  id dropnoteHandler;

  v4 = _Block_copy(a3);
  dropnoteHandler = self->_dropnoteHandler;
  self->_dropnoteHandler = v4;

}

- (void)setFilterPredicate:(id)a3
{
  _OSLogStreamFilter *v4;
  void *v5;
  _OSLogStreamFilter *v6;
  _OSLogStreamFilter *streamFilter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSLogEventLiveStream;
  -[OSLogEventStreamBase setFilterPredicate:](&v8, sel_setFilterPredicate_, a3);
  v4 = [_OSLogStreamFilter alloc];
  -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_OSLogStreamFilter initWithPredicate:](v4, "initWithPredicate:", v5);
  streamFilter = self->_streamFilter;
  self->_streamFilter = v6;

}

- (void)_handleStreamedObject:(id)a3 usingProxy:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "_fillFromXPCEventObject:", v11);
  -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[OSLogEventStreamBase filterPredicate](self, "filterPredicate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "evaluateWithObject:", v6),
        v8,
        (v9 & 1) != 0))
  {
    -[OSLogEventStreamBase streamHandler](self, "streamHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v6);

  }
}

- (void)_activateLiveStream
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  unint64_t reason;
  OSLogEventStreamPosition *v8;
  NSObject *v9;
  OS_xpc_object *mach_service;
  OS_xpc_object *diagdconn;
  OS_xpc_object *v12;
  xpc_object_t v13;
  char v14;
  char v15;
  __int16 v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  _OSLogStreamFilter *streamFilter;
  id v21;
  const void *v22;
  void *v23;
  xpc_object_t v24;
  uint64_t uint64;
  uint8_t v26[16];
  _QWORD handler[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  id v31;

  -[OSLogEventStreamBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[OSLogEventStreamBase streamHandler](self, "streamHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_26;
  if (!-[OSLogEventStreamBase invalidated](self, "invalidated"))
  {
    -[OSLogEventStreamBase queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", v9, 2uLL);
    diagdconn = self->_diagdconn;
    self->_diagdconn = mach_service;

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v31 = 0;
    v31 = +[OSLogEventProxy _make](OSLogEventProxy, "_make");
    self->_reason = 0;
    v12 = self->_diagdconn;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__OSLogEventLiveStream__activateLiveStream__block_invoke;
    handler[3] = &unk_1E4157248;
    handler[4] = self;
    handler[5] = &v28;
    xpc_connection_set_event_handler(v12, handler);
    xpc_connection_activate(self->_diagdconn);
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "action", 3uLL);
    objc_msgSend((id)v29[3], "_setIncludeSensitive:", 1);
    xpc_dictionary_set_uint64(v13, "flags", (16 * -[OSLogEventStreamBase flags](self, "flags")) & 0x20 | ((-[OSLogEventStreamBase flags](self, "flags") & 1) << 8));
    v14 = -[OSLogEventStreamBase flags](self, "flags");
    v15 = -[OSLogEventStreamBase flags](self, "flags");
    v16 = -[OSLogEventStreamBase flags](self, "flags");
    v17 = -[OSLogEventStreamBase flags](self, "flags");
    v18 = 15;
    if ((v14 & 0x20) == 0)
      v18 = 7;
    if (v15 < 0)
      v18 &= 0xEu;
    if ((v16 & 0x100) != 0)
      v18 &= ~2uLL;
    if ((v17 & 0x200) != 0)
      v19 = v18 & 0xFFFFFFFFFFFFFFFBLL;
    else
      v19 = v18;
    xpc_dictionary_set_uint64(v13, "types", v19);
    xpc_dictionary_set_BOOL(v13, "all_procs", 1);
    streamFilter = self->_streamFilter;
    if (streamFilter)
    {
      -[_OSLogStreamFilter data](streamFilter, "data");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = (const void *)objc_msgSend(v21, "bytes");
      -[_OSLogStreamFilter data](self->_streamFilter, "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_data(v13, "stream_filter", v22, objc_msgSend(v23, "length"));

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Sending stream request to diagnosticd", v26, 2u);
    }
    v24 = xpc_connection_send_message_with_reply_sync(self->_diagdconn, v13);
    if (MEMORY[0x1A1AECA14]() == MEMORY[0x1E0C81310])
    {
      xpc_connection_cancel(self->_diagdconn);
      goto LABEL_23;
    }
    uint64 = xpc_dictionary_get_uint64(v24, "error");
    if (!uint64)
    {
LABEL_23:

      _Block_object_dispose(&v28, 8);
      return;
    }
    if (uint64 == 1)
    {
      -[OSLogEventLiveStream invalidate](self, "invalidate");
      self->_reason = 7;
      xpc_connection_cancel(self->_diagdconn);
      goto LABEL_23;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_26:
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventLiveStream activated without stream handler";
    __break(1u);
    return;
  }
  self->_reason = 4;
  -[OSLogEventStreamBase invalidationHandler](self, "invalidationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[OSLogEventStreamBase invalidationHandler](self, "invalidationHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    reason = self->_reason;
    v8 = [OSLogEventStreamPosition alloc];
    ((void (**)(_QWORD, unint64_t, OSLogEventStreamPosition *))v6)[2](v6, reason, v8);

    -[OSLogEventStreamBase setInvalidationHandler:](self, "setInvalidationHandler:", 0);
  }
}

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  -[OSLogEventStreamBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__OSLogEventLiveStream_activate__block_invoke;
  block[3] = &unk_1E4157270;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OSLogEventLiveStream;
  -[OSLogEventStreamBase invalidate](&v5, sel_invalidate);
  -[OSLogEventStreamBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__OSLogEventLiveStream_invalidate__block_invoke;
  block[3] = &unk_1E4157270;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_xpc_object)diagdconn
{
  return self->_diagdconn;
}

- (void)setDiagdconn:(id)a3
{
  objc_storeStrong((id *)&self->_diagdconn, a3);
}

- (OSLogEventLiveSource)source
{
  return self->_source;
}

- (id)dropnoteHandler
{
  return self->_dropnoteHandler;
}

- (void)setDropnoteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dropnoteHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_diagdconn, 0);
  objc_storeStrong((id *)&self->_streamFilter, 0);
}

void __34__OSLogEventLiveStream_invalidate__block_invoke(uint64_t a1)
{
  _xpc_connection_s *v1;

  v1 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 80);
  if (v1)
    xpc_connection_cancel(v1);
}

uint64_t __32__OSLogEventLiveStream_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateLiveStream");
}

void __43__OSLogEventLiveStream__activateLiveStream__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD *v5;
  _xpc_connection_s *v6;
  void *v7;
  char *v8;
  char *v9;
  _BOOL4 v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  OSLogEventStreamPosition *v14;
  uint64_t value;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint8_t buf[4];
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1A1AECA14]() == MEMORY[0x1E0C81310])
  {
    v5 = *(_QWORD **)(a1 + 32);
    if (v3 != (id)MEMORY[0x1E0C81260])
    {
      v6 = (_xpc_connection_s *)v5[10];
LABEL_16:
      xpc_connection_cancel(v6);
      goto LABEL_17;
    }
    if (!objc_msgSend(v5, "invalidated"))
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 1;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "_unmake");
    objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v14 = [OSLogEventStreamPosition alloc];
      ((void (**)(_QWORD, uint64_t, OSLogEventStreamPosition *))v12)[2](v12, v13, v14);

      objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
    }
  }
  else
  {
    v19 = 0;
    v4 = v3;
    if (MEMORY[0x1A1AECA14]() != MEMORY[0x1E0C812F8])
    {
      asprintf(&v19, "Not a dictionary\n");
      goto LABEL_9;
    }
    xpc_dictionary_get_value(v4, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1A1AECA14]() != MEMORY[0x1E0C81398])
    {
      v8 = (char *)xpc_copy_short_description();
      asprintf(&v19, "Action is %s (not uint64, which was expected)\n", v8);
      free(v8);
LABEL_8:

LABEL_9:
      v9 = v19;
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136446210;
          v21 = v9;
          _os_log_error_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error with received event: %{public}s", buf, 0xCu);
          v9 = v19;
        }
        free(v9);
      }
      else if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unspecified error with received event", buf, 2u);
      }
      goto LABEL_15;
    }
    value = xpc_uint64_get_value(v7);
    v16 = value;
    if (value != 6 && value != 12)
    {
      asprintf(&v19, "Action is %llu (not %llu or %llu, which was expected)\n", value, 6, 12);
      goto LABEL_8;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "_setThreadCrumb");
    v17 = *(_QWORD **)(a1 + 32);
    if (v16 == 6)
    {
      objc_msgSend(v17, "_handleStreamedObject:usingProxy:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    }
    else
    {
      v18 = v17[12];
      if (v18)
        (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "invalidated"))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 4;
LABEL_15:
      v6 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 80);
      goto LABEL_16;
    }
  }
LABEL_17:

}

@end
