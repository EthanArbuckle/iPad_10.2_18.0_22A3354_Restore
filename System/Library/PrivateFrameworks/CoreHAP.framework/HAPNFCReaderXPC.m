@implementation HAPNFCReaderXPC

- (id)initReaderWithStream:(id)a3 fromSource:(unint64_t)a4 workQueue:(id)a5 readerStream:(id)a6
{
  id v10;
  id v11;
  id v12;
  HAPNFCReaderXPC *v13;
  HAPNFCReaderXPC *v14;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HAPNFCReaderXPC;
  v13 = -[HAPNFCReaderXPC init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[HAPNFCReaderXPC setStream:](v13, "setStream:", v10);
    -[HAPNFCReaderXPC setSource:](v14, "setSource:", a4);
    -[HAPNFCReaderXPC setWorkQueue:](v14, "setWorkQueue:", v11);
    -[HAPNFCReaderXPC setReaderStream:](v14, "setReaderStream:", v12);
  }

  return v14;
}

- (void)beginSession
{
  void *v3;
  HAPNFCReaderXPC *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPNFCReaderXPC stream](v4, "stream");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2080;
    v13 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Initializing xpc nfc event handler %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPNFCReaderXPC workQueue](v4, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HAPNFCReaderXPC_beginSession__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = v4;
  dispatch_async(v8, block);

}

- (BOOL)supportsBackgroundReading
{
  return self->_supportsBackgroundReading;
}

- (NSString)stream
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_xpc_object)event
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HAPNFCReaderStream)readerStream
{
  return (HAPNFCReaderStream *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReaderStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerStream, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

void __31__HAPNFCReaderXPC_beginSession__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  xpc_object_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD handler[5];

  v2 = (void *)MEMORY[0x1D17B7244]();
  objc_msgSend(*(id *)(a1 + 32), "stream");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __31__HAPNFCReaderXPC_beginSession__block_invoke_2;
  handler[3] = &unk_1E894BB40;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_set_event_stream_handler(v4, v5, handler);

  v6 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "setEvent:", v6);

  objc_msgSend(*(id *)(a1 + 32), "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v7, "version", "v1");

  objc_msgSend(*(id *)(a1 + 32), "stream");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  objc_msgSend(CFSTR("NFC"), "UTF8String");
  objc_msgSend(*(id *)(a1 + 32), "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_set_event();

  objc_autoreleasePoolPop(v2);
}

void __31__HAPNFCReaderXPC_beginSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  const char *string;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = MEMORY[0x1D17B76B8]();
  if (v6 != MEMORY[0x1E0C812F8])
  {
    v7 = v6;
    v8 = MEMORY[0x1E0C81310];
    v9 = MEMORY[0x1D17B7244]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v7 == v8)
    {
      if (v12)
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v13;
        v34 = 2048;
        v35 = objc_msgSend(v10, "source");
        v36 = 2112;
        v37 = v5;
        v14 = "%{public}@[NFC %lu] XPC Error event: %@";
        v15 = v11;
        v16 = 32;
        goto LABEL_11;
      }
    }
    else if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v13;
      v34 = 2048;
      v35 = objc_msgSend(v10, "source");
      v14 = "%{public}@[NFC %lu] unhandled xpc event type";
      v15 = v11;
      v16 = 22;
LABEL_11:
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);

    }
    v26 = (void *)v9;
LABEL_13:
    objc_autoreleasePoolPop(v26);
    goto LABEL_14;
  }
  v17 = (void *)MEMORY[0x1D17B7244]();
  v18 = v4;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v20;
    v34 = 2048;
    v35 = objc_msgSend(v18, "source");
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@[NFC %lu] XPC Dictionary event", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  string = xpc_dictionary_get_string(v5, (const char *)objc_msgSend(CFSTR("Payload"), "UTF8String"));
  if (!string)
  {
    v27 = MEMORY[0x1D17B7244]();
    v28 = v18;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v28, "source");
      *(_DWORD *)buf = 138543618;
      v33 = v30;
      v34 = 2048;
      v35 = v31;
      _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@[NFC %lu] XPC Error event - no payload dictionary entry", buf, 0x16u);

    }
    v26 = (void *)v27;
    goto LABEL_13;
  }
  v22 = string;
  objc_msgSend(v18, "readerStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v18, "source");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "nfcStreamIndicationFromSource:withPayload:", v24, v25);

LABEL_14:
}

@end
