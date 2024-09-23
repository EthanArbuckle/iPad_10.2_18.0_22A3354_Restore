@implementation SLRequestBodyInputStream

- (SLRequestBodyInputStream)initWithMultiParts:(id)a3 multiPartBoundary:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  SLRequestBodyInputStream *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  SLRequestMultiPartInputStream *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  SLRequestMultiPartInputStream *currentStream;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SLRequestBodyInputStream;
  v9 = -[SLRequestBodyInputStream init](&v38, sel_init);
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v16 = -[SLRequestMultiPartInputStream initWithMultiPart:]([SLRequestMultiPartInputStream alloc], "initWithMultiPart:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--%@--\r\n"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v9->_dataLength += objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "length");
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v19, "count"))
    {
      v9->_dataLength += objc_msgSend(v18, "length");
      objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithData:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v24);
      objc_storeStrong((id *)&v9->_inputStreams, v10);
      -[NSArray objectAtIndex:](v9->_inputStreams, "objectAtIndex:", 0);
      v25 = objc_claimAutoreleasedReturnValue();
      currentStream = v9->_currentStream;
      v9->_currentStream = (SLRequestMultiPartInputStream *)v25;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v9->_inputStreams, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9->_dataLength);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 7, CFSTR("SLRequestBodyInputStream %@ initWithMultiParts:multiPartBoundary: _inputStreams.count %@ _dataLength %@"));

  }
  return v9;
}

- (void)dealloc
{
  __CFRunLoopSource *rls;
  void (*release)(void *, SEL);
  objc_super v5;

  rls = self->_rls;
  if (rls)
  {
    CFRunLoopSourceInvalidate(rls);
    CFRelease(self->_rls);
  }
  release = (void (*)(void *, SEL))self->_clientContext.release;
  if (release)
    release(self->_clientContext.info, a2);
  v5.receiver = self;
  v5.super_class = (Class)SLRequestBodyInputStream;
  -[SLRequestBodyInputStream dealloc](&v5, sel_dealloc);
}

