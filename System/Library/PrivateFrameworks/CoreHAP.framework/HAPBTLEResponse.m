@implementation HAPBTLEResponse

- (HAPBTLEResponse)init
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

- (HAPBTLEResponse)initWithRequest:(id)a3
{
  id v5;
  HAPBTLEResponse *v6;
  HAPBTLEResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPBTLEResponse;
  v6 = -[HAPBTLEResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
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
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBTLEResponse shortDescription](self, "shortDescription");
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
  if (-[HAPBTLEResponse isEncrypted](self, "isEncrypted"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[HAPBTLEResponse identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HAPBTLEResponse bodyLength](self, "bodyLength");
  -[HAPBTLEResponse request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBTLEResponse body](self, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Encrypted = %@, Response Identifier = %@, Body Length = %tu, Request = %@> <Body: %@>"), v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v13;
}

- (id)debugDescription
{
  return -[HAPBTLEResponse descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLEResponse descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)isEncrypted
{
  void *v2;
  char v3;

  -[HAPBTLEResponse request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEncrypted");

  return v3;
}

- (BOOL)isComplete
{
  _BOOL4 v3;

  v3 = -[HAPBTLEResponse isHeaderComplete](self, "isHeaderComplete");
  if (v3)
    LOBYTE(v3) = -[HAPBTLEResponse isBodyComplete](self, "isBodyComplete");
  return v3;
}

- (BOOL)isBodyComplete
{
  unint64_t v3;
  void *v4;
  BOOL v5;

  if (!-[HAPBTLEResponse isHeaderComplete](self, "isHeaderComplete"))
    return 0;
  v3 = -[HAPBTLEResponse bodyLength](self, "bodyLength");
  -[HAPBTLEResponse body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == objc_msgSend(v4, "length");

  return v5;
}

- (BOOL)isValid
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[HAPBTLEResponse isComplete](self, "isComplete");
  if (v3)
  {
    -[HAPBTLEResponse identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBTLEResponse request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (unint64_t)_remainingBodyLength
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  -[HAPBTLEResponse body](self, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5 = -[HAPBTLEResponse bodyLength](self, "bodyLength");
  -[HAPBTLEResponse _internalBody](self, "_internalBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 - objc_msgSend(v6, "length");

  return v4;
}

- (unint64_t)appendData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[HAPBTLEResponse isComplete](self, "isComplete"))
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBTLEResponse shortDescription](self, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not appending data, the response is complete", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = CFSTR("Response is complete.");
LABEL_6:
      objc_msgSend(v11, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Failed to parse response."), v12, 0, 0);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  if (-[HAPBTLEResponse isHeaderComplete](self, "isHeaderComplete"))
  {
    v13 = 0;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v6, "length") <= 1)
    {
      v14 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBTLEResponse shortDescription](self, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v16;
        v29 = 2112;
        v30 = v17;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%@] The data, %@, does not contain the entire response header", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = CFSTR("The entire header was not present.");
        goto LABEL_6;
      }
LABEL_14:
      v13 = 0;
      goto LABEL_27;
    }
    v13 = -[HAPBTLEResponse _deserializeHeaderWithData:error:](self, "_deserializeHeaderWithData:error:", v6, a4);
    if (!v13)
      goto LABEL_27;
  }
  v18 = objc_msgSend(v6, "length");
  if (!-[HAPBTLEResponse isBodyComplete](self, "isBodyComplete") && v18 != v13)
  {
    v19 = -[HAPBTLEResponse _remainingBodyLength](self, "_remainingBodyLength");
    if (v19)
    {
      if (v19 >= v18 - v13)
        v20 = v18 - v13;
      else
        v20 = v19;
      -[HAPBTLEResponse _internalBody](self, "_internalBody");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", -[HAPBTLEResponse bodyLength](self, "bodyLength"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBTLEResponse _setInternalBody:](self, "_setInternalBody:", v22);

      }
      -[HAPBTLEResponse _internalBody](self, "_internalBody");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subdataWithRange:", v13, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appendData:", v24);

      v13 += v20;
    }
    if (!-[HAPBTLEResponse _remainingBodyLength](self, "_remainingBodyLength"))
    {
      -[HAPBTLEResponse _internalBody](self, "_internalBody");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBTLEResponse setBody:](self, "setBody:", v25);

      -[HAPBTLEResponse _setInternalBody:](self, "_setInternalBody:", 0);
    }
  }
LABEL_27:

  return v13;
}

- (unint64_t)_deserializeHeaderWithData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  HAPBTLETransactionIdentifier *v8;
  HAPBTLETransactionIdentifier *v9;
  HAPBTLETransactionIdentifier *identifier;
  void *v11;
  unint64_t v12;
  _BYTE v14[2];

  v6 = a3;
  v7 = 2;
  objc_msgSend(v6, "getBytes:length:", v14, 2);
  v8 = [HAPBTLETransactionIdentifier alloc];
  v9 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v8, "initWithUnsignedCharValue:", v14[0]);
  identifier = self->_identifier;
  self->_identifier = v9;

  self->_statusCode = v14[1];
  if ((unint64_t)objc_msgSend(v6, "length") >= 3)
  {
    objc_msgSend(v6, "subdataWithRange:", 2, objc_msgSend(v6, "length") - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HAPBTLEResponse _deserializeHeaderBodyLengthWithData:error:](self, "_deserializeHeaderBodyLengthWithData:error:", v11, a4);

    if (!v12)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v7 = v12 + 2;
  }
  -[HAPBTLEResponse setHeaderComplete:](self, "setHeaderComplete:", 1);
LABEL_6:

  return v7;
}

- (unint64_t)_deserializeHeaderBodyLengthWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") > 1)
  {
    LOWORD(v13) = 0;
    v11 = 2;
    objc_msgSend(v6, "getBytes:range:", &v13, 0, 2);
    self->_bodyLength = (unsigned __int16)v13;
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBTLEResponse shortDescription](self, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse header body length with control body: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 15, CFSTR("Failed to parse response."), CFSTR("Failed to parse header body length."), 0, 0);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (HAPBTLERequest)request
{
  return self->_request;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isHeaderComplete
{
  return self->_headerComplete;
}

- (void)setHeaderComplete:(BOOL)a3
{
  self->_headerComplete = a3;
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (NSMutableData)_internalBody
{
  return self->__internalBody;
}

- (void)_setInternalBody:(id)a3
{
  objc_storeStrong((id *)&self->__internalBody, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalBody, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
