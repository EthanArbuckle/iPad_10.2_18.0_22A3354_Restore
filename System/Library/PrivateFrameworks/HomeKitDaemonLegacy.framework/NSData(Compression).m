@implementation NSData(Compression)

- (id)hmd_compressedData
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
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  z_stream v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  _BYTE v27[8192];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  memset(&v22, 0, sizeof(v22));
  bzero(v27, 0x2000uLL);
  v3 = deflateInit2_(&v22, -1, 8, 15, 8, 0, "1.2.12", 112);
  if ((_DWORD)v3)
  {
    v11 = v3;
    v12 = (void *)MEMORY[0x1D17BA0A0](v3, v4, v5, v6, v7, v8, v9, v10);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 1024;
      v26 = v11;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize zlib for compression, error %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", deflateBound(&v22, objc_msgSend(a1, "length", *(_OWORD *)&v22.next_in, *(_OWORD *)&v22.total_in, *(_OWORD *)&v22.avail_out, *(_OWORD *)&v22.msg)));
    v16 = objc_retainAutorelease(a1);
    v22.avail_in = objc_msgSend(v16, "length", objc_msgSend(v16, "bytes"));
    while (1)
    {
      v22.avail_out = 0x2000;
      v22.next_out = v27;
      if (deflate(&v22, 4) == -2)
        break;
      objc_msgSend(v15, "appendBytes:length:", v27, 0x2000 - v22.avail_out);
      if (v22.avail_out)
      {
        deflateEnd(&v22);
        v17 = (void *)objc_msgSend(v15, "copy");

        goto LABEL_13;
      }
    }
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 1024;
      v26 = -2;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to compress, error %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v18);
    deflateEnd(&v22);

  }
  v17 = 0;
LABEL_13:
  objc_autoreleasePoolPop(v2);
  return v17;
}

- (id)hmd_uncompressedData
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  z_stream v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  _BYTE v19[8192];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 2* objc_msgSend(a1, "length", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0));
  bzero(v19, 0x2000uLL);
  memset(&v14.zalloc, 0, 24);
  v4 = inflateInit2_(&v14, 15, "1.2.12", 112);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 1024;
      v18 = v5;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize zlib for uncompression, error %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v9 = objc_retainAutorelease(a1);
    v14.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"));
    while (1)
    {
      v14.avail_out = 0x2000;
      v14.next_out = v19;
      v10 = inflate(&v14, 2);
      if (v10 >= 2)
        break;
      v11 = v10;
      objc_msgSend(v3, "appendBytes:length:", v19, 0x2000 - v14.avail_out);
      if (v11 == 1 && v14.avail_out)
      {
        inflateEnd(&v14);
        v12 = (void *)objc_msgSend(v3, "copy");
        goto LABEL_12;
      }
    }
    inflateEnd(&v14);
  }
  v12 = 0;
LABEL_12:

  objc_autoreleasePoolPop(v2);
  return v12;
}

@end
