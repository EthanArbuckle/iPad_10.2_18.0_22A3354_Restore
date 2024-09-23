@implementation SYDecompressingInputStream

- (SYDecompressingInputStream)initWithCompressedDataStream:(id)a3
{
  id v5;
  SYDecompressingInputStream *v6;
  uint64_t v7;
  _SYZlibStreamInternal *internal;
  SYDecompressingInputStream *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYDecompressingInputStream;
  v6 = -[SYDecompressingInputStream init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    internal = v6->_internal;
    v6->_internal = (_SYZlibStreamInternal *)v7;

    objc_storeStrong((id *)&v6->_stream, a3);
    v6->_internal->super._status = 0;
    objc_msgSend(v5, "setDelegate:", v6);
    -[SYDecompressingInputStream setDelegate:](v6, "setDelegate:", v6);
    v9 = v6;
  }

  return v6;
}

- (SYDecompressingInputStream)initWithData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  SYDecompressingInputStream *v7;

  v4 = (objc_class *)MEMORY[0x24BDBCE90];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  v7 = -[SYDecompressingInputStream initWithCompressedDataStream:](self, "initWithCompressedDataStream:", v6);
  return v7;
}

- (SYDecompressingInputStream)initWithURL:(id)a3
{
  id v4;
  SYCompressedFileInputStream *v5;
  uint64_t v6;
  SYDecompressingInputStream *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isFileURL"))
  {
    v5 = -[SYCompressedFileInputStream initWithCompressedFileAtURL:]([SYCompressedFileInputStream alloc], "initWithCompressedFileAtURL:", v4);
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithURL:", v4);

    if (!v6)
    {
      v7 = 0;
      v4 = 0;
      goto LABEL_7;
    }
    v5 = -[SYDecompressingInputStream initWithCompressedDataStream:](self, "initWithCompressedDataStream:", v6);
    self = (SYDecompressingInputStream *)v5;
    v4 = (id)v6;
  }
  v7 = (SYDecompressingInputStream *)v5;
LABEL_7:

  return v7;
}

- (SYDecompressingInputStream)initWithFileAtPath:(id)a3
{
  id v4;
  SYCompressedFileInputStream *v5;
  void *v6;
  SYDecompressingInputStream *v7;

  v4 = a3;
  v5 = [SYCompressedFileInputStream alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SYCompressedFileInputStream initWithCompressedFileAtURL:](v5, "initWithCompressedFileAtURL:", v6);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SYDecompressingInputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SYDecompressingInputStream;
  -[SYDecompressingInputStream dealloc](&v3, sel_dealloc);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_internal->super._delegate);
}

- (void)setDelegate:(id)a3
{
  SYDecompressingInputStream *v4;
  SYDecompressingInputStream *v5;

  v4 = (SYDecompressingInputStream *)a3;
  if (!v4)
    v4 = self;
  v5 = v4;
  objc_storeWeak((id *)&self->_internal->super._delegate, v4);

}

- (id)streamError
{
  return self->_internal->super._error;
}

- (unint64_t)streamStatus
{
  return self->_internal->super._status;
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
  _SYZlibStreamInternal *internal;

  internal = self->_internal;
  if (!internal->super._status)
  {
    internal->super._status = 1;
    if (!-[NSInputStream streamStatus](self->_stream, "streamStatus"))
      -[NSInputStream open](self->_stream, "open");
  }
}

