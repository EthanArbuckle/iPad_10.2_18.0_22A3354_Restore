@implementation HMDCameraRecordingSessionSignificantEventManager

- (HMDCameraRecordingSessionSignificantEventManager)initWithWorkQueue:(id)a3 faceClassificationResolver:(id)a4 logIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDCameraRecordingSessionSignificantEventManager *v13;
  HMDCameraRecordingSessionSignificantEventManager *v14;
  uint64_t v15;
  NSMutableArray *significantEvents;
  id significantEventUUIDFactory;
  id faceClassificationUUIDFactory;
  HMDCameraRecordingSessionSignificantEventManager *v20;
  SEL v21;
  id v22;
  unint64_t v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = v11;
    v24.receiver = self;
    v24.super_class = (Class)HMDCameraRecordingSessionSignificantEventManager;
    v13 = -[HMDCameraRecordingSessionSignificantEventManager init](&v24, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_workQueue, a3);
      objc_storeStrong((id *)&v14->_faceClassificationResolver, a4);
      objc_storeStrong((id *)&v14->_logIdentifier, a5);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = objc_claimAutoreleasedReturnValue();
      significantEvents = v14->_significantEvents;
      v14->_significantEvents = (NSMutableArray *)v15;

      significantEventUUIDFactory = v14->_significantEventUUIDFactory;
      v14->_significantEventUUIDFactory = &__block_literal_global_52860;

      faceClassificationUUIDFactory = v14->_faceClassificationUUIDFactory;
      v14->_faceClassificationUUIDFactory = &__block_literal_global_4_52861;

    }
    return v14;
  }
  else
  {
    v20 = (HMDCameraRecordingSessionSignificantEventManager *)_HMFPreconditionFailure();
    return (HMDCameraRecordingSessionSignificantEventManager *)-[HMDCameraRecordingSessionSignificantEventManager isAnyEventInAnalyzerFragmentResult:includedInRecordingEventTriggers:](v20, v21, v22, v23);
  }
}

- (BOOL)isAnyEventInAnalyzerFragmentResult:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v6 = a3;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDCameraRecordingSessionSignificantEventManager _isAnyEventInAnalyzerEvents:includedInRecordingEventTriggers:](self, "_isAnyEventInAnalyzerEvents:includedInRecordingEventTriggers:", v8, a4))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "frameResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDCameraRecordingSessionSignificantEventManager _isAnyEventInAnalyzerFrameResults:includedInRecordingEventTriggers:](self, "_isAnyEventInAnalyzerFrameResults:includedInRecordingEventTriggers:", v10, a4);

  }
  return v9;
}

