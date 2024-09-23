@implementation HAPBTLERequest

- (HAPBTLERequest)init
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

- (id)_initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  int v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  HAPBTLERequest *v20;
  HAPBTLERequest *v22;
  uint64_t v23;
  HAPService *service;
  uint64_t v25;
  NSData *body;
  uint64_t v27;
  HAPBTLETransactionIdentifier *v28;
  HAPBTLETransactionIdentifier *identifier;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v10 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = v14;
  if (v10)
  {
    if (a7 <= 0.0)
    {
      v16 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v18;
        v19 = "%{public}@[HAPBTLERequest] A timeout > 0 is required";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    if ((unint64_t)objc_msgSend(v14, "length") >= 0x10000)
    {
      v16 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v18;
        v19 = "%{public}@[HAPBTLERequest] The body length must not exceed 64KB";
LABEL_10:
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    v30.receiver = self;
    v30.super_class = (Class)HAPBTLERequest;
    v22 = -[HAPBTLERequest init](&v30, sel_init);
    if (v22)
    {
      objc_msgSend(v13, "service");
      v23 = objc_claimAutoreleasedReturnValue();
      service = v22->_service;
      v22->_service = (HAPService *)v23;

      objc_storeStrong((id *)&v22->_characteristic, a3);
      v22->_type = v10;
      v25 = objc_msgSend(v15, "copy");
      body = v22->_body;
      v22->_body = (NSData *)v25;

      v22->_encrypted = a6;
      v22->_timeoutInterval = a7;
      if (v10 != 255)
      {
        +[HAPBTLETransactionIdentifier randomTransactionIdentifier](HAPBTLETransactionIdentifier, "randomTransactionIdentifier");
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        identifier = v22->_identifier;
        v22->_identifier = (HAPBTLETransactionIdentifier *)v27;

        goto LABEL_19;
      }
      if ((unint64_t)objc_msgSend(v15, "length") >= 2)
      {
        buf[0] = 0;
        objc_msgSend(v15, "getBytes:range:", buf, 1, 1);
        v28 = [HAPBTLETransactionIdentifier alloc];
        v27 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v28, "initWithUnsignedCharValue:", buf[0]);
        goto LABEL_18;
      }
    }
LABEL_19:
    self = v22;
    v20 = self;
    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    v19 = "%{public}@[HAPBTLERequest] A request type is required";
    goto LABEL_10;
  }
LABEL_11:

  objc_autoreleasePoolPop(v16);
  v20 = 0;
LABEL_12:

  return v20;
}

- (HAPBTLERequest)initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  _BOOL8 v8;
  uint64_t v10;
  id v12;
  id v13;
  HAPBTLERequest *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v8 = a6;
  v10 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  if (v12)
  {
    self = (HAPBTLERequest *)-[HAPBTLERequest _initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](self, "_initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v12, v10, v13, v8, a7);
    v14 = self;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] A characteristic is required", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (HAPBTLERequest)initWithRequestType:(unsigned __int8)a3 bodyData:(id)a4 shouldEncrypt:(BOOL)a5 timeoutInterval:(double)a6
{
  return (HAPBTLERequest *)-[HAPBTLERequest _initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](self, "_initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", 0, a3, a4, a5, a6);
}

- (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  unsigned __int8 v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v3 = a3;
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBTLERequest shortDescription](self, "shortDescription");
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
  v7 = -[HAPBTLERequest type](self, "type") + 1;
  if (v7 > 9u)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E894BE00[v7];
  -[HAPBTLERequest timeoutInterval](self, "timeoutInterval");
  v10 = v9;
  if (-[HAPBTLERequest isEncrypted](self, "isEncrypted"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[HAPBTLERequest identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBTLERequest body](self, "body");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  -[HAPBTLERequest characteristic](self, "characteristic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shortDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@%@, Type = %@, Timeout = %f, Encrypted = %@, Request Identifier = %@, Body Length = %tu, Characteristic = %@>"), v5, v6, v8, v10, v11, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v17;
}

- (id)debugDescription
{
  return -[HAPBTLERequest descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLERequest descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (void)cancelWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[HAPBTLERequest isFinished](self, "isFinished"))
  {
    -[HAPBTLERequest operation](self, "operation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelWithError:", v6);

    -[HAPBTLERequest responseTimer](self, "responseTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suspend");

  }
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[HAPBTLERequest type](self, "type") == 255)
  {
    -[HAPBTLERequest body](self, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v7, "mutableCopy");
    goto LABEL_5;
  }
  -[HAPBTLERequest _serializeHeader](self, "_serializeHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HAPBTLERequest body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[HAPBTLERequest body](self, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendData:", v7);
LABEL_5:

  }
  return v4;
}

- (id)_serializeHeader
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  char v22;
  unsigned __int8 v23;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HAPBTLERequest type](self, "type");
  objc_msgSend(v3, "appendBytes:length:", &v23, 1);
  -[HAPBTLERequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedCharValue");

  v22 = v5;
  objc_msgSend(v3, "appendBytes:length:", &v22, 1);
  if (-[HAPBTLERequest type](self, "type") == 6 || -[HAPBTLERequest type](self, "type") == 8)
  {
    -[HAPBTLERequest service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedShortValue");

    v21 = v8;
    objc_msgSend(v3, "appendBytes:length:", &v21, 2);
  }
  else
  {
    -[HAPBTLERequest characteristic](self, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "instanceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedShortValue");

    }
    else
    {
      v12 = 0;
    }
    v20 = v12;
    objc_msgSend(v3, "appendBytes:length:", &v20, 2);

  }
  -[HAPBTLERequest body](self, "body");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    -[HAPBTLERequest body](self, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    v19 = v16;
    objc_msgSend(v3, "appendBytes:length:", &v19, 2);
  }
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (unsigned)type
{
  return self->_type;
}

- (HAPService)service
{
  return self->_service;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSData)body
{
  return self->_body;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (HMFBlockOperation)operation
{
  return (HMFBlockOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (HAPBTLEControlOutputStream)controlOutputStream
{
  return self->_controlOutputStream;
}

- (void)setControlOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_controlOutputStream, a3);
}

- (HMFTimer)responseTimer
{
  return self->_responseTimer;
}

- (void)setResponseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_responseTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_controlOutputStream, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
