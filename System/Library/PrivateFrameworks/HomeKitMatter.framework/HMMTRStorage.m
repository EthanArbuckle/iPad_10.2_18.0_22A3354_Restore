@implementation HMMTRStorage

- (NSSet)pairedNodeIDs
{
  return (NSSet *)-[HMMTRStorage pairedNodeIDsOnSystemCommissionerFabric:](self, "pairedNodeIDsOnSystemCommissionerFabric:", -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"));
}

- (void)setPairedNodeIDs:(id)a3
{
  id v4;

  v4 = a3;
  -[HMMTRStorage setPairedNodeIDs:forSystemCommissionerFabric:](self, "setPairedNodeIDs:forSystemCommissionerFabric:", v4, -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"));

}

- (void)addPairedNodeID:(id)a3
{
  id v4;

  v4 = a3;
  -[HMMTRStorage addPairedNodeID:toSystemCommissionerFabric:](self, "addPairedNodeID:toSystemCommissionerFabric:", v4, -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"));

}

- (void)removePairedNodeID:(id)a3
{
  id v4;

  v4 = a3;
  -[HMMTRStorage removePairedNodeID:fromSystemCommissionerFabric:](self, "removePairedNodeID:fromSystemCommissionerFabric:", v4, -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"));

}

- (id)pairedNodeIDsOnSystemCommissionerFabric:(BOOL)a3
{
  void *v4;
  void *v5;

  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.PairedNodeIDs"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage pairedNodeIDsFromStoredStringValue:](self, "pairedNodeIDsFromStoredStringValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pairedNodeIDsFromStoredStringValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HMMTRStorage *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRStorage *v20;
  NSObject *v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v4, 0);
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD1620];
      v7 = (void *)MEMORY[0x24BDBCF20];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v25[2] = objc_opt_class();
      v25[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v24;

      if (v10)
      {
        v12 = v10;
      }
      else
      {
        v19 = (void *)MEMORY[0x242656984]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v22;
          v28 = 2112;
          v29 = v11;
          _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_FAULT, "%{public}@Failed to load NodeID set with Error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;

    }
    else
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRStorage fabricID](v15, "fabricID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2112;
        v29 = v18;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@No paired NodeIDs set for fabricMapping index:%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)setPairedNodeIDs:(id)a3 forSystemCommissionerFabric:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  HMMTRStorage *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    -[HMMTRStorage storedStringValueFromPairedNodeIDs:](self, "storedStringValueFromPairedNodeIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.PairedNodeIDs"), v7, v4);

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_FAULT, "%{public}@Invalid value for pairedNodeID set", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)storedStringValueFromPairedNodeIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMTRStorage *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMMTRUtilities encodeObject:](HMMTRUtilities, "encodeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_FAULT, "%{public}@Failed to encode NodeID set", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)addPairedNodeID:(id)a3 toSystemCommissionerFabric:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__HMMTRStorage_Records__addPairedNodeID_toSystemCommissionerFabric___block_invoke;
  v8[3] = &unk_250F206E8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[HMMTRStorage setValueForKey:removingKeys:systemCommissionerFabric:block:](self, "setValueForKey:removingKeys:systemCommissionerFabric:block:", CFSTR("HMD.MTRPlugin.PairedNodeIDs"), 0, v4, v8);

}

- (void)removePairedNodeID:(id)a3 fromSystemCommissionerFabric:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__HMMTRStorage_Records__removePairedNodeID_fromSystemCommissionerFabric___block_invoke;
  v8[3] = &unk_250F206E8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[HMMTRStorage setValueForKey:removingKeys:systemCommissionerFabric:block:](self, "setValueForKey:removingKeys:systemCommissionerFabric:block:", CFSTR("HMD.MTRPlugin.PairedNodeIDs"), 0, v4, v8);

}

- (void)setSystemCommissionerFabricID:(id)a3
{
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"), a3, 1);
}

- (id)fabricIDForSystemCommissioner
{
  return -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"), 1);
}

- (void)setStaged:(BOOL)a3 forNode:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.Staged."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v7, v6);

}

- (BOOL)isStagedForNode:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.Staged."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setVendorID:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.VendorID."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v7, v6);

}

- (id)vendorIDForNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.VendorID."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setProductID:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.ProductID."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v7, v6);

}

- (id)productIDForNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.ProductID."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCategory:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.Category."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v7, v6);

}

- (id)categoryForNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.Category."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setConfigNumber:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.ConfigNumber."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v7, v6);

}

- (id)configNumberForNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.ConfigNumber."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFabricID:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.FabricIndex."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v7, v6);

}

- (id)fabricIndexForNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.FabricIndex."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTopology:(id)a3 forNode:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.Topology."));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v8, v7);
}

- (id)topologyForNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.Topology."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v5, 0);
  else
    v6 = 0;

  return v6;
}

- (void)setRootCertificate:(id)a3
{
  id v4;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.RootCert"), v4, 0);

}

- (id)rootCertificate
{
  void *v2;
  void *v3;

  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.RootCert"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v2, 0);
  else
    v3 = 0;

  return v3;
}

- (void)setOperationalCertificate:(id)a3
{
  id v4;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.OperationalCert"), v4, 0);

}

- (id)operationalCertificate
{
  void *v2;
  void *v3;

  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.OperationalCert"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v2, 0);
  else
    v3 = 0;

  return v3;
}

- (void)setControllerNodeID:(id)a3
{
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.ControllerNodeID"), a3, 0);
}

- (id)controllerNodeID
{
  return -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", CFSTR("HMD.MTRPlugin.ControllerNodeID"), 0);
}

- (void)removeRecordsForNode:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRStorage removeRecordsForNodeIDs:systemCommissionerFabric:](self, "removeRecordsForNodeIDs:systemCommissionerFabric:", v8, v4, v9, v10);
}

- (void)removeRecordsForNodeIDs:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  id v5;
  void *v6;
  HMMTRStorage *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  HMMTRStorage *v24;
  _BOOL4 v25;
  id obj;
  _QWORD v27[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v25 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v9;
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Deleting records from storage for node IDs: %@", buf, 0x16u);

  }
  v24 = v7;

  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v15, CFSTR("HMD.MTRPlugin.VendorID."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v15, CFSTR("HMD.MTRPlugin.Topology."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v15, CFSTR("HMD.MTRPlugin.FabricIndex."));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

        +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v15, CFSTR("HMD.MTRPlugin.ProductID."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v19);

        +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v15, CFSTR("HMD.MTRPlugin.Category."));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v20);

        +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v15, CFSTR("HMD.MTRPlugin.ConfigNumber."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v21);

        +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v15, CFSTR("HMD.MTRPlugin.Staged."));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v22);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __74__HMMTRStorage_Records__removeRecordsForNodeIDs_systemCommissionerFabric___block_invoke;
  v27[3] = &unk_250F206E8;
  v27[4] = v24;
  v28 = obj;
  v23 = obj;
  -[HMMTRStorage setValueForKey:removingKeys:systemCommissionerFabric:block:](v24, "setValueForKey:removingKeys:systemCommissionerFabric:block:", CFSTR("HMD.MTRPlugin.PairedNodeIDs"), v10, v25, v27);

}

- (void)removeAndSyncAllKeysNotIncludedInActiveNodeIDs:(id)a3
{
  id v4;
  void *v5;
  HMMTRStorage *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing all keys not included in active node IDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__HMMTRStorage_Records__removeAndSyncAllKeysNotIncludedInActiveNodeIDs___block_invoke;
  v10[3] = &unk_250F20710;
  v10[4] = v6;
  v11 = v4;
  v9 = v4;
  -[HMMTRStorage replaceAllKeysAndSyncWithBlock:systemCommissionerFabric:](v6, "replaceAllKeysAndSyncWithBlock:systemCommissionerFabric:", v10, -[HMMTRStorage isSystemCommissionerFabric](v6, "isSystemCommissionerFabric", v10[0], 3221225472, __72__HMMTRStorage_Records__removeAndSyncAllKeysNotIncludedInActiveNodeIDs___block_invoke, &unk_250F20710, v6));

}

- (id)nodeIDForFabricID:(id)a3 deviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  HMMTRStorage *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  HMMTRStorage *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMMTRStorage *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMMTRStorage *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMMTRStorage *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMMTRStorage *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];
  _QWORD v72[6];

  v72[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMMTRStorage dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storageDataSourceForFabricWithID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "keyValueStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.PairedNodeIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v11, 0);
      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDD1620];
        v14 = (void *)MEMORY[0x24BDBCF20];
        v72[0] = objc_opt_class();
        v72[1] = objc_opt_class();
        v72[2] = objc_opt_class();
        v72[3] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v16, v12, &v62);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v62;

        if (v17)
        {
          v54 = v12;
          v55 = v11;
          v56 = v9;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v53 = v17;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v59;
            while (2)
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v59 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", v23, v53, v54, v55, v56);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v7, "hasPrefix:", v24);

                if (v25)
                {
                  v43 = (void *)MEMORY[0x242656984]();
                  v44 = self;
                  HMFGetOSLogHandle();
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v64 = v46;
                    v65 = 2112;
                    v66 = v23;
                    v67 = 2112;
                    v68 = v6;
                    v69 = 2112;
                    v70 = v7;
                    _os_log_impl(&dword_23E95B000, v45, OS_LOG_TYPE_INFO, "%{public}@NodeID %@ returned for fabric ID %@ and device identifier %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v43);
                  v30 = v23;

                  goto LABEL_28;
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
              if (v20)
                continue;
              break;
            }
          }

          v26 = (void *)MEMORY[0x242656984]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v64 = v29;
            v65 = 2112;
            v66 = v7;
            v67 = 2112;
            v68 = v6;
            _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to find nodeID matching device identifier %@ in fabric ID %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v26);
          v30 = 0;
LABEL_28:
          v11 = v55;
          v9 = v56;
          v17 = v53;
          v12 = v54;
        }
        else
        {
          v47 = (void *)MEMORY[0x242656984]();
          v48 = self;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = v9;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v64 = v51;
            v65 = 2112;
            v66 = v6;
            v67 = 2112;
            v68 = v57;
            _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to load NodeID set for fabric ID %@ with error: %@", buf, 0x20u);

            v9 = v50;
            v17 = 0;
          }

          objc_autoreleasePoolPop(v47);
          v30 = 0;
        }

      }
      else
      {
        v39 = (void *)MEMORY[0x242656984]();
        v40 = self;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v64 = v42;
          v65 = 2112;
          v66 = v6;
          _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_ERROR, "%{public}@No paired NodeIDs set for fabric ID %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v39);
        v30 = 0;
      }

    }
    else
    {
      v35 = (void *)MEMORY[0x242656984]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = v38;
        v65 = 2112;
        v66 = v6;
        _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_ERROR, "%{public}@Fabric storage for fabric ID %@ does not include paired node IDs", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      v30 = 0;
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x242656984]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v34;
      v65 = 2112;
      v66 = v6;
      _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Request for nodeID failed to find storage for matching fabric ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    v30 = 0;
  }

  return v30;
}

- (void)setUuid:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.MTS.UUID."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)uuidForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.MTS.UUID."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSystemCommissionerFabricNodeID:(id)a3 forUuid:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("HMD.MTRPlugin.MTS.NodeIDForUUID."), "stringByAppendingString:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)systemCommissionerFabricNodeIDForUuid:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("HMD.MTRPlugin.MTS.NodeIDForUUID."), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeSystemCommissionerFabricNodeIDForUuid:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "UUIDString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("HMD.MTRPlugin.MTS.NodeIDForUUID."), "stringByAppendingString:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](self, "removeValueForKey:systemCommissionerFabric:", v4, 1);

}

- (void)setSerialNumber:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.MTS.SerialNumber."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)serialNumberForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.MTS.SerialNumber."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDeviceName:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.MTS.DeviceName."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)deviceNameForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.MTS.DeviceName."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSetupPayload:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.MTS.SetupPayloadString."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)setupPayloadForSystemCommissionerFabricNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.SetupPayload."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](self, "removeValueForKey:systemCommissionerFabric:", v5, 1);
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.SetupPayloadString."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v7, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
      -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v10, 1);
    else
      v8 = 0;
  }

  return v8;
}

- (void)setVendorID:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.VendorID."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)vendorIDForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.VendorID."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setProductID:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.ProductID."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)productIDForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.ProductID."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCategory:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.Category."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)categoryForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.Category."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setWEDSupported:(BOOL)a3 forSystemCommissionerFabricNode:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.MTS.WEDSupported."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (BOOL)wedSupportedForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.MTS.WEDSupported."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = objc_msgSend(v7, "isEqual:", &unk_250F3F198) ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (void)setExtendedMACAddress:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a4, CFSTR("HMD.MTRPlugin.MTS.ExtendedMACAddress."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, 1);

}

- (id)extendedMACAddressForSystemCommissionerFabricNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", a3, CFSTR("HMD.MTRPlugin.MTS.ExtendedMACAddress."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)removeRecordsForSystemCommissionerFabricNode:(id)a3
{
  id v4;
  void *v5;
  HMMTRStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Deleting records from storage for System Commissioner Fabric NodeID: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRStorage removePairedNodeID:fromSystemCommissionerFabric:](v6, "removePairedNodeID:fromSystemCommissionerFabric:", v4, 1);
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.VendorID."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v9, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.Topology."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v10, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.FabricIndex."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v11, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.ProductID."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v12, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.Category."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v13, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.ConfigNumber."));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v14, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.Staged."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v15, 1);

  -[HMMTRStorage uuidForSystemCommissionerFabricNode:](v6, "uuidForSystemCommissionerFabricNode:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    -[HMMTRStorage _removeSystemCommissionerFabricNodeIDForUuid:](v6, "_removeSystemCommissionerFabricNodeIDForUuid:", v16);
  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.UUID."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v17, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.SerialNumber."));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v18, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.DeviceName."));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v19, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.SetupPayload."));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v20, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.SetupPayloadString."));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v21, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.WEDSupported."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v22, 1);

  +[HMMTRStorage formatKeyForNodeId:key:](HMMTRStorage, "formatKeyForNodeId:key:", v4, CFSTR("HMD.MTRPlugin.MTS.ExtendedMACAddress."));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](v6, "removeValueForKey:systemCommissionerFabric:", v23, 1);

}

