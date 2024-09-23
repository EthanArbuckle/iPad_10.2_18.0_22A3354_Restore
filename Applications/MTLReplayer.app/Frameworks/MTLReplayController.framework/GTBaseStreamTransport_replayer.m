@implementation GTBaseStreamTransport_replayer

- (GTBaseStreamTransport_replayer)init
{
  id v2;
  vm_address_t v3;
  vm_address_t v4;
  const char *v5;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GTBaseStreamTransport_replayer;
  v2 = -[GTTransport_replayer init](&v8, "init");
  if (v2)
  {
    v3 = GTCoreAlloc(0x31uLL);
    *((_QWORD *)v2 + 13) = v3;
    if (v3)
    {
      *(_QWORD *)(v3 + 24) = 0x1000000001;
      *(_OWORD *)(v3 + 32) = xmmword_4AA500;
      *(_BYTE *)(v3 + 48) = 0;
      v4 = GTCoreAlloc(0x31uLL);
      *((_QWORD *)v2 + 28) = v4;
      if (v4)
      {
        *(_QWORD *)(v4 + 24) = 0x100000001;
        *(_OWORD *)(v4 + 32) = xmmword_4AA500;
        *(_BYTE *)(v4 + 48) = 0;
        v5 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v2)), v2, CFSTR("relay")), "UTF8String");
        *((_QWORD *)v2 + 27) = dispatch_queue_create_with_target_V2(v5, 0, *((dispatch_queue_t *)v2 + 2));
        *((_QWORD *)v2 + 26) = dispatch_semaphore_create(1);
        return (GTBaseStreamTransport_replayer *)v2;
      }
      v7 = "_relayTmu";
    }
    else
    {
      v7 = "_tmu";
    }
    __assert_rtn("-[GTBaseStreamTransport init]", ", 0, v7);
  }
  return (GTBaseStreamTransport_replayer *)v2;
}

- (void)dealloc
{
  NSObject *sendSema;
  NSObject *relayQueue;
  objc_super v5;

  sendSema = self->_sendSema;
  if (sendSema)
  {
    dispatch_release(sendSema);
    self->_sendSema = 0;
  }
  relayQueue = self->_relayQueue;
  if (relayQueue)
  {
    dispatch_release(relayQueue);
    self->_relayQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GTBaseStreamTransport_replayer;
  -[GTTransport_replayer dealloc](&v5, "dealloc");
}

- (void)_invalidate
{
  objc_super v3;

  if (self)
  {
    vm_deallocate(mach_task_self_, (vm_address_t)self->_relayTmu, 0x31uLL);
    self->_relayTmu = 0;
    vm_deallocate(mach_task_self_, (vm_address_t)self->_tmu, 0x31uLL);
    self->_tmu = 0;
  }

  self->_messageBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)GTBaseStreamTransport_replayer;
  -[GTTransport_replayer _invalidate](&v3, "_invalidate");
}

- (void)_scheduleInvalidation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GTBaseStreamTransport_replayer;
  -[GTTransport_replayer _scheduleInvalidation:](&v4, "_scheduleInvalidation:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  -[GTBaseStreamTransport_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  -[GTBaseStreamTransport_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)_waitEAGAIN
{
  usleep(0x64u);
}

- (int64_t)_syncTmuToHeader:(dy_transport_message_unpack_s *)a3 ioBlock:(id)a4
{
  int64_t result;
  __int128 v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;

  result = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  if (result != -1 && !a3->var3)
  {
    a3->var5 = 1;
    v7 = *(_OWORD *)&a3->var0.var0;
    *(int8x16_t *)&a3->var0.var0 = vrev32q_s8(*(int8x16_t *)&a3->var0.var0);
    v8 = bswap32(a3->var0.var4);
    v9 = bswap32(a3->var0.var5);
    a3->var0.var4 = v8;
    a3->var0.var5 = v9;
    if ((_DWORD)v7 == 1296389188)
    {
      a3->var3 = (v9 & 0x7FFFFFFF) + (v8 & 0x7FFFFFFF);
      a3->var4 = 0;
      if (self->_tmu->var3 + self->_tmu->var1 - 1 + self->_tmu->var2 - 1 < 0xF4240001)
        return result;
      v10 = objc_autoreleasePoolPush();
      v11 = 261;
    }
    else
    {
      v10 = objc_autoreleasePoolPush();
      v11 = 259;
    }
    -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v11, 0));
    objc_autoreleasePoolPop(v10);
    return -1;
  }
  return result;
}

