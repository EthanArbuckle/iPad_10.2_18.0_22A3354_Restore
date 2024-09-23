@implementation NWStreamPair

- (void)dealloc
{
  ReadBuffer *readData;
  NSObject *queue;
  OS_nw_connection *connection;
  __CFData *cachedPeerName;
  __CFArray *cachedPeerCerts;
  __SecTrust *cachedTrust;
  __CFError *readError;
  __CFError *writeError;
  objc_super v11;

  if (self->_rs || self->_ws)
    __assert_rtn("-[NWStreamPair dealloc]", "HTTPServerNWStream.mm", 662, "_rs == NULL && _ws == NULL");
  readData = self->_readData;
  if (readData)
  {
    (*((void (**)(ReadBuffer *, SEL))readData->var0 + 1))(readData, a2);
    self->_readData = 0;
  }
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  connection = self->_connection;
  if (connection)
  {
    nw_release(connection);
    self->_connection = 0;
  }
  cachedPeerName = self->_cachedPeerName;
  self->_cachedPeerName = 0;
  if (cachedPeerName)
    CFRelease(cachedPeerName);
  cachedPeerCerts = self->_cachedPeerCerts;
  self->_cachedPeerCerts = 0;
  if (cachedPeerCerts)
    CFRelease(cachedPeerCerts);
  cachedTrust = self->_cachedTrust;
  self->_cachedTrust = 0;
  if (cachedTrust)
    CFRelease(cachedTrust);
  readError = self->_readError;
  self->_readError = 0;
  if (readError)
    CFRelease(readError);
  writeError = self->_writeError;
  self->_writeError = 0;
  if (writeError)
    CFRelease(writeError);
  v11.receiver = self;
  v11.super_class = (Class)NWStreamPair;
  -[__CFNCoreLoggable dealloc](&v11, sel_dealloc);
}

BOOL __39__NWStreamPair_copyConnectionPeerCerts__block_invoke(uint64_t a1, sec_protocol_metadata_t metadata)
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39__NWStreamPair_copyConnectionPeerCerts__block_invoke_2;
  handler[3] = &__block_descriptor_40_e38_v16__0__NSObject_OS_sec_certificate__8l;
  handler[4] = *(_QWORD *)(a1 + 32);
  return sec_protocol_metadata_access_peer_certificate_chain(metadata, handler);
}

- (void)withTLSMetadata:(uint64_t)a1
{
  NSObject *v4;
  NSObject *v5;
  nw_protocol_metadata_t v6;
  NSObject *v7;
  NSObject *v8;

  v4 = MEMORY[0x186DB8944]();
  if (v4)
  {
    v5 = v4;
    v6 = nw_connection_copy_protocol_metadata(*(nw_connection_t *)(a1 + 16), v4);
    CFRelease(v5);
    if (v6)
    {
      if (nw_protocol_metadata_is_tls(v6))
      {
        v7 = v6;
        if (v7)
        {
          v8 = v7;
          (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v7);
          CFRelease(v8);
        }
      }
      CFRelease(v6);
    }
  }
}

void __39__NWStreamPair_copyConnectionPeerCerts__block_invoke_2(uint64_t a1, sec_certificate_t certificate)
{
  SecCertificateRef v3;
  SecCertificateRef v4;

  v3 = sec_certificate_copy_ref(certificate);
  if (v3)
  {
    v4 = v3;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
    CFRelease(v4);
  }
}

void __39__NWStreamPair_copyConnectionPeerTrust__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = sec_protocol_metadata_copy_sec_trust();
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sec_trust_copy_ref(v2);
    CFRelease(v3);
  }
}

- (void)_onqueue_issue_read
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 24))
  {
    if (!*(_BYTE *)(a1 + 80) && !*(_QWORD *)(a1 + 56) && !*(_BYTE *)(a1 + 82))
    {
      v1 = *(_QWORD *)(a1 + 72);
      if (!*(_BYTE *)(v1 + 32))
      {
        v2 = *(_QWORD *)(v1 + 8);
        v3 = *(_QWORD *)(v1 + 24);
        v4 = v2 - v3;
        if (v2 != v3)
        {
          *(_BYTE *)(v1 + 32) = 1;
          if (v4 >= 1)
            -[NWStreamPair _onqueue_issue_read0:]((_QWORD *)a1, v4);
        }
      }
    }
  }
}

- (void)_onqueue_issue_read0:(_QWORD *)a1
{
  uint32_t v3;
  NSObject *v4;
  _QWORD v5[5];
  uint32_t v6;

  if (a2 >= 0xFFFF)
    v3 = 0xFFFF;
  else
    v3 = a2;
  CFRetain(a1);
  v4 = a1[2];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__NWStreamPair__onqueue_issue_read0___block_invoke;
  v5[3] = &unk_1E14FBB80;
  v5[4] = a1;
  v6 = v3;
  nw_connection_receive(v4, 1u, v3, v5);
}