id __72__HMMTRStorage_Records__removeAndSyncAllKeysNotIncludedInActiveNodeIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[HMMTRStorage accessoryNodeIDFromPluginKey:](HMMTRStorage, "accessoryNodeIDFromPluginKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (!objc_msgSend(v5, "isEqual:", CFSTR("HMD.MTRPlugin.PairedNodeIDs")))
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 32), "pairedNodeIDsFromStoredStringValue:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = (void *)objc_msgSend(v10, "copy");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v20 = v6;
      v14 = 0;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v17) & 1) == 0)
          {
            objc_msgSend(v10, "removeObject:", v17);
            v14 = 1;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);

      v6 = v20;
      if ((v14 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "storedStringValueFromPairedNodeIDs:", v10);
        v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v8 = v18;

        goto LABEL_20;
      }
    }
    else
    {

    }
    v18 = v6;
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7))
  {
LABEL_16:
    v8 = v6;
    goto LABEL_20;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

id __74__HMMTRStorage_Records__removeRecordsForNodeIDs_systemCommissionerFabric___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pairedNodeIDsFromStoredStringValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "storedStringValueFromPairedNodeIDs:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __73__HMMTRStorage_Records__removePairedNodeID_fromSystemCommissionerFabric___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "pairedNodeIDsFromStoredStringValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "storedStringValueFromPairedNodeIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __68__HMMTRStorage_Records__addPairedNodeID_toSystemCommissionerFabric___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "pairedNodeIDsFromStoredStringValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "storedStringValueFromPairedNodeIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)removeRecordsForUnpairedNodesInDict:(id)a3 pairedNodes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[HMMTRStorage nodeIdFromPluginKey:](HMMTRStorage, "nodeIdFromPluginKey:", v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)chipPluginStorageKeys
{
  if (chipPluginStorageKeys_onceToken != -1)
    dispatch_once(&chipPluginStorageKeys_onceToken, &__block_literal_global_450);
  return (id)chipPluginStorageKeys_storageKeys;
}

+ (id)chipPluginStorageAccessoryNodeSpecificKeys
{
  if (chipPluginStorageAccessoryNodeSpecificKeys_onceToken != -1)
    dispatch_once(&chipPluginStorageAccessoryNodeSpecificKeys_onceToken, &__block_literal_global_54);
  return (id)chipPluginStorageAccessoryNodeSpecificKeys_storageKeys;
}

+ (id)matterStorageKeys
{
  if (matterStorageKeys_onceToken != -1)
    dispatch_once(&matterStorageKeys_onceToken, &__block_literal_global_57);
  return (id)matterStorageKeys_storageKeys;
}

+ (id)ignoredMatterStorageKeys
{
  if (ignoredMatterStorageKeys_onceToken != -1)
    dispatch_once(&ignoredMatterStorageKeys_onceToken, &__block_literal_global_72);
  return (id)ignoredMatterStorageKeys_storageKeys;
}

+ (id)memoryStorageKeys
{
  if (memoryStorageKeys_onceToken != -1)
    dispatch_once(&memoryStorageKeys_onceToken, &__block_literal_global_79);
  return (id)memoryStorageKeys_storageKeys;
}

+ (BOOL)isMatterKey:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[HMMTRStorage matterStorageKeys](HMMTRStorage, "matterStorageKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)) & 1) != 0)
          {
            v5 = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^f/[0-9a-fA-F]+/s/"), 0, &v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "count") == 1;

LABEL_13:
  }

  return v5;
}

+ (BOOL)isPluginKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMMTRStorage chipPluginStorageKeys](HMMTRStorage, "chipPluginStorageKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRStorage keyByStrippingNodeIdFromKey:](HMMTRStorage, "keyByStrippingNodeIdFromKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);
  return (char)v3;
}

+ (BOOL)isPluginAccessoryNodeKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMMTRStorage chipPluginStorageAccessoryNodeSpecificKeys](HMMTRStorage, "chipPluginStorageAccessoryNodeSpecificKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRStorage keyByStrippingNodeIdFromKey:](HMMTRStorage, "keyByStrippingNodeIdFromKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);
  return (char)v3;
}

+ (BOOL)shouldIgnoreWritesForKey:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[HMMTRStorage ignoredMatterStorageKeys](HMMTRStorage, "ignoredMatterStorageKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (BOOL)isMemoryStorageKey:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[HMMTRStorage memoryStorageKeys](HMMTRStorage, "memoryStorageKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v5 = 1;
    goto LABEL_21;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_20;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }

  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^f/[0-9a-fA-F]+/s/"), 0, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  objc_msgSend(v11, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
    goto LABEL_12;
  v20 = v6;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^f/[0-9a-fA-F]+/n$"), 0, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;

  objc_msgSend(v13, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count") == 1)
  {
    v5 = 1;
    v12 = v15;
  }
  else
  {
    v19 = v14;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^f/[0-9a-fA-F]+/o$"), 0, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;

    objc_msgSend(v11, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count") == 1)
    {
LABEL_12:
      v5 = 1;
      goto LABEL_19;
    }
    v18 = v6;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^f/[0-9a-fA-F]+/i$"), 0, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;

    objc_msgSend(v13, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v16, "count") == 1;
    v12 = v16;
  }
  v11 = v13;
  v6 = v14;
LABEL_19:

LABEL_20:
LABEL_21:

  return v5;
}

+ (id)matterItemsFromDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[HMMTRStorage chipPluginStorageKeys](HMMTRStorage, "chipPluginStorageKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMMTRStorage keyByStrippingNodeIdFromKey:](HMMTRStorage, "keyByStrippingNodeIdFromKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "containsObject:", v11) & 1) != 0)
        {

        }
        else
        {
          v12 = +[HMMTRStorage isMatterKey:](HMMTRStorage, "isMatterKey:", v9);

          if (v12)
            goto LABEL_11;
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v9);
        }

LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v14;
}

+ (id)formatKeyForNodeId:(id)a3 key:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), a4, a3);
}

+ (id)keyByStrippingNodeIdFromKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(.*\\D)\\d+$"), 0, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    objc_msgSend(v7, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "rangeAtIndex:", 1);
      objc_msgSend(v4, "substringWithRange:", v15, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v4;
    }
    v12 = v17;

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@More than 1 match found, ignoring input", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = v4;
  }

  return v12;
}

+ (id)nodeIdFromPluginKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "isPluginKey:", v4))
  {
    v5 = v4;
    v22 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\D+(\\d+)$"), 0, &v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    objc_msgSend(v6, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v8, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = (void *)MEMORY[0x24BDD17A8];
        v17 = objc_msgSend(v14, "rangeAtIndex:", 1);
        objc_msgSend(v5, "substringWithRange:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scannerWithString:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        v13 = 0;
        if (objc_msgSend(v20, "scanUnsignedLongLong:", buf))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)buf);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x242656984]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@More than 1 match found, ignoring input", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)accessoryNodeIDFromPluginKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "isPluginAccessoryNodeKey:", v4))
  {
    +[HMMTRStorage nodeIdFromPluginKey:](HMMTRStorage, "nodeIdFromPluginKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __42__HMMTRStorage_Records__memoryStorageKeys__block_invoke()
{
  void *v0;

  v0 = (void *)memoryStorageKeys_storageKeys;
  memoryStorageKeys_storageKeys = (uint64_t)&unk_250F405C0;

}

void __49__HMMTRStorage_Records__ignoredMatterStorageKeys__block_invoke()
{
  void *v0;

  v0 = (void *)ignoredMatterStorageKeys_storageKeys;
  ignoredMatterStorageKeys_storageKeys = (uint64_t)&unk_250F405A8;

}

void __42__HMMTRStorage_Records__matterStorageKeys__block_invoke()
{
  void *v0;

  v0 = (void *)matterStorageKeys_storageKeys;
  matterStorageKeys_storageKeys = (uint64_t)&unk_250F40590;

}

void __67__HMMTRStorage_Records__chipPluginStorageAccessoryNodeSpecificKeys__block_invoke()
{
  void *v0;

  v0 = (void *)chipPluginStorageAccessoryNodeSpecificKeys_storageKeys;
  chipPluginStorageAccessoryNodeSpecificKeys_storageKeys = (uint64_t)&unk_250F40578;

}

void __46__HMMTRStorage_Records__chipPluginStorageKeys__block_invoke()
{
  void *v0;

  v0 = (void *)chipPluginStorageKeys_storageKeys;
  chipPluginStorageKeys_storageKeys = (uint64_t)&unk_250F40560;

}

- (HMMTRStorage)initWithQueue:(id)a3
{
  id v5;
  HMMTRStorage *v6;
  NSOperationQueue *v7;
  NSOperationQueue *keyValueStoreUpdateQueue;
  uint64_t v9;
  NSMutableDictionary *localStorage;
  uint64_t v11;
  NSMutableDictionary *inMemoryStorage;
  MTSKeyValueStore *v13;
  MTSKeyValueStore *systemCommissionerKeyValueStore;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRStorage;
  v6 = -[HMMTRStorage init](&v16, sel_init);
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    keyValueStoreUpdateQueue = v6->_keyValueStoreUpdateQueue;
    v6->_keyValueStoreUpdateQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_keyValueStoreUpdateQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    localStorage = v6->_localStorage;
    v6->_localStorage = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    inMemoryStorage = v6->_inMemoryStorage;
    v6->_inMemoryStorage = (NSMutableDictionary *)v11;

    v13 = (MTSKeyValueStore *)objc_alloc_init(MEMORY[0x24BDDB880]);
    systemCommissionerKeyValueStore = v6->_systemCommissionerKeyValueStore;
    v6->_systemCommissionerKeyValueStore = v13;

    objc_storeStrong((id *)&v6->_workQueue, a3);
    v6->_sharedAdmin = 0;
  }

  return v6;
}

- (HMMTRStorageDataSource)dataSource
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  os_unfair_lock_unlock(p_lock);
  return (HMMTRStorageDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
  NSNumber *v4;
  NSNumber *fabricID;
  HMMTRFabricStorageDataSource *v6;
  HMMTRFabricStorageDataSource *fabricDataSource;
  void *v8;
  id obj;

  obj = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_dataSource, obj);
  objc_msgSend(obj, "currentFabricID");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fabricID = self->_fabricID;
  self->_fabricID = v4;

  if (self->_fabricID)
  {
    objc_msgSend(obj, "storageDataSourceForFabricWithID:");
    v6 = (HMMTRFabricStorageDataSource *)objc_claimAutoreleasedReturnValue();
    fabricDataSource = self->_fabricDataSource;
    self->_fabricDataSource = v6;

  }
  os_unfair_lock_unlock(&self->_lock);
  -[HMMTRStorage delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "storageDidBecomeAvailable:", self);

}

- (void)_handleUpdatedDataWithIsLocalChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  HMMTRStorage *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  HMMTRStorage *v18;
  NSObject *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD v35[5];
  BOOL v36;
  _QWORD v37[5];
  BOOL v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x242656984](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "remote";
    if (v3)
      v10 = "local";
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    v41 = 2080;
    v42 = v10;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling updated data storage due to %s change", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRStorage fabricID](v6, "fabricID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage dataSource](v6, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentFabricID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    -[HMMTRStorage dataSource](v6, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentFabricID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x242656984]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRStorage fabricID](v18, "fabricID");
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        -[HMMTRStorage dataSource](v18, "dataSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentFabricID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = (uint64_t)v20;
        v41 = 2112;
        v42 = v21;
        v43 = 2112;
        v44 = v23;
        _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Current fabric ID changed from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMMTRStorage dataSource](v18, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentFabricID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage setFabricID:](v18, "setFabricID:", v25);

    }
  }
  -[HMMTRStorage fabricID](v6, "fabricID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[HMMTRStorage dataSource](v6, "dataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage fabricID](v6, "fabricID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "storageDataSourceForFabricWithID:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage setFabricDataSource:](v6, "setFabricDataSource:", v29);

  }
  if (v3)
    -[HMMTRStorage _handlePerFabricStorageMaybeAvailable:](v6, "_handlePerFabricStorageMaybeAvailable:", 0);
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
    && (-[HMMTRStorage fabricID](v6, "fabricID"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v30,
        v30))
  {
    -[HMMTRStorage dataSource](v6, "dataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage fabricID](v6, "fabricID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appleHomeFabricWithID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke;
    v37[3] = &unk_250F23DC8;
    v37[4] = v6;
    v38 = v3;
    objc_msgSend(v33, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v37);

  }
  else
  {
    -[HMMTRStorage workQueue](v6, "workQueue");
    v34 = objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_3;
    v35[3] = &unk_250F23DA0;
    v35[4] = v6;
    v36 = v3;
    dispatch_async(v34, v35);

  }
}

- (void)handleUpdatedDataForFabricIndex:(id)a3 isLocalChange:(BOOL)a4
{
  -[HMMTRStorage handleUpdatedDataWithIsLocalChange:](self, "handleUpdatedDataWithIsLocalChange:", a4);
}

- (void)handleUpdatedDataForFabricIndex:(id)a3 nodeID:(id)a4 isLocalChange:(BOOL)a5
{
  -[HMMTRStorage handleUpdatedDataForFabricIndex:isLocalChange:](self, "handleUpdatedDataForFabricIndex:isLocalChange:", a3, a5);
}

- (void)handleUpdatedCurrentFabricIndex
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMTRStorage *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMMTRStorage *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productPlatform");

  if (v4 != 4)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      v12 = "%{public}@Ignoring resident updates on non-tvOS device";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_12:

    objc_autoreleasePoolPop(v8);
    return;
  }
  -[HMMTRStorage fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentFabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage fabricID](v9, "fabricID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring spurious fabric index update notification for fabric ID %@", buf, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (-[HMMTRStorage isFabricCreationInProgress](self, "isFabricCreationInProgress"))
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      v12 = "%{public}@Ignoring updated fabric index notification until fabric creation is successful";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_23E95B000, v13, v14, v12, buf, 0xCu);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  -[HMMTRStorage setRootCert:](self, "setRootCert:", 0);
  -[HMMTRStorage setOperationalCert:](self, "setOperationalCert:", 0);
  -[HMMTRStorage setOwnerNodeID:](self, "setOwnerNodeID:", 0);
  -[HMMTRStorage setOwnerIPK:](self, "setOwnerIPK:", 0);
  -[HMMTRStorage fabricID](self, "fabricID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentFabricID");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v16 == (void *)v18)
  {

    goto LABEL_20;
  }
  v19 = (void *)v18;
  -[HMMTRStorage dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentFabricID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
LABEL_20:
    -[HMMTRStorage handleUpdatedDataWithIsLocalChange:](self, "handleUpdatedDataWithIsLocalChange:", 0);
    return;
  }
  v22 = (void *)MEMORY[0x242656984]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v25;
    _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Current device is no longer the primary resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  -[HMMTRStorage delegate](v23, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __47__HMMTRStorage_handleUpdatedCurrentFabricIndex__block_invoke;
  v27[3] = &unk_250F23DF0;
  v27[4] = v23;
  objc_msgSend(v26, "handleDeviceNoLongerPrimaryResidentWithCompletion:", v27);

}

