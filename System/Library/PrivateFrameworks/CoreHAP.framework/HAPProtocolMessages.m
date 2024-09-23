@implementation HAPProtocolMessages

+ (id)constructTokenRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 16, a3, a4);
}

+ (id)constructInfoRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 18, a3, a4);
}

+ (id)constructInfoRequest:(id)a3 serviceUUID:(id)a4 outTID:(char *)a5
{
  id v7;
  void *v8;
  id v9;
  __int16 v11;
  _BYTE v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v7 = a4;
  +[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 18, a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 18;
  objc_msgSend(v8, "appendBytes:length:", &v11, 2);
  TLV8BufferInit();
  objc_msgSend(v7, "getUUIDBytes:", v12);

  if (TLV8BufferAppend())
  {
    TLV8BufferFree();
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "appendBytes:length:", v13);
    TLV8BufferFree();
    v9 = v8;
  }

  return v9;
}

+ (id)constructTokenUpdateRequest:(id)a3 token:(id)a4 outTID:(char *)a5
{
  id v8;
  id v9;
  unsigned __int16 v10;
  __int16 v11;
  __int16 v12;
  unsigned int v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  unsigned __int8 v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v41;
  id v42;
  __int16 v43;
  __int16 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  int v48;
  _BYTE v49[255];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  v10 = objc_msgSend(v9, "length");
  v11 = v10 / 0xFFu;
  v12 = v10 % 0xFFu;
  if (v10 % 0xFFu)
    LOBYTE(v11) = v11 + 1;
  v13 = v11;
  v44 = v10 + 2 * v11;
  v42 = v8;
  v14 = a5;
  v15 = v9;
  +[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 17, v8, v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendBytes:length:", &v44, 2);
  TLV8BufferInit();
  if (v13)
  {
    v16 = 0;
    v17 = 255 * (v13 - 1);
    v18 = 255 * v13;
    v43 = v12;
    while (1)
    {
      if (v12)
        v19 = v17 == v16;
      else
        v19 = 0;
      if (v19)
        v20 = v12;
      else
        v20 = -1;
      v21 = v20;
      v22 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v15, "getBytes:range:", v49, v16, v20));
      v23 = a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = v17;
        v26 = v18;
        v27 = a1;
        v28 = v15;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v29;
        v47 = 1024;
        v48 = v21;
        _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Adding token TLV length: %u", buf, 0x12u);

        v15 = v28;
        a1 = v27;
        v18 = v26;
        v17 = v25;
        v12 = v43;
      }

      objc_autoreleasePoolPop(v22);
      v30 = TLV8BufferAppend();
      if (v30)
        break;
      v16 += 255;
      if (v18 == v16)
        goto LABEL_15;
    }
    v34 = v30;
    v35 = TLV8BufferFree();
    v36 = (void *)MEMORY[0x1D17B7244](v35);
    v37 = v23;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v39;
      v47 = 1024;
      v48 = v34;
      _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct token update request status: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v36);
    v32 = 0;
    v31 = v41;
    v33 = v42;
  }
  else
  {
LABEL_15:
    v31 = v41;
    objc_msgSend(v41, "appendBytes:length:", v50);
    TLV8BufferFree();
    v32 = v41;
    v33 = v42;
  }

  return v32;
}

+ (id)constructRequestHeaderFor:(unint64_t)a3 instanceID:(id)a4 outTID:(char *)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  __int16 v11;
  __int16 v13;
  char v14;
  char v15;
  unint64_t v16;

  v16 = a3;
  v6 = (void *)MEMORY[0x1E0C99DF0];
  v7 = a4;
  objc_msgSend(v6, "dataWithCapacity:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "appendBytes:length:", &v15, 1);
  objc_msgSend(v8, "appendBytes:length:", &v16, 1);
  +[HAPBTLETransactionIdentifier randomTransactionIdentifier](HAPBTLETransactionIdentifier, "randomTransactionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedCharValue");

  v14 = v10;
  objc_msgSend(v8, "appendBytes:length:", &v14, 1);
  if (a5)
    *a5 = v14;
  v11 = objc_msgSend(v7, "unsignedShortValue");

  v13 = v11;
  objc_msgSend(v8, "appendBytes:length:", &v13, 2);
  return v8;
}