- (id)significantEventsForAnalyzerFragmentResult:(id)a3 dateOfOccurrence:(id)a4 timeOffsetWithinClip:(double)a5 recordingEventTriggers:(unint64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t k;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  id obja;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v9, "outcome");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isSuccess");

  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v9, "events");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v47 = v10;
    v48 = v9;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v45)
    {
      v43 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v63 != v43)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v9, "thumbnails");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "data");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraRecordingSessionSignificantEventManager _significantEventsForAnalyzerEvent:dateOfOccurrence:heroFrameData:timeOffsetWithinClip:recordingEventTriggers:](self, "_significantEventsForAnalyzerEvent:dateOfOccurrence:heroFrameData:timeOffsetWithinClip:recordingEventTriggers:", v16, v10, v19, a6, a5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDCameraRecordingSessionSignificantEventManager _filteredAndUpdatedSignificantEventsFromSignificantEvents:](self, "_filteredAndUpdatedSignificantEventsFromSignificantEvents:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v59;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v59 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                objc_msgSend(v26, "UUID");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v26, v27);

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
            }
            while (v23);
          }

          v10 = v47;
          v9 = v48;
        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v45);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v9, "frameResults");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v46)
    {
      v44 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(obja);
          -[HMDCameraRecordingSessionSignificantEventManager _significantEventsForFrameResult:analyzerResult:dateOfOccurrence:timeOffsetWithinClip:recordingEventTriggers:](self, "_significantEventsForFrameResult:analyzerResult:dateOfOccurrence:timeOffsetWithinClip:recordingEventTriggers:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k), v9, v10, a6, a5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraRecordingSessionSignificantEventManager _filteredAndUpdatedSignificantEventsFromSignificantEvents:](self, "_filteredAndUpdatedSignificantEventsFromSignificantEvents:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v51;
            do
            {
              for (m = 0; m != v32; ++m)
              {
                if (*(_QWORD *)v51 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * m);
                objc_msgSend(v35, "UUID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v35, v36);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
            }
            while (v32);
          }

          v10 = v47;
          v9 = v48;
        }
        v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v46);
    }

    if (objc_msgSend(v14, "count"))
    {
      v37 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v14, "allValues");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setWithArray:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HMDCameraRecordingSessionSignificantEventManager _significantEventsForEmptyAnalyzerResult:dateOfOccurrence:timeOffsetWithinClip:](self, "_significantEventsForEmptyAnalyzerResult:dateOfOccurrence:timeOffsetWithinClip:", v9, v10, a5);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[HMDCameraRecordingSessionSignificantEventManager _significantEventsForEmptyAnalyzerResult:dateOfOccurrence:timeOffsetWithinClip:](self, "_significantEventsForEmptyAnalyzerResult:dateOfOccurrence:timeOffsetWithinClip:", v9, v10, a5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

- (void)resetState
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingSessionSignificantEventManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Resetting state", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraRecordingSessionSignificantEventManager significantEvents](v5, "significantEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (BOOL)_isAnyEventInAnalyzerFrameResults:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _QWORD v9[6];

  v6 = a3;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __119__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerFrameResults_includedInRecordingEventTriggers___block_invoke;
  v9[3] = &unk_1E89AC378;
  v9[4] = self;
  v9[5] = a4;
  LOBYTE(a4) = objc_msgSend(v6, "na_any:", v9);

  return a4;
}

- (BOOL)_isAnyEventInAnalyzerEvents:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _QWORD v9[6];

  v6 = a3;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerEvents_includedInRecordingEventTriggers___block_invoke;
  v9[3] = &unk_1E89AC3A0;
  v9[4] = self;
  v9[5] = a4;
  LOBYTE(a4) = objc_msgSend(v6, "na_any:", v9);

  return a4;
}

- (id)_significantEventsForFrameResult:(id)a3 analyzerResult:(id)a4 dateOfOccurrence:(id)a5 timeOffsetWithinClip:(double)a6 recordingEventTriggers:(unint64_t)a7
{
  id v11;
  NSObject *v12;
  void *v13;
  HMDCameraRecordingSessionSignificantEventManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraRecordingSessionSignificantEventManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraRecordingSessionSignificantEventManager *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double Seconds;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  id obj;
  id v48;
  id v49;
  CMTime v50;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v49 = a4;
  v48 = a5;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "events");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v16;
    v62 = 2112;
    v63 = v17;
    v64 = 2112;
    v65 = v18;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Finding significant events for frame result %@ with analyzer events: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v20, "compressedFrameWithScale:quality:error:", &v58, 1.0, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v58;

  if (!v21)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v14;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = v25;
      v62 = 2112;
      v63 = v26;
      v64 = 2112;
      v65 = v45;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hero frame from frame %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
  }
  v27 = v14;
  objc_msgSend(v21, "data", v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v29 = v11;
  objc_msgSend(v11, "events");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v55 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v29, "frame");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
          objc_msgSend(v35, "presentationTimeStamp");
        else
          memset(&lhs, 0, sizeof(lhs));
        objc_msgSend(v49, "fragment");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37)
          objc_msgSend(v37, "timeRange");
        else
          memset(&v50, 0, sizeof(v50));
        rhs = v50;
        CMTimeSubtract(&time, &lhs, &rhs);
        Seconds = CMTimeGetSeconds(&time);

        objc_msgSend(v48, "dateByAddingTimeInterval:", Seconds);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingSessionSignificantEventManager _significantEventsForAnalyzerEvent:dateOfOccurrence:heroFrameData:timeOffsetWithinClip:recordingEventTriggers:](v27, "_significantEventsForAnalyzerEvent:dateOfOccurrence:heroFrameData:timeOffsetWithinClip:recordingEventTriggers:", v34, v40, v28, a7, Seconds + a6);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "unionSet:", v41);

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v31);
  }

  v42 = (void *)objc_msgSend(v19, "copy");
  return v42;
}