- (void)handlePrimaryResidentDataReady
{
  id v2;

  -[HMMTRStorage delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlePrimaryResidentDataReady");

}

- (void)handleUpdatedDataWithIsLocalChange:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMMTRStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__HMMTRStorage_handleUpdatedDataWithIsLocalChange___block_invoke;
  v6[3] = &unk_250F23DA0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (BOOL)_handlePerFabricStorageMaybeAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  HMMTRStorage *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRStorage fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@Expecting fabric ID to be present";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_23E95B000, v13, v14, v12, (uint8_t *)&v16, 0xCu);

    }
LABEL_9:

    objc_autoreleasePoolPop(v8);
    v7 = 0;
    goto LABEL_10;
  }
  -[HMMTRStorage fabricDataSource](self, "fabricDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@Fabric storage is not available";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[HMMTRStorage _syncToRemoteStorage](self, "_syncToRemoteStorage");
  v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)isResidentDevice
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMMTRStorage dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentFabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)persistLegacyControllerNodeWithDictionary:(id)a3
{
  id v4;
  void *v5;
  HMMTRStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  HMMTRStorage *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  HMMTRStorage *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v8;
    v62 = 2112;
    v63 = (uint64_t)v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Storing the initial Matter storage to remote %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (!-[HMMTRStorage isSystemCommissionerFabric](v6, "isSystemCommissionerFabric"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v4);
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
      && !-[HMMTRStorage isResidentDevice](v6, "isResidentDevice"))
    {
      v28 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("f/1/r"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "convertMatterCertificate:", v29);
      v53 = objc_claimAutoreleasedReturnValue();

      v30 = objc_alloc(MEMORY[0x24BDDB5A8]);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("f/1/n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithTLVBytes:", v31);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
      v33 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRStorage nocSigner](v6, "nocSigner");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage operationalKeyPair](v6, "operationalKeyPair");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v49, "publicKey");
      objc_msgSend(v32, "subject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "fabricID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v32;
      objc_msgSend(v32, "subject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "caseAuthenticatedTags");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      v40 = v50;
      v51 = (void *)v33;
      objc_msgSend(v40, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v34, v53, v35, v37, v33, v39, &v58);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v58;

      if (v41)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, CFSTR("HMD.MTRPlugin.OperationalCert"));
        v43 = (void *)v53;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v53, CFSTR("HMD.MTRPlugin.RootCert"));
        objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v44, CFSTR("f/1/n"));

      }
      else
      {
        v43 = (void *)v53;
        v45 = (void *)MEMORY[0x242656984]();
        v46 = v6;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = v48;
          v62 = 2112;
          v63 = (uint64_t)v42;
          _os_log_impl(&dword_23E95B000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist legacy node with error %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v45);
      }

      if (!v41)
        goto LABEL_17;
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("f/1/n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertMatterCertificate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("HMD.MTRPlugin.OperationalCert"));

      v13 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("f/1/r"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertMatterCertificate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("HMD.MTRPlugin.RootCert"));

    }
    -[HMMTRStorage startLocalStorageMode](v6, "startLocalStorageMode");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v55 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTRStorage setStorageData:forKey:](v6, "setStorageData:forKey:", v22, v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v18);
    }

    v23 = (void *)MEMORY[0x242656984](-[HMMTRStorage endLocalStorageModeBySyncingToRemote:](v6, "endLocalStorageModeBySyncingToRemote:", 1));
    v24 = v6;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 138543618;
      v61 = v26;
      v62 = 2048;
      v63 = v27;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Successfully persisted legacy node to Apple Home storage with %lu keys", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
LABEL_17:

  }
}

- (id)_preferencesValueForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDBD580]);
}

- (void)_setPreferencesValueForKey:(id)a3 value:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  HMMTRStorage *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Setting preferences value for key: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (const __CFString *)*MEMORY[0x24BDBD580];
  CFPreferencesSetAppValue(v6, v7, (CFStringRef)*MEMORY[0x24BDBD580]);
  CFPreferencesAppSynchronize(v12);

}

- (void)prepareStorageForFabricID:(id)a3
{
  -[HMMTRStorage prepareStorageForFabricID:forInitialSetup:](self, "prepareStorageForFabricID:forInitialSetup:", a3, 0);
}

- (void)prepareStorageForFabricID:(id)a3 forInitialSetup:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMMTRStorage *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  HMMTRStorage *v27;
  NSObject *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMMTRStorage setFabricID:](self, "setFabricID:", v6);
  -[HMMTRStorage dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage fabricID](self, "fabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storageDataSourceForFabricWithID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage setFabricDataSource:](self, "setFabricDataSource:", v9);

  if (!-[HMMTRStorage isSharedAdmin](self, "isSharedAdmin"))
  {
    -[HMMTRStorage fabricDataSource](self, "fabricDataSource");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[HMMTRStorage fabricDataSource](self, "fabricDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyValueStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[HMMTRStorage fabricDataSource](self, "fabricDataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "keyValueStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForKey:", CFSTR("HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)MEMORY[0x242656984]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v39 = v20;
            _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Storage for Apple Home fabric contains System Commissioner Fabric ID. Cleaning it up", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v17);
          -[HMMTRStorage _syncSetDataSourceValue:forKey:](v18, "_syncSetDataSourceValue:forKey:", 0, CFSTR("HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"));
          -[HMMTRStorage systemCommissionerKeyValueStore](v18, "systemCommissionerKeyValueStore");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "storedValueForKey:", CFSTR("HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            -[HMMTRStorage systemCommissionerKeyValueStore](v18, "systemCommissionerKeyValueStore");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0;
            v24 = objc_msgSend(v23, "setStoredValue:forKey:error:", v16, CFSTR("HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"), &v37);
            v25 = v37;

            if ((v24 & 1) == 0)
            {
              v26 = (void *)MEMORY[0x242656984]();
              v27 = v18;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v39 = v29;
                v40 = 2112;
                v41 = v25;
                _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to System Commissioner fabric ID with error %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v26);
            }

          }
        }

      }
    }
    if (!a4)
    {
      v30 = -[HMMTRStorage isResidentDevice](self, "isResidentDevice");
      if (v6)
      {
        if (v30)
        {
          if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
          {
            -[HMMTRStorage dataSource](self, "dataSource");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "appleHomeFabricWithID:", v6);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v35[0] = MEMORY[0x24BDAC760];
            v35[1] = 3221225472;
            v35[2] = __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke;
            v35[3] = &unk_250F23E18;
            v35[4] = self;
            v36 = v6;
            objc_msgSend(v32, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v35);

          }
          else
          {
            v33[0] = MEMORY[0x24BDAC760];
            v33[1] = 3221225472;
            v33[2] = __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke_22;
            v33[3] = &unk_250F23E18;
            v33[4] = self;
            v34 = v6;
            -[HMMTRStorage _fetchCertForFabricWithID:isOwner:forPairing:forceFetchFromResident:completion:](self, "_fetchCertForFabricWithID:isOwner:forPairing:forceFetchFromResident:completion:", v34, 1, 0, 0, v33);

          }
        }
      }
    }
  }

}

- (BOOL)_syncSetDataSourceValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRStorage *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMMTRStorage *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  HMMTRStorage *v31;
  NSObject *v32;
  void *v33;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v11;
    v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source values for key: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v38 = 0;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __47__HMMTRStorage__syncSetDataSourceValue_forKey___block_invoke;
  v35[3] = &unk_250F23E40;
  v35[4] = v9;
  v12 = v7;
  v36 = v12;
  v13 = v6;
  v37 = v13;
  v14 = -[HMMTRStorage _syncSetDataSourceValuesWithError:block:](v9, "_syncSetDataSourceValuesWithError:block:", &v38, v35);
  v15 = v38;
  v20 = v15;
  if (v14)
  {
    v21 = (void *)MEMORY[0x242656984](v15, v16, v17, v18, v19);
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v24;
      v41 = 2112;
      v42 = v12;
      _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store for key = %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);

  }
  else
  {

    v30 = (void *)MEMORY[0x242656984](v25, v26, v27, v28, v29);
    v31 = v9;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v33;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store for key = %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
  }

  return v14;
}

- (BOOL)_syncSetDataSourceValuesWithError:(id *)a3 block:(id)a4
{
  id v6;
  void *v7;
  HMMTRStorage *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  id v19;
  id location;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source values", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9899;
  v24 = __Block_byref_object_dispose__9900;
  v25 = 0;
  v11 = objc_alloc_init(MEMORY[0x24BE3F148]);
  objc_initWeak(&location, v11);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke;
  v16[3] = &unk_250F23E90;
  objc_copyWeak(&v19, &location);
  v16[4] = v8;
  v12 = v6;
  v17 = v12;
  p_buf = &buf;
  objc_msgSend(v11, "addExecutionBlock:", v16);
  -[HMMTRStorage keyValueStoreUpdateQueue](v8, "keyValueStoreUpdateQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v11);

  objc_msgSend(v11, "waitUntilFinished");
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)_removeAllDataSourceData
{
  void *v3;
  HMMTRStorage *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  HMMTRStorage *v14;
  __int128 *p_buf;
  id v16;
  id location;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Queueing remove all data source data", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x2020000000;
  v20 = 1;
  v7 = objc_alloc_init(MEMORY[0x24BE3F148]);
  objc_initWeak(&location, v7);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __40__HMMTRStorage__removeAllDataSourceData__block_invoke;
  v13 = &unk_250F23EE0;
  objc_copyWeak(&v16, &location);
  v14 = v4;
  p_buf = &buf;
  objc_msgSend(v7, "addExecutionBlock:", &v10);
  -[HMMTRStorage keyValueStoreUpdateQueue](v4, "keyValueStoreUpdateQueue", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

  objc_msgSend(v7, "waitUntilFinished");
  LOBYTE(v8) = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (char)v8;
}

- (BOOL)_syncSetDataSourceDictionary:(id)a3
{
  id v4;
  void *v5;
  HMMTRStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _BYTE *v16;
  id v17;
  id location;
  _BYTE buf[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source value for keys: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v20 = 1;
  v10 = objc_alloc_init(MEMORY[0x24BE3F148]);
  objc_initWeak(&location, v10);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke;
  v14[3] = &unk_250F23F30;
  objc_copyWeak(&v17, &location);
  v14[4] = v6;
  v11 = v4;
  v15 = v11;
  v16 = buf;
  objc_msgSend(v10, "addExecutionBlock:", v14);
  -[HMMTRStorage keyValueStoreUpdateQueue](v6, "keyValueStoreUpdateQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v10);

  objc_msgSend(v10, "waitUntilFinished");
  LOBYTE(v12) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return (char)v12;
}

- (BOOL)syncDataSourceDictionary:(id)a3 forFabric:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRStorage *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  HMMTRStorage *v22;
  id v23;
  id v24;
  _BYTE *v25;
  id v26;
  id location;
  _BYTE buf[24];
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source value for keys: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v29 = 1;
  v13 = objc_alloc_init(MEMORY[0x24BE3F148]);
  objc_initWeak(&location, v13);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke;
  v21 = &unk_250F23F58;
  objc_copyWeak(&v26, &location);
  v22 = v9;
  v14 = v6;
  v23 = v14;
  v15 = v7;
  v24 = v15;
  v25 = buf;
  objc_msgSend(v13, "addExecutionBlock:", &v18);
  -[HMMTRStorage keyValueStoreUpdateQueue](v9, "keyValueStoreUpdateQueue", v18, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v13);

  objc_msgSend(v13, "waitUntilFinished");
  LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return (char)v16;
}

- (unsigned)knownFabricInStorage:(id)a3 fabricID:(id)a4 keyPair:(id)a5 controllerNodeID:(id *)a6 rootCertificate:(id *)a7
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  HMMTRStorage *v33;
  NSObject *v34;
  void *v35;
  id v36;
  int v37;
  void *v38;
  HMMTRStorage *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMMTRStorage *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMMTRStorage *v47;
  NSObject *v48;
  void *v49;
  HMMTRStorage *v50;
  NSObject *v51;
  void *v52;
  void *context;
  void *contexta;
  unsigned int v57;
  id v58;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v72;
  unsigned int v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  _BYTE v81[14];
  __int16 v82;
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v62 = a4;
  v66 = a5;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v72 = v9;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (!v11)
    goto LABEL_53;
  v12 = v11;
  v13 = *(_QWORD *)v75;
  v69 = v10;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v75 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
      if (objc_msgSend(v15, "hasPrefix:", CFSTR("f/"))
        && objc_msgSend(v15, "hasSuffix:", CFSTR("/r"))
        && (unint64_t)objc_msgSend(v15, "length") >= 5)
      {
        objc_msgSend(v15, "substringWithRange:", 2, objc_msgSend(v15, "length") - 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          v17 = 0;
          do
          {
            v18 = objc_msgSend(v16, "characterAtIndex:", v17);
            if ((unsigned __int16)(v18 - 58) <= 0xFFF5u
              && ((v18 - 65) > 0x25 || ((1 << (v18 - 65)) & 0x3F0000003FLL) == 0))
            {
              goto LABEL_38;
            }
          }
          while (++v17 < (unint64_t)objc_msgSend(v16, "length"));
        }
        v73 = 0;
        objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "scanHexInt:", &v73);

        if ((v20 & 1) == 0)
          _HMFPreconditionFailure();
        objc_msgSend(v72, "objectForKeyedSubscript:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
        v23 = v22;

        if (!v23
          || (v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v23, 0)) == 0)
        {
          v38 = (void *)MEMORY[0x242656984]();
          v39 = self;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v79 = v41;
            v80 = 1024;
            *(_DWORD *)v81 = v73;
            _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r isn't base64 encoded", buf, 0x12u);

            v10 = v69;
          }

          objc_autoreleasePoolPop(v38);
LABEL_38:

          continue;
        }
        v25 = (void *)v24;
        objc_msgSend(MEMORY[0x24BDDB5B0], "convertMatterCertificate:", v24);
        v70 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(MEMORY[0x24BDDB5B0], "keypair:matchesCertificate:", v66) & 1) != 0)
        {
          v67 = v25;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("f/%x/n"), v73);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKeyedSubscript:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
          v28 = v27;

          v64 = v28;
          if (v28
            && (v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v28, 0)) != 0)
          {
            v60 = (void *)v29;
            v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v29);
            objc_msgSend(v63, "subject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "fabricID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v61 = v31;
            if ((objc_msgSend(v31, "isEqual:", v62) & 1) != 0)
            {
              v25 = v67;
              if (a6)
              {
                objc_msgSend(v63, "subject");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "nodeID");
                v58 = (id)objc_claimAutoreleasedReturnValue();

                context = (void *)MEMORY[0x242656984]();
                v33 = self;
                HMFGetOSLogHandle();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v79 = v35;
                  v80 = 2112;
                  *(_QWORD *)v81 = v62;
                  *(_WORD *)&v81[8] = 1024;
                  *(_DWORD *)&v81[10] = v73;
                  v82 = 2112;
                  v83 = v58;
                  _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Retrieved root cert for fabric ID %@ with fabric index 0x%x. Controller node ID is %@.", buf, 0x26u);

                  v10 = v69;
                }

                objc_autoreleasePoolPop(context);
                v36 = objc_retainAutorelease(v58);
                *a6 = v36;

              }
              if (a7)
                *a7 = objc_retainAutorelease(v70);
              v37 = 1;
              v57 = v73;
            }
            else
            {
              contexta = (void *)MEMORY[0x242656984]();
              v50 = self;
              HMFGetOSLogHandle();
              v51 = objc_claimAutoreleasedReturnValue();
              v25 = v67;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v79 = v52;
                v80 = 1024;
                *(_DWORD *)v81 = v73;
                *(_WORD *)&v81[4] = 2112;
                *(_QWORD *)&v81[6] = v61;
                v82 = 2112;
                v83 = v62;
                _os_log_impl(&dword_23E95B000, v51, OS_LOG_TYPE_DEBUG, "%{public}@f/%x/n fabric ID %@ doesn't match fabric ID %@", buf, 0x26u);

                v10 = v69;
              }

              objc_autoreleasePoolPop(contexta);
              v37 = 3;
            }

          }
          else
          {
            v46 = (void *)MEMORY[0x242656984]();
            v47 = self;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v79 = v49;
              v80 = 1024;
              *(_DWORD *)v81 = v73;
              *(_WORD *)&v81[4] = 1024;
              *(_DWORD *)&v81[6] = v73;
              _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r doesn't have matching f/%x/n", buf, 0x18u);

            }
            objc_autoreleasePoolPop(v46);
            v37 = 3;
            v25 = v67;
            v10 = v69;
          }

        }
        else
        {
          v42 = (void *)MEMORY[0x242656984]();
          v43 = self;
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v68 = v25;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v79 = v45;
            v80 = 1024;
            *(_DWORD *)v81 = v73;
            *(_WORD *)&v81[4] = 2112;
            *(_QWORD *)&v81[6] = v66;
            _os_log_impl(&dword_23E95B000, v44, OS_LOG_TYPE_DEBUG, "%{public}@f/%x/r doesn't match system commissioner keypair %@", buf, 0x1Cu);

            v25 = v68;
          }

          objc_autoreleasePoolPop(v42);
          v37 = 3;
          v10 = v69;
        }

        if (v37 != 3)
          goto LABEL_54;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  }
  while (v12);
