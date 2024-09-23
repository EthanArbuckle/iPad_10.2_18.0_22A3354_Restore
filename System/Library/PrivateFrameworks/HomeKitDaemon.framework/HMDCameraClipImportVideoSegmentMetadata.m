@implementation HMDCameraClipImportVideoSegmentMetadata

- (HMDCameraClipImportVideoSegmentMetadata)initWithVideoSegmentMetadata:(id)a3
{
  id v4;
  HMDCameraClipImportVideoSegmentMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *resourcePath;
  double v14;
  HMDCameraClipImportVideoSegmentMetadata *v15;
  void *v16;
  HMDCameraClipImportVideoSegmentMetadata *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCameraClipImportVideoSegmentMetadata *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDCameraClipImportVideoSegmentMetadata *v25;
  NSObject *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMDCameraClipImportVideoSegmentMetadata;
  v5 = -[HMDCameraClipImportVideoSegmentMetadata init](&v29, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v5;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find resourcePath in video segment metadata: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    goto LABEL_17;
  }
  v7 = (void *)v6;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("isHeader"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v5;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find isHeader in video segment metadata: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    goto LABEL_16;
  }
  v9 = (void *)v8;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("duration"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v5;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v27;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find duration in video segment metadata: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);

LABEL_16:
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  v11 = (void *)v10;
  v12 = objc_msgSend(v7, "copy");
  resourcePath = v5->_resourcePath;
  v5->_resourcePath = (NSString *)v12;

  v5->_header = objc_msgSend(v9, "BOOLValue");
  objc_msgSend(v11, "doubleValue");
  v5->_duration = v14;

LABEL_6:
  v15 = v5;
LABEL_18:

  return v15;
}

- (NSString)resourcePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isHeader
{
  return self->_header;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end