- (id)nextStream
{
  unint64_t v3;
  void *v4;

  v3 = self->_currentIndex + 1;
  self->_currentIndex = v3;
  if (v3 == -[NSArray count](self->_inputStreams, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_inputStreams, "objectAtIndex:", self->_currentIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_streamEventTrigger
{
  uint64_t v2;
  void *v5;
  SLRequestBodyInputStream **p_selfReferenceDuringStreamEventTrigger;
  _BOOL4 openEventSent;
  unint64_t dataOffset;
  unint64_t dataLength;
  void (*clientCallback)(SLRequestBodyInputStream *, uint64_t, void *);
  void *info;
  SLRequestBodyInputStream *v12;
  uint64_t v13;
  void (*v14)(SLRequestBodyInputStream *, uint64_t, void *);
  void *v15;
  void *v16;
  void *v17;
  SLRequestBodyInputStream *v18;
  uint64_t v19;
  SLRequestBodyInputStream *v20;
  void *v21;
  SLRequestBodyInputStream *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dataOffset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dataLength);
  v23 = v5;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  _SLLog(v2, 7, CFSTR("SLRequestBodyInputStream %@ _streamEventTrigger _dataOffset %@ _dataLength %@"));

  p_selfReferenceDuringStreamEventTrigger = &self->_selfReferenceDuringStreamEventTrigger;
  objc_storeStrong((id *)&self->_selfReferenceDuringStreamEventTrigger, self);
  openEventSent = self->_openEventSent;
  if (self->_openEventSent)
  {
    dataOffset = self->_dataOffset;
    dataLength = self->_dataLength;
    if (dataOffset >= dataLength || self->_streamStatus == 6)
    {
      if (dataOffset != dataLength)
        goto LABEL_17;
      self->_streamStatus = 5;
      clientCallback = (void (*)(SLRequestBodyInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        v12 = self;
        v13 = 16;
LABEL_11:
        clientCallback(v12, v13, info);
        goto LABEL_17;
      }
      -[SLRequestBodyInputStream delegate](self, "delegate", self, v5, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = self;
      v19 = 16;
    }
    else
    {
      clientCallback = (void (*)(SLRequestBodyInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        v12 = self;
        v13 = 2;
        goto LABEL_11;
      }
      -[SLRequestBodyInputStream delegate](self, "delegate", self, v5, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = self;
      v19 = 2;
    }
    objc_msgSend(v16, "stream:handleEvent:", v18, v19);

  }
  else
  {
    v14 = (void (*)(SLRequestBodyInputStream *, uint64_t, void *))self->_clientCallback;
    if (v14)
    {
      v14(self, 1, self->_clientContext.info);
    }
    else
    {
      -[SLRequestBodyInputStream delegate](self, "delegate", self, v5, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stream:handleEvent:", self, 1);

    }
    self->_openEventSent = 1;
  }
LABEL_17:
  if (self->_dataOffset > self->_dataLength)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SLRequestBodyInputStream.m"), 140, CFSTR("sanity check for stream data"));

    if (openEventSent)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (!openEventSent)
LABEL_19:
    -[SLRequestBodyInputStream _scheduleCallback](self, "_scheduleCallback", v22, v23, v24);
LABEL_20:
  v20 = *p_selfReferenceDuringStreamEventTrigger;
  *p_selfReferenceDuringStreamEventTrigger = 0;

}

- (void)_scheduleCallback
{
  CFRunLoopSourceSignal(self->_rls);
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  __CFRunLoopSource *rls;
  void *v9;
  CFRunLoopSourceContext v10;

  rls = self->_rls;
  if (!rls)
  {
    v10.version = 0;
    memset(&v10.retain, 0, 56);
    v10.info = self;
    v10.perform = (void (__cdecl *)(void *))_streamEventTrigger;
    rls = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v10);
    self->_rls = rls;
    if (!rls)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SLRequestBodyInputStream.m"), 176, CFSTR("should be able to make run loop source"));

      rls = self->_rls;
    }
  }
  CFRunLoopAddSource(a3, rls, a4);
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  CFRunLoopRemoveSource(a3, self->_rls, a4);
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  $3FA37093598C0C5E3447A96743C089CD *p_clientContext;
  __int128 v8;
  __int128 v9;
  void (*retain)(void *, SEL, unint64_t);
  void (*release)(void *, SEL, unint64_t);

  p_clientContext = &self->_clientContext;
  if (a5)
  {
    v8 = *(_OWORD *)&a5->var0;
    v9 = *(_OWORD *)&a5->var2;
    self->_clientContext.copyDescription = a5->var4;
    *(_OWORD *)&p_clientContext->version = v8;
    *(_OWORD *)&self->_clientContext.retain = v9;
    retain = (void (*)(void *, SEL, unint64_t))self->_clientContext.retain;
    if (retain)
      retain(self->_clientContext.info, a2, a3);
  }
  else
  {
    release = (void (*)(void *, SEL, unint64_t))self->_clientContext.release;
    if (release)
      release(self->_clientContext.info, a2, a3);
    p_clientContext->copyDescription = 0;
    *(_OWORD *)&p_clientContext->version = 0u;
    *(_OWORD *)&p_clientContext->retain = 0u;
  }
  self->_clientCallback = a4;
  return 1;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v6;

  v6 = a4;
  -[SLRequestBodyInputStream _scheduleInCFRunLoop:forMode:](self, "_scheduleInCFRunLoop:forMode:", objc_msgSend(a3, "getCFRunLoop"), v6);

}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  id v6;

  v6 = a4;
  -[SLRequestBodyInputStream _unscheduleFromCFRunLoop:forMode:](self, "_unscheduleFromCFRunLoop:forMode:", objc_msgSend(a3, "getCFRunLoop"), v6);

}

- (void)open
{
  uint64_t v2;

  _SLLog(v2, 7, CFSTR("SLRequestBodyInputStream %@ open"));
  -[SLRequestBodyInputStream _scheduleCallback](self, "_scheduleCallback", self);
  self->_streamStatus = 2;
}

- (void)close
{
  uint64_t v2;
  __CFRunLoopSource *rls;

  _SLLog(v2, 7, CFSTR("SLRequestBodyInputStream %@ close"));
  rls = self->_rls;
  if (rls)
    CFRunLoopSourceInvalidate(rls);
  self->_streamStatus = 6;
}

- (id)streamError
{
  return 0;
}

- (unint64_t)streamStatus
{
  return self->_streamStatus;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v8;
  SLRequestMultiPartInputStream *v9;
  SLRequestMultiPartInputStream *currentStream;
  SLRequestMultiPartInputStream *v11;
  char *v12;
  void *v13;
  SLRequestBodyInputStream *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v16 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self;
  _SLLog(v4, 7, CFSTR("SLRequestBodyInputStream %@ read: %p maxLength: %@"));

  v8 = 0;
  if (a4)
  {
    while (self->_dataOffset + v8 < self->_dataLength)
    {
      if (!-[SLRequestMultiPartInputStream hasBytesAvailable](self->_currentStream, "hasBytesAvailable", v15, v16, v18))
      {
        _SLLog(v4, 6, CFSTR("SLRequestBodyInputStream %@ Current stream has no bytes, switching"));
        -[SLRequestMultiPartInputStream close](self->_currentStream, "close", self);
        -[SLRequestBodyInputStream nextStream](self, "nextStream");
        v9 = (SLRequestMultiPartInputStream *)objc_claimAutoreleasedReturnValue();
        currentStream = self->_currentStream;
        self->_currentStream = v9;

        v11 = self->_currentStream;
        if (!v11)
        {
          _SLLog(v4, 3, CFSTR("Bad state, current stream is nil"));
          break;
        }
        -[SLRequestMultiPartInputStream open](v11, "open");
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v4, 6, CFSTR("SLRequestBodyInputStream %@ read:maxLength: Will source bytes at offset %@"));

      v8 += -[SLRequestMultiPartInputStream read:maxLength:](self->_currentStream, "read:maxLength:", &a3[v8], a4 - v8, self, v17);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v16 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self;
      _SLLog(v4, 6, CFSTR("SLRequestBodyInputStream %@ read:maxLength: Total %@ bytes written to buffer, maxLen %@"));

      if (v8 >= a4)
        break;
    }
  }
  self->_dataOffset += v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dataLength);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 6, CFSTR("SLRequestBodyInputStream %@ read:maxLength: Total %@ bytes streamed, total length is %@"));

  -[SLRequestBodyInputStream _scheduleCallback](self, "_scheduleCallback", self, v13, v19);
  return v8;
}

- (unint64_t)totalBytes
{
  return self->_dataLength;
}

- (unint64_t)bytesRead
{
  return self->_dataOffset;
}

- (BOOL)hasBytesAvailable
{
  return self->_dataOffset < self->_dataLength;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (NSStreamDelegate)delegate
{
  return (NSStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selfReferenceDuringStreamEventTrigger, 0);
  objc_storeStrong((id *)&self->_currentStream, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
}

@end
