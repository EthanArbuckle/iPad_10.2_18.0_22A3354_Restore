@implementation HMDCameraRecordingBulkSendSessionReader

- (HMDCameraRecordingBulkSendSessionReader)initWithWorkQueue:(id)a3 session:(id)a4 readTimeout:(double)a5 logIdentifier:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraRecordingBulkSendSessionReader *v15;

  v10 = (objc_class *)MEMORY[0x24BE3F298];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithTimeInterval:options:", 0, a5);
  v15 = -[HMDCameraRecordingBulkSendSessionReader initWithWorkQueue:session:readCallbackTimer:logIdentifier:](self, "initWithWorkQueue:session:readCallbackTimer:logIdentifier:", v13, v12, v14, v11);

  return v15;
}

- (HMDCameraRecordingBulkSendSessionReader)initWithWorkQueue:(id)a3 session:(id)a4 readCallbackTimer:(id)a5 logIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCameraRecordingBulkSendSessionReader *v15;
  HMDCameraRecordingBulkSendSessionReader *v16;
  uint64_t v17;
  NSString *logIdentifier;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraRecordingBulkSendSessionReader;
  v15 = -[HMDCameraRecordingBulkSendSessionReader init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_session, a4);
    objc_storeStrong((id *)&v16->_readCallbackTimer, a5);
    v17 = objc_msgSend(v14, "copy");
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v17;

  }
  return v16;
}

- (void)start
{
  HMDCameraRecordingBulkSendSessionReader *v2;
  void *v3;
  HMDCameraRecordingBulkSendSessionReader *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  SEL v8;
  SEL v9;
  id Property;
  const char *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v2 = self;
  v14 = *MEMORY[0x24BDAC8D0];
  if (self)
    self = (HMDCameraRecordingBulkSendSessionReader *)objc_getProperty(self, a2, 32, 1);
  dispatch_assert_queue_V2(&self->super.super);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = v2;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting bulk send session reader", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  if (v2)
  {
    objc_msgSend(objc_getProperty(v4, v7, 40, 1), "setDelegate:", v4);
    v2 = (HMDCameraRecordingBulkSendSessionReader *)objc_getProperty(v4, v8, 32, 1);
    Property = objc_getProperty(v4, v9, 40, 1);
  }
  else
  {
    objc_msgSend(0, "setDelegate:", 0);
    Property = 0;
  }
  objc_msgSend(Property, "setDelegateQueue:", v2);

  -[HMDCameraRecordingBulkSendSessionReader _readNextDataChunk](v4, v11);
}

