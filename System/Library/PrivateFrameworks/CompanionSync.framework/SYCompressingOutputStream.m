@implementation SYCompressingOutputStream

- (SYCompressingOutputStream)initWithDestinationStream:(id)a3
{
  id v5;
  SYCompressingOutputStream *v6;
  uint64_t v7;
  _SYZlibStreamInternal *internal;
  SYCompressingOutputStream *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYCompressingOutputStream;
  v6 = -[SYCompressingOutputStream init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    internal = v6->_internal;
    v6->_internal = (_SYZlibStreamInternal *)v7;

    objc_storeStrong((id *)&v6->_stream, a3);
    -[NSOutputStream setDelegate:](v6->_stream, "setDelegate:", v6);
    objc_storeWeak((id *)&v6->_internal->super._delegate, v6);
    v6->_level = -1;
    v9 = v6;
  }

  return v6;
}

- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4
{
  void *v5;
  SYCompressingOutputStream *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToBuffer:capacity:", a3, a4);
  v6 = -[SYCompressingOutputStream initWithDestinationStream:](self, "initWithDestinationStream:", v5);

  return v6;
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SYCompressedFileOutputStream *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  v7 = [SYCompressedFileOutputStream alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SYCompressedFileOutputStream initToCompressedFileAtURL:shouldAppend:](v7, "initToCompressedFileAtURL:shouldAppend:", v8, v4);
  return v9;
}

- (SYCompressingOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SYCompressingOutputStream *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[SYCompressedFileOutputStream initToCompressedFileAtURL:shouldAppend:]([SYCompressedFileOutputStream alloc], "initToCompressedFileAtURL:shouldAppend:", v6, v4);

  return v7;
}

- (id)initToMemory
{
  void *v3;
  SYCompressingOutputStream *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToMemory");
  v4 = -[SYCompressingOutputStream initWithDestinationStream:](self, "initWithDestinationStream:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SYCompressingOutputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SYCompressingOutputStream;
  -[SYCompressingOutputStream dealloc](&v3, sel_dealloc);
}

- (id)streamError
{
  return self->_internal->super._error;
}

- (unint64_t)streamStatus
{
  return self->_internal->super._status;
}

- (void)setCompressionLevel:(int64_t)a3
{
  if (!self->_internal->super._status)
    self->_level = a3;
}

- (unint64_t)inputBufferSize
{
  return self->_internal->_inputSize;
}

- (void)setInputBufferSize:(unint64_t)a3
{
  _SYZlibStreamInternal *internal;

  internal = self->_internal;
  if (!internal->super._status)
    internal->_inputSize = a3;
}

- (unint64_t)outputBufferSize
{
  return self->_internal->_outputSize;
}

- (void)setOutputBufferSize:(unint64_t)a3
{
  _SYZlibStreamInternal *internal;

  internal = self->_internal;
  if (!internal->super._status)
    internal->_outputSize = a3;
}

- (void)open
{
  if (!self->_internal->super._status)
  {
    if (!-[NSOutputStream streamStatus](self->_stream, "streamStatus"))
      -[NSOutputStream open](self->_stream, "open");
    self->_internal->super._status = 1;
  }
}

- (void)close
{
  _SYZlibStreamInternal *internal;
  uint64_t v4;
  unint64_t v5;
  void (**onClose)(id, SYCompressingOutputStream *);

  internal = self->_internal;
  if (internal->super._status - 6 >= 0xFFFFFFFFFFFFFFFBLL)
  {
    v4 = deflateEnd(&internal->_zStream);
    if ((v4 & 0x80000000) != 0)
    {
      -[_SYZlibStreamInternal setZlibError:forStream:](self->_internal, "setZlibError:forStream:", v4, self);
      v5 = 7;
    }
    else
    {
      v5 = 6;
    }
    -[NSOutputStream close](self->_stream, "close");
    self->_internal->super._status = v5;
    onClose = (void (**)(id, SYCompressingOutputStream *))self->_onClose;
    if (onClose)
      onClose[2](onClose, self);
  }
}

- (_SYStreamGuts)_internal
{
  return (_SYStreamGuts *)self->_internal;
}

- (void)_postEventToDelegate:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_internal->super._delegate);
  objc_msgSend(WeakRetained, "stream:handleEvent:", self, a3);

}

- (int)_handlePendingInput
{
  _SYZlibStreamInternal *internal;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internal = self->_internal;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SYCompressingOutputStream__handlePendingInput__block_invoke;
  v5[3] = &unk_24CC65440;
  v5[4] = self;
  v5[5] = &v6;
  -[_SYZlibStreamInternal synchronized:](internal, "synchronized:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__SYCompressingOutputStream__handlePendingInput__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = deflate((z_streamp)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) + 72), 2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 0x80000000) != 0)
  {
    objc_msgSend(*(id *)(v3 + 136), "close");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setZlibError:forStream:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  else
  {
    v4 = *(_QWORD *)(v3 + 144);
    if (!*(_DWORD *)(v4 + 80))
    {
      *(_QWORD *)(v4 + 72) = *(_QWORD *)(v4 + 200);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) + 80) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) + 216) = 0;
    }
  }
  return result;
}

