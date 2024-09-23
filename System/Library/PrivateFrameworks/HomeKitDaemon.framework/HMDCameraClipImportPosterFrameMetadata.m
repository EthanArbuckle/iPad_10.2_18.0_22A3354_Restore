@implementation HMDCameraClipImportPosterFrameMetadata

- (HMDCameraClipImportPosterFrameMetadata)initWithPosterFrameMetadata:(id)a3
{
  id v4;
  HMDCameraClipImportPosterFrameMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  void *v14;
  HMDCameraClipImportPosterFrameMetadata *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDCameraClipImportPosterFrameMetadata *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDCameraClipImportPosterFrameMetadata *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraClipImportPosterFrameMetadata *v27;
  NSObject *v28;
  void *v29;
  HMDCameraClipImportPosterFrameMetadata *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraClipImportPosterFrameMetadata;
  v5 = -[HMDCameraClipImportPosterFrameMetadata init](&v32, sel_init);
  if (!v5)
    goto LABEL_22;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v5;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v17;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not find resourcePath in poster frame segment metadata: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    goto LABEL_21;
  }
  v7 = (void *)v6;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("offset"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v5;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v21;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find offset in poster frame segment metadata: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);

    goto LABEL_21;
  }
  v9 = (void *)v8;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("width"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "hmf_numberForKey:", CFSTR("height"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_storeStrong((id *)&v5->_resourcePath, v7);
      objc_msgSend(v9, "doubleValue");
      v5->_offset = v12;
      v5->_width = objc_msgSend(v10, "unsignedIntegerValue");
      v13 = 0;
      v5->_height = objc_msgSend(v11, "unsignedIntegerValue");
    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = v5;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v29;
        v35 = 2112;
        v36 = v4;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find height in poster frame segment metadata: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v13 = 1;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v5;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v25;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not find width in poster frame segment metadata: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v13 = 1;
  }

  if (!v13)
  {
LABEL_22:
    v30 = v5;
    goto LABEL_23;
  }
LABEL_21:
  v30 = 0;
LABEL_23:

  return v30;
}

- (NSString)resourcePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)offset
{
  return self->_offset;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end
