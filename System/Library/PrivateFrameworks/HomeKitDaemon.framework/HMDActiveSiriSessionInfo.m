@implementation HMDActiveSiriSessionInfo

- (HMDActiveSiriSessionInfo)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HMDActiveSiriSessionInfo *v9;
  HMDActiveSiriSessionInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDActiveSiriSessionInfo;
  v9 = -[HMDActiveSiriSessionInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDActiveSiriSessionInfo identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(id=%@, bsFail=%d, bsDone=%d, ssStart=%d, ssStop=%d)"), v4, -[HMDActiveSiriSessionInfo didBulkSendSessionFail](self, "didBulkSendSessionFail"), -[HMDActiveSiriSessionInfo didBulkSendSessionComplete](self, "didBulkSendSessionComplete"), -[HMDActiveSiriSessionInfo didSiriSessionStart](self, "didSiriSessionStart"), -[HMDActiveSiriSessionInfo didSiriSessionStop](self, "didSiriSessionStop"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isBulkSendActive
{
  void *v3;
  _BOOL4 v4;

  -[HMDActiveSiriSessionInfo bulkSendSession](self, "bulkSendSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[HMDActiveSiriSessionInfo didBulkSendSessionFail](self, "didBulkSendSessionFail"))
    v4 = !-[HMDActiveSiriSessionInfo didBulkSendSessionComplete](self, "didBulkSendSessionComplete");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)isSiriSessionActive
{
  _BOOL4 v3;

  v3 = -[HMDActiveSiriSessionInfo didSiriSessionStart](self, "didSiriSessionStart");
  if (v3)
    LOBYTE(v3) = !-[HMDActiveSiriSessionInfo didSiriSessionStop](self, "didSiriSessionStop");
  return v3;
}

- (void)markSiriPluginReady
{
  -[HMDActiveSiriSessionInfo setDidSiriSessionStart:](self, "setDidSiriSessionStart:", 1);
  if (-[HMDActiveSiriSessionInfo isBulkSendActive](self, "isBulkSendActive"))
    -[HMDActiveSiriSessionInfo _doReadAudioFrames](self, "_doReadAudioFrames");
}

- (void)markSiriPluginStopped
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  HMDActiveSiriSessionInfo *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  HMDActiveSiriSessionInfo *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDActiveSiriSessionInfo bulkSendSession](self, "bulkSendSession");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[HMDActiveSiriSessionInfo didBulkSendSessionComplete](self, "didBulkSendSessionComplete");

    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Plugin stopped and all audio was received; closing as complete (%@)",
          (uint8_t *)&v11,
          0x16u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDActiveSiriSessionInfo bulkSendSession](v7, "bulkSendSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancelWithReason:", 0);

      -[HMDActiveSiriSessionInfo setBulkSendSession:](v7, "setBulkSendSession:", 0);
    }
  }
}

- (void)setActiveBulkSendSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDActiveSiriSessionInfo *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDActiveSiriSessionInfo bulkSendSession](self, "bulkSendSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Siri active session got two send sessions? Canceling the latter one.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "cancelWithReason:", 2);
  }
  else
  {
    -[HMDActiveSiriSessionInfo setBulkSendSession:](self, "setBulkSendSession:", v4);
    if (-[HMDActiveSiriSessionInfo isSiriSessionActive](self, "isSiriSessionActive"))
      -[HMDActiveSiriSessionInfo _doReadAudioFrames](self, "_doReadAudioFrames");
  }

}

- (void)invalidate
{
  void *v3;
  HMDActiveSiriSessionInfo *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  HMDActiveSiriSessionInfo *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[HMDActiveSiriSessionInfo isBulkSendActive](self, "isBulkSendActive"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Plugin removed before all audio was received; cancelling (%@)",
        (uint8_t *)&v8,
        0x16u);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDActiveSiriSessionInfo bulkSendSession](v4, "bulkSendSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelWithReason:", 3);

    -[HMDActiveSiriSessionInfo setBulkSendSession:](v4, "setBulkSendSession:", 0);
  }
}

- (void)readFirstFrame
{
  void *v3;
  _QWORD v4[5];

  -[HMDActiveSiriSessionInfo bulkSendSession](self, "bulkSendSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HMDActiveSiriSessionInfo_readFirstFrame__block_invoke;
  v4[3] = &unk_24E79A980;
  v4[4] = self;
  objc_msgSend(v3, "read:", v4);

}

- (BOOL)_maybeHandleFrame:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Audio receive channel has error; closing. (%@)",
        (uint8_t *)&v14,
        0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (!v6 || -[HMDActiveSiriSessionInfo _handleFrame:](self, "_handleFrame:", v6))
    {
      v11 = 1;
      goto LABEL_9;
    }
    -[HMDActiveSiriSessionInfo bulkSendSession](self, "bulkSendSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelWithReason:", 5);

  }
  -[HMDActiveSiriSessionInfo _bulkSendDidFail](self, "_bulkSendDidFail");
  v11 = 0;
LABEL_9:

  return v11;
}