- (void)_dispatchMyEvent:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;

  switch(a3)
  {
    case 1uLL:
      v4 = 152;
      goto LABEL_8;
    case 2uLL:
      v4 = 160;
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      v4 = 168;
      goto LABEL_8;
    case 8uLL:
      v4 = 184;
      goto LABEL_8;
    default:
      if (a3 != 16)
        return;
      v4 = 176;
LABEL_8:
      v5 = *(uint64_t *)((char *)&self->super.super.super.isa + v4);
      if (v5)
        (*(void (**)(uint64_t, SYCompressingOutputStream *))(v5 + 16))(v5, self);
      return;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  SYCompressingOutputStream *v6;
  SYCompressingOutputStream *v7;
  uint64_t v8;
  _SYZlibStreamInternal *v9;
  _BOOL4 v10;
  int v11;
  _SYZlibStreamInternal *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _SYZlibStreamInternal *internal;
  NSError *error;
  _SYZlibStreamInternal *v18;
  uint64_t v19;
  _SYZlibStreamInternal *v20;
  SYCompressingOutputStream *v21;
  int v22;
  uint64_t v23;
  SYCompressingOutputStream *v24;
  SYCompressingOutputStream *v25;

  v6 = (SYCompressingOutputStream *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v25 = v6;
    -[SYCompressingOutputStream _dispatchMyEvent:](v6, "_dispatchMyEvent:", a4);
LABEL_13:
    v7 = v25;
    goto LABEL_14;
  }
  if ((SYCompressingOutputStream *)self->_stream != v6)
    goto LABEL_14;
  if ((uint64_t)a4 > 7)
  {
    if (a4 != 8)
    {
      if (a4 != 16)
        goto LABEL_14;
      goto LABEL_25;
    }
    v25 = v6;
    -[SYCompressingOutputStream streamError](v6, "streamError");
    v15 = objc_claimAutoreleasedReturnValue();
    internal = self->_internal;
    error = internal->super._error;
    internal->super._error = (NSError *)v15;

    self->_internal->super._status = 7;
    -[NSOutputStream close](self->_stream, "close");
    v18 = self->_internal;
    v19 = 8;
    goto LABEL_35;
  }
  if (a4 == 1)
  {
    v25 = v6;
    v12 = self->_internal;
    if (v12->super._status == 1)
    {
      v13 = deflateInit2_(&v12->_zStream, self->_level, 8, 31, 8, 0, "1.2.12", 112);
      if ((_DWORD)v13)
      {
        v14 = v13;
        -[NSOutputStream close](self->_stream, "close");
        -[_SYZlibStreamInternal setZlibError:forStream:](self->_internal, "setZlibError:forStream:", v14, self);
        goto LABEL_13;
      }
      v12 = self->_internal;
    }
    v12->super._status = 2;
    -[_SYStreamGuts postStreamEvent:forStream:](self->_internal, "postStreamEvent:forStream:", 1, self);
    v23 = -[_SYZlibStreamInternal inputRoom](self->_internal, "inputRoom");
    v7 = v25;
    if (v23 < 1)
      goto LABEL_14;
    v18 = self->_internal;
    v19 = 4;
LABEL_35:
    v21 = self;
LABEL_36:
    -[_SYStreamGuts postStreamEvent:forStream:](v18, "postStreamEvent:forStream:", v19, v21);
    goto LABEL_13;
  }
  if (a4 == 4)
  {
    v24 = v6;
    if (-[_SYZlibStreamInternal outputAvailable](self->_internal, "outputAvailable")
      || !self->_internal->_zStream.avail_in
      || (v22 = -[SYCompressingOutputStream _handlePendingInput](self, "_handlePendingInput"),
          v7 = v24,
          (v22 & 0x80000000) == 0))
    {
      while (1)
      {
        v8 = -[_SYZlibStreamInternal outputAvailable](self->_internal, "outputAvailable");
        v9 = self->_internal;
        if (v8 < 1)
          break;
        -[_SYZlibStreamInternal readOutputToStream:](v9, "readOutputToStream:", self->_stream);
        v10 = -[NSOutputStream hasSpaceAvailable](self->_stream, "hasSpaceAvailable");
        v9 = self->_internal;
        if (!v10 || !v9->_zStream.avail_in)
          break;
        v11 = -[SYCompressingOutputStream _handlePendingInput](self, "_handlePendingInput");
        v7 = v24;
        if (v11 < 0)
          goto LABEL_14;
      }
      if (-[_SYZlibStreamInternal inputRoom](v9, "inputRoom") >= 1)
        -[_SYStreamGuts postStreamEvent:forStream:](self->_internal, "postStreamEvent:forStream:", 4, self);
      v7 = v24;
LABEL_25:
      v20 = self->_internal;
      if (v20->super._status == 5 || v20->_zStream.total_out || v20->_zStream.avail_in)
        goto LABEL_14;
      v20->super._status = 5;
      v18 = self->_internal;
      v19 = 16;
      v21 = self;
      v25 = v7;
      goto LABEL_36;
    }
  }
LABEL_14:

}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  __CFString *v6;
  _SYZlibStreamInternal *internal;
  __CFRunLoop *v8;
  __CFRunLoopSource *runloopSource;
  const __CFString *v10;
  id v11;

  v11 = a3;
  v6 = (__CFString *)a4;
  -[NSOutputStream scheduleInRunLoop:forMode:](self->_stream, "scheduleInRunLoop:forMode:", v11, v6);
  internal = self->_internal;
  if (!internal->super._runloopSource)
    -[_SYStreamGuts createRunloopSourceForStream:](internal, "createRunloopSourceForStream:", self);
  v8 = (__CFRunLoop *)objc_msgSend(v11, "getCFRunLoop");
  runloopSource = self->_internal->super._runloopSource;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x24BDBCA90]))
    v10 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  else
    v10 = v6;
  CFRunLoopAddSource(v8, runloopSource, v10);

}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  __CFString *v6;
  __CFRunLoop *v7;
  __CFRunLoopSource *runloopSource;
  const __CFString *v9;
  id v10;

  v10 = a3;
  v6 = (__CFString *)a4;
  -[NSOutputStream removeFromRunLoop:forMode:](self->_stream, "removeFromRunLoop:forMode:", v10, v6);
  if (self->_internal->super._runloopSource)
  {
    v7 = (__CFRunLoop *)objc_msgSend(v10, "getCFRunLoop");
    runloopSource = self->_internal->super._runloopSource;
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x24BDBCA90]))
      v9 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    else
      v9 = v6;
    CFRunLoopRemoveSource(v7, runloopSource, v9);
  }

}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  _SYZlibStreamInternal *internal;
  int64_t v8;
  NSProgress *progress;

  if (!-[_SYZlibStreamInternal inputRoom](self->_internal, "inputRoom"))
    return 0;
  internal = self->_internal;
  if (internal->super._status != 2)
    return 0;
  internal->super._status = 4;
  v8 = -[_SYZlibStreamInternal writeInputFromBuffer:length:](self->_internal, "writeInputFromBuffer:length:", a3, a4);
  self->_internal->super._status = 2;
  if (-[NSOutputStream hasSpaceAvailable](self->_stream, "hasSpaceAvailable"))
    -[SYCompressingOutputStream stream:handleEvent:](self, "stream:handleEvent:", self->_stream, 4);
  if (v8 >= 1)
  {
    self->_byteCount += v8;
    progress = self->_progress;
    if (progress)
      -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
  }
  return v8;
}

