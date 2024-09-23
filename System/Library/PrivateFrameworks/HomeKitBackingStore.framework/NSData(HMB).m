@implementation NSData(HMB)

- (id)hmbCompress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  z_stream v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[8192];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B6230]();
  memset(&v24, 0, sizeof(v24));
  bzero(v29, 0x2000uLL);
  v3 = deflateInit2_(&v24, -1, 8, 15, 8, 0, "1.2.12", 112);
  if ((_DWORD)v3)
  {
    v11 = v3;
    v12 = (void *)MEMORY[0x1D17B6230](v3, v4, v5, v6, v7, v8, v9, v10);
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v15;
      v27 = 2048;
      v28 = v11;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize zlib for compression: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", deflateBound(&v24, objc_msgSend(a1, "length", *(_OWORD *)&v24.next_in, *(_OWORD *)&v24.total_in, *(_OWORD *)&v24.avail_out, *(_OWORD *)&v24.msg)));
    v17 = objc_retainAutorelease(a1);
    v24.avail_in = objc_msgSend(v17, "length", objc_msgSend(v17, "bytes"));
    while (1)
    {
      v24.avail_out = 0x2000;
      v24.next_out = v29;
      if (deflate(&v24, 4) == -2)
        break;
      objc_msgSend(v16, "appendBytes:length:", v29, 0x2000 - v24.avail_out);
      if (v24.avail_out)
      {
        deflateEnd(&v24);
        v18 = (void *)objc_msgSend(v16, "copy");

        goto LABEL_13;
      }
    }
    v19 = (void *)MEMORY[0x1D17B6230]();
    v20 = v17;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2048;
      v28 = -2;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to deflate data: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    deflateEnd(&v24);

  }
  v18 = 0;
LABEL_13:
  objc_autoreleasePoolPop(v2);
  return v18;
}

- (id)hmbUncompress
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  z_stream v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[8192];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B6230]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 2* objc_msgSend(a1, "length", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0));
  bzero(v23, 0x2000uLL);
  memset(&v18.zalloc, 0, 24);
  v4 = inflateInit2_(&v18, 15, "1.2.12", 112);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2048;
      v22 = v5;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize zlib for uncompression: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10 = objc_retainAutorelease(a1);
    v18.avail_in = objc_msgSend(v10, "length", objc_msgSend(v10, "bytes"));
    while (1)
    {
      v18.avail_out = 0x2000;
      v18.next_out = v23;
      v11 = inflate(&v18, 2);
      if (v11 >= 2)
        break;
      objc_msgSend(v3, "appendBytes:length:", v23, 0x2000 - v18.avail_out);
      if (v11 == 1 && v18.avail_out)
      {
        inflateEnd(&v18);
        v12 = (void *)objc_msgSend(v3, "copy");
        goto LABEL_14;
      }
    }
    v13 = (void *)MEMORY[0x1D17B6230]();
    v14 = v10;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2048;
      v22 = v11;
      _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to inflate data: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    inflateEnd(&v18);
  }
  v12 = 0;
LABEL_14:

  objc_autoreleasePoolPop(v2);
  return v12;
}

- (id)hmbDescription
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "length");
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (v2 < 0x41)
  {
    objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%lu bytes>"), objc_msgSend(a1, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)hmbEncodeQueryableParameter:()HMB
{
  return a3;
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  return a3;
}

+ (uint64_t)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  return objc_msgSend(a3, "hmbDescription");
}

@end