LABEL_53:
  v57 = 0;
LABEL_54:

  return v57;
}

- (unsigned)knownFabricWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMMTRStorage localStorage](self, "localStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage nocSigner](self, "nocSigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[HMMTRStorage knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:](self, "knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:", v5, v4, v6, 0, 0);

  return self;
}

- (BOOL)areCachedCertificatesValidForFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  void *v20;
  void *v21;
  HMMTRStorage *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  HMMTRStorage *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMMTRStorage *v39;
  NSObject *v40;
  void *v41;
  HMMTRStorage *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMMTRStorage *v46;
  NSObject *v47;
  void *v48;
  HMMTRStorage *v49;
  void *v50;
  void *v51;
  void *v52;
  HMMTRStorage *v53;
  void *v54;
  void *v56;
  void *context;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRStorage dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageDataSourceForFabricWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = isFeatureMatteriPhoneOnlyPairingControlEnabled();
    objc_msgSend(v6, "keyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.RootCert"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!v9
        || (v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v9, 0)) == 0)
      {
        v21 = (void *)MEMORY[0x242656984]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v24;
          _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Cached Root certificate not found", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        v19 = 0;
        goto LABEL_39;
      }
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v12);
      v14 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRStorage nocSigner](self, "nocSigner");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend(v14, "keypair:matchesCertificate:", v15, v11);

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v13, "subject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fabricID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = HMFEqualObjects();

        if ((v18 & 1) != 0)
        {
          v19 = 1;
LABEL_38:

LABEL_39:
          v20 = v9;
          goto LABEL_40;
        }
        v45 = (void *)MEMORY[0x242656984]();
        v53 = self;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subject");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "fabricID");
          *(_DWORD *)buf = 138543874;
          v63 = v59;
          v64 = 2112;
          v65 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v65;
          v66 = 2112;
          v67 = v4;
          _os_log_impl(&dword_23E95B000, v47, OS_LOG_TYPE_ERROR, "%{public}@FabricID from cached Root (%@) doesn't match expected value (%@)", buf, 0x20u);

        }
      }
      else
      {
        v45 = (void *)MEMORY[0x242656984]();
        v46 = self;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v48;
          _os_log_impl(&dword_23E95B000, v47, OS_LOG_TYPE_ERROR, "%{public}@Cached Root certificate uses unexpected operational key pair", buf, 0xCu);

        }
      }

      objc_autoreleasePoolPop(v45);
      v19 = 0;
      goto LABEL_38;
    }
    if (v9)
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v9, 0);
    else
      v20 = 0;
    objc_msgSend(v6, "keyValueStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.OperationalCert"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && v26)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v26, 0);
      objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v20);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v60);
      v29 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRStorage nocSigner](self, "nocSigner");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v29) = objc_msgSend(v29, "keypair:matchesCertificate:", v30, v20);

      if ((v29 & 1) != 0)
      {
        v56 = v27;
        objc_msgSend(v28, "subject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "fabricID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = HMFEqualObjects();

        if ((v33 & 1) != 0)
        {

          v34 = (void *)MEMORY[0x242656984]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v63 = v37;
            _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Cached Root/Operational certificates are valid", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v34);

          v19 = 1;
          goto LABEL_34;
        }
        v58 = v28;
        context = (void *)MEMORY[0x242656984]();
        v49 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "subject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "fabricID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v50;
          v64 = 2112;
          v65 = (uint64_t)v52;
          v66 = 2112;
          v67 = v4;
          _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@FabricID from cached Root (%@) doesn't match expected value (%@)", buf, 0x20u);

        }
        v27 = v56;
      }
      else
      {
        v58 = v28;
        context = (void *)MEMORY[0x242656984]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v44;
          _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Cached Root certificate uses unexpected operational key pair", buf, 0xCu);

        }
      }

      objc_autoreleasePoolPop(context);
    }
    else
    {
      v38 = (void *)MEMORY[0x242656984]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v41;
        _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cached Root/Operational certificates are not found in storage", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
    }
    v19 = 0;
LABEL_34:

LABEL_40:
    goto LABEL_41;
  }
  v19 = 0;
LABEL_41:

  return v19;
}

- (void)fetchCertForFabricWithID:(id)a3 isOwner:(BOOL)a4 forPairing:(BOOL)a5 forceFetchFromResident:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  HMMTRStorage *v19;
  id v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v12 = a3;
  v13 = a7;
  -[HMMTRStorage workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke;
  v17[3] = &unk_250F23FA8;
  v18 = v12;
  v19 = self;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v20 = v13;
  v15 = v13;
  v16 = v12;
  dispatch_async(v14, v17);

}

- (void)_fetchCertForFabricWithID:(id)a3 isOwner:(BOOL)a4 forPairing:(BOOL)a5 forceFetchFromResident:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v9;
  __CFError *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  HMMTRStorage *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMMTRStorage *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  id v33;
  void *v34;
  HMMTRStorage *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  __CFError *v46;
  void *v47;
  void *v48;
  HMMTRStorage *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMMTRStorage *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  CFDataRef v57;
  void *v58;
  __CFError *v59;
  void *v60;
  CFErrorRef v61;
  void *v62;
  HMMTRStorage *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  HMMTRStorage *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  HMMTRStorage *v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  HMMTRStorage *v89;
  NSObject *v90;
  void *v91;
  __CFError *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  HMMTRStorage *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  HMMTRStorage *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  HMMTRStorage *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  HMMTRStorage *v122;
  NSObject *v123;
  NSObject *v124;
  void *v125;
  const char *v126;
  NSObject *v127;
  os_log_type_t v128;
  uint32_t v129;
  HMMTRStorage *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  HMMTRStorage *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  void *v145;
  HMMTRStorage *v146;
  NSObject *v147;
  void *v148;
  void *v149;
  void *v150;
  __CFError *v151;
  void *v152;
  BOOL v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  __CFError *v162;
  _BOOL4 v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  __CFError *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  _QWORD v176[5];
  id v177;
  CFErrorRef error;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  uint8_t buf[4];
  void *v188;
  __int16 v189;
  CFErrorRef v190;
  uint64_t v191;

  v163 = a5;
  v9 = a4;
  v191 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFError *)a3;
  v12 = a7;
  -[HMMTRStorage setRootCert:](self, "setRootCert:", 0);
  -[HMMTRStorage setOperationalCert:](self, "setOperationalCert:", 0);
  -[HMMTRStorage setOwnerNodeID:](self, "setOwnerNodeID:", 0);
  v13 = -[HMMTRStorage setOwnerIPK:](self, "setOwnerIPK:", 0);
  if (!v11)
  {
    v16 = 0;
    if (v9 && !a6)
    {
      v166 = v12;
      v40 = 0;
      v19 = 0;
      v20 = 0;
      v15 = 0;
      v41 = 0;
      goto LABEL_56;
    }
    v15 = 0;
    v167 = 0;
    v172 = 0;
    if (!v9)
      goto LABEL_30;
    goto LABEL_33;
  }
  -[HMMTRStorage dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "storageDataSourceForFabricWithID:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = 0;
  v18 = !v9 || a6;
  if (v18)
  {
    v19 = 0;
    v20 = 0;
    goto LABEL_29;
  }
  v19 = 0;
  v20 = 0;
  if (v15)
  {
    v13 = -[HMMTRStorage areCachedCertificatesValidForFabricID:](self, "areCachedCertificatesValidForFabricID:", v11);
    if ((_DWORD)v13)
    {
      v165 = v12;
      v21 = (void *)MEMORY[0x242656984]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v188 = v24;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Using Cached Root/Operational certificates", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v15, "keyValueStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.RootCert"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v156 = v16;
      v159 = v15;
      if (v16)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v16, 0);
        v26 = (void *)MEMORY[0x242656984]();
        v27 = v22;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v188 = v29;
          v189 = 2112;
          v190 = v11;
          _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@Check validity period of the root cert of fabric ID %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        -[HMMTRStorage nocSigner](v27, "nocSigner");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v186 = 0;
        v31 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:](HMMTRStorage, "checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:", v16, v30, &v186);
        v32 = v186;

        if (v31)
        {
          v33 = v32;

          v16 = v33;
        }

        v15 = v159;
      }
      objc_msgSend(v15, "keyValueStore");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.OperationalCert"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v155 = v19;
      if (!v19)
      {
        v20 = 0;
LABEL_98:

        v17 = v16 != 0;
        if (v16 && v19)
        {
          -[HMMTRStorage setRootCert:](v22, "setRootCert:", v16);
          -[HMMTRStorage setOperationalCert:](v22, "setOperationalCert:", v19);
          -[HMMTRStorage setOwnerNodeID:](v22, "setOwnerNodeID:", v20);
          -[HMMTRStorage ipkForFabricID:forPairing:](v22, "ipkForFabricID:forPairing:", v11, 0);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTRStorage setOwnerIPK:](v22, "setOwnerIPK:", v150);

          v12 = v165;
          (*((void (**)(id, _QWORD))v165 + 2))(v165, 0);
          goto LABEL_89;
        }
        v12 = v165;
        if (!v18)
          goto LABEL_22;
LABEL_29:
        v167 = v20;
        v172 = v19;
        if (!v9)
        {
LABEL_30:
          v45 = v16;
          v46 = v11;
          v47 = v15;
          v48 = (void *)MEMORY[0x242656984](v13);
          v49 = self;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v188 = v51;
            _os_log_impl(&dword_23E95B000, v50, OS_LOG_TYPE_INFO, "%{public}@Shared Admin is attempting to pair", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v48);
          v15 = v47;
          v11 = v46;
          v16 = v45;
        }
LABEL_33:
        v52 = (void *)MEMORY[0x242656984](v13);
        v53 = self;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v188 = v55;
          _os_log_impl(&dword_23E95B000, v54, OS_LOG_TYPE_INFO, "%{public}@Requesting certificates required for commissioning from Resident device", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v52);
        error = 0;
        -[HMMTRStorage operationalKeyPair](v53, "operationalKeyPair");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v56, "publicKey"), &error);

        if (v57)
        {
          -[HMMTRStorage delegate](v53, "delegate");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v176[0] = MEMORY[0x24BDAC760];
          v176[1] = 3221225472;
          v176[2] = __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke;
          v176[3] = &unk_250F23FF8;
          v176[4] = v53;
          v177 = v12;
          objc_msgSend(v58, "fetchCommissioningCertificatesFromOwnerForPublicKey:fabricID:completionHandler:", v57, v11, v176);

        }
        else
        {
          v164 = v16;
          v59 = v11;
          v60 = v15;
          v61 = error;
          v62 = (void *)MEMORY[0x242656984]();
          v63 = v53;
          HMFGetOSLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v188 = v65;
            v189 = 2112;
            v190 = v61;
            _os_log_impl(&dword_23E95B000, v64, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert public key to NSData for transmission with error %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v62);
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v12 + 2))(v12, v66);

          v15 = v60;
          v11 = v59;
          v16 = v164;
        }
        v20 = v167;

        goto LABEL_41;
      }
      v153 = v18;
      v35 = v22;
      v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v19, 0);
      objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v36);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v152);
      objc_msgSend(v154, "subject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "nodeID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRStorage operationalKeyPair](v35, "operationalKeyPair");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = (void *)v36;
      LOBYTE(v38) = objc_msgSend(v38, "keypair:matchesCertificate:", v39, v36);

      if ((v38 & 1) != 0)
      {
        v19 = (void *)v36;
        v22 = v35;
        v18 = v153;
LABEL_97:

        goto LABEL_98;
      }
      v170 = (__CFError *)v20;
      v109 = (void *)MEMORY[0x242656984]();
      v110 = v35;
      HMFGetOSLogHandle();
      v111 = objc_claimAutoreleasedReturnValue();
      v22 = v35;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v188 = v112;
        _os_log_impl(&dword_23E95B000, v111, OS_LOG_TYPE_INFO, "%{public}@Operational Keypair of the cached NOC doesn't match current keypair", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v109);
      v113 = (void *)MEMORY[0x242656984]();
      v114 = v110;
      HMFGetOSLogHandle();
      v115 = objc_claimAutoreleasedReturnValue();
      v18 = v153;
      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v188 = v116;
        v189 = 2112;
        v190 = v170;
        _os_log_impl(&dword_23E95B000, v115, OS_LOG_TYPE_INFO, "%{public}@Generating new NOC using node ID = %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v113);
      v117 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRStorage nocSigner](v114, "nocSigner");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage operationalKeyPair](v114, "operationalKeyPair");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = 0;
      objc_msgSend(v117, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v118, v16, objc_msgSend(v119, "publicKey"), v11, v170, 0, &v185);
      v120 = objc_claimAutoreleasedReturnValue();
      v151 = (__CFError *)v185;

      v121 = (void *)MEMORY[0x242656984]();
      v122 = v114;
      HMFGetOSLogHandle();
      v123 = objc_claimAutoreleasedReturnValue();
      v124 = v123;
      if (v120)
      {
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v175 = v120;
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v188 = v125;
          v126 = "%{public}@Successfully generated Operational Certificate using Root Certificate from storage";
          v127 = v124;
          v128 = OS_LOG_TYPE_INFO;
          v129 = 12;
LABEL_95:
          _os_log_impl(&dword_23E95B000, v127, v128, v126, buf, v129);

          v120 = v175;
        }
      }
      else if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v175 = 0;
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v188 = v125;
        v189 = 2112;
        v190 = v151;
        v126 = "%{public}@Failed to generate Operational Certificate with error %@";
        v127 = v124;
        v128 = OS_LOG_TYPE_ERROR;
        v129 = 22;
        goto LABEL_95;
      }

      objc_autoreleasePoolPop(v121);
      v19 = (void *)v120;
      v15 = v159;
      v20 = v170;
      goto LABEL_97;
    }
    v17 = 0;
    v16 = 0;
    v19 = 0;
    v20 = 0;
  }
  if (v18)
    goto LABEL_29;