- (void)close
{
  _SYZlibStreamInternal *internal;
  unint64_t status;
  BOOL v4;
  uint64_t v6;
  unint64_t v7;
  void (**onClose)(id, SYDecompressingInputStream *);

  internal = self->_internal;
  status = internal->super._status;
  if (status)
    v4 = status == 6;
  else
    v4 = 1;
  if (!v4)
  {
    v6 = inflateEnd(&internal->_zStream);
    if ((v6 & 0x80000000) != 0)
    {
      -[_SYZlibStreamInternal setZlibError:forStream:](self->_internal, "setZlibError:forStream:", v6, self);
      v7 = 7;
    }
    else
    {
      v7 = 6;
    }
    -[NSInputStream close](self->_stream, "close");
    self->_internal->super._status = v7;
    onClose = (void (**)(id, SYDecompressingInputStream *))self->_onClose;
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
        (*(void (**)(uint64_t, SYDecompressingInputStream *))(v5 + 16))(v5, self);
      return;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  SYDecompressingInputStream *v6;
  SYDecompressingInputStream *v7;
  int64_t v8;
  _SYZlibStreamInternal *v9;
  _SYZlibStreamInternal *v10;
  _SYZlibStreamInternal *v11;
  uint64_t v12;
  _SYZlibStreamInternal *v13;
  _SYZlibStreamInternal *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _SYZlibStreamInternal *internal;
  NSError *error;
  _QWORD v20[6];

  v6 = (SYDecompressingInputStream *)a3;
  v7 = v6;
  if (v6 == self)
  {
    -[SYDecompressingInputStream _dispatchMyEvent:](v6, "_dispatchMyEvent:", a4);
  }
  else if ((SYDecompressingInputStream *)self->_stream == v6)
  {
    if ((uint64_t)a4 > 7)
    {
      if (a4 == 8)
      {
        -[SYDecompressingInputStream streamError](v6, "streamError");
        v17 = objc_claimAutoreleasedReturnValue();
        internal = self->_internal;
        error = internal->super._error;
        internal->super._error = (NSError *)v17;

        self->_internal->super._status = 7;
        -[NSInputStream close](self->_stream, "close");
        v11 = self->_internal;
        v12 = 8;
        goto LABEL_24;
      }
      if (a4 == 16)
      {
        v13 = self->_internal;
        if (v13->super._status != 5 && !v13->_zStream.total_out && !v13->_zStream.avail_in)
        {
          v13->super._status = 5;
          v11 = self->_internal;
          v12 = 16;
          goto LABEL_24;
        }
      }
    }
    else
    {
      if (a4 == 1)
      {
        v14 = self->_internal;
        if (v14->super._status == 1)
        {
          v15 = inflateInit2_(&v14->_zStream, 47, "1.2.12", 112);
          if ((_DWORD)v15)
          {
            v16 = v15;
            -[NSInputStream close](self->_stream, "close");
            -[_SYZlibStreamInternal setZlibError:forStream:](self->_internal, "setZlibError:forStream:", v16, self);
            goto LABEL_11;
          }
          v14 = self->_internal;
        }
        v14->super._status = 2;
        v11 = self->_internal;
        v12 = 1;
        goto LABEL_24;
      }
      if (a4 == 2)
      {
        if (-[_SYZlibStreamInternal inputRoom](self->_internal, "inputRoom"))
        {
          v8 = -[_SYZlibStreamInternal writeInputFromStream:](self->_internal, "writeInputFromStream:", self->_stream);
          v9 = self->_internal;
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __49__SYDecompressingInputStream_stream_handleEvent___block_invoke;
          v20[3] = &unk_24CC653F0;
          v20[4] = self;
          v20[5] = v8;
          -[_SYZlibStreamInternal synchronized:](v9, "synchronized:", v20);
          v10 = self->_internal;
          if (v10->super._status != 7 && -[_SYZlibStreamInternal outputAvailable](v10, "outputAvailable") >= 1)
          {
            v11 = self->_internal;
            v12 = 2;
LABEL_24:
            -[_SYStreamGuts postStreamEvent:forStream:](v11, "postStreamEvent:forStream:", v12, self);
          }
        }
      }
    }
  }
LABEL_11:

}

uint64_t __49__SYDecompressingInputStream_stream_handleEvent___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  if (*(uint64_t *)(result + 40) > 0
    && (result = inflate((z_streamp)(*(_QWORD *)(*(_QWORD *)(result + 32) + 144) + 72), 2),
        (result & 0x80000000) != 0))
  {
    v3 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 136), "close");
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 144), "setZlibError:forStream:", v3);
  }
  else
  {
    v2 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 144);
    if (!*(_DWORD *)(v2 + 80))
    {
      *(_QWORD *)(v2 + 72) = *(_QWORD *)(v2 + 200);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 144) + 216) = 0;
    }
  }
  return result;
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
  -[NSInputStream scheduleInRunLoop:forMode:](self->_stream, "scheduleInRunLoop:forMode:", v11, v6);
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
  NSInputStream *stream;
  id v7;
  __CFRunLoop *v8;
  __CFRunLoopSource *runloopSource;
  const __CFString *v10;
  __CFString *v11;

  v11 = (__CFString *)a4;
  stream = self->_stream;
  v7 = a3;
  -[NSInputStream removeFromRunLoop:forMode:](stream, "removeFromRunLoop:forMode:", v7, v11);
  v8 = (__CFRunLoop *)objc_msgSend(v7, "getCFRunLoop");

  runloopSource = self->_internal->super._runloopSource;
  if (-[__CFString isEqualToString:](v11, "isEqualToString:", *MEMORY[0x24BDBCA90]))
    v10 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  else
    v10 = v11;
  CFRunLoopRemoveSource(v8, runloopSource, v10);

}

