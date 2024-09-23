@implementation NPFlowProperties

- (NPFlowProperties)initWithTLVData:(id)a3
{
  id v4;
  NPFlowProperties *v5;
  void *v6;
  _QWORD v8[4];
  NPFlowProperties *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPFlowProperties;
  v5 = -[NPFlowProperties init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__NPFlowProperties_initWithTLVData___block_invoke;
    v8[3] = &unk_1E4137CC8;
    v9 = v5;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v8);

  }
  return v5;
}

uint64_t __36__NPFlowProperties_initWithTLVData___block_invoke(uint64_t a1, int a2, unsigned int a3, __int128 *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NPTunnelTuscanyEndpoint *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _OWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 1:
      if (a3 == 8)
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)a4;
      return 1;
    case 2:
      if (a3 == 4)
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_DWORD *)a4;
      return 1;
    case 3:
      if (a3 == 8)
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)a4;
      return 1;
    case 4:
      if (a3 == 4)
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_DWORD *)a4;
      return 1;
    case 5:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a4, a3);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      return 1;
    case 6:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a4, a3);
      v10 = -[NPTunnelTuscanyEndpoint initWithEncodedData:]([NPTunnelTuscanyEndpoint alloc], "initWithEncodedData:", v9);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 48);
      *(_QWORD *)(v11 + 48) = v10;

      goto LABEL_19;
    case 9:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a3, 0);
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v35);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v35;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 64);
      *(_QWORD *)(v15 + 64) = v13;

      if (!v14)
        goto LABEL_18;
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 138412290;
      v38 = v14;
      v18 = "Failed to decode the direct endpoint: %@";
      break;
    case 10:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a3, 0);
      v19 = (void *)MEMORY[0x1E0CB3710];
      v20 = (void *)MEMORY[0x1E0C99E60];
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      objc_msgSend(v19, "unarchivedObjectOfClasses:fromData:error:", v23, v9, &v36);
      v24 = objc_claimAutoreleasedReturnValue();
      v14 = v36;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(void **)(v25 + 56);
      *(_QWORD *)(v25 + 56) = v24;

      if (!v14)
        goto LABEL_18;
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 138412290;
      v38 = v14;
      v18 = "Failed to decode the replacement address map: %@";
      break;
    case 11:
      if (a3 == 120)
      {
        v28 = malloc_type_malloc(0x78uLL, 0x723C59F1uLL);
        if (v28)
        {
          v29 = *a4;
          v30 = a4[1];
          v31 = a4[3];
          v28[2] = a4[2];
          v28[3] = v31;
          *v28 = v29;
          v28[1] = v30;
          v32 = a4[4];
          v33 = a4[5];
          v34 = a4[6];
          *((_QWORD *)v28 + 14) = *((_QWORD *)a4 + 14);
          v28[5] = v33;
          v28[6] = v34;
          v28[4] = v32;
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v28;
        }
      }
      return 1;
    default:
      return 1;
  }
  _os_log_error_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
LABEL_17:

LABEL_18:
LABEL_19:

  return 1;
}

- (void)dealloc
{
  unint64_t *timestamps;
  objc_super v4;

  timestamps = self->_timestamps;
  if (timestamps)
  {
    free(timestamps);
    self->_timestamps = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NPFlowProperties;
  -[NPFlowProperties dealloc](&v4, sel_dealloc);
}

- (id)copyTLVData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  unint64_t *timestamps;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v4 = v3;
  if (self->_serviceID)
    -[NSMutableData appendType:length:value:](v3, 1, 8u, (uint64_t)&self->_serviceID);
  if (self->_flowIdentifier)
    -[NSMutableData appendType:length:value:](v4, 2, 4u, (uint64_t)&self->_flowIdentifier);
  if (self->_fallbackTimeout > 0.0)
    -[NSMutableData appendType:length:value:](v4, 3, 8u, (uint64_t)&self->_fallbackTimeout);
  if (self->_flags)
    -[NSMutableData appendType:length:value:](v4, 4, 4u, (uint64_t)&self->_flags);
  if (-[NSData length](self->_requestData, "length"))
    -[NSMutableData appendType:length:value:](v4, 5, -[NSData length](self->_requestData, "length"), (uint64_t)-[NSData bytes](self->_requestData, "bytes"));
  if (self->_replacementEndpoint)
  {
    -[NPFlowProperties replacementEndpoint](self, "replacementEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LOWORD(v5) = objc_msgSend(v6, "length");
    v7 = objc_retainAutorelease(v6);
    -[NSMutableData appendType:length:value:](v4, 6, (unsigned __int16)v5, objc_msgSend(v7, "bytes"));

  }
  if (self->_replacementAddressMap)
  {
    v8 = (void *)MEMORY[0x1E0CB36F8];
    -[NPFlowProperties replacementAddressMap](self, "replacementAddressMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;

    if (v10)
    {
      -[NSMutableData appendType:length:value:](v4, 10, objc_msgSend(v10, "length"), objc_msgSend(objc_retainAutorelease(v10), "bytes"));
    }
    else
    {
      nplog_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v11;
        _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, "Failed to encode replacement address map: %@", buf, 0xCu);
      }

    }
  }
  if (self->_directEndpoint)
  {
    v13 = (void *)MEMORY[0x1E0CB36F8];
    -[NPFlowProperties directEndpoint](self, "directEndpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;

    if (v15)
    {
      -[NSMutableData appendType:length:value:](v4, 9, objc_msgSend(v15, "length"), objc_msgSend(objc_retainAutorelease(v15), "bytes"));
    }
    else
    {
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_error_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_ERROR, "Failed to encode replacement endpoint: %@", buf, 0xCu);
      }

    }
  }
  timestamps = self->_timestamps;
  if (timestamps)
    -[NSMutableData appendType:length:value:](v4, 11, 0x78u, (uint64_t)timestamps);
  return v4;
}

- (BOOL)enableNSP
{
  return self->_flags & 1;
}

- (void)setEnableNSP:(BOOL)a3
{
  self->_flags = self->_flags & 0xFFFFFFFE | a3;
}

- (BOOL)isLoopback
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)setIsLoopback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFD | v3;
}

- (BOOL)disableIdleTimeout
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (void)setDisableIdleTimeout:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFB | v3;
}

- (unint64_t)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(unint64_t)a3
{
  self->_serviceID = a3;
}

- (unsigned)flowIdentifier
{
  return self->_flowIdentifier;
}

- (void)setFlowIdentifier:(unsigned int)a3
{
  self->_flowIdentifier = a3;
}

- (double)fallbackTimeout
{
  return self->_fallbackTimeout;
}

- (void)setFallbackTimeout:(double)a3
{
  self->_fallbackTimeout = a3;
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (NPTunnelTuscanyEndpoint)replacementEndpoint
{
  return self->_replacementEndpoint;
}

- (void)setReplacementEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_replacementEndpoint, a3);
}

- (NSDictionary)replacementAddressMap
{
  return self->_replacementAddressMap;
}

- (void)setReplacementAddressMap:(id)a3
{
  objc_storeStrong((id *)&self->_replacementAddressMap, a3);
}

- (int)dataMode
{
  return self->_dataMode;
}

- (void)setDataMode:(int)a3
{
  self->_dataMode = a3;
}

- (NWEndpoint)directEndpoint
{
  return self->_directEndpoint;
}

- (void)setDirectEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_directEndpoint, a3);
}

- (unint64_t)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(unint64_t *)a3
{
  self->_timestamps = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directEndpoint, 0);
  objc_storeStrong((id *)&self->_replacementAddressMap, 0);
  objc_storeStrong((id *)&self->_replacementEndpoint, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end