- (id)_significantEventsForAnalyzerEvent:(id)a3 dateOfOccurrence:(id)a4 heroFrameData:(id)a5 timeOffsetWithinClip:(double)a6 recordingEventTriggers:(unint64_t)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  void *v32;
  HMDMutableCameraRecordingSessionSignificantEvent *v33;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v37 = a4;
  v12 = a5;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_class();
  v16 = significantEventReasonFromVideoAnalyzerEventClass(v15);
  v17 = objc_msgSend(v11, "confidenceLevel");
  v18 = v17;
  if (v17 >= 3)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v22;
      v40 = 2048;
      v41 = v18;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unknown analyzer event confidence level: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 100;
  }
  else
  {
    v19 = qword_1CDB8F200[v17];
  }
  v23 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = HMCameraSignificantEventTypesFromReasons();

  if ((v26 & v36) != 0)
  {
    v27 = v37;
    v28 = v12;
    -[HMDCameraRecordingSessionSignificantEventManager _faceRecognitionSignificantEventForAnalyzerEvent:dateOfOccurrence:heroFrameData:timeOffsetWithinClip:confidenceLevel:](self, "_faceRecognitionSignificantEventForAnalyzerEvent:dateOfOccurrence:heroFrameData:timeOffsetWithinClip:confidenceLevel:", v11, v37, v12, v19, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v14, "addObject:", v29);
    }
    else
    {
      -[HMDCameraRecordingSessionSignificantEventManager significantEventUUIDFactory](self, "significantEventUUIDFactory");
      v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v31)[2](v31, v11, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = -[HMDCameraRecordingSessionSignificantEvent initWithUUID:]([HMDMutableCameraRecordingSessionSignificantEvent alloc], "initWithUUID:", v32);
      -[HMDCameraRecordingSessionSignificantEvent setReason:](v33, "setReason:", v16);
      -[HMDCameraRecordingSessionSignificantEvent setDateOfOccurrence:](v33, "setDateOfOccurrence:", v37);
      -[HMDCameraRecordingSessionSignificantEvent setConfidenceLevel:](v33, "setConfidenceLevel:", v19);
      -[HMDCameraRecordingSessionSignificantEvent setHeroFrameData:](v33, "setHeroFrameData:", v28);
      -[HMDCameraRecordingSessionSignificantEvent setTimeOffsetWithinClip:](v33, "setTimeOffsetWithinClip:", a6);
      objc_msgSend(v14, "addObject:", v33);

    }
    v30 = (void *)objc_msgSend(v14, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v37;
    v28 = v12;
  }

  return v30;
}