LABEL_22:
  v166 = v12;
  if (v15)
  {
    if (!v20)
      v17 = 0;
    v168 = v20;
    v173 = v19;
    if (v17)
    {
      v42 = v20;
      v43 = v16;
      v44 = v42;
    }
    else
    {
      v67 = v15;
      objc_msgSend(v15, "keyValueStore");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage nocSigner](self, "nocSigner");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = 0;
      v184 = 0;
      -[HMMTRStorage knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:](self, "knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:", v68, v11, v69, &v184, &v183);
      v44 = v184;
      v43 = v183;

      v70 = (void *)MEMORY[0x242656984]();
      v71 = self;
      HMFGetOSLogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v188 = v73;
        v189 = 2112;
        v190 = v11;
        _os_log_impl(&dword_23E95B000, v72, OS_LOG_TYPE_INFO, "%{public}@Check validity period of the Matter SDK stored root cert of fabric ID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v70);
      -[HMMTRStorage nocSigner](v71, "nocSigner");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = 0;
      v75 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:](HMMTRStorage, "checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:", v43, v74, &v182);
      v76 = v182;

      if (v75)
      {
        v77 = v76;

        v43 = v77;
      }
      v19 = v173;

      v15 = v67;
    }
    v41 = 0;
    if (v43 && v44)
    {
      v160 = v15;
      v78 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRStorage nocSigner](self, "nocSigner");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage operationalKeyPair](self, "operationalKeyPair");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = 0;
      objc_msgSend(v78, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v79, v43, objc_msgSend(v80, "publicKey"), v11, v44, 0, &v181);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v181;

      if (v81)
      {
        -[HMMTRStorage setRootCert:](self, "setRootCert:", v43);
        -[HMMTRStorage setOperationalCert:](self, "setOperationalCert:", v81);
        v82 = (void *)MEMORY[0x242656984](-[HMMTRStorage setOwnerNodeID:](self, "setOwnerNodeID:", v44));
        v83 = self;
        HMFGetOSLogHandle();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v157 = v82;
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v188 = v85;
          _os_log_impl(&dword_23E95B000, v84, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate using SDK Root Certificate and Node ID from storage", buf, 0xCu);

          v82 = v157;
        }

        objc_autoreleasePoolPop(v82);
      }
      v15 = v160;
      v19 = v173;
    }

    v40 = 1;
    v20 = v168;
  }
  else
  {
    v40 = 0;
    v41 = 0;
  }
LABEL_56:
  -[HMMTRStorage rootCert](self, "rootCert");
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = (void *)v86;
  v162 = v11;
  if (!v40 || v86)
    goto LABEL_78;
  if (v163)
  {
    v169 = v20;
    v174 = v19;
    v161 = v15;
    v88 = (void *)MEMORY[0x242656984]();
    v89 = self;
    HMFGetOSLogHandle();
    v90 = objc_claimAutoreleasedReturnValue();
    v12 = v166;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage certificateIssuerID](v89, "certificateIssuerID");
      v92 = (__CFError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v188 = v91;
      v189 = 2112;
      v190 = v92;
      _os_log_impl(&dword_23E95B000, v90, OS_LOG_TYPE_INFO, "%{public}@Generating root certificate using issuer ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v88);
    v93 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRStorage nocSigner](v89, "nocSigner");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage certificateIssuerID](v89, "certificateIssuerID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = v41;
    objc_msgSend(v93, "createRootCertificate:issuerID:fabricID:error:", v94, v95, v11, &v180);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v180;

    -[HMMTRStorage setRootCert:](v89, "setRootCert:", v96);
    -[HMMTRStorage rootCert](v89, "rootCert");
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v98)
    {
      v41 = v97;
      v15 = v161;
      v20 = v169;
      v19 = v174;
      goto LABEL_80;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRStorage nocSigner](v89, "nocSigner");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage rootCert](v89, "rootCert");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage operationalKeyPair](v89, "operationalKeyPair");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = v97;
    objc_msgSend(v99, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v100, v101, objc_msgSend(v102, "publicKey"), v11, v87, 0, &v179);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v179;

    -[HMMTRStorage setOperationalCert:](v89, "setOperationalCert:", v103);
    -[HMMTRStorage operationalCert](v89, "operationalCert");
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      v105 = (void *)MEMORY[0x242656984](-[HMMTRStorage setOwnerNodeID:](v89, "setOwnerNodeID:", v87));
      v106 = v89;
      HMFGetOSLogHandle();
      v107 = objc_claimAutoreleasedReturnValue();
      v15 = v161;
      if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v188 = v108;
        _os_log_impl(&dword_23E95B000, v107, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate using newly generated Root Certificate", buf, 0xCu);

      }
    }
    else
    {
      v105 = (void *)MEMORY[0x242656984]();
      v130 = v89;
      HMFGetOSLogHandle();
      v107 = objc_claimAutoreleasedReturnValue();
      v15 = v161;
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v188 = v131;
        v189 = 2112;
        v41 = v158;
        v190 = (CFErrorRef)v158;
        _os_log_impl(&dword_23E95B000, v107, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate with error %@", buf, 0x16u);

LABEL_77:
        objc_autoreleasePoolPop(v105);
        v20 = v169;
        v19 = v174;
LABEL_78:

        goto LABEL_79;
      }
    }
    v41 = v158;
    goto LABEL_77;
  }
LABEL_79:
  v12 = v166;
LABEL_80:
  -[HMMTRStorage rootCert](self, "rootCert");
  v132 = objc_claimAutoreleasedReturnValue();
  if (!v132
    || (v133 = (void *)v132,
        -[HMMTRStorage operationalCert](self, "operationalCert"),
        v134 = (void *)objc_claimAutoreleasedReturnValue(),
        v134,
        v133,
        !v134))
  {
    v138 = v41;
    v139 = v19;
    v140 = (void *)MEMORY[0x242656984]();
    v141 = self;
    HMFGetOSLogHandle();
    v142 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v188 = v143;
      _os_log_impl(&dword_23E95B000, v142, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch certificates for owner", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v140);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v144);

    v19 = v139;
    v41 = v138;
    v11 = v162;
    goto LABEL_88;
  }
  -[HMMTRStorage ownerIPK](self, "ownerIPK");
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v162;
  if (v135
    || (-[HMMTRStorage ipkForFabricID:forPairing:](self, "ipkForFabricID:forPairing:", v162, v163),
        v136 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMMTRStorage setOwnerIPK:](self, "setOwnerIPK:", v136),
        v136,
        -[HMMTRStorage ownerIPK](self, "ownerIPK"),
        v137 = (void *)objc_claimAutoreleasedReturnValue(),
        v137,
        v137))
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
LABEL_88:

    goto LABEL_89;
  }
  v172 = v19;
  v145 = (void *)MEMORY[0x242656984]();
  v146 = self;
  HMFGetOSLogHandle();
  v147 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v188 = v148;
    v189 = 2112;
    v190 = v162;
    _os_log_impl(&dword_23E95B000, v147, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch IPK for fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v145);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v12 + 2))(v12, v149);

LABEL_41:
  v19 = v172;
LABEL_89:

}

- (void)fetchCertificatesFromStorageForFabricID:(id)a3 controllerNodeID:(id)a4 rootCert:(id *)a5 operationalCert:(id *)a6 residentNodeID:(id *)a7 ipk:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMMTRStorage *v23;
  NSObject *v24;
  id *v25;
  id v26;
  void *v27;
  id v28;
  id *v29;
  id *v30;
  id *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  -[HMMTRStorage _cachedRootCertificateIfValidForFabricID:](self, "_cachedRootCertificateIfValidForFabricID:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    -[HMMTRStorage _rootCertificateFromSdkCertificatesForFabricID:](self, "_rootCertificateFromSdkCertificatesForFabricID:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_22;
  }
  -[HMMTRStorage ipkForFabricID:forPairing:](self, "ipkForFabricID:forPairing:", v14, 0);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appleHomeFabricWithID:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v18;
  objc_msgSend(v18, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessoryAdministerPrivilegeCATID:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRStorage _cachedOperationalCertificateIfValidForFabricID:](self, "_cachedOperationalCertificateIfValidForFabricID:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v20;
  if (v21
    || (-[HMMTRStorage _operationalCertificateFromSdkCertificatesForFabricID:](self, "_operationalCertificateFromSdkCertificatesForFabricID:", v14), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = a5;
    v31 = a6;
    -[HMMTRStorage _nodeIDFromOperationalX509Certificate:](self, "_nodeIDFromOperationalX509Certificate:", v21);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x242656984]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = a7;
      v25 = a8;
      v26 = v15;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v27;
      v38 = 2112;
      v39 = v21;
      v40 = 2112;
      v41 = v35;
      _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, "%{public}@Resident NOC %@ resident node ID %@", buf, 0x20u);

      v15 = v26;
      a8 = v25;
      a7 = v29;
    }

    objc_autoreleasePoolPop(v22);
    a5 = v30;
    a6 = v31;
    v20 = v34;
  }
  else
  {
    v35 = 0;
  }
  if (-[HMMTRStorage isResidentDevice](self, "isResidentDevice"))
  {
    v28 = v21;
    if (!a5)
      goto LABEL_15;
  }
  else
  {
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v20);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HMMTRStorage _createOperationalCertificateForFabricID:rootCert:caseAuthenticatedTags:controllerNodeID:](self, "_createOperationalCertificateForFabricID:rootCert:caseAuthenticatedTags:controllerNodeID:", v14, v16, v20, v15);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v20 = v34;
    if (!a5)
      goto LABEL_15;
  }
  *a5 = objc_retainAutorelease(v16);
LABEL_15:
  if (a6)
    *a6 = objc_retainAutorelease(v28);
  if (a7)
    *a7 = objc_retainAutorelease(v35);
  if (a8)
    *a8 = objc_retainAutorelease(v33);

LABEL_22:
}

- (id)_createOperationalCertificateForFabricID:(id)a3 rootCert:(id)a4 caseAuthenticatedTags:(id)a5 controllerNodeID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMMTRStorage *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  HMMTRStorage *v26;
  NSObject *v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v13 || objc_msgSend(v13, "isEqual:", &unk_250F40320))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  v16 = (void *)MEMORY[0x242656984]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v32 = v19;
    v33 = 2112;
    v34 = v14;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v10;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating operational certificate for controller node ID %@ CAT %@ root cert %@, fabric ID %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = (void *)MEMORY[0x24BDDB5B0];
  -[HMMTRStorage nocSigner](v17, "nocSigner");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage operationalKeyPair](v17, "operationalKeyPair");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v20, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v21, v11, objc_msgSend(v22, "publicKey"), v10, v14, v12, &v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v30;

  if (!v23)
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = v17;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v28;
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v12;
      v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create operational certificate for controller node ID %@ CAT %@ with error %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v25);
  }

  return v23;
}

- (id)_cachedRootCertificateIfValidForFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRStorage *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v6 = 0;
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  -[HMMTRStorage dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageDataSourceForFabricWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || !-[HMMTRStorage areCachedCertificatesValidForFabricID:](self, "areCachedCertificatesValidForFabricID:", v4))
  {
    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v10;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Using Cached Root certificate", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "keyValueStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.RootCert"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
  else
    v13 = 0;

LABEL_10:
  return v13;
}

- (id)_rootCertificateFromSdkCertificatesForFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_5;
  }
  -[HMMTRStorage dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageDataSourceForFabricWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "keyValueStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage nocSigner](self, "nocSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  -[HMMTRStorage knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:](self, "knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:", v7, v4, v8, 0, &v11);
  v9 = v11;

LABEL_6:
  return v9;
}

- (id)rootCertForCurrentFabric
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
    && (-[HMMTRStorage fabricID](self, "fabricID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[HMMTRStorage dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage fabricID](self, "fabricID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleHomeFabricWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fabricData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootCert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMMTRStorage rootCert](self, "rootCert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[HMMTRStorage rootCertificate](self, "rootCertificate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage setRootCert:](self, "setRootCert:", v8);
    }
  }
  return v8;
}

- (id)_cachedOperationalCertificateIfValidForFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRStorage *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v6 = 0;
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  -[HMMTRStorage dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageDataSourceForFabricWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || !-[HMMTRStorage areCachedCertificatesValidForFabricID:](self, "areCachedCertificatesValidForFabricID:", v4))
  {
    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v10;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Using Cached Operational certificate", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "keyValueStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.OperationalCert"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
  else
    v13 = 0;

LABEL_10:
  return v13;
}