+ (BOOL)parseTokenResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5 outToken:(id *)a6 outUUID:(id *)a7
{
  _BOOL4 v7;
  int v8;
  id v10;
  unsigned __int16 v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  unsigned __int16 v20;
  id v21;
  int v22;
  int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  unsigned __int16 v33;
  unsigned __int8 v34;
  __int16 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  _BYTE v39[10];
  uint64_t v40;

  v7 = a5;
  v8 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v35 = 0;
  v34 = 0;
  v11 = objc_msgSend(v10, "length");
  v33 = v11;
  if (!v7)
  {
    v20 = v11;
LABEL_8:
    if (objc_msgSend(v10, "length") == v20)
    {
      v21 = objc_retainAutorelease(v10);
      objc_msgSend(v21, "bytes");
      objc_msgSend(v21, "length");
      v22 = TLV8GetOrCopyCoalesced();
      if (v22)
        v23 = v22;
      else
        v23 = -6743;
    }
    else
    {
      v23 = -6742;
    }
    v24 = (void *)MEMORY[0x1D17B7244]();
    v25 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v27;
      v38 = 2048;
      *(_QWORD *)v39 = v23;
      _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Auth response failed status: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);

    return 0;
  }
  _extractResponseHeaderFields(v10, (_BYTE *)&v35 + 1, (uint64_t)&v35, (uint64_t)&v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v35 != v8)
    {
      v13 = (void *)MEMORY[0x1D17B7244]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v16;
        v38 = 1024;
        *(_DWORD *)v39 = v35;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v8;
        v17 = "%{public}@Unexpected TID: 0x%02x expected: 0x%02x";
        v18 = v15;
        v19 = 24;
        goto LABEL_20;
      }
LABEL_21:

      objc_autoreleasePoolPop(v13);
      return 0;
    }
    if (v34)
    {
      v13 = (void *)MEMORY[0x1D17B7244]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v16;
        v38 = 1024;
        *(_DWORD *)v39 = v34;
        v17 = "%{public}@Unexpected Status: 0x%02x";
        v18 = v15;
        v19 = 18;
LABEL_20:
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if ((unint64_t)objc_msgSend(v12, "length") < 2)
    {
      v13 = (void *)MEMORY[0x1D17B7244]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v16;
      v17 = "%{public}@Insufficient body length";
      v18 = v15;
      v19 = 12;
      goto LABEL_20;
    }
    objc_msgSend(v12, "getBytes:length:", &v33, 2);
    objc_msgSend(v12, "subdataWithRange:", 2, objc_msgSend(v12, "length") - 2);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v20 = v33;
    goto LABEL_8;
  }
  v28 = (void *)MEMORY[0x1D17B7244]();
  v29 = a1;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v31;
    _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v28);
  return 0;
}

+ (BOOL)_parseEmptyResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  _BOOL4 v5;
  int v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v22;
  __int16 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v5 = a5;
  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  v23 = 0;
  v22 = 0;
  if (v5)
  {
    _extractResponseHeaderFields(v8, (_BYTE *)&v23 + 1, (uint64_t)&v23, (uint64_t)&v22);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v17 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);

      }
      v11 = 0;
      goto LABEL_14;
    }
    v11 = (void *)v10;
    if (v23 != v6)
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v19 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v20;
        v26 = 1024;
        v27 = v23;
        v28 = 1024;
        v29 = v6;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);

      }
      goto LABEL_14;
    }
    if (v22)
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 1024;
        v27 = v22;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected Status: 0x%02x", buf, 0x12u);

      }
LABEL_14:

      objc_autoreleasePoolPop(v12);
      v16 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = 1;
LABEL_15:

  return v16;
}

+ (BOOL)parseTokenUpdateResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  char v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v5 = a5;
  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("No");
    v16 = 138543874;
    v17 = v12;
    v18 = 2112;
    if (v5)
      v13 = CFSTR("Yes");
    v19 = v8;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Update Response: %@ withHeader: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = objc_msgSend(v10, "_parseEmptyResponse:expectedTID:withHeader:", v8, v6, v5);

  return v14;
}

+ (id)parseInfoResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  _BOOL4 v5;
  int v6;
  id v8;
  unsigned __int16 v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  unsigned __int16 v18;
  id v19;
  int v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  unsigned __int16 v33;
  unsigned __int8 v34;
  __int16 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  _BYTE v39[10];
  uint64_t v40;

  v5 = a5;
  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = 0;
  v34 = 0;
  v9 = objc_msgSend(v8, "length");
  v33 = v9;
  if (!v5)
  {
    v18 = v9;
LABEL_8:
    if (objc_msgSend(v8, "length") == v18)
    {
      v19 = objc_retainAutorelease(v8);
      objc_msgSend(v19, "bytes");
      objc_msgSend(v19, "length");
      v20 = TLV8GetOrCopyCoalesced();
      if (v20)
        v21 = v20;
      else
        v21 = -6743;
    }
    else
    {
      v21 = -6742;
    }
    v28 = (void *)MEMORY[0x1D17B7244]();
    v29 = a1;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v31;
      v38 = 1024;
      *(_DWORD *)v39 = v21;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Acc Info Response failed status: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v28);

    return 0;
  }
  _extractResponseHeaderFields(v8, (_BYTE *)&v35 + 1, (uint64_t)&v35, (uint64_t)&v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v35 != v6)
    {
      v11 = (void *)MEMORY[0x1D17B7244]();
      v12 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v27;
        v38 = 1024;
        *(_DWORD *)v39 = v35;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v6;
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);

      }
      goto LABEL_28;
    }
    if (v34)
    {
      v11 = (void *)MEMORY[0x1D17B7244]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v14;
        v38 = 1024;
        *(_DWORD *)v39 = v34;
        v15 = "%{public}@Unexpected Status: 0x%02x";
        v16 = v13;
        v17 = 18;
LABEL_26:
        _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);

        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if ((unint64_t)objc_msgSend(v10, "length") < 2)
    {
      v11 = (void *)MEMORY[0x1D17B7244]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v14;
        v15 = "%{public}@Insufficient body length";
        v16 = v13;
        v17 = 12;
        goto LABEL_26;
      }