- (id)_significantEventsForEmptyAnalyzerResult:(id)a3 dateOfOccurrence:(id)a4 timeOffsetWithinClip:(double)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  HMDMutableCameraRecordingSessionSignificantEvent *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a3;
  -[HMDCameraRecordingSessionSignificantEventManager significantEventUUIDFactory](self, "significantEventUUIDFactory");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10[2](v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDCameraRecordingSessionSignificantEvent initWithUUID:]([HMDMutableCameraRecordingSessionSignificantEvent alloc], "initWithUUID:", v11);
  objc_msgSend(v9, "outcome");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isSuccess"))
    v14 = 1;
  else
    v14 = 6;
  -[HMDCameraRecordingSessionSignificantEvent setReason:](v12, "setReason:", v14);

  -[HMDCameraRecordingSessionSignificantEvent setDateOfOccurrence:](v12, "setDateOfOccurrence:", v8);
  -[HMDCameraRecordingSessionSignificantEvent setConfidenceLevel:](v12, "setConfidenceLevel:", 100);
  objc_msgSend(v9, "thumbnails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setHeroFrameData:](v12, "setHeroFrameData:", v17);

  -[HMDCameraRecordingSessionSignificantEvent setTimeOffsetWithinClip:](v12, "setTimeOffsetWithinClip:", a5);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEventManager _filteredAndUpdatedSignificantEventsFromSignificantEvents:](self, "_filteredAndUpdatedSignificantEventsFromSignificantEvents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_filteredAndUpdatedSignificantEventsFromSignificantEvents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  HMDCameraRecordingSessionSignificantEventManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDCameraRecordingSessionSignificantEventManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDCameraRecordingSessionSignificantEventManager *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDCameraRecordingSessionSignificantEventManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMDCameraRecordingSessionSignificantEventManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  id obj;
  void *v61;
  uint64_t v62;
  HMDCameraRecordingSessionSignificantEventManager *v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E20];
  v63 = self;
  -[HMDCameraRecordingSessionSignificantEventManager significantEvents](self, "significantEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v4;
  objc_msgSend(v4, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_13_52832);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  v70 = 0u;
  obj = v10;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v64)
  {
    v11 = MEMORY[0x1E0C809B0];
    v62 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v71 != v62)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v69[0] = v11;
        v69[1] = 3221225472;
        v69[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2;
        v69[3] = &unk_1E89AC408;
        v69[4] = v13;
        objc_msgSend(v8, "na_firstObjectPassingTest:", v69);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v13, "sessionEntityUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (!v15)
            goto LABEL_21;
          v67[0] = v11;
          v67[1] = 3221225472;
          v67[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_15;
          v67[3] = &unk_1E89AC408;
          v68 = v15;
          objc_msgSend(v8, "na_firstObjectPassingTest:", v67);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(v13, "faceClassifications");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v65[0] = v11;
            v65[1] = 3221225472;
            v65[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2_16;
            v65[3] = &unk_1E89AC430;
            v20 = v18;
            v66 = v20;
            objc_msgSend(v19, "na_filter:", v65);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v21, "count"))
            {
              v22 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v8, "removeObject:", v20));
              v23 = v63;
              HMFGetOSLogHandle();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v75 = v25;
                v76 = 2112;
                v77 = v21;
                v78 = 2112;
                v79 = v20;
                _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Adding new face classifications %@ to existing significant event: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v22);
              objc_msgSend(v20, "faceClassifications");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setByAddingObjectsFromSet:", v21);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setFaceClassifications:", v27);

              v28 = (void *)objc_msgSend(v20, "copy");
              objc_msgSend(v61, "addObject:", v28);

              goto LABEL_27;
            }

LABEL_21:
            v42 = (void *)MEMORY[0x1D17BA0A0]();
            v43 = v63;
            HMFGetOSLogHandle();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v75 = v45;
              v76 = 2112;
              v77 = v13;
              _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Skipping significant event because it is already represented: %@", buf, 0x16u);

              v11 = MEMORY[0x1E0C809B0];
            }

            objc_autoreleasePoolPop(v42);
          }
          else
          {
            objc_msgSend(v14, "sessionEntityUUID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              v36 = (void *)MEMORY[0x1D17BA0A0]();
              v37 = v63;
              HMFGetOSLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v75 = v39;
                v76 = 2112;
                v77 = v13;
                _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Adding new significant event: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v36);
              -[HMDCameraRecordingSessionSignificantEventManager significantEvents](v37, "significantEvents");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (void *)objc_msgSend(v13, "mutableCopy");
              objc_msgSend(v40, "addObject:", v41);

              objc_msgSend(v61, "addObject:", v13);
            }
            else
            {
              v46 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v8, "removeObject:", v14));
              v47 = v63;
              HMFGetOSLogHandle();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "UUID");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v75 = v49;
                v76 = 2112;
                v77 = v50;
                v78 = 2112;
                v79 = v13;
                _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_INFO, "%{public}@Updating existing significant event with UUID %@ using new significant event: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v46);
              objc_msgSend(v13, "dateOfOccurrence");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setDateOfOccurrence:", v51);

              objc_msgSend(v13, "sessionEntityUUID");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setSessionEntityUUID:", v52);

              objc_msgSend(v13, "faceClassifications");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setFaceClassifications:", v53);

              objc_msgSend(v13, "heroFrameData");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setHeroFrameData:", v54);

              objc_msgSend(v13, "faceCropData");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setFaceCropData:", v55);

              objc_msgSend(v13, "timeOffsetWithinClip");
              objc_msgSend(v14, "setTimeOffsetWithinClip:");
              v56 = (void *)objc_msgSend(v14, "copy");
              objc_msgSend(v61, "addObject:", v56);

            }
