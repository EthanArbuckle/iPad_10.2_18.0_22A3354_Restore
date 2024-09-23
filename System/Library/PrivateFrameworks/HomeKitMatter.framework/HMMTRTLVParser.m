@implementation HMMTRTLVParser

+ (id)csrFromNOCSRElements:(id)a3
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  void *v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  v3 = objc_retainAutorelease(a3);
  v4 = (_BYTE *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  if (v5 && *v4 == 21)
  {
    v11 = v5 - 1;
    v12 = v4 + 1;
    v9 = 0;
    v10 = 0;
    v6 = ReadOctetStringWithContextSpecificTag(&v12, (unint64_t *)&v11, &v10, &v9);
    v7 = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)fabricIndicesFromTLV:(id)a3
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  int i;
  uint64_t v8;
  _BYTE *v9;
  void *v11;
  void *v13;
  uint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unint64_t v34;
  _BYTE *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v4 = (_BYTE *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 && *v4 == 21)
  {
    v6 = v5 - 1;
    v34 = v5 - 1;
    v35 = v4 + 1;
    for (i = 1; ; i = 0)
    {
      v8 = v6 - 2;
      if (v6 >= 2)
      {
        v9 = v35;
        if ((*v35 & 0xE0) == 0x20 && (*v35 & 0x1F) == 0x16 && v35[1] == 1)
          break;
      }
      if ((ReadIntegerWithContextSpecificTag(&v35, &v34, &v29) & i & 1) == 0)
        goto LABEL_12;
      v6 = v34;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 < 1)
      goto LABEL_27;
    v14 = 0;
    v15 = v9 + 2;
    v16 = v8;
    while (2)
    {
      v17 = v15[v14];
      if (v17 > 0x1F)
      {
LABEL_27:

        v22 = 0;
LABEL_28:
        v11 = 0;
      }
      else
      {
        v18 = 1;
        v19 = 1;
        switch(v15[v14])
        {
          case 0:
            goto LABEL_25;
          case 1:
            goto LABEL_20;
          case 2:
            goto LABEL_22;
          case 3:
            goto LABEL_24;
          case 4:
            v19 = 0;
            v18 = 1;
            goto LABEL_25;
          case 5:
            v19 = 0;
LABEL_20:
            v18 = 2;
            goto LABEL_25;
          case 6:
            v19 = 0;
LABEL_22:
            v18 = 4;
            goto LABEL_25;
          case 7:
            v19 = 0;
LABEL_24:
            v18 = 8;
LABEL_25:
            if (v16 <= v18)
              goto LABEL_27;
            v20 = v14 + 1;
            LittleEndianNumberFromBytes((uint64_t)&v15[v14 + 1], v18, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v21);

            v14 = v18 + v20;
            v16 = v8 - (v18 + v20);
            if (v8 <= (uint64_t)(v18 + v20))
              goto LABEL_27;
            continue;
          default:
            if (v17 != 24)
              goto LABEL_27;
            v23 = objc_retainAutorelease(v13);

            v24 = v23;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v22 = v24;
            v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
            if (!v25)
              goto LABEL_39;
            v26 = v25;
            v27 = *(_QWORD *)v31;
            break;
        }
        while (2)
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v31 != v27)
              objc_enumerationMutation(v22);
            if ((unint64_t)(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "longLongValue") - 1) > 0xFD)
            {

              goto LABEL_28;
            }
          }
          v26 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
          if (v26)
            continue;
          break;
        }
LABEL_39:

        v22 = v22;
        v11 = v22;
      }
      break;
    }

  }
  else
  {
LABEL_12:
    v11 = 0;
  }

  return v11;
}

+ (id)keyPairDataFromTLV:(id)a3
{
  id v4;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  char v8;
  char v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  id v22;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v5 = (_BYTE *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  if (!v6 || *v5 != 21)
    goto LABEL_17;
  v7 = 0;
  v27 = v6 - 1;
  v28 = v5 + 1;
  v8 = 1;
  while (1)
  {
    v9 = v8;
    v25 = 0;
    v26 = 0;
    v24 = 0;
    v10 = ReadIntegerWithContextSpecificTag(&v28, (unint64_t *)&v27, &v24);
    v11 = v24;
    v12 = v11;
    if (v10)
      break;
    if (!ReadOctetStringWithContextSpecificTag(&v28, (unint64_t *)&v27, &v26, &v25))
    {
      v14 = (void *)MEMORY[0x242656984]();
      v22 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      v19 = "%{public}@Unknown field in the key pair TLV struct";
      v20 = v16;
      v21 = 12;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v26, v25);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
LABEL_9:

    v8 = 0;
    if ((v9 & 1) == 0)
      goto LABEL_18;
  }
  if ((objc_msgSend(v11, "isEqual:", &unk_250F3FBE8) & 1) != 0)
    goto LABEL_9;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2112;
    v32 = v12;
    v19 = "%{public}@Unexpected key pair data version: %@";
    v20 = v16;
    v21 = 22;
LABEL_15:
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);

  }
LABEL_16:

  objc_autoreleasePoolPop(v14);
LABEL_17:
  v7 = 0;
LABEL_18:

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_7847 != -1)
    dispatch_once(&logCategory__hmf_once_t2_7847, &__block_literal_global_7848);
  return (id)logCategory__hmf_once_v3_7849;
}

void __29__HMMTRTLVParser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_7849;
  logCategory__hmf_once_v3_7849 = v0;

}

@end