- (void)stopWithReason:(unsigned __int16)a3
{
  const char *v3;
  NSObject *Property;

  if (self)
  {
    v3 = (const char *)a3;
    Property = objc_getProperty(self, a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](self, v3);
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  SEL v7;
  id v8;
  void *v9;
  HMDCameraRecordingBulkSendSessionReader *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 32, 1);
    dispatch_assert_queue_V2(Property);
    v8 = objc_getProperty(self, v7, 40, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    v8 = 0;
  }
  if (v8 == v5)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Read callback timer fired, closing bulk send session", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](v10, (const char *)6);
  }

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDDataStreamBulkSendSession)session
{
  return (HMDDataStreamBulkSendSession *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraRecordingBulkSendSessionReaderDelegate)delegate
{
  return (HMDCameraRecordingBulkSendSessionReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentChunkAssembler, 0);
  objc_storeStrong((id *)&self->_readCallbackTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)_stopWithReason:(void *)a1
{
  NSObject *Property;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  SEL v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    v5 = (void *)MEMORY[0x227676638]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 1024;
      v15 = (int)a2;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping bulk send session reader with reason: %d", (uint8_t *)&v12, 0x12u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelWithReason:", a2);

    objc_msgSend(v6, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bulkSendSessionReader:didFinishWithReason:", v6, a2);

    objc_setProperty_atomic(v6, v11, 0, 40);
  }
}

- (void)_readNextDataChunk
{
  NSObject *Property;
  SEL v4;
  void *v5;
  _QWORD v6[5];

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(objc_getProperty(a1, v4, 40, 1), "resume");
    objc_msgSend(a1, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__HMDCameraRecordingBulkSendSessionReader__readNextDataChunk__block_invoke;
    v6[3] = &unk_24E79A980;
    v6[4] = a1;
    objc_msgSend(v5, "read:", v6);

  }
}

void __61__HMDCameraRecordingBulkSendSessionReader__readNextDataChunk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  HMDDataStreamFragmentChunk *v7;
  NSObject *Property;
  void *v9;
  int v10;
  void *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  HMDDataStreamFragmentChunk *v16;
  const char *v17;
  HMDDataStreamFragmentAssembler *v18;
  void *v19;
  void *v20;
  HMDDataStreamFragmentAssembler *v21;
  SEL v22;
  void *v23;
  void *v24;
  char v25;
  const char *v26;
  char v27;
  const char *v28;
  id v29;
  const char *v30;
  HMDDataStreamFragmentChunk *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  HMDDataStreamFragmentChunk *v45;
  SEL v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  HMDDataStreamFragmentChunk *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  Property = *(NSObject **)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v6, 32, 1);
  dispatch_assert_queue_V2(Property);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isActive");

  if (v10)
  {
    if (v5)
    {
      v11 = *(void **)(a1 + 32);
      v13 = v5;
      if (!v11)
        goto LABEL_30;
      v14 = objc_getProperty(v11, v12, 32, 1);
      dispatch_assert_queue_V2(v14);
      v16 = -[HMDDataStreamFragmentChunk initWithDictionaryRepresentation:]([HMDDataStreamFragmentChunk alloc], "initWithDictionaryRepresentation:", v13);
      if (v16)
      {
        if (!objc_getProperty(v11, v15, 48, 1))
        {
          v18 = [HMDDataStreamFragmentAssembler alloc];
          -[HMDDataStreamFragmentChunk fragmentSequenceNumber](v16, "fragmentSequenceNumber");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamFragmentChunk type](v16, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[HMDDataStreamFragmentAssembler initWithSequenceNumber:type:](v18, "initWithSequenceNumber:type:", v19, v20);
          objc_setProperty_atomic(v11, v22, v21, 48);

        }
        objc_msgSend(objc_getProperty(v11, v17, 48, 1), "sequenceNumber");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamFragmentChunk fragmentSequenceNumber](v16, "fragmentSequenceNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if ((v25 & 1) != 0)
        {
          v59 = v13;
          v61 = 0;
          v27 = objc_msgSend(objc_getProperty(v11, v26, 48, 1), "addFragmentChunk:error:", v16, &v61);
          v29 = v61;
          if ((v27 & 1) != 0)
          {
            objc_msgSend(objc_getProperty(v11, v28, 48, 1), "assembledFragment");
            v31 = (HMDDataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_setProperty_atomic(v11, v30, 0, 48);
              v32 = (void *)MEMORY[0x227676638]();
              v33 = v11;
              HMFGetOSLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v63 = v35;
                v64 = 2112;
                v65 = v31;
                _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Assembled fragment: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v32);
              objc_msgSend(v33, "delegate");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "bulkSendSessionReader:didReadFragment:", v33, v31);

            }
          }
          else
          {
            v49 = (void *)MEMORY[0x227676638]();
            v50 = v11;
            HMFGetOSLogHandle();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v63 = v52;
              v64 = 2112;
              v65 = v16;
              v66 = 2112;
              v67 = v29;
              _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to add data chunk %@ to assembler: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v49);
            -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](v50, (const char *)7);
          }

          v13 = v59;
          goto LABEL_29;
        }
        v41 = (void *)MEMORY[0x227676638]();
        v42 = v11;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamFragmentChunk fragmentSequenceNumber](v16, "fragmentSequenceNumber");
          v60 = v41;
          v45 = (HMDDataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(objc_getProperty(v42, v46, 48, 1), "sequenceNumber");
          v47 = v13;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v44;
          v64 = 2112;
          v65 = v45;
          v66 = 2112;
          v67 = v48;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Received fragment chunk for fragment sequence number %@ even though we haven't received last chunk for fragment sequence number %@", buf, 0x20u);

          v13 = v47;
          v41 = v60;
          goto LABEL_23;
        }
      }
      else
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = v11;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v44;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fragment chunk from stream data dictionary", buf, 0xCu);
LABEL_23:

        }
      }

      objc_autoreleasePoolPop(v41);
      -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](v42, (const char *)7);
LABEL_29:

LABEL_30:
      objc_msgSend(*(id *)(a1 + 32), "session");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "isActive");

      if ((v54 & 1) != 0)
      {
        -[HMDCameraRecordingBulkSendSessionReader _readNextDataChunk](*(_QWORD *)(a1 + 32));
      }
      else
      {
        v55 = (void *)MEMORY[0x227676638]();
        v56 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v58;
          _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_INFO, "%{public}@Data processing marked the bulk send session as inactive", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v55);
      }
      goto LABEL_35;
    }
    v37 = (void *)MEMORY[0x227676638]();
    v38 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v40;
      v64 = 2112;
      v65 = v7;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to read from bulk send session: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](*(void **)(a1 + 32), (const char *)5);
  }
LABEL_35:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_160652 != -1)
    dispatch_once(&logCategory__hmf_once_t8_160652, &__block_literal_global_160653);
  return (id)logCategory__hmf_once_v9_160654;
}

void __54__HMDCameraRecordingBulkSendSessionReader_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_160654;
  logCategory__hmf_once_v9_160654 = v0;

}

@end