- (void)_unpackAndDispatchMessage
{
  void *v3;
  uint64_t v4;
  id v5;
  dy_transport_message_unpack_s *tmu;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  unsigned int var5;
  id v12;
  int v13;
  GTTransportMessage_replayer *v14;
  GTVMBuffer *messageBuffer;
  uint64_t v16;
  uint64_t v17;
  vm_address_t *v18;
  dy_transport_message_unpack_s *v19;

  v3 = objc_autoreleasePoolPush();
  v4 = self->_tmu->var0.var4 & 0x7FFFFFFF;
  v5 = -[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes");
  tmu = self->_tmu;
  v7 = ((unint64_t)v5 + tmu->var1 - 1) & -(uint64_t)tmu->var1;
  if ((tmu->var0.var4 & 0x80000000) != 0)
  {
    v10 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", objc_msgSend(-[GTVMBuffer subdataWithRange:](self->_messageBuffer, "subdataWithRange:", v7 - (_QWORD)-[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"), v4), "GTGPUToolsData"), 0, 0, 0);
    if (!v10)
    {
      -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 260, 0));
      objc_autoreleasePoolPop(v3);
      return;
    }
    v8 = v10;
    v9 = (v4 + 24);
    tmu = self->_tmu;
  }
  else
  {
    v8 = 0;
    v9 = 24;
  }
  var5 = tmu->var0.var5;
  if ((var5 & 0x80000000) != 0)
  {
    v13 = var5 & 0x7FFFFFFF;
    v12 = objc_msgSend(-[GTVMBuffer subdataWithRange:](self->_messageBuffer, "subdataWithRange:", ((v7 + v4 + tmu->var2 - 1) & -(uint64_t)tmu->var2)- (_QWORD)-[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"), var5 & 0x7FFFFFFF), "GTGPUToolsData");
    v9 = (v13 + v9);
    tmu = self->_tmu;
  }
  else
  {
    v12 = 0;
  }
  v14 = -[GTTransportMessage_replayer initWithKind:attributes:payload:]([GTTransportMessage_replayer alloc], "initWithKind:attributes:payload:", tmu->var0.var1, v8, v12);
  -[GTTransportMessage_replayer _setSerial:replySerial:transport:](v14, "_setSerial:replySerial:transport:", self->_tmu->var0.var2, self->_tmu->var0.var3, self);
  -[GTTransportMessage_replayer _setTransportSize:](v14, "_setTransportSize:", v9);
  objc_autoreleasePoolPop(v3);
  messageBuffer = self->_messageBuffer;
  v17 = objc_opt_class(GTVMBuffer_replayer, v16);
  if ((objc_opt_isKindOfClass(messageBuffer, v17) & 1) != 0)
  {
    v18 = (vm_address_t *)-[GTVMBuffer vmBuffer](self->_messageBuffer, "vmBuffer");
    vm_protect(mach_task_self_, *v18, v18[2] * v18[1], 0, 1);
  }

  self->_messageBuffer = 0;
  -[GTTransport_replayer _dispatchMessage:](self, "_dispatchMessage:", v14);

  v19 = self->_tmu;
  *(_OWORD *)&v19->var3 = xmmword_4AA500;
  v19->var5 = 0;
}

- (void)_allocateMessageBuffer
{
  dy_transport_message_unpack_s *tmu;
  vm_size_t v3;
  Class *v5;
  GTVMBuffer *v6;
  const char *v7;

  tmu = self->_tmu;
  if (!tmu->var5)
  {
    v7 = "_tmu->hasHeader";
    goto LABEL_11;
  }
  v3 = tmu->var3 + tmu->var1 - 1 + tmu->var2 - 1;
  if (v3 >= 0xF4240001)
  {
    v7 = "size_aligned <= MAXIMUM_MESSAGE_SIZE";
    goto LABEL_11;
  }

  if (v3 >= 3 * vm_page_size)
    v5 = (Class *)&off_4D45F0;
  else
    v5 = (Class *)NSMutableData_ptr;
  v6 = (GTVMBuffer *)objc_msgSend(objc_alloc(*v5), "initWithLength:", v3);
  self->_messageBuffer = v6;
  if (!v6)
  {
    v7 = "_messageBuffer != nil";
LABEL_11:
    __assert_rtn("-[GTBaseStreamTransport _allocateMessageBuffer]", ", 0, v7);
  }
}

- (int64_t)_performRead:(void *)a3 size:(unint64_t)a4
{
  int64_t result;
  int v7;
  void *v8;
  void *v9;
  dy_transport_message_unpack_s *tmu;
  int64_t v11;

  if (!self->_bytesToRead)
    self->_bytesToRead = a4;
  do
  {
    result = -[GTBaseStreamTransport_replayer _read:size:](self, "_read:size:", a3, self->_bytesToRead);
    if (result != -1)
    {
      if (result)
      {
        tmu = self->_tmu;
        v11 = tmu->var4 + result;
        tmu->var3 -= result;
        tmu->var4 = v11;
        self->_bytesToRead = 0;
      }
      else
      {
        v9 = objc_autoreleasePoolPush();
        -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 31, 0));
        objc_autoreleasePoolPop(v9);
        return 0;
      }
      return result;
    }
    v7 = *__error();
  }
  while (v7 == 4);
  if (v7 != 35)
  {
    v8 = objc_autoreleasePoolPush();
    -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 31, 0));
    objc_autoreleasePoolPop(v8);
  }
  *__error() = v7;
  return -1;
}