LABEL_27:

LABEL_28:
      objc_autoreleasePoolPop(v11);

      return 0;
    }
    objc_msgSend(v10, "getBytes:length:", &v33, 2);
    objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v18 = v33;
    goto LABEL_8;
  }
  v22 = (void *)MEMORY[0x1D17B7244]();
  v23 = a1;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v25;
    _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  return 0;
}

+ (id)constructAuthChallengeRequest:(id)a3 nonce:(id)a4 outTID:(char *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  __int16 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  +[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 19, a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v12 = objc_msgSend(v7, "length") + 2;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  TLV8BufferInit();
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  if (!TLV8BufferAppend())
  {
    objc_msgSend(v8, "appendBytes:length:", &v12, 2);
    objc_msgSend(v8, "appendBytes:length:", v13);
    TLV8BufferFree();
LABEL_5:
    v10 = (void *)objc_msgSend(v8, "copy");
    goto LABEL_6;
  }
  TLV8BufferFree();
  v10 = 0;
LABEL_6:

  return v10;
}

+ (BOOL)parseAuthChallengeResponse:(id)a3 expectedTID:(unsigned __int8)a4 outChallengeResponse:(id *)a5 outMFICert:(id *)a6 withHeader:(BOOL)a7
{
  _BOOL4 v7;
  int v10;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  int v26;
  int v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v7 = a7;
  v10 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = v12;
  if (v7)
  {
    LOBYTE(v38) = 0;
    LOBYTE(v37) = 0;
    v40 = 0;
    LOWORD(v39) = objc_msgSend(v12, "length");
    _extractResponseHeaderFields(v13, &v38, (uint64_t)&v37, (uint64_t)&v40);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (v37 != v10)
      {
        v15 = (void *)MEMORY[0x1D17B7244]();
        v23 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v24;
          v43 = 1024;
          v44 = v37;
          v45 = 1024;
          v46 = v10;
          _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);

        }
        goto LABEL_13;
      }
      if (v40)
      {
        v15 = (void *)MEMORY[0x1D17B7244]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v18;
          v43 = 1024;
          v44 = v40;
          v19 = "%{public}@Unexpected Status: 0x%02x";
          v20 = v17;
          v21 = 18;
LABEL_10:
          _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);

        }
LABEL_13:

        objc_autoreleasePoolPop(v15);
        v25 = 0;
LABEL_30:

        return v25;
      }
      if ((unint64_t)objc_msgSend(v14, "length") > 1)
      {
        objc_msgSend(v14, "getBytes:length:", &v39, 2);
        objc_msgSend(v14, "subdataWithRange:", 2, objc_msgSend(v14, "length") - 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      v15 = (void *)MEMORY[0x1D17B7244]();
      v36 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v18;
      v19 = "%{public}@Insufficient body length";
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v22 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v18;
      v19 = "%{public}@Failed parsing headers";
    }
    v20 = v17;
    v21 = 12;
    goto LABEL_10;
  }
LABEL_16:
  if (v13)
  {
    v14 = objc_retainAutorelease(v13);
    objc_msgSend(v14, "bytes");
    objc_msgSend(v14, "length");
    v38 = 0;
    v39 = 0;
    v37 = 0;
    v26 = TLV8GetOrCopyCoalesced();
    if (v26)
    {
      v27 = v26;
      v28 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v39, v38);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        free(v37);
        v37 = 0;
      }
      if (a5)
        *a5 = objc_retainAutorelease(v29);
      v30 = TLV8GetOrCopyCoalesced();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v39, v38);
        v28 = (id)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          free(v37);
          v37 = 0;
        }
        if (a6)
        {
          v28 = objc_retainAutorelease(v28);
          *a6 = v28;
        }
        v25 = 1;
        goto LABEL_29;
      }
      v27 = v30;
      v28 = v29;
    }
    v31 = (void *)MEMORY[0x1D17B7244]();
    v32 = a1;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v34;
      v43 = 1024;
      v44 = v27;
      _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Auth challenge response failed status: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v31);
    v25 = 0;
LABEL_29:

    goto LABEL_30;
  }
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1)
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_23100);
  return (id)logCategory__hmf_once_v32;
}

void __34__HAPProtocolMessages_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v32;
  logCategory__hmf_once_v32 = v0;

}

@end