- (void)_doReadAudioFrames
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[HMDActiveSiriSessionInfo bulkSendSession](self, "bulkSendSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDActiveSiriSessionInfo bulkSendSession](self, "bulkSendSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __46__HMDActiveSiriSessionInfo__doReadAudioFrames__block_invoke;
    v5[3] = &unk_24E79A980;
    v5[4] = self;
    objc_msgSend(v4, "read:", v5);

  }
}

- (void)_bulkSendDidFail
{
  id v3;

  if (-[HMDActiveSiriSessionInfo isBulkSendActive](self, "isBulkSendActive"))
  {
    -[HMDActiveSiriSessionInfo setDidBulkSendSessionFail:](self, "setDidBulkSendSessionFail:", 1);
    -[HMDActiveSiriSessionInfo setBulkSendSession:](self, "setBulkSendSession:", 0);
  }
  if (-[HMDActiveSiriSessionInfo isSiriSessionActive](self, "isSiriSessionActive"))
  {
    -[HMDActiveSiriSessionInfo delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeSiriSessionDidStop:", self);

  }
}

- (void)_bulkSendDidComplete
{
  id v3;

  if (-[HMDActiveSiriSessionInfo isBulkSendActive](self, "isBulkSendActive"))
    -[HMDActiveSiriSessionInfo setDidBulkSendSessionComplete:](self, "setDidBulkSendSessionComplete:", 1);
  if (-[HMDActiveSiriSessionInfo isSiriSessionActive](self, "isSiriSessionActive"))
  {
    -[HMDActiveSiriSessionInfo delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeSiriSessionDidStop:", self);

  }
}

- (BOOL)_handleFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HMDActiveSiriSessionInfo *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDActiveSiriSessionInfo *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDActiveSiriSessionInfo *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDActiveSiriSessionInfo *v43;
  NSObject *v44;
  void *v45;
  HMDActiveSiriSessionInfo *v46;
  NSObject *v47;
  void *v49;
  void *context;
  void *contexta;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDActiveSiriSessionInfo delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("firstPassResults"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14 && !objc_msgSend(v7, "length"))
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActiveSiriSessionInfo identifier](v38, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v40;
        v54 = 2112;
        v55 = v41;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@First pass metadata packet observed (%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(v11, "activeSiriSession:didReceiveFirstPassMetadata:", v38, v14);
      v21 = 1;
    }
    else if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rms"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        v21 = v20 != 0;
        if (v20)
        {
          context = v17;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("holdTimeMs"));
          v22 = v11;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
          v25 = v24;

          v11 = v22;
          if (v25)
            objc_msgSend(v22, "activeSiriSession:didReceiveButtonUpWithDuration:", self, v25);
          v26 = v22;
          v17 = context;
          objc_msgSend(v26, "activeSiriSession:didCreateAudioFrame:sequenceNumber:gain:", self, v7, context, v20);

        }
        else
        {
          contexta = (void *)MEMORY[0x227676638]();
          v46 = self;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v53 = v49;
            _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Audio received packet but no Gain", buf, 0xCu);

          }
          objc_autoreleasePoolPop(contexta);
        }

      }
      else
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = self;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v53 = v45;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Audio received packet but no sequence number", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v42);
        v21 = 0;
      }

    }
    else
    {
      v32 = (void *)MEMORY[0x227676638]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActiveSiriSessionInfo identifier](v33, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v35;
        v54 = 2112;
        v55 = v36;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Received packet, but no audio was included (%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      v21 = 0;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActiveSiriSessionInfo identifier](v28, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v30;
      v54 = 2112;
      v55 = v31;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Received packet, but no metadata was included (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    v21 = 0;
  }

  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HMDActiveSiriSessionInfoDelegate)delegate
{
  return (HMDActiveSiriSessionInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didBulkSendSessionFail
{
  return self->_didBulkSendSessionFail;
}

- (void)setDidBulkSendSessionFail:(BOOL)a3
{
  self->_didBulkSendSessionFail = a3;
}

- (BOOL)didBulkSendSessionComplete
{
  return self->_didBulkSendSessionComplete;
}

- (void)setDidBulkSendSessionComplete:(BOOL)a3
{
  self->_didBulkSendSessionComplete = a3;
}

- (BOOL)didSiriSessionStart
{
  return self->_didSiriSessionStart;
}

- (void)setDidSiriSessionStart:(BOOL)a3
{
  self->_didSiriSessionStart = a3;
}

- (BOOL)didSiriSessionStop
{
  return self->_didSiriSessionStop;
}

- (void)setDidSiriSessionStop:(BOOL)a3
{
  self->_didSiriSessionStop = a3;
}

- (HMDDataStreamBulkSendSession)bulkSendSession
{
  return self->_bulkSendSession;
}

- (void)setBulkSendSession:(id)a3
{
  objc_storeStrong((id *)&self->_bulkSendSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulkSendSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __46__HMDActiveSiriSessionInfo__doReadAudioFrames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_maybeHandleFrame:error:", v5, v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "bulkSendSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isActive");

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "_doReadAudioFrames");
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Audio receive channel is complete", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 32), "_bulkSendDidComplete");
    }
  }

}

uint64_t __42__HMDActiveSiriSessionInfo_readFirstFrame__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_maybeHandleFrame:error:", a2, a3);
}

@end