- (id)_operationalCertificateFromSdkCertificatesForFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  HMMTRStorage *v23;
  NSObject *v24;
  void *v25;
  HMMTRStorage *v26;
  NSObject *v27;
  void *v29;
  void *context;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_19;
  }
  -[HMMTRStorage dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageDataSourceForFabricWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_19;
  objc_msgSend(v6, "keyValueStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRStorage nocSigner](self, "nocSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMTRStorage knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:](self, "knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:", v7, v4, v8, 0, 0);

  if (!(_DWORD)v9)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("f/%x/n"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyValueStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v14
    || (v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v14, 0)) == 0)
  {
    v22 = (void *)MEMORY[0x242656984]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      v33 = 1024;
      v34 = v9;
      _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Storage doesn't have f/%x/n", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v22);

    goto LABEL_19;
  }
  v16 = (void *)v15;
  objc_msgSend(MEMORY[0x24BDDB5B0], "convertMatterCertificate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDDB5B0];
  -[HMMTRStorage operationalKeyPair](self, "operationalKeyPair");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "keypair:matchesCertificate:", v19, v17);

  if (v20)
  {
    v21 = v17;
  }
  else
  {
    context = (void *)MEMORY[0x242656984]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v29;
      v33 = 1024;
      v34 = v9;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@f/%x/n doesn't match ", buf, 0x12u);

    }
    objc_autoreleasePoolPop(context);
  }

  if ((v20 & 1) == 0)
LABEL_19:
    v17 = 0;

  return v17;
}

- (id)operationalCertForCurrentFabric
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
    && (-[HMMTRStorage fabricID](self, "fabricID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[HMMTRStorage dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage fabricID](self, "fabricID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleHomeFabricWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currentDeviceNodeData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "operationalCertificate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMMTRStorage operationalCert](self, "operationalCert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[HMMTRStorage operationalCertificate](self, "operationalCertificate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage setOperationalCert:](self, "setOperationalCert:", v8);
    }
  }
  return v8;
}

- (id)ipkForCurrentFabric
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    -[HMMTRStorage fabricID](self, "fabricID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HMMTRStorage dataSource](self, "dataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage fabricID](self, "fabricID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appleHomeFabricWithID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "fabricData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ipk");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
      return v8;
    }
  }
  -[HMMTRStorage ownerIPK](self, "ownerIPK");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[HMMTRStorage fabricID](self, "fabricID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage ipkForFabricID:forPairing:](self, "ipkForFabricID:forPairing:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  return v8;
}

- (id)ipkForFabricID:(id)a3 forPairing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRStorage *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMMTRStorage *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  HMMTRStorage *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6
    || (-[HMMTRStorage dataSource](self, "dataSource"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "storageDataSourceForFabricWithID:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v15;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Fabric data source not available; failed to get ipk for fabric ID %@",
        (uint8_t *)&v26,
        0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v8 = 0;
LABEL_9:
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v4)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v20;
        v28 = 2112;
        v29 = v6;
        _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Generating new IPK for fabric ID %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      +[HMMTRStorage generateIPK](HMMTRStorage, "generateIPK");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v11 = (void *)v21;
        goto LABEL_20;
      }
      v16 = (void *)MEMORY[0x242656984]();
      v24 = v17;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v22;
        v28 = 2112;
        v29 = v6;
        v23 = "%{public}@FATAL Error: Failed to generate IPK for fabric ID %@";
        goto LABEL_18;
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v6;
      v23 = "%{public}@IPK missing for fabric ID %@";
LABEL_18:
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v11 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v8, "keyValueStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IPK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v10, 0);

  if (!v11)
    goto LABEL_9;
LABEL_20:

  return v11;
}

- (id)legacyNodeIDForCurrentFabric
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
    && (-[HMMTRStorage fabricID](self, "fabricID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[HMMTRStorage dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage fabricID](self, "fabricID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleHomeFabricWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fabricData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "residentNodeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMMTRStorage fabricID](self, "fabricID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage legacyNodeIDForFabricID:](self, "legacyNodeIDForFabricID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)legacyNodeIDForFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRStorage *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4
    && (-[HMMTRStorage dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "storageDataSourceForFabricWithID:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    objc_msgSend(v6, "keyValueStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HMD.MTRPlugin.OperationalCert"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0);
      -[HMMTRStorage _nodeIDFromOperationalX509Certificate:](self, "_nodeIDFromOperationalX509Certificate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Fabric data source not available; failed to get legacy node ID for fabric ID %@",
        (uint8_t *)&v16,
        0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v6 = 0;
    v10 = 0;
  }

  return v10;
}

- (id)_nodeIDFromOperationalX509Certificate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v3);
  objc_msgSend(v4, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)storageDataForKey:(id)a3
{
  void *v3;
  void *v4;

  -[HMMTRStorage valueForKey:](self, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0);
  else
    v4 = 0;

  return v4;
}

- (BOOL)setStorageData:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMMTRStorage setValueForKey:value:](self, "setValueForKey:value:", v6, v7);

  return (char)self;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HMMTRStorage valueForKey:systemCommissionerFabric:](self, "valueForKey:systemCommissionerFabric:", v4, -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setValueForKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  LOBYTE(self) = -[HMMTRStorage setValueForKey:value:systemCommissionerFabric:](self, "setValueForKey:value:systemCommissionerFabric:", v7, v6, -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"));

  return (char)self;
}

- (BOOL)removeValueForKey:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[HMMTRStorage removeValueForKey:systemCommissionerFabric:](self, "removeValueForKey:systemCommissionerFabric:", v4, -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"));

  return (char)self;
}

- (id)valueForKey:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  if (+[HMMTRStorage shouldIgnoreWritesForKey:](HMMTRStorage, "shouldIgnoreWritesForKey:", v6))
    goto LABEL_2;
  if (-[HMMTRStorage isLocalStorageMode](self, "isLocalStorageMode")
    && -[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric") == v4)
  {
    -[HMMTRStorage localStorage](self, "localStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v4)
  {
    -[HMMTRStorage systemCommissionerKeyValueStore](self, "systemCommissionerKeyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storedValueForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[HMMTRStorage fabricID](self, "fabricID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMMTRStorage inMemoryStorage](self, "inMemoryStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[HMMTRStorage isResidentDevice](self, "isResidentDevice")
      || !v8
      || !+[HMMTRStorage isMemoryStorageKey:](HMMTRStorage, "isMemoryStorageKey:", v6))
    {
      -[HMMTRStorage fabricDataSource](self, "fabricDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyValueStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    v9 = v8;
    v8 = v9;
LABEL_13:
    v7 = v9;
LABEL_15:

    goto LABEL_16;
  }
LABEL_2:
  v7 = 0;
LABEL_16:

  return v7;
}

- (BOOL)setValueForKey:(id)a3 value:(id)a4 systemCommissionerFabric:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a5;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__HMMTRStorage_setValueForKey_value_systemCommissionerFabric___block_invoke;
  v11[3] = &unk_250F24020;
  v12 = v8;
  v9 = v8;
  LOBYTE(v5) = -[HMMTRStorage setValueForKey:removingKeys:systemCommissionerFabric:block:](self, "setValueForKey:removingKeys:systemCommissionerFabric:block:", a3, 0, v5, v11);

  return v5;
}

- (BOOL)setValueForKey:(id)a3 removingKeys:(id)a4 systemCommissionerFabric:(BOOL)a5 block:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  HMMTRStorage *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  HMMTRStorage *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  BOOL v51;
  id v52;
  void *v53;
  HMMTRStorage *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMMTRStorage *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void (**v64)(id, void *);
  void (**v65)(id, void *);
  id v66;
  id v67;
  char v68;
  id obj;
  _QWORD v70[4];
  id v71;
  id v72;
  void (**v73)(id, void *);
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  _BYTE v89[128];
  uint64_t v90;

  v7 = a5;
  v90 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  if (+[HMMTRStorage shouldIgnoreWritesForKey:](HMMTRStorage, "shouldIgnoreWritesForKey:", v10))
  {
LABEL_5:
    v18 = 1;
    goto LABEL_6;
  }
  if (-[HMMTRStorage isLocalStorageMode](self, "isLocalStorageMode"))
  {
    -[HMMTRStorage localStorage](self, "localStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage localStorage](self, "localStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v10);

    if (v11)
    {
      -[HMMTRStorage localStorage](self, "localStorage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectsForKeys:", v11);

    }
    goto LABEL_5;
  }
  if (v7)
  {
    -[HMMTRStorage systemCommissionerKeyValueStore](self, "systemCommissionerKeyValueStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "storedValueForKey:", v10);
    v21 = objc_claimAutoreleasedReturnValue();
    v12[2](v12, (void *)v21);
    v22 = objc_claimAutoreleasedReturnValue();

    -[HMMTRStorage systemCommissionerKeyValueStore](self, "systemCommissionerKeyValueStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    v62 = (void *)v22;
    LOBYTE(v21) = objc_msgSend(v23, "setStoredValue:forKey:error:", v22, v10, &v80);
    v24 = v80;

    v68 = v21;
    if ((v21 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x242656984]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v82 = v28;
        v83 = 2112;
        v84 = v24;
        _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to System Commissioner storage with error %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }
    v61 = v24;
    v63 = v10;
    v64 = v12;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v66 = v11;
    obj = v11;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v77 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          -[HMMTRStorage systemCommissionerKeyValueStore](self, "systemCommissionerKeyValueStore");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = 0;
          v35 = objc_msgSend(v34, "removeStoredValueForKey:error:", v33, &v75);
          v36 = v75;

          v37 = (void *)MEMORY[0x242656984]();
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if ((v35 & 1) != 0)
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v82 = v41;
              v83 = 2112;
              v84 = v33;
              _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_INFO, "%{public}@Removal of %@ requested from keychain store", buf, 0x16u);

            }
          }
          else
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v82 = v42;
              v83 = 2112;
              v84 = v33;
              v85 = 2112;
              v86 = v36;
              _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove key %@ from System Commissioner storage with error %@", buf, 0x20u);

            }
            v68 = 0;
          }

          objc_autoreleasePoolPop(v37);
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      }
      while (v30);
    }

    v10 = v63;
    v12 = v64;
    v11 = v66;
    v18 = v68;
  }
  else
  {
    -[HMMTRStorage dataSource](self, "dataSource");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      if (-[HMMTRStorage isResidentDevice](self, "isResidentDevice")
        && +[HMMTRStorage isMemoryStorageKey:](HMMTRStorage, "isMemoryStorageKey:", v10))
      {
        -[HMMTRStorage inMemoryStorage](self, "inMemoryStorage");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v10);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRStorage inMemoryStorage](self, "inMemoryStorage");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v10);

        if (v11)
        {
          -[HMMTRStorage inMemoryStorage](self, "inMemoryStorage");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "removeObjectsForKeys:", v11);

        }
        v18 = 1;
      }
      else
      {
        v74 = 0;
        v70[0] = MEMORY[0x24BDAC760];
        v70[1] = 3221225472;
        v70[2] = __75__HMMTRStorage_setValueForKey_removingKeys_systemCommissionerFabric_block___block_invoke;
        v70[3] = &unk_250F24048;
        v65 = v12;
        v73 = v12;
        v49 = v10;
        v71 = v49;
        v67 = v11;
        v50 = v11;
        v72 = v50;
        v51 = -[HMMTRStorage _syncSetDataSourceValuesWithError:block:](self, "_syncSetDataSourceValuesWithError:block:", &v74, v70);
        v52 = v74;
        v18 = v51;
        if (v51)
        {

          v53 = (void *)MEMORY[0x242656984]();
          v54 = self;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v82 = v56;
            v83 = 2112;
            v84 = v49;
            v85 = 2112;
            v86 = v50;
            _os_log_impl(&dword_23E95B000, v55, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store for added key = %@, removed keys %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v53);
        }
        else
        {
          v57 = (void *)MEMORY[0x242656984]();
          v58 = self;
          HMFGetOSLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v82 = v60;
            v83 = 2112;
            v84 = v49;
            v85 = 2112;
            v86 = v50;
            v87 = 2112;
            v88 = v52;
            _os_log_impl(&dword_23E95B000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store for added key = %@, removed keys = %@ with error %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v57);

        }
        v12 = v65;
        v11 = v67;
      }
    }
    else
    {
      v18 = 0;
    }

  }
LABEL_6:

  return v18 & 1;
}

