@implementation SZExtractor(HMFDigest)

+ (id)optionsForArchiveURL:()HMFDigest digest:
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v31;
  void *v32;
  _QWORD v33[4];
  _QWORD v34[4];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "algorithm") - 2;
  if (v8 < 7 && ((0x79u >> v8) & 1) != 0)
  {
    v15 = **((id **)&unk_1E3AB5EF8 + v8);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v16, "attributesOfItemAtPath:error:", v17, &v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v31;

    if (v18)
    {
      v20 = *MEMORY[0x1E0DAFE80];
      v34[0] = v15;
      v21 = *MEMORY[0x1E0DAFE90];
      v33[0] = v20;
      v33[1] = v21;
      objc_msgSend(v7, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hmf_hexadecimalRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v24;
      v33[2] = *MEMORY[0x1E0DAFE88];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "fileSize"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = *MEMORY[0x1E0DAFE78];
      v34[2] = v25;
      v34[3] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = a1;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        v37 = 2112;
        v38 = v19;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to get file size with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v14 = 0;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "algorithm");
      HMFDigestAlgorithmToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v12;
      v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Invalid digest algorithm: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = 0;
  }

  return v14;
}

@end
