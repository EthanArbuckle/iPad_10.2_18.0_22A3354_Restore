@implementation HMDResidentSelectionCoordinationElection

- (HMDResidentSelectionCoordinationElection)initWithContext:(id)a3
{
  id v3;
  HMDResidentSelectionCoordinationElection *v4;
  uint64_t v5;
  HMDPrimaryElectionCoordinationAddOn *coordinationAddOn;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDResidentSelectionCoordinationElection;
  v3 = a3;
  v4 = -[HMDResidentSelectionCoordinationElection init](&v8, sel_init);
  objc_storeWeak((id *)&v4->_context, v3);
  -[HMDResidentSelectionCoordinationElection createElectionAddOnWithContext:](v4, "createElectionAddOnWithContext:", v3, v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  coordinationAddOn = v4->_coordinationAddOn;
  v4->_coordinationAddOn = (HMDPrimaryElectionCoordinationAddOn *)v5;

  -[HMDPrimaryElectionCoordinationAddOn setDelegate:](v4->_coordinationAddOn, "setDelegate:", v4);
  return v4;
}

- (id)createElectionAddOnWithContext:(id)a3
{
  id v3;
  HMDPrimaryElectionCoordinationAddOn *v4;

  v3 = a3;
  v4 = -[HMDPrimaryElectionCoordinationAddOn initWithContext:]([HMDPrimaryElectionCoordinationAddOn alloc], "initWithContext:", v3);

  return v4;
}

- (unint64_t)currentModeType
{
  return 1;
}

- (void)start
{
  void *v3;
  id v4;

  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessages");

  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

}

- (void)stop
{
  id v2;

  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (NSSet)locallyReachableResidents
{
  void *v2;
  void *v3;

  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentsInMesh");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (HMDPreferredResidentsList)localPreferredResidentsList
{
  return 0;
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryResidentChanged:previousResidentDevice:", v7, v6);

}

- (void)registerForMessages
{
  id v2;

  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerForMessages");

}

- (BOOL)residentIsLocallyReachable:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "residentIsPartOfTheCurrentMesh:", v4);

  return v6;
}

- (id)residentsNotPresentInPreferredResidentsList:(id)a3
{
  id v5;
  void *v6;
  HMDResidentSelectionCoordinationElection *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

  return 0;
}

- (id)dumpState
{
  void *v2;
  void *v3;

  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dumpState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[HMDResidentSelectionCoordinationElection coordinationAddOn](self, "coordinationAddOn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowExternalUpdateOfPrimaryResidentTo:", v5);

  return v7;
}

- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  HMDResidentSelectionCoordinationElection *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);

}

- (void)didUpdateResidentSelectionModelTo:(id)a3
{
  id v5;
  void *v6;
  HMDResidentSelectionCoordinationElection *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

}

- (void)currentDeviceReadyAsAResident
{
  void *v4;
  HMDResidentSelectionCoordinationElection *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)configureAsAResidentWithRunPrimaryEvaluation:(BOOL)a3
{
  void *v5;
  HMDResidentSelectionCoordinationElection *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2, a3);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
}

- (void)didReceiveSelectionMessage:(id)a3
{
  id v5;
  void *v6;
  HMDResidentSelectionCoordinationElection *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

}

- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDResidentSelectionCoordinationElection *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

}

- (id)sortedResidents
{
  void *v4;
  HMDResidentSelectionCoordinationElection *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  return 0;
}

- (id)_residentDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDResidentSelectionCoordinationElection context](self, "context", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableResidentDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a6;
  v9 = a4;
  -[HMDResidentSelectionCoordinationElection delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primarySelectionMode:didSelectPrimaryResident:selectionInfo:selectionLogEvent:completion:", self, v9, 0, v8, 0);

}

- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionCoordinationElection delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primarySelectionMode:didFailToSelectWithError:", self, v5);

}

- (void)primaryElectionAddOn:(id)a3 didReceivePrimaryResidentUUIDFromLeader:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDResidentSelectionCoordinationElection _residentDeviceWithIdentifier:](self, "_residentDeviceWithIdentifier:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionCoordinationElection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primarySelectionMode:didReceivePrimaryResidentIdsIdentifier:selectionTimestamp:", self, v7, 0);

}

- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionCoordinationElection delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primarySelectionMode:didUpdateActiveNodes:", self, v5);

}

- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionCoordinationElection delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primarySelectionMode:didUpdateResidentDevice:", self, v5);

}

- (HMDResidentSelectionModeDelegate)delegate
{
  return (HMDResidentSelectionModeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)primaryChangedReason
{
  return self->_primaryChangedReason;
}

- (HMDPrimaryElectionCoordinationAddOn)coordinationAddOn
{
  return (HMDPrimaryElectionCoordinationAddOn *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinationAddOn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMDResidentDeviceManagerContext)context
{
  return (HMDResidentDeviceManagerContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_coordinationAddOn, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