- (BOOL)removeValueForKey:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRStorage *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[HMMTRStorage isLocalStorageMode](self, "isLocalStorageMode"))
  {
    -[HMMTRStorage localStorage](self, "localStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v6);

    v8 = 1;
    goto LABEL_15;
  }
  if (v4)
  {
    -[HMMTRStorage systemCommissionerKeyValueStore](self, "systemCommissionerKeyValueStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v8 = objc_msgSend(v9, "removeStoredValueForKey:error:", v6, &v21);
    v10 = v21;

    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v8 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v15;
        v24 = 2112;
        v25 = v6;
        v16 = "%{public}@Removal of %@ requested from keychain store";
        v17 = v14;
        v18 = OS_LOG_TYPE_INFO;
LABEL_13:
        _os_log_impl(&dword_23E95B000, v17, v18, v16, buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v10;
      v16 = "%{public}@Failed to remove key from System Commissioner storage with error %@";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

    objc_autoreleasePoolPop(v11);
    goto LABEL_15;
  }
  if (-[HMMTRStorage isResidentDevice](self, "isResidentDevice")
    && +[HMMTRStorage isMemoryStorageKey:](HMMTRStorage, "isMemoryStorageKey:", v6))
  {
    -[HMMTRStorage inMemoryStorage](self, "inMemoryStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v6);

  }
  v8 = -[HMMTRStorage _syncSetDataSourceValue:forKey:](self, "_syncSetDataSourceValue:forKey:", 0, v6);
LABEL_15:

  return v8;
}

- (BOOL)replaceAllKeysAndSyncWithBlock:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  HMMTRStorage *v26;
  NSObject *v27;
  void *v28;
  HMMTRStorage *v29;
  void *v30;
  int v31;
  void *v32;
  HMMTRStorage *v33;
  NSObject *v34;
  void *v35;
  char v36;
  void *v37;
  HMMTRStorage *v38;
  NSObject *v39;
  void *v40;
  __int128 v42;
  char v43;
  id v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  uint64_t v46;
  _QWORD v47[5];
  id v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v4 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  v45 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v4)
  {
    -[HMMTRStorage systemCommissionerKeyValueStore](self, "systemCommissionerKeyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storedValuesByKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v53;
      v43 = 1;
      *(_QWORD *)&v12 = 138543874;
      v42 = v12;
      v44 = v10;
      do
      {
        v15 = 0;
        v46 = v13;
        do
        {
          if (*(_QWORD *)v53 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v15);
          objc_msgSend(v10, "objectForKeyedSubscript:", v16, v42);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v7)[2](v7, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqual:", v18) & 1) == 0)
          {
            if (-[HMMTRStorage isLocalStorageMode](self, "isLocalStorageMode"))
            {
              -[HMMTRStorage localStorage](self, "localStorage");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v16);

            }
            -[HMMTRStorage systemCommissionerKeyValueStore](self, "systemCommissionerKeyValueStore");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v18)
            {
              v51 = 0;
              v22 = objc_msgSend(v20, "setStoredValue:forKey:error:", v18, v16, &v51);
              v23 = v51;
            }
            else
            {
              v50 = 0;
              v22 = objc_msgSend(v20, "removeStoredValueForKey:error:", v16, &v50);
              v23 = v50;
            }
            v24 = v23;

            if ((v22 & 1) != 0)
            {
              v25 = (void *)MEMORY[0x242656984]();
              v26 = self;
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v57 = v28;
                v58 = 2112;
                v59 = v16;
                _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_INFO, "%{public}@%@ removed from keychain store", buf, 0x16u);

              }
            }
            else
            {
              v25 = (void *)MEMORY[0x242656984]();
              v29 = self;
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v42;
                v57 = v30;
                v58 = 2112;
                v59 = v16;
                v60 = 2112;
                v61 = v24;
                _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key %@ from System Commissioner storage with error %@", buf, 0x20u);

              }
              v43 = 0;
            }
            v13 = v46;

            objc_autoreleasePoolPop(v25);
            v10 = v44;
            v7 = v45;
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v13);
    }
    else
    {
      v43 = 1;
    }

    v36 = v43;
  }
  else
  {
    v49 = 0;
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __72__HMMTRStorage_replaceAllKeysAndSyncWithBlock_systemCommissionerFabric___block_invoke;
    v47[3] = &unk_250F24070;
    v47[4] = self;
    v48 = v6;
    v31 = -[HMMTRStorage _syncSetDataSourceValuesWithError:block:](self, "_syncSetDataSourceValuesWithError:block:", &v49, v47);
    v10 = v49;
    if ((v31 & 1) != 0)
    {

      v32 = (void *)MEMORY[0x242656984]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v35;
        _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
      v36 = 1;
    }
    else
    {
      v37 = (void *)MEMORY[0x242656984]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v40;
        v58 = 2112;
        v59 = v10;
        _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store with error %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);

      v36 = 0;
    }
    v7 = v45;
  }

  return v36 & 1;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMTRStorage fabricID](self, "fabricID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)localStorageMode
{
  HMMTRStorage *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_localStorageMode;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLocalStorageMode:(BOOL)a3
{
  void *v5;
  HMMTRStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x242656984](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage isLocalStorageMode](v6, "isLocalStorageMode");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing local storage mode from %@ to %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v6->_localStorageMode = a3;
  os_unfair_lock_unlock(&v6->_lock);
}

- (void)startLocalStorageMode
{
  void *v3;
  HMMTRStorage *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRStorage *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Attempting to start local storage mode", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  if (-[HMMTRStorage isSystemCommissionerFabric](v4, "isSystemCommissionerFabric"))
  {
    -[HMMTRStorage systemCommissionerKeyValueStore](v4, "systemCommissionerKeyValueStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = (void *)MEMORY[0x24BDBCED8];
      -[HMMTRStorage systemCommissionerKeyValueStore](v4, "systemCommissionerKeyValueStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "storedValuesByKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithDictionary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage setLocalStorage:](v4, "setLocalStorage:", v12);

    }
    -[HMMTRStorage localStorage](v4, "localStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[HMMTRStorage setLocalStorageWithoutUpdates:](v4, "setLocalStorageWithoutUpdates:", v14);
  }
  else
  {
    if (-[HMMTRStorage isSharedAdmin](v4, "isSharedAdmin"))
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMMTRStorage dataSource](v4, "dataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage fabricID](v4, "fabricID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storageDataSourceForFabricWithID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage setFabricDataSource:](v4, "setFabricDataSource:", v17);

      -[HMMTRStorage fabricDataSource](v4, "fabricDataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "keyValueStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[HMMTRStorage appleFabricLocalStorage](v4, "appleFabricLocalStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[HMMTRStorage appleFabricLocalStorage](v4, "appleFabricLocalStorage");
    else
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage setLocalStorage:](v4, "setLocalStorage:", v14);
  }

  -[HMMTRStorage setLocalStorageMode:](v4, "setLocalStorageMode:", 1);
  v20 = (void *)MEMORY[0x242656984](-[HMMTRStorage setStorageSyncPending:](v4, "setStorageSyncPending:", 0));
  v21 = v4;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD16E0];
    -[HMMTRStorage localStorage](v21, "localStorage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v23;
    v29 = 2112;
    v30 = v26;
    _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Local storage initiated with %@ keys", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
}

- (void)endLocalStorageModeBySyncingToRemote:(BOOL)a3
{
  void *v5;
  HMMTRStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRStorage isLocalStorageMode](self, "isLocalStorageMode"))
  {
    if (a3)
    {
      -[HMMTRStorage setStorageSyncPending:](self, "setStorageSyncPending:", 1);
      -[HMMTRStorage _syncToRemoteStorage](self, "_syncToRemoteStorage");
    }
    else
    {
      v5 = (void *)MEMORY[0x242656984]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Discarding Local Storage", (uint8_t *)&v10, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      -[HMMTRStorage localStorage](v6, "localStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAllObjects");

      -[HMMTRStorage setStorageSyncPending:](v6, "setStorageSyncPending:", 0);
    }
    if (!-[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"))
      -[HMMTRStorage setAppleFabricLocalStorage:](self, "setAppleFabricLocalStorage:", 0);
    -[HMMTRStorage setLocalStorageMode:](self, "setLocalStorageMode:", 0);
  }
}

- (void)endLocalStorageModeByPersistingAppleFabricData
{
  void *v3;
  HMMTRStorage *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMMTRStorage *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRStorage isLocalStorageMode](self, "isLocalStorageMode"))
  {
    if (-[HMMTRStorage isSystemCommissionerFabric](self, "isSystemCommissionerFabric"))
    {
      v3 = (void *)MEMORY[0x242656984]();
      v4 = self;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v6;
        _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_ERROR, "%{public}@Cannot persist Apple Fabric data while in System Commissioner Fabric", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
    }
    else
    {
      -[HMMTRStorage localStorage](self, "localStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      -[HMMTRStorage setAppleFabricLocalStorage:](self, "setAppleFabricLocalStorage:", v8);

      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Discarding Local Storage, but keeping Apple Home keys", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMMTRStorage localStorage](v10, "localStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAllObjects");

      -[HMMTRStorage setStorageSyncPending:](v10, "setStorageSyncPending:", 0);
      -[HMMTRStorage setLocalStorageMode:](v10, "setLocalStorageMode:", 0);
    }
  }
}

- (void)_syncToRemoteStorage
{
  HMMTRStorage *v2;
  void *v3;
  HMMTRStorage *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMMTRStorage *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  char v36;
  id v37;
  void *v38;
  HMMTRStorage *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  HMMTRStorage *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  HMMTRStorage *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  HMMTRStorage *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  HMMTRStorage *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  HMMTRStorage *v86;
  void *v87;
  HMMTRStorage *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  HMMTRStorage *v93;
  void *v94;
  void *v95;
  void *obj;
  void *obja;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t v112[128];
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  id v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v2 = self;
  v121 = *MEMORY[0x24BDAC8D0];
  if (!-[HMMTRStorage storageSyncInProgress](self, "storageSyncInProgress"))
  {
    if (!-[HMMTRStorage storageSyncPending](v2, "storageSyncPending"))
      return;
    -[HMMTRStorage setStorageSyncInProgress:](v2, "setStorageSyncInProgress:", 1);
    if (-[HMMTRStorage isSystemCommissionerFabric](v2, "isSystemCommissionerFabric"))
    {
      -[HMMTRStorage localStorage](v2, "localStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage pairedNodeIDsOnSystemCommissionerFabric:](v2, "pairedNodeIDsOnSystemCommissionerFabric:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMMTRStorage removeRecordsForUnpairedNodesInDict:pairedNodes:](HMMTRStorage, "removeRecordsForUnpairedNodesInDict:pairedNodes:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v92 = (void *)v9;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage setLocalStorage:](v2, "setLocalStorage:", v10);

      v11 = (void *)MEMORY[0x242656984]();
      v93 = v2;
      v12 = v2;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRStorage pairedNodeIDsOnSystemCommissionerFabric:](v12, "pairedNodeIDsOnSystemCommissionerFabric:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v14;
        v115 = 2112;
        v116 = v15;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Currently paired nodes on System commissioner fabric %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      -[HMMTRStorage localStorageWithoutUpdates](v12, "localStorageWithoutUpdates");
      obj = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v109 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
            -[HMMTRStorage localStorage](v12, "localStorage");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              -[HMMTRStorage localStorage](v12, "localStorage");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMTRStorage localStorageWithoutUpdates](v12, "localStorageWithoutUpdates");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v24, "isEqual:", v26);

              if (v27)
              {
                -[HMMTRStorage localStorage](v12, "localStorage");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "removeObjectForKey:", v20);

              }
            }
            else
            {
              objc_msgSend(v94, "addObject:", v20);
            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
        }
        while (v17);
      }

      v107 = 0u;
      v105 = 0u;
      v106 = 0u;
      v104 = 0u;
      v29 = v94;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
      v95 = v29;
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v105;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v105 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * j);
            -[HMMTRStorage systemCommissionerKeyValueStore](v12, "systemCommissionerKeyValueStore");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = 0;
            v36 = objc_msgSend(v35, "removeStoredValueForKey:error:", v34, &v103);
            v37 = v103;

            if ((v36 & 1) == 0)
            {
              v38 = (void *)MEMORY[0x242656984]();
              v39 = v12;
              HMFGetOSLogHandle();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v114 = v41;
                v115 = 2112;
                v116 = v34;
                v117 = 2112;
                v118 = v37;
                _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove %@ from System Commissioner storage with error %@", buf, 0x20u);

                v29 = v95;
              }

              objc_autoreleasePoolPop(v38);
            }

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
        }
        while (v31);
      }

      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      -[HMMTRStorage localStorage](v12, "localStorage");
      obja = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v100;
        do
        {
          for (k = 0; k != v43; ++k)
          {
            if (*(_QWORD *)v100 != v44)
              objc_enumerationMutation(obja);
            v46 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * k);
            -[HMMTRStorage systemCommissionerKeyValueStore](v12, "systemCommissionerKeyValueStore");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRStorage localStorage](v12, "localStorage");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", v46);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = 0;
            v50 = objc_msgSend(v47, "setStoredValue:forKey:error:", v49, v46, &v98);
            v51 = v98;

            if ((v50 & 1) == 0)
            {
              v52 = (void *)MEMORY[0x242656984]();
              v53 = v12;
              HMFGetOSLogHandle();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v114 = v55;
                v115 = 2112;
                v116 = v46;
                v117 = 2112;
                v118 = v51;
                _os_log_impl(&dword_23E95B000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to System Commissioner storage for key %@ with error %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v52);
            }

          }
          v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
        }
        while (v43);
      }

      v56 = (void *)MEMORY[0x242656984]();
      v57 = v12;
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)MEMORY[0x24BDD16E0];
        -[HMMTRStorage localStorage](v57, "localStorage");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "numberWithUnsignedInteger:", objc_msgSend(v61, "count"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v95, "count"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v114 = v59;
        v115 = 2112;
        v116 = v62;
        v117 = 2112;
        v118 = v63;
        _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_INFO, "%{public}@Updated %@ and removed %@ key-value pairs while sync'ing from local storage with remote System Commissioner Fabric storage", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v56);
      -[HMMTRStorage systemCommissionerKeyValueStore](v57, "systemCommissionerKeyValueStore");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_opt_respondsToSelector();

      v2 = v93;
      if ((v65 & 1) != 0)
      {
        v66 = (void *)MEMORY[0x242656984]();
        v67 = v57;
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTRStorage systemCommissionerKeyValueStore](v67, "systemCommissionerKeyValueStore");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "storedValuesByKey");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v114 = v69;
          v115 = 2112;
          v116 = v71;
          _os_log_impl(&dword_23E95B000, v68, OS_LOG_TYPE_INFO, "%{public}@System Commissioner storage contains %@", buf, 0x16u);

          v2 = v93;
        }

        objc_autoreleasePoolPop(v66);
      }

    }
    else
    {
      -[HMMTRStorage dataSource](v2, "dataSource");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage fabricID](v2, "fabricID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "storageDataSourceForFabricWithID:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRStorage setFabricDataSource:](v2, "setFabricDataSource:", v74);

      -[HMMTRStorage fabricDataSource](v2, "fabricDataSource");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v75)
      {
        v87 = (void *)MEMORY[0x242656984]();
        v88 = v2;
        HMFGetOSLogHandle();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTRStorage fabricID](v88, "fabricID");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v114 = v90;
          v115 = 2112;
          v116 = v91;
          _os_log_impl(&dword_23E95B000, v89, OS_LOG_TYPE_INFO, "%{public}@Remote storage is not yet available for fabric index = %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v87);
        v86 = v88;
        goto LABEL_54;
      }
      -[HMMTRStorage localStorage](v2, "localStorage");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)objc_msgSend(v76, "copy");
      -[HMMTRStorage _syncSetDataSourceDictionary:](v2, "_syncSetDataSourceDictionary:", v77);

      v78 = (void *)MEMORY[0x242656984]();
      v79 = v2;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)MEMORY[0x24BDD16E0];
        -[HMMTRStorage localStorage](v79, "localStorage");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "numberWithUnsignedInteger:", objc_msgSend(v83, "count"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v81;
        v115 = 2112;
        v116 = v84;
        _os_log_impl(&dword_23E95B000, v80, OS_LOG_TYPE_INFO, "%{public}@Synced %@ key-value pairs from local storage to remote Apple Home storage", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v78);
    }
    -[HMMTRStorage localStorage](v2, "localStorage");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "removeAllObjects");

    -[HMMTRStorage setStorageSyncPending:](v2, "setStorageSyncPending:", 0);
    v86 = v2;
LABEL_54:
    -[HMMTRStorage setStorageSyncInProgress:](v86, "setStorageSyncInProgress:", 0);
    return;
  }
  v3 = (void *)MEMORY[0x242656984]();
  v4 = v2;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v114 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Attempting to sync to remote storage when another sync is already in progress; ignoring",
      buf,
      0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isLocalStorageMode
{
  return self->_localStorageMode;
}

- (NSOperationQueue)keyValueStoreUpdateQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)localStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)inMemoryStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInMemoryStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)appleFabricLocalStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppleFabricLocalStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)localStorageWithoutUpdates
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocalStorageWithoutUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)storageSyncPending
{
  return self->_storageSyncPending;
}

- (void)setStorageSyncPending:(BOOL)a3
{
  self->_storageSyncPending = a3;
}

- (BOOL)storageSyncInProgress
{
  return self->_storageSyncInProgress;
}

- (void)setStorageSyncInProgress:(BOOL)a3
{
  self->_storageSyncInProgress = a3;
}

