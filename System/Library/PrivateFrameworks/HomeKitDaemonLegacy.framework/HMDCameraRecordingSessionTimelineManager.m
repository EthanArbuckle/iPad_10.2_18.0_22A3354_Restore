@implementation HMDCameraRecordingSessionTimelineManager

- (HMDCameraRecordingSessionTimelineManager)initWithWorkQueue:(id)a3 fragmentDuration:(double)a4 fragmentCreationReferenceDate:(id)a5 logIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraRecordingSessionTimelineManager *v15;
  HMDCameraRecordingSessionTimelineManager *v16;
  uint64_t v17;
  NSDate *fragmentCreationReferenceDate;
  uint64_t v19;
  NSMutableArray *motionActiveDateIntervals;
  uint64_t v21;
  NSMutableArray *doorbellActiveDateIntervals;
  HMDCameraRecordingSessionTimelineManager *v24;
  SEL v25;
  double v26;
  objc_super v27;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (a4 <= 0.0)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v24 = (HMDCameraRecordingSessionTimelineManager *)_HMFPreconditionFailure();
    return (HMDCameraRecordingSessionTimelineManager *)-[HMDCameraRecordingSessionTimelineManager creationDateForFragmentAtTimeOffset:](v24, v25, v26);
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraRecordingSessionTimelineManager;
  v15 = -[HMDCameraRecordingSessionTimelineManager init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    v16->_fragmentDuration = a4;
    v17 = objc_msgSend(v12, "copy");
    fragmentCreationReferenceDate = v16->_fragmentCreationReferenceDate;
    v16->_fragmentCreationReferenceDate = (NSDate *)v17;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    motionActiveDateIntervals = v16->_motionActiveDateIntervals;
    v16->_motionActiveDateIntervals = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    doorbellActiveDateIntervals = v16->_doorbellActiveDateIntervals;
    v16->_doorbellActiveDateIntervals = (NSMutableArray *)v21;

    objc_storeStrong((id *)&v16->_logIdentifier, a6);
  }

  return v16;
}

- (id)creationDateForFragmentAtTimeOffset:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  -[HMDCameraRecordingSessionTimelineManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](self, "fragmentCreationReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isMotionTriggerActiveAtAnyTimeAfterOffset:(double)a3 forDuration:(double)a4
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRecordingSessionTimelineManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDCameraRecordingSessionTimelineManager creationDateForFragmentAtTimeOffset:](self, "creationDateForFragmentAtTimeOffset:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v8, "dateByAddingTimeInterval:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v8, v10);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDCameraRecordingSessionTimelineManager motionActiveDateIntervals](self, "motionActiveDateIntervals", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "intersectsDateInterval:", v11) & 1) != 0)
        {
          LOBYTE(v13) = 1;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v13;
}

- (BOOL)isDoorbellTriggerActiveAtAnyTimeAfterOffset:(double)a3 forDuration:(double)a4
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRecordingSessionTimelineManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDCameraRecordingSessionTimelineManager creationDateForFragmentAtTimeOffset:](self, "creationDateForFragmentAtTimeOffset:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v8, "dateByAddingTimeInterval:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v8, v10);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDCameraRecordingSessionTimelineManager doorbellActiveDateIntervals](self, "doorbellActiveDateIntervals", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "intersectsDateInterval:", v11) & 1) != 0)
        {
          LOBYTE(v13) = 1;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v13;
}

- (void)handleMotionActive:(BOOL)a3 didChangeAtDate:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraRecordingSessionTimelineManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  HMDCameraRecordingSessionTimelineManager *v32;
  uint64_t v33;
  int v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMDCameraRecordingSessionTimelineManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDCameraRecordingSessionTimelineManager motionActiveDateIntervals](self, "motionActiveDateIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v10);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v9, "endDate");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  if (v4)
  {
    if (!v9
      || (objc_msgSend(v9, "endDate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToDate:", v10),
          v15,
          (v16 & 1) == 0))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v10);
      -[HMDCameraRecordingSessionTimelineManager motionActiveDateIntervals](self, "motionActiveDateIntervals");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v17);

      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](v20, "fragmentCreationReferenceDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", v23);
        v34 = 138543618;
        v35 = v22;
        v36 = 2048;
        v37 = v24;
        v25 = "%{public}@Motion trigger activated at time offset: %f";