- (int64_t)_readAndAccumulate
{
  dy_transport_message_unpack_s *tmu;
  int64_t v4;
  unint64_t var4;
  unint64_t v6;
  unint64_t var3;
  dy_transport_message_unpack_s *v8;
  id v9;
  uint64_t var1;
  int64_t v11;

  if (LOBYTE(self->super._interposerVersion))
    return -1;
  tmu = self->_tmu;
  if (tmu->var5)
  {
    v4 = 0;
  }
  else
  {
    v4 = -[GTBaseStreamTransport_replayer _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
    if (v4 == -1)
      return v4;
    v8 = self->_tmu;
    if (!v8->var5)
      return v4;
    if (!v8->var3)
    {
LABEL_16:
      -[GTBaseStreamTransport_replayer _unpackAndDispatchMessage](self, "_unpackAndDispatchMessage");
      return v4;
    }
    -[GTBaseStreamTransport_replayer _allocateMessageBuffer](self, "_allocateMessageBuffer");
    v9 = -[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes");
    var1 = self->_tmu->var1;
    self->_messageBufferWritePtr = (void *)(((unint64_t)v9 + var1 - 1) & -var1);
    tmu = self->_tmu;
    if (!tmu->var5)
      return v4;
  }
  var4 = tmu->var4;
  v6 = tmu->var0.var4 & 0x7FFFFFFF;
  var3 = v6 - var4;
  if (v6 <= var4)
  {
    if (v6 == var4)
    {
      self->_messageBufferWritePtr = (void *)(((uint64_t)self->_messageBufferWritePtr + tmu->var2 - 1) & -(uint64_t)tmu->var2);
      var3 = self->_tmu->var3;
    }
    else
    {
      var3 = tmu->var3;
    }
  }
  v11 = -[GTBaseStreamTransport_replayer _performRead:size:](self, "_performRead:size:", self->_messageBufferWritePtr, var3);
  if (v11 == -1)
    return -1;
  v4 += v11;
  self->_messageBufferWritePtr = (char *)self->_messageBufferWritePtr + v11;
  if (!self->_tmu->var3)
    goto LABEL_16;
  return v4;
}

- (void)_clearBuffers
{
  uint64_t v2;
  NSData **buffers;

  v2 = 0;
  buffers = self->_buffers;
  do
  {

    buffers[v2++] = 0;
  }
  while (v2 != 3);
}

- (int64_t)_writeBuffers:(id *)a3
{
  uint64_t v5;
  int64_t v6;
  int v7;
  NSData **buffers;
  NSData *v9;
  iovec *v10;
  NSUInteger v11;
  uint64_t v12;
  iovec *iov;
  int v14;
  unint64_t v15;
  int *v16;
  int v17;
  uint64_t v18;
  size_t *p_iov_len;
  size_t v20;
  unint64_t v21;
  NSError *v22;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  buffers = self->_buffers;
  do
  {
    v9 = buffers[v5];
    if (v9)
    {
      v10 = &self->_iov[v7];
      v10->iov_base = (void *)-[NSData bytes](v9, "bytes");
      v11 = -[NSData length](buffers[v5], "length");
      v10->iov_len = v11;
      v6 += v11;
      ++v7;
    }
    ++v5;
  }
  while (v5 != 3);
  if (v6)
  {
    v12 = 0;
    iov = self->_iov;
    v14 = v7;
    while (1)
    {
      do
      {
        while (1)
        {
          v15 = -[GTBaseStreamTransport_replayer _write:size:](self, "_write:size:", iov->iov_base, iov->iov_len);
          v16 = __error();
          if (v15 == -1)
            break;
          v12 += v15;
          if (v12 == v6)
            goto LABEL_25;
          if (v14 < 1)
          {
            LODWORD(v18) = 0;
          }
          else
          {
            v18 = 0;
            p_iov_len = &iov->iov_len;
            while (1)
            {
              v20 = *p_iov_len;
              v21 = v15 - *p_iov_len;
              if (v15 < *p_iov_len)
                break;
              ++v18;
              p_iov_len += 2;
              v15 = v21;
              if (v14 == v18)
              {
                LODWORD(v18) = v14;
                goto LABEL_20;
              }
            }
            iov[v18].iov_base = (char *)iov[v18].iov_base + v15;
            *p_iov_len = v20 - v15;
          }
LABEL_20:
          iov += v18;
          v14 = v7 - ((unint64_t)((char *)iov - (char *)self->_iov) >> 4);
        }
        v17 = *v16;
      }
      while (*v16 == 4);
      if (v17 != 35)
        break;
      if (LOBYTE(self->super._interposerVersion))
      {
        if (a3)
          *a3 = -[GTTransport_replayer error](self, "error");
        goto LABEL_24;
      }
      -[GTBaseStreamTransport_replayer _waitEAGAIN](self, "_waitEAGAIN");
    }
    v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, 0);
    -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", v22);
    if (a3)
      *a3 = v22;
    *__error() = v17;
LABEL_24:
    v6 = -1;
  }
LABEL_25:
  -[GTBaseStreamTransport_replayer _clearBuffers](self, "_clearBuffers");
  return v6;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  void *v6;
  NSData *v7;
  NSData *v8;
  id v9;
  unsigned int v10;
  BOOL result;
  id v12;
  NSDictionary *v13;
  id v14;

  if (objc_msgSend(a3, "attributes"))
  {
    v14 = 0;
    v6 = objc_autoreleasePoolPush();
    v7 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", objc_msgSend(a3, "attributes"), 200, 0, &v14);
    v8 = v7;
    v9 = v14;
    objc_autoreleasePoolPop(v6);
    if (!v7)
    {
      if (a4)
      {
        v13 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v14, NSUnderlyingErrorKey);

        *a4 = +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 36, v13);
      }
      return 0;
    }
    objc_msgSend(a3, "setEncodedAttributes:", v7);

  }
  else
  {
    v7 = 0;
  }
  v10 = -[NSData length](v7, "length");
  if (v10 + objc_msgSend(objc_msgSend(a3, "payload"), "length") + 24 < 0xF4240001uLL)
  {
    objc_msgSend(a3, "_setTransportSize:");
    return 1;
  }
  objc_msgSend(a3, "setEncodedAttributes:", 0);
  if (a4)
  {
    v12 = +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 261, 0);
    result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  int64_t v15;
  _DWORD v17[6];

  v7 = objc_msgSend(a3, "payload");
  v8 = objc_msgSend(a3, "encodedAttributes");
  v9 = objc_msgSend(a3, "kind");
  v10 = objc_msgSend(a3, "serial");
  v11 = objc_msgSend(a3, "replySerial");
  if (v8)
  {
    v12 = objc_msgSend(v8, "length") | 0x80000000;
    if (v7)
    {
LABEL_3:
      v13 = objc_msgSend(v7, "length") | 0x80000000;
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
    if (v7)
      goto LABEL_3;
  }
  v13 = 0;
LABEL_6:
  v17[0] = 1296389188;
  v17[1] = bswap32(v9);
  v17[2] = bswap32(v10);
  v17[3] = bswap32(v11);
  v17[4] = bswap32(v12);
  v17[5] = bswap32(v13);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  if (LOBYTE(self->super._interposerVersion))
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
    objc_msgSend(a3, "setEncodedAttributes:", 0);
    return -1;
  }
  self->_buffers[0] = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v17, 24);
  if (!v8)
  {
    v14 = 1;
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_buffers[1] = (NSData *)v8;
  objc_msgSend(a3, "setEncodedAttributes:", 0);
  v14 = 2;
  if (v7)
LABEL_9:
    self->_buffers[v14] = (NSData *)v7;
LABEL_10:
  v15 = -[GTBaseStreamTransport_replayer _writeBuffers:](self, "_writeBuffers:", a4);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
  return v15;
}