void __37__NWStreamPair__onqueue_issue_read0___block_invoke(uint64_t a1, dispatch_data_t data, nw_content_context_t context, _BOOL4 a4, nw_error_t error)
{
  BOOL is_final;
  uint64_t v9;
  uint64_t v10;
  int64_t size;
  const void *v12;
  _QWORD *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;

  if (context)
    is_final = 0;
  else
    is_final = a4;
  if (context && a4)
    is_final = nw_content_context_get_is_final(context);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    if (!*(_QWORD *)(v9 + 24))
      goto LABEL_28;
    if (data)
    {
      v10 = *(_QWORD *)(v9 + 72);
      if (!*(_BYTE *)(v10 + 32))
        __assert_rtn("copyInData", "HTTPServerNWStream.mm", 61, "_readOutstanding");
      *(_BYTE *)(v10 + 32) = 0;
      size = dispatch_data_get_size(data);
      v12 = *(const void **)(v10 + 16);
      if (v12)
      {
        *(_QWORD *)(v10 + 16) = dispatch_data_create_concat(*(dispatch_data_t *)(v10 + 16), data);
        CFRelease(v12);
        data = *(dispatch_data_t *)(v10 + 16);
        size += *(_QWORD *)(v10 + 24);
      }
      else
      {
        CFRetain(data);
        *(_QWORD *)(v10 + 16) = data;
      }
      *(_QWORD *)(v10 + 24) = size;
      if (dispatch_data_get_size(data) != size)
        __assert_rtn("copyInData", "HTTPServerNWStream.mm", 75, "dispatch_data_get_size(_dataBuffer) == _dataBufferSize");
      if (size > *(_QWORD *)(v10 + 8))
        __assert_rtn("copyInData", "HTTPServerNWStream.mm", 76, "_dataBufferSize <= _maxReadCount");
    }
    *(_BYTE *)(v9 + 80) = is_final;
    if (error && !*(_QWORD *)(v9 + 56))
      *(_QWORD *)(v9 + 56) = nw_error_copy_cf_error(error);
    v13 = *(_QWORD **)(v9 + 24);
    v14 = ReadBuffer::countOfAvailableBytes(*(ReadBuffer **)(v9 + 72));
    v15 = *(unsigned __int8 *)(v9 + 80);
    v16 = *(_QWORD *)(v9 + 56);
    v17 = v13[5];
    if (v17)
    {
      dispatch_semaphore_signal(v17);
      v13[5] = 0;
    }
    if ((uint64_t)v14 >= 1)
      (*(void (**)(_QWORD *, uint64_t))(*v13 + 56))(v13, 2);
    if (v15)
      (*(void (**)(_QWORD *, uint64_t))(*v13 + 56))(v13, 16);
    if (v16)
      (*(void (**)(_QWORD *, uint64_t))(*v13 + 64))(v13, v16);
    -[NWStreamPair _onqueue_issue_read](v9);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
LABEL_28:
      CFRelease((CFTypeRef)v9);
  }
}

- (void)_onqueue_checkForCompletion
{
  if (*(_BYTE *)(a1 + 82) && *(_BYTE *)(a1 + 81) && (*(_QWORD *)(a1 + 64) || !*(_QWORD *)(a1 + 112)))
    nw_connection_cancel(*(nw_connection_t *)(a1 + 16));
}

void __44__NWStreamPair__onqueue_writeData_outError___block_invoke(uint64_t a1, nw_error_t error)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  const void *v10;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = v2[14] - 1;
    v2[14] = v6;
    if (!v6)
      -[NWStreamPair _onqueue_checkForCompletion]((uint64_t)v2);
    if (error && !v2[8])
    {
      v2[8] = nw_error_copy_cf_error(error);
      -[NWStreamPair _onqueue_checkForCompletion]((uint64_t)v2);
    }
    v7 = (_QWORD *)v2[4];
    if (v7)
    {
      v8 = v2[8];
      if (v5 >= 1)
        v7[5] -= v5;
      v9 = v7[6];
      if (v9)
      {
        dispatch_semaphore_signal(v9);
        v7[6] = 0;
      }
      if ((uint64_t)v7[5] <= 65534)
        (*(void (**)(_QWORD *, uint64_t))(*v7 + 56))(v7, 4);
      if (v8)
        (*(void (**)(_QWORD *, uint64_t))(*v7 + 64))(v7, v8);
    }
    v10 = *(const void **)(a1 + 32);
    if (v10)
      CFRelease(v10);
  }
}

- (CFTypeRef)_offqueue_owner_copyProperty:(uint64_t)a1
{
  int ExactString;
  uint64_t v4;
  const void *v5;

  if (!a1)
    return 0;
  ExactString = _findExactString(theString, 2u);
  switch(ExactString)
  {
    case 230928472:
      v4 = 96;
      break;
    case 229937221:
      v4 = 104;
      break;
    case 122947790:
      v4 = 88;
      break;
    default:
      return 0;
  }
  v5 = *(const void **)(a1 + v4);
  if (v5)
    return CFRetain(v5);
  return 0;
}

@end
