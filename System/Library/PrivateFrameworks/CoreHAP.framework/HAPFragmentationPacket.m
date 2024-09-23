@implementation HAPFragmentationPacket

- (HAPFragmentationPacket)init
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAPFragmentationPacket)initWithFragmentedPacketData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  HAPFragmentationPacket *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v30[2];
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v8;
      v9 = "%{public}@[HAPFragmentationPacket] Invalid parameter 'data'";
      v10 = v7;
      v11 = 12;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v6);
    v12 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)objc_msgSend(v4, "length") <= 0xB)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v8;
      v35 = 2048;
      v36 = 12;
      v9 = "%{public}@[HAPFragmentationPacket] Fragmented data must have a length of at least %lu bytes";
      v10 = v7;
      v11 = 22;
LABEL_7:
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = v5;
  memset(v30, 0, 12);
  if ((unint64_t)objc_msgSend(v13, "length") <= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid serialized data length %tu"), objc_msgSend(v13, "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v22;
      v35 = 2112;
      v36 = (uint64_t)v19;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPFragmentationPacket] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6743, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v18 = v25;
    v26 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v28;
      v35 = 2112;
      v36 = (uint64_t)v18;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationPacket] Failed to deserialize packet header with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v12 = 0;
  }
  else
  {
    objc_msgSend(v13, "getBytes:length:", v30, 12);
    v14 = LOWORD(v30[0]);
    v15 = *(unsigned int *)((char *)v30 + 2);
    v16 = *(unsigned int *)((char *)v30 + 6);

    objc_msgSend(v13, "subdataWithRange:", 12, objc_msgSend(v13, "length") - 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HAPFragmentationPacket initWithData:transactionIdentifier:length:offset:](self, "initWithData:transactionIdentifier:length:offset:", v17, v14, v15, v16);

    v18 = 0;
    v12 = self;
  }

LABEL_17:
  return v12;
}

- (HAPFragmentationPacket)initWithData:(id)a3 transactionIdentifier:(unsigned __int16)a4 length:(unsigned int)a5 offset:(unsigned int)a6
{
  id v11;
  HAPFragmentationPacket *v12;
  HAPFragmentationPacket *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPFragmentationPacket;
  v12 = -[HAPFragmentationPacket init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v13->_transactionIdentifier = a4;
    v13->_length = a5;
    v13->_offset = a6;
  }

  return v13;
}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPFragmentationPacket shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  v6 = -[HAPFragmentationPacket length](self, "length");
  v7 = -[HAPFragmentationPacket offset](self, "offset");
  -[HAPFragmentationPacket data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>"), v4, self, v5, v6, v7, objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPFragmentationPacket shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  v6 = -[HAPFragmentationPacket length](self, "length");
  v7 = -[HAPFragmentationPacket offset](self, "offset");
  -[HAPFragmentationPacket data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>"), v4, v5, v6, v7, objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  int v3;

  v3 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  return -[HAPFragmentationPacket offset](self, "offset") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HAPFragmentationPacket *v4;
  HAPFragmentationPacket *v5;
  int v6;
  unsigned int v7;
  BOOL v8;

  v4 = (HAPFragmentationPacket *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
      v8 = 0;
      if (v6 == -[HAPFragmentationPacket transactionIdentifier](v5, "transactionIdentifier"))
      {
        v7 = -[HAPFragmentationPacket offset](self, "offset");
        if (v7 == -[HAPFragmentationPacket offset](v5, "offset"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v9;
  uint64_t v10;
  int v11;

  LOWORD(v9) = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  *(_DWORD *)((char *)&v9 + 2) = -[HAPFragmentationPacket length](self, "length");
  *(_DWORD *)((char *)&v9 + 6) = -[HAPFragmentationPacket offset](self, "offset");
  v10 = v9;
  v11 = WORD4(v9);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99DF0];
  -[HAPFragmentationPacket data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithCapacity:", objc_msgSend(v5, "length") + 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendData:", v3);
  -[HAPFragmentationPacket data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

  return v6;
}

- (unsigned)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (unsigned)length
{
  return self->_length;
}

- (unsigned)offset
{
  return self->_offset;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