- (BOOL)hasSpaceAvailable
{
  return -[_SYZlibStreamInternal inputRoom](self->_internal, "inputRoom") > 0;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSOutputStream propertyForKey:](self->_stream, "propertyForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_SYStreamGuts propertyForKey:](self->_internal, "propertyForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  if ((-[NSOutputStream setProperty:forKey:](self->_stream, "setProperty:forKey:", v6, v7) & 1) == 0)
    -[_SYStreamGuts storeProperty:forKey:](self->_internal, "storeProperty:forKey:", v6, v7);

  return 1;
}

- (id)onOpenComplete
{
  return self->_onOpenComplete;
}

- (void)setOnOpenComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)onBytesAvailable
{
  return self->_onBytesAvailable;
}

- (void)setOnBytesAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)onSpaceAvailable
{
  return self->_onSpaceAvailable;
}

- (void)setOnSpaceAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)onEndOfFile
{
  return self->_onEndOfFile;
}

- (void)setOnEndOfFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)onError
{
  return self->_onError;
}

- (void)setOnError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)onClose
{
  return self->_onClose;
}

- (void)setOnClose:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (unint64_t)bytesThroughput
{
  return self->_byteCount;
}

- (int64_t)compressionLevel
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_onClose, 0);
  objc_storeStrong(&self->_onError, 0);
  objc_storeStrong(&self->_onEndOfFile, 0);
  objc_storeStrong(&self->_onSpaceAvailable, 0);
  objc_storeStrong(&self->_onBytesAvailable, 0);
  objc_storeStrong(&self->_onOpenComplete, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