- (HMMTRStorageDelegate)delegate
{
  return (HMMTRStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSData)rootCert
{
  return self->_rootCert;
}

- (void)setRootCert:(id)a3
{
  objc_storeStrong((id *)&self->_rootCert, a3);
}

- (NSData)operationalCert
{
  return self->_operationalCert;
}

- (void)setOperationalCert:(id)a3
{
  objc_storeStrong((id *)&self->_operationalCert, a3);
}

- (NSNumber)caseAuthenticatedTag
{
  return self->_caseAuthenticatedTag;
}

- (void)setCaseAuthenticatedTag:(id)a3
{
  objc_storeStrong((id *)&self->_caseAuthenticatedTag, a3);
}

- (BOOL)caseAuthenticatedTagsUpdated
{
  return self->_caseAuthenticatedTagsUpdated;
}

- (void)setCaseAuthenticatedTagsUpdated:(BOOL)a3
{
  self->_caseAuthenticatedTagsUpdated = a3;
}

- (NSData)ownerIPK
{
  return self->_ownerIPK;
}

- (void)setOwnerIPK:(id)a3
{
  objc_storeStrong((id *)&self->_ownerIPK, a3);
}

- (NSNumber)ownerNodeID
{
  return self->_ownerNodeID;
}

- (void)setOwnerNodeID:(id)a3
{
  objc_storeStrong((id *)&self->_ownerNodeID, a3);
}

- (HMMTRMatterKeypair)nocSigner
{
  return self->_nocSigner;
}

- (void)setNocSigner:(id)a3
{
  objc_storeStrong((id *)&self->_nocSigner, a3);
}

- (HMMTRMatterKeypair)systemCommissionerNocSigner
{
  return self->_systemCommissionerNocSigner;
}

- (void)setSystemCommissionerNocSigner:(id)a3
{
  objc_storeStrong((id *)&self->_systemCommissionerNocSigner, a3);
}

- (HMMTRMatterKeypair)operationalKeyPair
{
  return self->_operationalKeyPair;
}

- (void)setOperationalKeyPair:(id)a3
{
  objc_storeStrong((id *)&self->_operationalKeyPair, a3);
}

- (NSNumber)certificateIssuerID
{
  return self->_certificateIssuerID;
}

- (void)setCertificateIssuerID:(id)a3
{
  objc_storeStrong((id *)&self->_certificateIssuerID, a3);
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFabricID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)isSystemCommissionerFabric
{
  return self->_systemCommissionerFabric;
}

- (void)setSystemCommissionerFabric:(BOOL)a3
{
  self->_systemCommissionerFabric = a3;
}

- (BOOL)isSharedAdmin
{
  return self->_sharedAdmin;
}

- (void)setSharedAdmin:(BOOL)a3
{
  self->_sharedAdmin = a3;
}

- (HMMTRFabricStorageDataSource)fabricDataSource
{
  return (HMMTRFabricStorageDataSource *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFabricDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)isFabricCreationInProgress
{
  return self->_fabricCreationInProgress;
}

- (void)setFabricCreationInProgress:(BOOL)a3
{
  self->_fabricCreationInProgress = a3;
}

- (MTSKeyValueStore)systemCommissionerKeyValueStore
{
  return (MTSKeyValueStore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSystemCommissionerKeyValueStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemCommissionerKeyValueStore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fabricDataSource, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_certificateIssuerID, 0);
  objc_storeStrong((id *)&self->_operationalKeyPair, 0);
  objc_storeStrong((id *)&self->_systemCommissionerNocSigner, 0);
  objc_storeStrong((id *)&self->_nocSigner, 0);
  objc_storeStrong((id *)&self->_ownerNodeID, 0);
  objc_storeStrong((id *)&self->_ownerIPK, 0);
  objc_storeStrong((id *)&self->_caseAuthenticatedTag, 0);
  objc_storeStrong((id *)&self->_operationalCert, 0);
  objc_storeStrong((id *)&self->_rootCert, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStorageWithoutUpdates, 0);
  objc_storeStrong((id *)&self->_appleFabricLocalStorage, 0);
  objc_storeStrong((id *)&self->_inMemoryStorage, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_keyValueStoreUpdateQueue, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __72__HMMTRStorage_replaceAllKeysAndSyncWithBlock_systemCommissionerFabric___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v17 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
        {
          if (objc_msgSend(*(id *)(a1 + 32), "isLocalStorageMode"))
          {
            objc_msgSend(*(id *)(a1 + 32), "localStorage");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v12);

          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);
          if (!v14)
            objc_msgSend(v17, "addObject:", v12);
          v9 = 1;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

uint64_t __75__HMMTRStorage_setValueForKey_removingKeys_systemCommissionerFabric_block___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = a1[6];
  objc_msgSend(v5, "objectForKeyedSubscript:", a1[4]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v6, "addObject:", a1[4]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, a1[4]);
  if (a1[5])
  {
    objc_msgSend(v5, "removeObjectsForKeys:");
    objc_msgSend(v6, "addObjectsFromArray:", a1[5]);
  }
  v11 = HMFEqualObjects() ^ 1;

  return v11;
}

id __62__HMMTRStorage_setValueForKey_value_systemCommissionerFabric___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x242656984]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v31 = v16;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v12;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Received Root Certificate %@, Operational Certificate %@, Owner Node ID %@, and IPK %@ from Resident", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_45;
  v23[3] = &unk_250F23FD0;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v27 = v12;
  v18 = *(void **)(a1 + 40);
  v28 = *(_QWORD *)(a1 + 32);
  v29 = v18;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  v22 = v9;
  dispatch_async(v17, v23);

}

void __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_45(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 64), "setRootCert:");
    objc_msgSend(*(id *)(a1 + 64), "setOperationalCert:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 64), "setOwnerNodeID:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 64), "setOwnerIPK:", *(_QWORD *)(a1 + 56));
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0);
  }
  else
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Certificates OR Owner Node ID required for pairing", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = isFeatureMatteriPhoneOnlyPairingControlEnabled();
  v3 = *(_QWORD *)(a1 + 32);
  if (!v2 || !v3)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = *(unsigned __int8 *)(a1 + 57);
    v6 = *(unsigned __int8 *)(a1 + 58);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_2;
    v8[3] = &unk_250F23F80;
    v7 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_fetchCertForFabricWithID:isOwner:forPairing:forceFetchFromResident:completion:", v3, v4, v5, v6, v8);

  }
}

uint64_t __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source value for keys: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 48), "fabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "fabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storageDataSourceForFabricWithID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_29;
      v22[3] = &unk_250F23F08;
      v23 = *(id *)(a1 + 40);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_2;
      v19[3] = &unk_250F23EB8;
      v13 = *(_QWORD *)(a1 + 56);
      v19[4] = *(_QWORD *)(a1 + 32);
      v21 = v13;
      v20 = WeakRetained;
      objc_msgSend(v11, "updateKeyValueStoreWithBlock:completion:", v22, v19);

    }
    else
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "fabricID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Fabric data source for fabric ID %@ is not available yet; cannot update storage",
          buf,
          0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(WeakRetained, "finish");
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_msgSend(WeakRetained, "finish");
  }

}

uint64_t __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_29(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  return 1;
}

void __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store with error %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

void __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source value for keys: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "fabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_12:
    objc_msgSend(WeakRetained, "finish");
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fabricID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storageDataSourceForFabricWithID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFabricDataSource:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v17 = (void *)MEMORY[0x242656984]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fabricID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v20;
      v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Fabric data source for fabric ID %@ is not available yet; cannot update storage",
        buf,
        0x16u);

    }
    objc_autoreleasePoolPop(v17);
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_28;
  v25[3] = &unk_250F23F08;
  v26 = *(id *)(a1 + 40);
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_2;
  v22[3] = &unk_250F23EB8;
  v16 = *(_QWORD *)(a1 + 48);
  v22[4] = *(_QWORD *)(a1 + 32);
  v24 = v16;
  v23 = WeakRetained;
  objc_msgSend(v14, "updateKeyValueStoreWithBlock:completion:", v25, v22);

LABEL_13:
}

uint64_t __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_28(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  return 1;
}

void __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store with error %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

void __40__HMMTRStorage__removeAllDataSourceData__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing all data source data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v16 = (void *)MEMORY[0x242656984]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Expecting fabric ID to be present when data source is removed", buf, 0xCu);

    }
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storageDataSourceForFabricWithID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFabricDataSource:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = (void *)MEMORY[0x242656984]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fabricID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@Fabric data source for fabric ID %@ is not available yet; cannot remove data from storage",
        buf,
        0x16u);

    }
LABEL_14:
    objc_autoreleasePoolPop(v16);
    objc_msgSend(WeakRetained, "finish");
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __40__HMMTRStorage__removeAllDataSourceData__block_invoke_27;
  v24[3] = &unk_250F23EB8;
  v15 = *(_QWORD *)(a1 + 40);
  v24[4] = *(_QWORD *)(a1 + 32);
  v26 = v15;
  v25 = WeakRetained;
  objc_msgSend(v13, "updateKeyValueStore:completion:", v14, v24);

LABEL_15:
}

void __40__HMMTRStorage__removeAllDataSourceData__block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove key-value store: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully removed all keys from key-value store", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

void __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source values", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_11;
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storageDataSourceForFabricWithID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFabricDataSource:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fabricID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Fabric data source for fabric ID %@ is not available yet", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
LABEL_11:
    objc_msgSend(WeakRetained, "finish");
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "fabricDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke_25;
  v20[3] = &unk_250F23E68;
  v14 = *(_QWORD *)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 48);
  v21 = WeakRetained;
  objc_msgSend(v13, "updateKeyValueStoreWithBlock:completion:", v14, v20);

LABEL_12:
}

void __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke_25(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

uint64_t __47__HMMTRStorage__syncSetDataSourceValue_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v20 = 138543618;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source value for key: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HMFEqualObjects();
  if (v13)
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping write for key %@ as new value is same as existing", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    if (!*(_QWORD *)(a1 + 48))
      objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));
  }

  return v13 ^ 1u;
}

void __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Failed to fetch commissioning certificates for fabric ID %@ with error %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Successfully fetched commissioning certificates for fabric ID %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Failed to fetch commissioning certificates for fabric ID %@ with error %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Successfully fetched commissioning certificates for fabric ID %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __51__HMMTRStorage_handleUpdatedDataWithIsLocalChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedDataWithIsLocalChange:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __47__HMMTRStorage_handleUpdatedCurrentFabricIndex__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting fabric ID to nil", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setFabricID:", 0);
}

void __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_2;
  v3[3] = &unk_250F23DA0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  dispatch_async(v2, v3);

}

void __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageDidUpdateData:isLocalChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageDidUpdateData:isLocalChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

+ (BOOL)checkAndUpdateExpiryOfCertificate:(id)a3 keyPair:(id)a4 newCertificate:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  void *v53;
  void *v54;
  id *v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x24BDDB5B0], "keypair:matchesCertificate:", v9, v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v10);
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "notAfter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToDate:", v14);

      if (v15)
      {
        v16 = v12;
        v17 = (void *)MEMORY[0x242656984]();
        v18 = a1;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "notAfter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
          v22 = v10;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = v20;
          v59 = 2112;
          v60 = v21;
          v61 = 2112;
          v62 = v23;
          _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Certificate expires in distant future. No update needed %@ vs %@", buf, 0x20u);

          v10 = v22;
        }

        objc_autoreleasePoolPop(v17);
        v24 = 0;
        v12 = v16;
      }
      else
      {
        v54 = v10;
        v33 = objc_alloc(MEMORY[0x24BDD1508]);
        objc_msgSend(v12, "notBefore");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = a5;
        v36 = (void *)objc_msgSend(v33, "initWithStartDate:endDate:", v34, v35);

        v37 = (void *)MEMORY[0x24BDDB5B0];
        objc_msgSend(v12, "issuer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "rootCACertificateID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v12;
        objc_msgSend(v12, "issuer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "fabricID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        objc_msgSend(v37, "createRootCertificate:issuerID:fabricID:validityPeriod:error:", v9, v39, v41, v36, &v56);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v56;
        *v55 = v42;

        v43 = *v55;
        v24 = *v55 != 0;
        v44 = (void *)MEMORY[0x242656984]();
        v45 = a1;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v43)
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v48;
            v59 = 2112;
            v60 = v36;
            _os_log_impl(&dword_23E95B000, v47, OS_LOG_TYPE_INFO, "%{public}@Successfully re-created certificate with new validity %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v44);
          objc_msgSend(MEMORY[0x24BDDB5B0], "printX509Certificate:", *v55);
          v49 = v52;
        }
        else
        {
          v49 = v52;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v58 = v50;
            v59 = 2112;
            v60 = v36;
            v61 = 2112;
            v62 = v52;
            _os_log_impl(&dword_23E95B000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-create certificate with new validity %@ due to error %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v44);
        }

        v12 = v53;
        v10 = v54;
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x242656984](objc_msgSend(MEMORY[0x24BDDB5B0], "printX509Certificate:", v8));
      v30 = a1;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v32;
        _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      v24 = 0;
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x242656984](objc_msgSend(MEMORY[0x24BDDB5B0], "printX509Certificate:", v8));
    v26 = a1;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v28;
      v59 = 2112;
      v60 = v9;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@Certificate doesn't match key pair %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

+ (id)generateIPK
{
  _BYTE bytes[16];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 0x10uLL, bytes))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", bytes, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t107 != -1)
    dispatch_once(&logCategory__hmf_once_t107, &__block_literal_global_9952);
  return (id)logCategory__hmf_once_v108;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)didUpdateMatterItems:(id)a3 oldStorage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((isFeatureMatteriPhoneOnlyPairingControlEnabled() & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!+[HMMTRStorage isPluginKey:](HMMTRStorage, "isPluginKey:", v13)
            && !+[HMMTRStorage isMatterKey:](HMMTRStorage, "isMatterKey:", v13))
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v13);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:", v15))
            {
LABEL_24:
              NSLog(CFSTR("Storage Key %@ has changed and is not managed by HomeKitMatter"), v13);
              LOBYTE(v7) = 1;
              goto LABEL_25;
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v10)
          continue;
        break;
      }
    }

    v16 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v5, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v6, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "minusSet:", v8);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v20;
    v7 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v7)
    {
      v21 = *(_QWORD *)v25;
      while (2)
      {
        for (j = 0; j != v7; ++j)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v15);
          v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          if (!+[HMMTRStorage isPluginKey:](HMMTRStorage, "isPluginKey:", v13))
          {
            v14 = v15;
            goto LABEL_24;
          }
        }
        v7 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v7)
          continue;
        break;
      }
    }
    v14 = v15;
LABEL_25:

  }
  return v7;
}

void __27__HMMTRStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v108;
  logCategory__hmf_once_v108 = v0;

}

@end
