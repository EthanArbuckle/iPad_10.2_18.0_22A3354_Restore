@implementation HMDMPCSendMRCommandOperation

- (HMDMPCSendMRCommandOperation)initWithCommand:(unsigned int)a3 options:(id)a4 destination:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  HMDMPCSendMRCommandOperationDefaultExternalObjectInterface *v10;
  HMDMPCSendMRCommandOperation *v11;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(HMDMPCSendMRCommandOperationDefaultExternalObjectInterface);
  v11 = -[HMDMPCSendMRCommandOperation initWithCommand:destination:options:externalObjectInterface:](self, "initWithCommand:destination:options:externalObjectInterface:", v6, v8, v9, v10);

  return v11;
}

- (HMDMPCSendMRCommandOperation)initWithCommand:(unsigned int)a3 destination:(id)a4 options:(id)a5 externalObjectInterface:(id)a6
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  HMDMPCSendMRCommandOperation *v14;
  uint64_t v15;
  NSNumber *mediaRemoteCommand;
  uint64_t v17;
  NSDictionary *options;
  objc_super v20;

  v9 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDMPCSendMRCommandOperation;
  v14 = -[HMFOperation initWithTimeout:](&v20, sel_initWithTimeout_, 0.0);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    mediaRemoteCommand = v14->_mediaRemoteCommand;
    v14->_mediaRemoteCommand = (NSNumber *)v15;

    v17 = objc_msgSend(v12, "copy");
    options = v14->_options;
    v14->_options = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_destination, a4);
    objc_storeStrong((id *)&v14->_externalObjectInterface, a6);
  }

  return v14;
}

- (HMDMPCSendMRCommandOperation)initWithPlaybackArchive:(id)a3 options:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDMPCSendMRCommandOperationDefaultExternalObjectInterface *v11;
  HMDMPCSendMRCommandOperation *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDMPCSendMRCommandOperationDefaultExternalObjectInterface);
  v12 = -[HMDMPCSendMRCommandOperation initWithPlaybackArchive:destination:options:externalObjectInterface:](self, "initWithPlaybackArchive:destination:options:externalObjectInterface:", v10, v8, v9, v11);

  return v12;
}

- (HMDMPCSendMRCommandOperation)initWithPlaybackArchive:(id)a3 destination:(id)a4 options:(id)a5 externalObjectInterface:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDMPCSendMRCommandOperation *v15;
  HMDMPCSendMRCommandOperation *v16;
  uint64_t v17;
  NSDictionary *options;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDMPCSendMRCommandOperation;
  v15 = -[HMFOperation initWithTimeout:](&v20, sel_initWithTimeout_, 0.0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_playbackArchive, a3);
    objc_storeStrong((id *)&v16->_destination, a4);
    v17 = objc_msgSend(v13, "copy");
    options = v16->_options;
    v16->_options = (NSDictionary *)v17;

    objc_storeStrong((id *)&v16->_externalObjectInterface, a6);
  }

  return v16;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  HMDMPCSendMRCommandOperation *v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDMPCSendMRCommandOperation dependencies](self, "dependencies", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "error");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFOperation cancelWithError:](self, "cancelWithError:", v12);
          goto LABEL_18;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[HMDMPCSendMRCommandOperation mediaRemoteCommand](self, "mediaRemoteCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDMPCSendMRCommandOperation mediaRemoteCommand](self, "mediaRemoteCommand");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "unsignedIntValue");
    -[HMDMPCSendMRCommandOperation destination](self, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMPCSendMRCommandOperation options](self, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!self)
      goto LABEL_17;
    v15 = v13;
    v16 = v12;
    -[HMDMPCSendMRCommandOperation externalObjectInterface](self, "externalObjectInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createMPCAssistantCommand");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __66__HMDMPCSendMRCommandOperation_sendMRCommand_destination_options___block_invoke;
    v32 = &unk_24E793E28;
    v33 = self;
    v34 = v18;
    v19 = v18;
    objc_msgSend(v19, "sendCommand:toDestination:withOptions:completion:", v11, v16, v15, &v29);
    goto LABEL_16;
  }
  -[HMDMPCSendMRCommandOperation playbackArchive](self, "playbackArchive");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 8, CFSTR("No command or queue in SendCommandOperation"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](self, "cancelWithError:", v3);
    goto LABEL_19;
  }
  -[HMDMPCSendMRCommandOperation playbackArchive](self, "playbackArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCSendMRCommandOperation destination](self, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCSendMRCommandOperation options](self, "options");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (self)
  {
    v22 = v21;
    v15 = v12;
    v16 = v3;
    -[HMDMPCSendMRCommandOperation externalObjectInterface](self, "externalObjectInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createMPCAssistantCommand");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __72__HMDMPCSendMRCommandOperation_sendPlaybackArchive_destination_options___block_invoke;
    v32 = &unk_24E793E28;
    v33 = self;
    v34 = v24;
    v19 = v24;
    objc_msgSend(v19, "sendPlaybackArchive:toDestination:withOptions:completion:", v16, v15, v22, &v29);

LABEL_16:
  }
LABEL_17:

LABEL_18:
LABEL_19:

}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCSendMRCommandOperation mediaRemoteCommand](self, "mediaRemoteCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCSendMRCommandOperation options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCSendMRCommandOperation destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ MR Command: %@, options: %@ destination: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMPCSendMRCommandOperation mediaRemoteCommand](self, "mediaRemoteCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Media Remote Command"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMPCSendMRCommandOperation options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Options"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMPCSendMRCommandOperation playbackArchive](self, "playbackArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Playback Archive"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMPCSendMRCommandOperation destination](self, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Destination"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (MPCAssistantRemoteControlDestination)destination
{
  return self->_destination;
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSNumber)mediaRemoteCommand
{
  return self->_mediaRemoteCommand;
}

- (HMDMPCSendMRCommandOperationExternalObjectInterface)externalObjectInterface
{
  return (HMDMPCSendMRCommandOperationExternalObjectInterface *)objc_getProperty(self, a2, 344, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalObjectInterface, 0);
  objc_storeStrong((id *)&self->_mediaRemoteCommand, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

void __72__HMDMPCSendMRCommandOperation_sendPlaybackArchive_destination_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2080;
    v14 = "-[HMDMPCSendMRCommandOperation sendPlaybackArchive:destination:options:]_block_invoke";
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[HMDMPCSendMRCommandOperation] %s", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDMPCSendMRCommandOperation generateMPCErrorOrFinishWithError:statuses:](*(void **)(a1 + 32), v5, v6);

}

- (void)generateMPCErrorOrFinishWithError:(void *)a3 statuses:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_35;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v10;
    v41 = 2112;
    v42 = v5;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDMPCSendMRCommandOperation] error %@ statuses %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v8, "mediaRemoteCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "mediaRemoteCommand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue") == 1;

  }
  else
  {
    v13 = 0;
  }

  if (!v5)
    goto LABEL_16;
  if (MRMediaRemoteErrorIsInformational())
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v8;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v17;
      v18 = "%{public}@[HMDMPCSendMRCommandOperation] discarding informational media remote error";
      v19 = v16;
      v20 = 12;