LABEL_27:

            v11 = MEMORY[0x1E0C809B0];
          }

          goto LABEL_29;
        }
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = v63;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v75 = v32;
          v76 = 2112;
          v77 = v13;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding new significant event: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        -[HMDCameraRecordingSessionSignificantEventManager significantEvents](v30, "significantEvents");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v33, "addObject:", v34);

        objc_msgSend(v61, "addObject:", v13);
LABEL_29:

      }
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v64);
  }

  v57 = (void *)objc_msgSend(v61, "copy");
  return v57;
}

- (id)_filteredFaceClassificationsFromFaceClassifications:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__HMDCameraRecordingSessionSignificantEventManager__filteredFaceClassificationsFromFaceClassifications___block_invoke;
  v8[3] = &unk_1E89AC458;
  v8[4] = self;
  objc_msgSend(v4, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_faceRecognitionSignificantEventForAnalyzerEvent:(id)a3 dateOfOccurrence:(id)a4 heroFrameData:(id)a5 timeOffsetWithinClip:(double)a6 confidenceLevel:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  id v30;
  void *v31;
  HMDMutableCameraRecordingSessionSignificantEvent *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  _QWORD v41[5];
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[HMDCameraRecordingSessionSignificantEventManager workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  v16 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(v18, "face");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    v22 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v21 = v23;

  }
  objc_msgSend(v21, "faceRecognition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v39 = a7;
    objc_msgSend(v24, "classifications");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSessionSignificantEventManager _filteredFaceClassificationsFromFaceClassifications:](self, "_filteredFaceClassificationsFromFaceClassifications:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __169__HMDCameraRecordingSessionSignificantEventManager__faceRecognitionSignificantEventForAnalyzerEvent_dateOfOccurrence_heroFrameData_timeOffsetWithinClip_confidenceLevel___block_invoke;
      v41[3] = &unk_1E89AC480;
      v41[4] = self;
      v28 = v25;
      v42 = v28;
      objc_msgSend(v27, "na_map:", v41);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSessionSignificantEventManager significantEventUUIDFactory](self, "significantEventUUIDFactory");
      v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sessionEntityUUID");
      v40 = v14;
      v30 = v13;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v29)[2](v29, v16, v31);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = -[HMDCameraRecordingSessionSignificantEvent initWithUUID:]([HMDMutableCameraRecordingSessionSignificantEvent alloc], "initWithUUID:", v38);
      -[HMDCameraRecordingSessionSignificantEvent setReason:](v32, "setReason:", 2);
      -[HMDCameraRecordingSessionSignificantEvent setDateOfOccurrence:](v32, "setDateOfOccurrence:", v30);
      -[HMDCameraRecordingSessionSignificantEvent setConfidenceLevel:](v32, "setConfidenceLevel:", v39);
      objc_msgSend(v28, "sessionEntityUUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSessionSignificantEvent setSessionEntityUUID:](v32, "setSessionEntityUUID:", v33);

      -[HMDCameraRecordingSessionSignificantEvent setFaceClassifications:](v32, "setFaceClassifications:", v37);
      -[HMDCameraRecordingSessionSignificantEvent setHeroFrameData:](v32, "setHeroFrameData:", v40);
      objc_msgSend(v28, "faceCrop");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "dataRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSessionSignificantEvent setFaceCropData:](v32, "setFaceCropData:", v35);

      v13 = v30;
      v14 = v40;

      -[HMDCameraRecordingSessionSignificantEvent setTimeOffsetWithinClip:](v32, "setTimeOffsetWithinClip:", a6);
    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver
{
  return (HMDCameraSignificantEventFaceClassificationResolver *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)significantEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (id)significantEventUUIDFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setSignificantEventUUIDFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)faceClassificationUUIDFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setFaceClassificationUUIDFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_faceClassificationUUIDFactory, 0);
  objc_storeStrong(&self->_significantEventUUIDFactory, 0);
  objc_storeStrong((id *)&self->_significantEvents, 0);
  objc_storeStrong((id *)&self->_faceClassificationResolver, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

HMDMutableCameraSignificantEventFaceClassification *__169__HMDCameraRecordingSessionSignificantEventManager__faceRecognitionSignificantEventForAnalyzerEvent_dateOfOccurrence_heroFrameData_timeOffsetWithinClip_confidenceLevel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  HMDMutableCameraSignificantEventFaceClassification *v6;
  void *v7;
  HMDMutableCameraSignificantEventFaceClassification *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "faceClassificationUUIDFactory");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [HMDMutableCameraSignificantEventFaceClassification alloc];
  objc_msgSend(v3, "sourceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDCameraSignificantEventFaceClassification initWithUUID:personManagerUUID:](v6, "initWithUUID:personManagerUUID:", v5, v7);

  objc_msgSend(v3, "personUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "faceCrop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSignificantEventFaceClassification setUnassociatedFaceCropUUID:](v8, "setUnassociatedFaceCropUUID:", v13);
    goto LABEL_6;
  }
  -[HMDCameraSignificantEventFaceClassification setPersonUUID:](v8, "setPersonUUID:", v9);
  objc_msgSend(*(id *)(a1 + 32), "faceClassificationResolver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personManagerWithUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "sharesFaceClassifications") && (objc_msgSend(v12, "syncsPersonData") & 1) == 0)
  {
    objc_msgSend(v12, "personWithUUID:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSignificantEventFaceClassification setPersonName:](v8, "setPersonName:", v14);

LABEL_6:
  }

  return v8;
}

uint64_t __104__HMDCameraRecordingSessionSignificantEventManager__filteredFaceClassificationsFromFaceClassifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "familiarity");
  if (v4 == 1)
    goto LABEL_4;
  if (v4)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "faceClassificationResolver");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "personManagerWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) != 0)
