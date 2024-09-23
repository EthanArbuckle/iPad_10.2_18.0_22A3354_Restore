@implementation HAPBTLEControlOutputStream

- (id)completionHandler
{
  return objc_getAssociatedObject(self, "completionHandler");
}

- (void)setCompletionHandler:(id)a3
{
  id v4;

  v4 = (id)MEMORY[0x1D17B7400](a3, a2);
  objc_setAssociatedObject(self, "completionHandler", v4, (void *)3);

}

- (HAPBTLEControlOutputStream)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAPBTLEControlOutputStream)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 controlPayload:(id)a5 mtuLength:(unint64_t)a6 timeoutInterval:(double)a7
{
  id v13;
  id v14;
  void *v15;
  HAPBTLEControlOutputStream *v16;
  HAPBTLEControlOutputStream *v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *clientQueue;
  uint64_t v22;
  NSData *payload;
  NSOperationQueue *v24;
  void *v25;
  NSOperationQueue *operationQueue;
  HAPBTLEControlOutputStream *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  const char *v32;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (!v13)
  {
    v28 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_9;
  }
  if (!objc_msgSend(v14, "length"))
  {
    v28 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
LABEL_9:
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPBTLEControlOutputStream shortDescription](HAPBTLEControlOutputStream, "shortDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v30;
    v37 = 2112;
    v38 = v31;
    v32 = "%{public}@[%@] Invalid control payload data.";
    goto LABEL_16;
  }
  if (!a6)
  {
    v28 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPBTLEControlOutputStream shortDescription](HAPBTLEControlOutputStream, "shortDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v30;
    v37 = 2112;
    v38 = v31;
    v32 = "%{public}@[%@] Invalid MTU length.";
LABEL_16:
    _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);

    goto LABEL_17;
  }
  if (a7 <= 0.0)
  {
    v28 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[HAPBTLEControlOutputStream shortDescription](HAPBTLEControlOutputStream, "shortDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v30;
      v37 = 2112;
      v38 = v31;
      v32 = "%{public}@[%@] Invalid timeout for write.";
      goto LABEL_16;
    }
LABEL_17:

    objc_autoreleasePoolPop(v28);
    v27 = 0;
    goto LABEL_18;
  }
  v34.receiver = self;
  v34.super_class = (Class)HAPBTLEControlOutputStream;
  v16 = -[HAPBTLEControlOutputStream init](&v34, sel_init);
  v17 = v16;
  if (v16)
  {
    v18 = (const char *)HAPDispatchQueueName(v16, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    clientQueue = v17->_clientQueue;
    v17->_clientQueue = (OS_dispatch_queue *)v20;

    v17->_type = a3;
    objc_storeStrong((id *)&v17->_transactionIdentifier, a4);
    v22 = objc_msgSend(v15, "copy");
    payload = v17->_payload;
    v17->_payload = (NSData *)v22;

    v17->_mtuLength = a6;
    v17->_timeoutInterval = a7;
    v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), HAPDispatchQueueName(v17, CFSTR("operationQueue")));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v24, "setName:", v25);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v24, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v24, "setQualityOfService:", 25);
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = v24;

  }
  self = v17;
  v27 = self;
LABEL_18:

  return v27;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v3 = a3;
  v16 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBTLEControlOutputStream shortDescription](self, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E894EFE8;
  }
  v7 = -[HAPBTLEControlOutputStream type](self, "type");
  v8 = CFSTR("unknown");
  if (v7 == 1)
    v8 = CFSTR("response");
  if (!v7)
    v8 = CFSTR("request");
  v9 = v8;
  -[HAPBTLEControlOutputStream transactionIdentifier](self, "transactionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedCharValue");
  -[HAPBTLEControlOutputStream isComplete](self, "isComplete");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBTLEControlOutputStream payload](self, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@%@, Type = %@, Transaction Identifier = 0x%02x, Completed = %@, Payload Length = %tu, Remaining Payload Length = %tu>"), v5, v6, v9, v11, v12, objc_msgSend(v13, "length"), -[HAPBTLEControlOutputStream remainingControlPayloadLength](self, "remainingControlPayloadLength"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v14;
}

- (id)debugDescription
{
  return -[HAPBTLEControlOutputStream descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLEControlOutputStream descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)remainingControlPayloadLength
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[HAPBTLEControlOutputStream payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = v4 - -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength");

  return v5;
}

- (void)open
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPBTLEControlOutputStream clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HAPBTLEControlOutputStream_open__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPBTLEControlOutputStream clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HAPBTLEControlOutputStream_close__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_closeWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HAPBTLEControlOutputStream isOpen](self, "isOpen"))
  {
    -[HAPBTLEControlOutputStream setOpen:](self, "setOpen:", 0);
    -[HAPBTLEControlOutputStream delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controlOutputStream:didCloseWithError:", self, v5);

  }
}