LABEL_12:
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v34, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (v9)
  {
    objc_msgSend(v9, "endDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToDate:", v10);

    if (v27)
    {
      -[HMDCameraRecordingSessionTimelineManager motionActiveDateIntervals](self, "motionActiveDateIntervals");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeLastObject");

      v29 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v9, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v29, "initWithStartDate:endDate:", v30, v6);

      -[HMDCameraRecordingSessionTimelineManager motionActiveDateIntervals](self, "motionActiveDateIntervals");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v17);

      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](v32, "fragmentCreationReferenceDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", v23);
        v34 = 138543618;
        v35 = v22;
        v36 = 2048;
        v37 = v33;
        v25 = "%{public}@Motion trigger deactivated at time offset: %f";
        goto LABEL_12;
      }
LABEL_13:

      objc_autoreleasePoolPop(v19);
    }
  }

}

- (void)handleDoorbellDidActivateAtDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraRecordingSessionTimelineManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMDCameraRecordingSessionTimelineManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRecordingSessionTimelineManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSessionTimelineManager doorbellActiveDateIntervals](self, "doorbellActiveDateIntervals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v4;
  -[HMDCameraRecordingSessionTimelineManager fragmentDuration](self, "fragmentDuration");
  objc_msgSend(v8, "dateByAddingTimeInterval:", v9 + v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v10);
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](v13, "fragmentCreationReferenceDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v27 = 138543618;
    v28 = v15;
    v29 = 2048;
    v30 = v18;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Doorbell trigger activated at time offset: %f", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = v13;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](v20, "fragmentCreationReferenceDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v24);
    v27 = 138543618;
    v28 = v22;
    v29 = 2048;
    v30 = v25;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Doorbell trigger will be deactivated at time offset: %f", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDCameraRecordingSessionTimelineManager doorbellActiveDateIntervals](v20, "doorbellActiveDateIntervals");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v11);

}

- (BOOL)isDoorbellTriggerActiveAtAnyTimeAfterOffset:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  -[HMDCameraRecordingSessionTimelineManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](self, "fragmentCreationReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionTimelineManager doorbellActiveDateIntervals](self, "doorbellActiveDateIntervals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  v12 = objc_msgSend(v10, "intersectsDateInterval:", v11);

  return v12;
}

- (BOOL)isMotionTriggerActiveAtAnyTimeAfterOffset:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  -[HMDCameraRecordingSessionTimelineManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](self, "fragmentCreationReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionTimelineManager motionActiveDateIntervals](self, "motionActiveDateIntervals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  v12 = objc_msgSend(v10, "intersectsDateInterval:", v11);

  return v12;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingSessionTimelineManager logIdentifier](self, "logIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingSessionTimelineManager fragmentDuration](self, "fragmentDuration", v5);
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Fragment Duration"), v8);
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingSessionTimelineManager fragmentCreationReferenceDate](self, "fragmentCreationReferenceDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Fragment Creation Reference Date"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (double)fragmentDuration
{
  return self->_fragmentDuration;
}

- (NSDate)fragmentCreationReferenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)motionActiveDateIntervals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)doorbellActiveDateIntervals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_doorbellActiveDateIntervals, 0);
  objc_storeStrong((id *)&self->_motionActiveDateIntervals, 0);
  objc_storeStrong((id *)&self->_fragmentCreationReferenceDate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_62352 != -1)
    dispatch_once(&logCategory__hmf_once_t4_62352, &__block_literal_global_62353);
  return (id)logCategory__hmf_once_v5_62354;
}

void __55__HMDCameraRecordingSessionTimelineManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_62354;
  logCategory__hmf_once_v5_62354 = v0;

}

@end