- (int64_t)_relayBufferInner:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  dy_transport_message_unpack_s *v10;
  unint64_t v11;
  unint64_t v12;
  OS_dispatch_semaphore **p_sendSema;
  int64_t v14;
  dy_transport_message_unpack_s *relayTmu;
  int64_t v16;
  dy_transport_message_unpack_s *v17;

  if (LOBYTE(self->super._interposerVersion))
    return -1;
  v4 = a4;
  if (self->_relayTmu->var5)
  {
    v7 = 0;
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  v14 = -[GTBaseStreamTransport_replayer _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
  if (v14 == -1)
    return -1;
  relayTmu = self->_relayTmu;
  if (!relayTmu->var5)
    return 0;
  v16 = v14;
  *(int8x16_t *)&relayTmu->var0.var0 = vrev32q_s8(*(int8x16_t *)&relayTmu->var0.var0);
  *(int8x8_t *)&relayTmu->var0.var4 = vrev32_s8(*(int8x8_t *)&relayTmu->var0.var4);
  p_sendSema = &self->_sendSema;
  v9 = -1;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  if (LOBYTE(self->super._interposerVersion))
    goto LABEL_9;
  self->_buffers[0] = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", self->_relayTmu, 24, 0);
  v17 = self->_relayTmu;
  v17->var3 += 24;
  if (!v17->var5)
    return 0;
  v4 -= v16;
  a3 = (char *)a3 + v16;
  v7 = 1;
  if (v4)
LABEL_4:
    self->_buffers[v7] = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", a3, v4, 0);
LABEL_5:
  v8 = -[GTBaseStreamTransport_replayer _writeBuffers:](self, "_writeBuffers:", 0);
  v9 = v8;
  if (v8 == -1)
  {
LABEL_8:
    p_sendSema = &self->_sendSema;
LABEL_9:
    dispatch_semaphore_signal((dispatch_semaphore_t)*p_sendSema);
    return v9;
  }
  v10 = self->_relayTmu;
  v11 = v10->var3 - v8;
  v12 = v10->var4 + v8;
  v10->var3 = v11;
  v10->var4 = v12;
  if (!v11)
  {
    *(_OWORD *)&v10->var3 = xmmword_4AA500;
    v10->var5 = 0;
    goto LABEL_8;
  }
  return v9;
}

- (int64_t)_relayBuffer:(const void *)a3 size:(unint64_t)a4
{
  char v7;
  NSObject *relayQueue;
  int64_t v9;
  _QWORD block[8];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = BYTE1(self->super._interposerVersion);
  if (v7)
    dispatch_suspend((dispatch_object_t)self->super._queue);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  relayQueue = self->_relayQueue;
  v16 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__GTBaseStreamTransport__relayBuffer_size___block_invoke;
  block[3] = &unk_725320;
  block[4] = self;
  block[5] = &v13;
  block[6] = a3;
  block[7] = a4;
  v12 = v7;
  dispatch_sync(relayQueue, block);
  v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

@end