- (void)_complete
{
  id v3;

  if (!-[HAPBTLEControlOutputStream isComplete](self, "isComplete"))
  {
    -[HAPBTLEControlOutputStream setComplete:](self, "setComplete:", 1);
    -[HAPBTLEControlOutputStream delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "controlOutputStreamDidComplete:", self);

  }
}

- (void)sendNextPayloadFragment
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  id location;

  v3 = objc_alloc(MEMORY[0x1E0D28550]);
  -[HAPBTLEControlOutputStream timeoutInterval](self, "timeoutInterval");
  v4 = (void *)objc_msgSend(v3, "initWithTimeout:");
  objc_initWeak(&location, v4);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke;
  v9[3] = &unk_1E894DF38;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v4, "addExecutionBlock:", v9);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_3;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v4, "setCompletionBlock:", v7);
  -[HAPBTLEControlOutputStream operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_sendNextPayloadFragmentWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPBTLEControlOutputStream clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E894D5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_nextPacketWithMaximumLength:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL8 v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  HAPBTLEControlPacket *v17;
  uint64_t v18;
  void *v19;
  HAPBTLEControlPacket *v20;
  unint64_t v21;
  void *v22;
  HAPBTLEControlPacket *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[HAPBTLEControlOutputStream isComplete](self, "isComplete"))
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBTLEControlOutputStream shortDescription](self, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@[%@] The control output stream is complete", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Invalid operation."), CFSTR("The control output stream is complete"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v12 = -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength") != 0;
    -[HAPBTLEControlOutputStream payload](self, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength");
    -[HAPBTLEControlOutputStream payload](self, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subdataWithRange:", v14, objc_msgSend(v15, "length")- -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = [HAPBTLEControlPacket alloc];
    v18 = -[HAPBTLEControlOutputStream type](self, "type");
    -[HAPBTLEControlOutputStream transactionIdentifier](self, "transactionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HAPBTLEControlPacket initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:](v17, "initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:", v18, v19, v12, v16, a3);

    if (v20)
    {
      v21 = -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength");
      -[HAPBTLEControlPacket payload](v20, "payload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBTLEControlOutputStream setControlPayloadWrittenLength:](self, "setControlPayloadWrittenLength:", objc_msgSend(v22, "length") + v21);

      v23 = v20;
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBTLEControlOutputStream shortDescription](self, "shortDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v26;
        v30 = 2112;
        v31 = v27;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to create control packet", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Failed to create control packet."), 0, 0, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    return v20;
  }
}

- (HAPBTLEControlOutputStreamDelegate)delegate
{
  return (HAPBTLEControlOutputStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (HAPBTLETransactionIdentifier)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)payload
{
  return self->_payload;
}

- (unint64_t)mtuLength
{
  return self->_mtuLength;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (unint64_t)controlPayloadWrittenLength
{
  return self->_controlPayloadWrittenLength;
}

- (void)setControlPayloadWrittenLength:(unint64_t)a3
{
  self->_controlPayloadWrittenLength = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v20 = 0;
  objc_msgSend(v2, "_nextPacketWithMaximumLength:error:", objc_msgSend(v2, "mtuLength"), &v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_17;
      v18[3] = &unk_1E894D798;
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(id *)(a1 + 40);
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = v7;
      objc_msgSend(v5, "controlOutputStream:didReceiveRequestToSendControlPacket:completionHandler:", v6, v3, v18);
      v8 = v19;
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] The stream delegate is missing, closing session", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Operation not supported."), CFSTR("The stream delegate is missing."), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

LABEL_13:
    goto LABEL_14;
  }
  v9 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to get the next control packet with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v4);
LABEL_14:

}

void __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E894D5E0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_2;
    v5[3] = &unk_1E894DD58;
    v6 = v3;
    objc_msgSend(v4, "_sendNextPayloadFragmentWithCompletionHandler:", v5);

  }
}

void __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_4;
  v6[3] = &unk_1E894E0F8;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = WeakRetained;
  v8 = v4;
  v5 = WeakRetained;
  dispatch_async(v3, v6);

}

void __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_closeWithError:", v6);

  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "remainingControlPayloadLength");
    v5 = *(void **)(a1 + 40);
    if (v4)
      objc_msgSend(v5, "sendNextPayloadFragment");
    else
      objc_msgSend(v5, "_complete");
  }
}

uint64_t __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "cancelWithError:", a2);
  else
    return objc_msgSend(v2, "finish");
}

uint64_t __35__HAPBTLEControlOutputStream_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

uint64_t __34__HAPBTLEControlOutputStream_open__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isOpen");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOpen:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "controlOutputStreamDidOpen:", *(_QWORD *)(a1 + 32));

    return objc_msgSend(*(id *)(a1 + 32), "sendNextPayloadFragment");
  }
  return result;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
