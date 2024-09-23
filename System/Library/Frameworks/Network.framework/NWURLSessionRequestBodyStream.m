@implementation NWURLSessionRequestBodyStream

- (int64_t)countOfBytesSent
{
  if (self)
    return *(_QWORD *)(self + 24);
  return self;
}

- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  __CFRunLoop *v9;
  const void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a5;
  v9 = (__CFRunLoop *)objc_msgSend(MEMORY[0x1E0C92C58], "resourceLoaderRunLoop");
  v10 = (const void *)*MEMORY[0x1E0C9B280];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
  v12[3] = &unk_1E149C2D8;
  v14 = a3;
  v15 = a4;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  CFRunLoopPerformBlock(v9, v10, v12);
  CFRunLoopWakeUp(v9);

}

- (void)close
{
  __CFRunLoop *v3;
  const void *v4;
  _QWORD block[5];

  v3 = (__CFRunLoop *)objc_msgSend(MEMORY[0x1E0C92C58], "resourceLoaderRunLoop");
  v4 = (const void *)*MEMORY[0x1E0C9B280];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NWURLSessionRequestBodyStream_close__block_invoke;
  block[3] = &unk_1E14ACFD0;
  block[4] = self;
  CFRunLoopPerformBlock(v3, v4, block);
  CFRunLoopWakeUp(v3);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  __CFRunLoop *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke;
  block[3] = &unk_1E14AB278;
  v12 = v6;
  v13 = a4;
  block[4] = self;
  v7 = (void *)MEMORY[0x1E0C92C58];
  v8 = v6;
  v9 = (__CFRunLoop *)objc_msgSend(v7, "resourceLoaderRunLoop");
  if (CFRunLoopGetCurrent() == v9)
  {
    __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke((uint64_t)block);
    v10 = v8;
  }
  else
  {
    CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x1E0C9B280], block);
    CFRunLoopWakeUp(v9);
    v10 = v12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

void __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NWURLError *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_super v11;

  v2 = *(_QWORD *)(a1 + 48);
  if ((unint64_t)(v2 - 1) < 2)
  {
    -[NWURLSessionRequestBodyStream pollStream](*(_QWORD *)(a1 + 32));
  }
  else if (v2 == 8)
  {
    v5 = [NWURLError alloc];
    if (v5)
    {
      v6 = *MEMORY[0x1E0CB32E8];
      v11.receiver = v5;
      v11.super_class = (Class)NWURLError;
      v10 = objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v6, -1021, 0);
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "streamError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUnderlyingError:", v7);
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(_QWORD *)(v8 + 40);
    else
      v9 = 0;
    -[NWURLSessionReadRequest putError:](v9, v10);

  }
  else if (v2 == 16)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 40);
      if (v4)
      {
        *(_BYTE *)(v4 + 8) = 1;
        -[NWURLSessionReadRequest tryFulfillRequest](v4);
      }
    }

  }
}

- (void)pollStream
{
  CFRunLoopRef Current;
  uint64_t v3;
  uint64_t v4;
  NSObject *alloc;
  char *subrange;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  NWURLError *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  if (a1)
  {
    Current = CFRunLoopGetCurrent();
    if (Current != (CFRunLoopRef)objc_msgSend(MEMORY[0x1E0C92C58], "resourceLoaderRunLoop"))
      __assert_rtn("-[NWURLSessionRequestBodyStream pollStream]", "NWURLSessionRequest.m", 353, "CFRunLoopGetCurrent() == NSURLConnection.resourceLoaderRunLoop");
    if (objc_msgSend(*(id *)(a1 + 16), "hasBytesAvailable"))
    {
      v3 = *(_QWORD *)(a1 + 40);
      if (v3)
      {
        if (*(_QWORD *)(v3 + 32))
        {
          v4 = *(_QWORD *)(v3 + 24);
          if (v4)
          {
            alloc = dispatch_data_create_alloc();
            subrange = 0;
            while (1)
            {
              v7 = objc_msgSend(*(id *)(a1 + 16), "read:maxLength:", subrange, v4);
              v8 = v7;
              if (v7 <= 0)
                break;
              subrange += v7;
              v4 -= v7;
              if (!v4 || (objc_msgSend(*(id *)(a1 + 16), "hasBytesAvailable") & 1) == 0)
                goto LABEL_11;
            }
            if (!v7)
            {
LABEL_11:
              v9 = objc_msgSend(*(id *)(a1 + 16), "streamStatus");
              v11 = v8 < 1 || v9 == 5;
              if (subrange)
                subrange = (char *)dispatch_data_create_subrange(alloc, 0, (size_t)subrange);
              -[NWURLSessionReadRequest putData:complete:](*(_QWORD *)(a1 + 40), subrange, v11);
              goto LABEL_20;
            }
            v12 = [NWURLError alloc];
            if (v12)
            {
              v13 = *MEMORY[0x1E0CB32E8];
              v15.receiver = v12;
              v15.super_class = (Class)NWURLError;
              subrange = (char *)objc_msgSendSuper2(&v15, sel_initWithDomain_code_userInfo_, v13, -1021, 0);
            }
            else
            {
              subrange = 0;
            }
            objc_msgSend(*(id *)(a1 + 16), "streamError");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(subrange, "setUnderlyingError:", v14);
            -[NWURLSessionReadRequest putError:](*(_QWORD *)(a1 + 40), subrange);

LABEL_20:
          }
        }
      }
    }
  }
}

uint64_t __38__NWURLSessionRequestBodyStream_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  objc_msgSend(v3, "close");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 16);
  else
    v5 = 0;
  return objc_msgSend(v5, "setDelegate:", 0);
}

void __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  _QWORD newValue[5];
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 8))
    {
LABEL_3:
      v3 = *(_OWORD **)(v2 + 40);
      goto LABEL_4;
    }
    *(_BYTE *)(v2 + 8) = 1;
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 16);
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "setDelegate:");
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[2];
  v8 = (void *)MEMORY[0x1E0C99E58];
  v9 = v7;
  objc_msgSend(v8, "currentRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scheduleInRunLoop:forMode:", v10, *MEMORY[0x1E0C99748]);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 16);
  else
    v12 = 0;
  objc_msgSend(v12, "open");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    goto LABEL_3;
  v3 = 0;
LABEL_4:
  v13 = *(_OWORD *)(a1 + 48);
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2;
  newValue[3] = &unk_1E149C2B0;
  newValue[4] = v2;
  v15 = *(id *)(a1 + 40);
  if (v3)
  {
    v3[1] = v13;
    objc_setProperty_nonatomic_copy(v3, v4, newValue, 32);
    -[NWURLSessionReadRequest tryFulfillRequest]((uint64_t)v3);
  }
  -[NWURLSessionRequestBodyStream pollStream](*(_QWORD *)(a1 + 32));

}

void __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(NSObject **)(v9 + 32);
  else
    v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_3;
  block[3] = &unk_1E14A4948;
  v15 = v7;
  v16 = v9;
  v11 = *(id *)(a1 + 40);
  v19 = a3;
  v17 = v8;
  v18 = v11;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

uint64_t __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      *(_QWORD *)(v2 + 24) += dispatch_data_get_size(*(dispatch_data_t *)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