LABEL_14:
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (MPCAssistantErrorIsInformational())
  {
    v14 = (void *)MEMORY[0x227676638]();
    v21 = v8;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      v41 = 2112;
      v42 = v5;
      v18 = "%{public}@[HMDMPCSendMRCommandOperation] discarding informational media playback core assistant error: %@";
      v19 = v16;
      v20 = 22;
      goto LABEL_14;
    }
LABEL_15:

    objc_autoreleasePoolPop(v14);
LABEL_16:
    if ((v13 & objc_msgSend(v6, "containsObject:", &unk_24E96D0D0) & 1) != 0)
    {
      v5 = 0;
      goto LABEL_18;
    }
    if ((objc_msgSend(v6, "containsObject:", &unk_24E96D0E8) & 1) != 0)
    {
      v5 = 0;
LABEL_24:
      objc_msgSend(v8, "finish");
      goto LABEL_35;
    }
    v26 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("statuses %@"), v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hmErrorWithCode:userInfo:", 2005, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    if (!v29)
      goto LABEL_24;
    goto LABEL_32;
  }
  objc_msgSend(v5, "domain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE64CB8]))
    v31 = objc_msgSend(v5, "code") == 1 || objc_msgSend(v5, "code") == 18;
  else
    v31 = 0;

  if ((v13 & (objc_msgSend(v6, "containsObject:", &unk_24E96D0D0) | v31)) == 1)
  {
LABEL_18:
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v8;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v25;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDMPCSendMRCommandOperation] discarding pause media remote error and assuming success as there is no now playing application (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    goto LABEL_24;
  }
  v29 = v5;
  v5 = v29;
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 74, CFSTR("Media remote MPC command failure"), CFSTR("Media remote MPC command failure"), 0, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v8;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v36;
    v41 = 2112;
    v42 = v32;
    v43 = 2112;
    v44 = v29;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[HMDMPCSendMRCommandOperation] Cancel with error %@, underlying error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v33);
  objc_msgSend(v34, "cancelWithError:", v32);

LABEL_35:
}

void __66__HMDMPCSendMRCommandOperation_sendMRCommand_destination_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2080;
    v14 = "-[HMDMPCSendMRCommandOperation sendMRCommand:destination:options:]_block_invoke";
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[HMDMPCSendMRCommandOperation] %s", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDMPCSendMRCommandOperation generateMPCErrorOrFinishWithError:statuses:](*(void **)(a1 + 32), v5, v6);

}

+ (id)shortDescription
{
  return CFSTR("HMDMPCSendMRCommandOperation");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_216339 != -1)
    dispatch_once(&logCategory__hmf_once_t7_216339, &__block_literal_global_216340);
  return (id)logCategory__hmf_once_v8_216341;
}

void __43__HMDMPCSendMRCommandOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_216341;
  logCategory__hmf_once_v8_216341 = v0;

}

@end
