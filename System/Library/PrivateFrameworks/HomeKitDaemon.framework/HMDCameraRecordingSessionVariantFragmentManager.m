@implementation HMDCameraRecordingSessionVariantFragmentManager

- (HMDCameraRecordingSessionVariantFragmentManager)initWithLogIdentifier:(id)a3
{
  id v5;
  HMDCameraRecordingSessionVariantFragmentManager *v6;
  HMDCameraRecordingSessionVariantFragmentManager *v7;
  uint64_t v8;
  NSMutableArray *fullFragmentTimeRanges;
  uint64_t v10;
  NSMutableArray *variantFragments;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraRecordingSessionVariantFragmentManager;
  v6 = -[HMDCameraRecordingSessionVariantFragmentManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logIdentifier, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    fullFragmentTimeRanges = v7->_fullFragmentTimeRanges;
    v7->_fullFragmentTimeRanges = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    variantFragments = v7->_variantFragments;
    v7->_variantFragments = (NSMutableArray *)v10;

  }
  return v7;
}

- (BOOL)expectsVariantFragment
{
  void *v2;
  BOOL v3;

  -[HMDCameraRecordingSessionVariantFragmentManager fullFragmentTimeRanges](self, "fullFragmentTimeRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)handleFullFragment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraRecordingSessionVariantFragmentManager *v9;
  SEL v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[HMDCameraRecordingSessionVariantFragmentManager fullFragmentTimeRanges](self, "fullFragmentTimeRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(v5, "timeRange");
    objc_msgSend(v7, "valueWithCMTimeRange:", &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    -[HMDCameraRecordingSessionVariantFragmentManager _drainVariantFragmentQueue](self, "_drainVariantFragmentQueue");
  }
  else
  {
    v9 = (HMDCameraRecordingSessionVariantFragmentManager *)_HMFPreconditionFailure();
    -[HMDCameraRecordingSessionVariantFragmentManager handleVariantFragment:](v9, v10, v11);
  }
}

- (void)handleVariantFragment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraRecordingSessionVariantFragmentManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraRecordingSessionVariantFragmentManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](self, "variantFragments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 4)
  {
    -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](self, "variantFragments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v13;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Selecting non-overlapping variant fragment: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCameraRecordingSessionVariantFragmentManager delegate](v11, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "variantFragmentManager:didSelectVariantFragment:overlapsFullFragment:", v11, v9, 0);

    -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](v11, "variantFragments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmf_removeFirstObject");

  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](v17, "variantFragments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    v23 = 138543874;
    v24 = v19;
    v25 = 2112;
    v26 = v5;
    v27 = 2048;
    v28 = v21 + 1;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Buffering variant fragment: %@, count: %lu", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](v17, "variantFragments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v5);

  -[HMDCameraRecordingSessionVariantFragmentManager _drainVariantFragmentQueue](v17, "_drainVariantFragmentQueue");
}

- (void)_drainVariantFragmentQueue
{
  HMDCameraRecordingSessionVariantFragmentManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL (*v8)(uint64_t, void *);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  HMDCameraRecordingSessionVariantFragmentManager *v15;
  NSObject *v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, void *);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMDCameraRecordingSessionVariantFragmentManager *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  CMTime time2;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CMTime time1;
  CMTimeRange v40;
  CMTimeRange range;
  uint64_t v42;

  v2 = self;
  v42 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSessionVariantFragmentManager fullFragmentTimeRanges](self, "fullFragmentTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    memset(&v40, 0, sizeof(v40));
    v29 = v4;
    objc_msgSend(v4, "CMTimeRangeValue");
    -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](v2, "variantFragments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = MEMORY[0x24BDAC760];
      v8 = __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke;
      v30 = v2;
      while (1)
      {
        -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](v2, "variantFragments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "timeRange");
        }
        else
        {
          v38 = 0u;
          v36 = 0u;
          v37 = 0u;
        }
        *(_OWORD *)&time1.value = v36;
        time1.epoch = v37;
        range = v40;
        CMTimeRangeGetEnd(&time2, &range);
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
          break;
        -[HMDCameraRecordingSessionVariantFragmentManager fullFragmentTimeRanges](v2, "fullFragmentTimeRanges");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v7;
        v33[1] = 3221225472;
        v33[2] = v8;
        v33[3] = &unk_24E78A0D8;
        v12 = v10;
        v34 = v12;
        v13 = objc_msgSend(v11, "na_any:", v33);

        v14 = (void *)MEMORY[0x227676638]();
        v15 = v2;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = v7;
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(range.start.value) = 138543874;
          *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v19;
          LOWORD(range.start.flags) = 2112;
          *(_QWORD *)((char *)&range.start.flags + 2) = v12;
          HIWORD(range.start.epoch) = 2112;
          range.duration.value = (CMTimeValue)v20;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Selecting variant fragment: %@, overlapsFullFragment: %@", (uint8_t *)&range, 0x20u);

          v8 = v18;
          v7 = v17;
          v2 = v30;
        }

        objc_autoreleasePoolPop(v14);
        -[HMDCameraRecordingSessionVariantFragmentManager delegate](v15, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "variantFragmentManager:didSelectVariantFragment:overlapsFullFragment:", v15, v12, v13);

        -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](v15, "variantFragments");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hmf_removeFirstObject");

        -[HMDCameraRecordingSessionVariantFragmentManager fullFragmentTimeRanges](v15, "fullFragmentTimeRanges");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v7;
        v31[1] = 3221225472;
        v31[2] = __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke_5;
        v31[3] = &unk_24E78A100;
        v32 = v12;
        v24 = v12;
        objc_msgSend(v23, "indexesOfObjectsPassingTest:", v31);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDCameraRecordingSessionVariantFragmentManager fullFragmentTimeRanges](v15, "fullFragmentTimeRanges");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObjectsAtIndexes:", v25);

        -[HMDCameraRecordingSessionVariantFragmentManager variantFragments](v15, "variantFragments");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (!v28)
          goto LABEL_13;
      }

    }
