@implementation SZExtractor(HMFDigest)

+ (id)optionsForArchiveURL:()HMFDigest digest:fileManager:
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "algorithm") - 2;
  if (v11 < 7 && ((0x79u >> v11) & 1) != 0)
  {
    v18 = **((id **)&unk_1E89B4678 + v11);
    objc_msgSend(v8, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v19, &v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v36;

    if (v20)
    {
      v22 = *MEMORY[0x1E0DAFE80];
      v39[0] = v18;
      v23 = *MEMORY[0x1E0DAFE90];
      v38[0] = v22;
      v38[1] = v23;
      objc_msgSend(v9, "value");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "hmf_hexadecimalRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v25;
      v38[2] = *MEMORY[0x1E0DAFE88];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v20, "fileSize"));
      v26 = v20;
      v27 = v18;
      v28 = v21;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = *MEMORY[0x1E0DAFE78];
      v39[2] = v29;
      v39[3] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v28;
      v18 = v27;
      v20 = v26;

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        v42 = 2112;
        v43 = v21;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to get file size with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v17 = 0;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "algorithm");
      HMFDigestAlgorithmToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v15;
      v42 = 2112;
      v43 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid digest algorithm: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = 0;
  }

  return v17;
}

@end
