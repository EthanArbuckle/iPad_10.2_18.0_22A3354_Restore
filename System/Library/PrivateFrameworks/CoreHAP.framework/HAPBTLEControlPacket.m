@implementation HAPBTLEControlPacket

- (HAPBTLEControlPacket)init
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

- (HAPBTLEControlPacket)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 continuationPacket:(BOOL)a5 packetPayload:(id)a6 maximumLength:(unint64_t)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  HAPBTLEControlPacket *v15;
  HAPBTLEControlPacket *v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HAPBTLEControlPacket *v24;
  uint64_t v25;
  NSData *payload;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v9 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HAPBTLEControlPacket;
  v15 = -[HAPBTLEControlPacket init](&v28, sel_init);
  v16 = v15;
  if (!v15)
  {
LABEL_12:
    v24 = v16;
    goto LABEL_13;
  }
  v15->_type = a3;
  objc_storeStrong((id *)&v15->_transactionIdentifier, a4);
  v16->_continuationPacket = v9;
  if (v9)
    v17 = 2;
  else
    v17 = 1;
  v18 = a7 >= v17;
  v19 = a7 - v17;
  if (v18)
  {
    if (objc_msgSend(v14, "length") < v19)
      v19 = objc_msgSend(v14, "length");
    objc_msgSend(v14, "subdataWithRange:", 0, v19);
    v25 = objc_claimAutoreleasedReturnValue();
    payload = v16->_payload;
    v16->_payload = (NSData *)v25;

    goto LABEL_12;
  }
  v20 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBTLEControlPacket shortDescription](v16, "shortDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v22;
    v31 = 2112;
    v32 = v23;
    v33 = 2048;
    v34 = v17;
    _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@[%@] The maximum packet length must be greater than the header length: %tu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  v24 = 0;
LABEL_13:

  return v24;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBTLEControlPacket shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E894EFE8;
  }
  v8 = -[HAPBTLEControlPacket type](self, "type");
  v9 = CFSTR("unknown");
  if (v8 == 1)
    v9 = CFSTR("response");
  if (!v8)
    v9 = CFSTR("request");
  v10 = v9;
  -[HAPBTLEControlPacket transactionIdentifier](self, "transactionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedCharValue");
  -[HAPBTLEControlPacket payload](self, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Type = %@, Transaction Identifier = 0x%02x, Payload Length = %tu>"), v6, v7, v10, v12, objc_msgSend(v13, "length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v14;
}

- (id)debugDescription
{
  return -[HAPBTLEControlPacket descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLEControlPacket descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)serialize
{
  unsigned __int8 v3;
  void *v4;
  uint8_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[HAPBTLEControlPacket type](self, "type");
  -[HAPBTLEControlPacket transactionIdentifier](self, "transactionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedCharValue");
  v6 = -[HAPBTLEControlPacket isContinuationPacket](self, "isContinuationPacket");
  buf[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 2 * v3;
  if (v6)
    v9 = (2 * v3) | 0x80;
  v18 = v9;
  objc_msgSend(v7, "appendBytes:length:", &v18, 1);
  if (v6)
    objc_msgSend(v8, "appendBytes:length:", buf, 1);

  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    -[HAPBTLEControlPacket payload](self, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendData:", v11);

    v12 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBTLEControlPacket shortDescription](self, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = 0;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to create control header with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
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

- (BOOL)isContinuationPacket
{
  return self->_continuationPacket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

+ (id)packetWithSerializedData:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  HAPBTLETransactionIdentifier *v15;
  void *v16;
  HAPBTLEControlPacket *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = CFSTR("The control field length is invalid.");
    goto LABEL_7;
  }
  buf[0] = 0;
  objc_msgSend(v5, "getBytes:range:", buf, 0, 1);
  v6 = buf[0];
  if ((buf[0] & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = CFSTR("Invalid control field version.");
    goto LABEL_7;
  }
  if ((buf[0] & 0x70) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = CFSTR("Reserved bits must be zero.");
LABEL_7:
    objc_msgSend(v7, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to parse control field."), v8, 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = 0;
LABEL_9:
    v11 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_10;
  }
  v10 = (buf[0] >> 1) & 7;
  if (v10 > 1)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid control type: %u."), (buf[0] >> 1) & 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to parse control field."), v24, 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if ((buf[0] & 0x80) != 0)
  {
    if ((unint64_t)objc_msgSend(v5, "length") <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to parse control field."), CFSTR("The control field length is invalid for a continuation payload."), 0, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v25 = 0;
    objc_msgSend(v5, "getBytes:range:", &v25, 1, 1);
    v12 = v25;
    v13 = 2;
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }
  v9 = 0;
  v11 = v6 >> 7;
LABEL_10:

  v14 = v9;
  if (v13)
  {
    v15 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:]([HAPBTLETransactionIdentifier alloc], "initWithUnsignedCharValue:", v12);
    objc_msgSend(v5, "subdataWithRange:", v13, objc_msgSend(v5, "length") - v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HAPBTLEControlPacket initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:]([HAPBTLEControlPacket alloc], "initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:", v10, v15, v11, v16, -1);

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HAPBTLEControlPacket shortDescription](HAPBTLEControlPacket, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse control field with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }

  return v17;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
