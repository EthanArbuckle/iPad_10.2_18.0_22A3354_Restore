@implementation HMDCameraClipImportMetadata

- (id)initClipData:(id)a3
{
  id v4;
  HMDCameraClipImportMetadata *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  NSArray *posterFrames;
  uint64_t v16;
  NSArray *videoSegments;
  int v18;
  void *v19;
  HMDCameraClipImportMetadata *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCameraClipImportMetadata *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDCameraClipImportMetadata *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDCameraClipImportMetadata *v32;
  NSObject *v33;
  void *v34;
  HMDCameraClipImportMetadata *v35;
  NSObject *v36;
  HMDCameraClipImportMetadata *v37;
  void *v39;
  void *contexta;
  void *context;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)HMDCameraClipImportMetadata;
  v5 = -[HMDCameraClipImportMetadata init](&v42, sel_init);
  if (!v5)
    goto LABEL_28;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("startDate"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v5;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v22;
      v45 = 2112;
      v46 = v4;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not find start date string in clip data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    goto LABEL_27;
  }
  v7 = (void *)v6;
  v8 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v8, "dateFromString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "hmf_numberForKey:", CFSTR("targetFragmentDuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("posterFrames"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("fragments"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_storeStrong((id *)&v5->_startDate, v9);
          objc_msgSend(v10, "doubleValue");
          v5->_targetFragmentDuration = v13;
          objc_msgSend(v11, "na_map:", &__block_literal_global_118);
          v14 = objc_claimAutoreleasedReturnValue();
          posterFrames = v5->_posterFrames;
          v5->_posterFrames = (NSArray *)v14;

          objc_msgSend(v12, "na_map:", &__block_literal_global_121_147949);
          v16 = objc_claimAutoreleasedReturnValue();
          videoSegments = v5->_videoSegments;
          v5->_videoSegments = (NSArray *)v16;

          v18 = 0;
        }
        else
        {
          context = (void *)MEMORY[0x1D17BA0A0]();
          v35 = v5;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v44 = v39;
            v45 = 2112;
            v46 = v4;
            _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find video fragments in clip data: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(context);
          v18 = 1;
        }

      }
      else
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = v5;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          contexta = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v34;
          v45 = 2112;
          v46 = v4;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find poster frames in clip data: %@", buf, 0x16u);

          v31 = contexta;
        }

        objc_autoreleasePoolPop(v31);
        v18 = 1;
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v5;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v30;
        v45 = 2112;
        v46 = v4;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not find target fragment duration in clip data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      v18 = 1;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = v5;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v26;
      v45 = 2112;
      v46 = v7;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not parse start date from string: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v18 = 1;
  }

  if (!v18)
  {
LABEL_28:
    v37 = v5;
    goto LABEL_29;
  }
LABEL_27:
  v37 = 0;
LABEL_29:

  return v37;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (NSArray)videoSegments
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)posterFrames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterFrames, 0);
  objc_storeStrong((id *)&self->_videoSegments, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

HMDCameraClipImportVideoSegmentMetadata *__44__HMDCameraClipImportMetadata_initClipData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraClipImportVideoSegmentMetadata *v3;

  v2 = a2;
  v3 = -[HMDCameraClipImportVideoSegmentMetadata initWithVideoSegmentMetadata:]([HMDCameraClipImportVideoSegmentMetadata alloc], "initWithVideoSegmentMetadata:", v2);

  return v3;
}

HMDCameraClipImportPosterFrameMetadata *__44__HMDCameraClipImportMetadata_initClipData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraClipImportPosterFrameMetadata *v3;

  v2 = a2;
  v3 = -[HMDCameraClipImportPosterFrameMetadata initWithPosterFrameMetadata:]([HMDCameraClipImportPosterFrameMetadata alloc], "initWithPosterFrameMetadata:", v2);

  return v3;
}

@end