LABEL_4:
    v8 = 0;
  else
LABEL_5:
    v8 = 1;

  return v8;
}

BOOL __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 v6;

  v3 = a2;
  v6 = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "reason") != 1 || objc_msgSend(v3, "reason") == 6)
  {
    v4 = objc_msgSend(v3, "reason");
    if (v4 != objc_msgSend(*(id *)(a1 + 32), "reason")
      || (v5 = objc_msgSend(v3, "confidenceLevel"), v5 < objc_msgSend(*(id *)(a1 + 32), "confidenceLevel")))
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sessionEntityUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "faceClassifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_3;
  v8[3] = &unk_1E89AC430;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_allObjectsPassTest:", v8);

  return v6;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "personManagerUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personManagerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  objc_msgSend(v3, "personUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "personUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  return v6 ^ 1 | v8;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a2, "sessionEntityUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "sessionEntityUUID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "sessionEntityUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v8 = 1;
    else
      v8 = -1;
  }

  return v8;
}

BOOL __113__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerEvents_includedInRecordingEventTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = significantEventReasonFromVideoAnalyzerEventClass(v4);
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMCameraSignificantEventTypesFromReasons();

  v10 = *(_QWORD *)(a1 + 40) & v9;
  if (v10)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Recording fragment due to recording trigger event: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

  return v10 != 0;
}

uint64_t __119__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerFrameResults_includedInRecordingEventTriggers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_isAnyEventInAnalyzerEvents:includedInRecordingEventTriggers:", v4, *(_QWORD *)(a1 + 40));

  return v5;
}

uint64_t __111__HMDCameraRecordingSessionSignificantEventManager_initWithWorkQueue_faceClassificationResolver_logIdentifier___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
}

uint64_t __111__HMDCameraRecordingSessionSignificantEventManager_initWithWorkQueue_faceClassificationResolver_logIdentifier___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_52868 != -1)
    dispatch_once(&logCategory__hmf_once_t13_52868, &__block_literal_global_25_52869);
  return (id)logCategory__hmf_once_v14_52870;
}

void __63__HMDCameraRecordingSessionSignificantEventManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_52870;
  logCategory__hmf_once_v14_52870 = v0;

}

@end