LABEL_13:
    v4 = v29;
  }

}

- (HMDCameraRecordingSessionVariantFragmentManagerDelegate)delegate
{
  return (HMDCameraRecordingSessionVariantFragmentManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)fullFragmentTimeRanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)variantFragments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_variantFragments, 0);
  objc_storeStrong((id *)&self->_fullFragmentTimeRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v10;
  void *v11;
  CMTime v12;
  CMTimeRange v13;
  CMTimeRange v14;
  CMTimeRange v15;
  CMTime time1;
  CMTimeRange v17;
  CMTimeRange v18;
  CMTimeRange v19;
  CMTimeRange v20;
  CMTimeRange v21;
  CMTimeRange v22;
  CMTimeRange v23;
  CMTimeRange v24;
  CMTimeRange v25;
  CMTimeRange v26;
  CMTimeRange otherRange;
  CMTimeRange range;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "CMTimeRangeValue");
  else
    memset(&range, 0, sizeof(range));
  v5 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(&otherRange, 0, sizeof(otherRange));
  CMTimeRangeGetIntersection(&v26, &range, &otherRange);
  if ((v26.start.flags & 1) == 0)
    goto LABEL_22;
  if (v4)
    objc_msgSend(v4, "CMTimeRangeValue");
  else
    memset(&v25, 0, sizeof(v25));
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "timeRange");
  else
    memset(&v24, 0, sizeof(v24));
  CMTimeRangeGetIntersection(&v23, &v25, &v24);
  if ((v23.duration.flags & 1) == 0)
    goto LABEL_22;
  if (v4)
    objc_msgSend(v4, "CMTimeRangeValue");
  else
    memset(&v22, 0, sizeof(v22));
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_msgSend(v7, "timeRange");
  else
    memset(&v21, 0, sizeof(v21));
  CMTimeRangeGetIntersection(&v20, &v22, &v21);
  if (v20.duration.epoch)
    goto LABEL_22;
  if (v4)
    objc_msgSend(v4, "CMTimeRangeValue");
  else
    memset(&v19, 0, sizeof(v19));
  v10 = *(void **)(a1 + 32);
  if (v10)
    objc_msgSend(v10, "timeRange");
  else
    memset(&v18, 0, sizeof(v18));
  CMTimeRangeGetIntersection(&v17, &v19, &v18);
  if (v17.duration.value < 0)
  {
LABEL_22:
    v8 = 1;
  }
  else
  {
    if (v4)
      objc_msgSend(v4, "CMTimeRangeValue");
    else
      memset(&v15, 0, sizeof(v15));
    v11 = *(void **)(a1 + 32);
    if (v11)
      objc_msgSend(v11, "timeRange");
    else
      memset(&v14, 0, sizeof(v14));
    CMTimeRangeGetIntersection(&v13, &v15, &v14);
    time1 = v13.duration;
    v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    v8 = CMTimeCompare(&time1, &v12) != 0;
  }

  return v8;
}

uint64_t __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  CMTimeRange v8;
  CMTime time2;
  CMTimeRange range;
  CMTime time1;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "CMTimeRangeValue");
  else
    memset(&range, 0, sizeof(range));
  CMTimeRangeGetEnd(&time1, &range);
  v5 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(&v8, 0, sizeof(v8));
  CMTimeRangeGetEnd(&time2, &v8);
  v6 = CMTimeCompare(&time1, &time2);

  return v6 >> 31;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_154010 != -1)
    dispatch_once(&logCategory__hmf_once_t3_154010, &__block_literal_global_154011);
  return (id)logCategory__hmf_once_v4_154012;
}

void __62__HMDCameraRecordingSessionVariantFragmentManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_154012;
  logCategory__hmf_once_v4_154012 = v0;

}

@end