- (void)_handlePendingInput
{
  _SYZlibStreamInternal *internal;
  _QWORD v3[5];

  internal = self->_internal;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__SYDecompressingInputStream__handlePendingInput__block_invoke;
  v3[3] = &unk_24CC65418;
  v3[4] = self;
  -[_SYZlibStreamInternal synchronized:](internal, "synchronized:", v3);
}

uint64_t __49__SYDecompressingInputStream__handlePendingInput__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) + 72;
  if (*(_DWORD *)(result + 8))
  {
    v3 = inflate((z_streamp)result, 2);
    result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
    if (v3 < 0)
    {
      objc_msgSend((id)result, "setZlibError:forStream:");
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "close");
    }
    else if (!*(_DWORD *)(result + 80))
    {
      *(_QWORD *)(result + 72) = *(_QWORD *)(result + 200);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) + 216) = 0;
    }
  }
  return result;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  _SYZlibStreamInternal *internal;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v13;
  uint64_t v14;
  _SYZlibStreamInternal *v16;
  NSProgress *progress;

  internal = self->_internal;
  if (internal->super._status != 2)
    return 0;
  v8 = -[_SYZlibStreamInternal outputAvailable](internal, "outputAvailable");
  if (!v8)
    return 0;
  v9 = v8;
  self->_internal->super._status = 3;
  v10 = 0;
  if (v8 < 1 || a4 == 0)
  {
    if (v8 <= 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  do
  {
    v13 = -[_SYZlibStreamInternal readOutputToBuffer:length:](self->_internal, "readOutputToBuffer:length:", &a3[v10], a4);
    if (v13 == v9)
      -[SYDecompressingInputStream _handlePendingInput](self, "_handlePendingInput");
    -[_SYZlibStreamInternal setStatusForStream:](self->_internal, "setStatusForStream:", self->_stream);
    v10 += v13;
    a4 -= v13;
    v14 = -[_SYZlibStreamInternal outputAvailable](self->_internal, "outputAvailable");
    v9 = v14;
  }
  while (v14 >= 1 && a4 != 0);
  if (!v14)
  {
    if (-[NSInputStream hasBytesAvailable](self->_stream, "hasBytesAvailable"))
      -[SYDecompressingInputStream stream:handleEvent:](self, "stream:handleEvent:", self->_stream, 2);
    goto LABEL_22;
  }
  if (v14 >= 1)
LABEL_21:
    -[_SYStreamGuts postStreamEvent:forStream:](self->_internal, "postStreamEvent:forStream:", 2, self);
LABEL_22:
  v16 = self->_internal;
  if (v16->super._status == 3)
    v16->super._status = 2;
  if (v10 >= 1)
  {
    self->_byteCount += v10;
    progress = self->_progress;
    if (progress)
      -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
  }
  return v10;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return -[_SYZlibStreamInternal outputAvailable](self->_internal, "outputAvailable") > 0;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSInputStream propertyForKey:](self->_stream, "propertyForKey:", v4);
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
  if ((-[NSInputStream setProperty:forKey:](self->_stream, "setProperty:forKey:", v6, v7) & 1) == 0)
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
