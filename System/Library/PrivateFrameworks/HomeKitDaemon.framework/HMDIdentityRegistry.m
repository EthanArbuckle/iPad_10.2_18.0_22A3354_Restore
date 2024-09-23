@implementation HMDIdentityRegistry

- (HMDIdentityRegistry)init
{
  HMDIdentityRegistry *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  uint64_t v5;
  NSMutableArray *registeredIdentities;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDIdentityRegistry;
  v2 = -[HMDIdentityRegistry init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    lock = v2->_lock;
    v2->_lock = v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    registeredIdentities = v2->_registeredIdentities;
    v2->_registeredIdentities = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDIdentityRegistry registeredIdentities](self, "registeredIdentities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identities"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)registeredIdentities
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14933;
  v11 = __Block_byref_object_dispose__14934;
  v12 = 0;
  -[HMDIdentityRegistry lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__HMDIdentityRegistry_registeredIdentities__block_invoke;
  v6[3] = &unk_24E79B698;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)identityForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__14933;
    v15 = __Block_byref_object_dispose__14934;
    v16 = 0;
    -[HMDIdentityRegistry lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__HMDIdentityRegistry_identityForIdentifier___block_invoke;
    v8[3] = &unk_24E79C0A8;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "performBlock:", v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_userForIdenity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  -[HMDIdentityRegistry homeManager](self, "homeManager", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "userWithPairingIdentity:", v4);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)userForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identitiesForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
  {
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  -[HMDIdentityRegistry _userForIdenity:](self, "_userForIdenity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (id)identitiesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__14933;
    v19 = __Block_byref_object_dispose__14934;
    v20 = 0;
    -[HMDIdentityRegistry lock](self, "lock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__HMDIdentityRegistry_identitiesForDevice___block_invoke;
    v11[3] = &unk_24E79B5F8;
    v11[4] = self;
    v12 = v5;
    v8 = v6;
    v13 = v8;
    v14 = &v15;
    objc_msgSend(v7, "performBlock:", v11);

    v9 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v9 = (id)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (id)identitiesForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__14933;
    v15 = __Block_byref_object_dispose__14934;
    v16 = 0;
    -[HMDIdentityRegistry lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__HMDIdentityRegistry_identitiesForAccount___block_invoke;
    v8[3] = &unk_24E79C0A8;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "performBlock:", v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = (id)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)identitiesForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__14933;
    v15 = __Block_byref_object_dispose__14934;
    v16 = 0;
    -[HMDIdentityRegistry lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__HMDIdentityRegistry_identitiesForAccountIdentifier___block_invoke;
    v8[3] = &unk_24E79C0A8;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "performBlock:", v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = (id)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)accountsForIdentity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__14933;
    v15 = __Block_byref_object_dispose__14934;
    v16 = 0;
    -[HMDIdentityRegistry lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__HMDIdentityRegistry_accountsForIdentity___block_invoke;
    v8[3] = &unk_24E79C0A8;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "performBlock:", v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)registerIdentity:(id)a3 device:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDIdentityRegistry *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v15;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Registering identity, %@, for device, %@, for object: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F218]), "initWithObservedObject:", v11);
    -[HMDIdentityRegistry lock](v13, "lock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __54__HMDIdentityRegistry_registerIdentity_device_object___block_invoke;
    v20[3] = &unk_24E79A910;
    v20[4] = v13;
    v21 = v8;
    v22 = v9;
    v23 = v17;
    v19 = v17;
    objc_msgSend(v18, "performBlock:", v20);

  }
}

- (void)registerIdentity:(id)a3 account:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDIdentityRegistry *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v15;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering identity, %@, for account, %@, for object: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F218]), "initWithObservedObject:", v11);
    -[HMDIdentityRegistry lock](v13, "lock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__HMDIdentityRegistry_registerIdentity_account_object___block_invoke;
    v20[3] = &unk_24E79A910;
    v20[4] = v13;
    v21 = v8;
    v22 = v9;
    v23 = v17;
    v19 = v17;
    objc_msgSend(v18, "performBlock:", v20);

  }
}

- (void)deregisterIdentity:(id)a3 object:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    -[HMDIdentityRegistry lock](self, "lock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__HMDIdentityRegistry_deregisterIdentity_object___block_invoke;
    v9[3] = &unk_24E79BBD0;
    v9[4] = self;
    v10 = v8;
    v11 = v6;
    objc_msgSend(v7, "performBlock:", v9);

  }
}

- (void)reset
{
  void *v3;
  _QWORD v4[5];

  -[HMDIdentityRegistry lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __28__HMDIdentityRegistry_reset__block_invoke;
  v4[3] = &unk_24E79C240;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (id)dumpState
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  id obj;
  id obja;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[2];
  _QWORD v119[2];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _QWORD v124[2];
  _QWORD v125[2];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIdentityRegistry registeredIdentities](self, "registeredIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithStrongToStrongObjects");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v115;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v115 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v114 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          objc_msgSend(v11, "device");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "device");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setObject:forKey:", v13, v14);

          }
          objc_msgSend(v13, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
    }
    while (v6);
  }
  v63 = v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v74, "count"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  objc_msgSend(v74, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
  if (v72)
  {
    v68 = *(_QWORD *)v111;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v111 != v68)
          objc_enumerationMutation(obj);
        v76 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v15);
        v78 = v15;
        objc_msgSend(v74, "objectForKey:", v63);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v80 = v16;
        v17 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
        if (v17)
        {
          v18 = v17;
          v82 = *(_QWORD *)v107;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v107 != v82)
                objc_enumerationMutation(v80);
              v20 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v19);
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = 0u;
              v103 = 0u;
              v104 = 0u;
              v105 = 0u;
              objc_msgSend(v20, "registeredObjects");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v102, v126, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v103;
                do
                {
                  v26 = 0;
                  do
                  {
                    if (*(_QWORD *)v103 != v25)
                      objc_enumerationMutation(v22);
                    objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * v26), "observedObject");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "description");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "addObject:", v28);

                    ++v26;
                  }
                  while (v24 != v26);
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v102, v126, 16);
                }
                while (v24);
              }

              v124[0] = CFSTR("Identity");
              objc_msgSend(v20, "description");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v124[1] = CFSTR("Objects");
              v125[0] = v29;
              v125[1] = v21;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "addObject:", v30);

              ++v19;
            }
            while (v19 != v18);
            v18 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
          }
          while (v18);
        }

        objc_msgSend(v76, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setObject:forKey:", v84, v31);

        v15 = v78 + 1;
      }
      while (v78 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
    }
    while (v72);
  }

  v32 = (void *)objc_msgSend(v70, "copy");
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v32, CFSTR("deviceIdentities"));

  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithStrongToStrongObjects");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v33 = v63;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v99;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v99 != v36)
          objc_enumerationMutation(v33);
        v38 = *(id *)(*((_QWORD *)&v98 + 1) + 8 * v37);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v39 = v38;
        else
          v39 = 0;
        v40 = v39;

        if (v40)
        {
          objc_msgSend(v40, "account");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectForKey:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "account");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setObject:forKey:", v42, v43);

          }
          objc_msgSend(v42, "addObject:", v40, v63);

        }
        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
    }
    while (v35);
  }
  v64 = v33;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v75, "count"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(v75, "keyEnumerator");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v122, 16);
  if (v73)
  {
    v69 = *(_QWORD *)v95;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v95 != v69)
          objc_enumerationMutation(obja);
        v77 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v44);
        v79 = v44;
        objc_msgSend(v75, "objectForKey:", v64);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v45, "count"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v81 = v45;
        v46 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v90, v121, 16);
        if (v46)
        {
          v47 = v46;
          v83 = *(_QWORD *)v91;
          do
          {
            v48 = 0;
            do
            {
              if (*(_QWORD *)v91 != v83)
                objc_enumerationMutation(v81);
              v49 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v48);
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              v89 = 0u;
              objc_msgSend(v49, "registeredObjects");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v86, v120, 16);
              if (v52)
              {
                v53 = v52;
                v54 = *(_QWORD *)v87;
                do
                {
                  v55 = 0;
                  do
                  {
                    if (*(_QWORD *)v87 != v54)
                      objc_enumerationMutation(v51);
                    objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v55), "observedObject");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "description");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "addObject:", v57);

                    ++v55;
                  }
                  while (v53 != v55);
                  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v86, v120, 16);
                }
                while (v53);
              }

              v118[0] = CFSTR("Identity");
              objc_msgSend(v49, "description");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v118[1] = CFSTR("Objects");
              v119[0] = v58;
              v119[1] = v50;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 2);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "addObject:", v59);

              ++v48;
            }
            while (v48 != v47);
            v47 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v90, v121, 16);
          }
          while (v47);
        }

        objc_msgSend(v77, "shortDescription");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKey:", v85, v60);

        v44 = v79 + 1;
      }
      while (v79 + 1 != v73);
      v73 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v122, 16);
    }
    while (v73);
  }

  v61 = (void *)objc_msgSend(v71, "copy");
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v61, CFSTR("accountIdentities"));

  return v65;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_registeredIdentities, 0);
}

uint64_t __28__HMDIdentityRegistry_reset__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        __notifyRegisteredIdentityRemoved(*(void **)(a1 + 32), *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects", (_QWORD)v12);
}

void __49__HMDIdentityRegistry_deregisterIdentity_object___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v37 = v5;
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Deregistering identity, %@, for object: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registeredIdentities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v23 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      v24 = v9;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        objc_msgSend(v12, "identity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 40));

        if (v14)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v12, "registeredObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v27;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v27 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(v20, "observedObject");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = *(void **)(a1 + 48);

                if (v21 == v22)
                {
                  __removeRegisteredObjectForRegisteredIdentity(*(void **)(a1 + 32), v12, v20);
                  goto LABEL_19;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v17)
                continue;
              break;
            }
          }
LABEL_19:

          v10 = v23;
          v9 = v24;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }

}

void __55__HMDIdentityRegistry_registerIdentity_account_object___block_invoke(void **a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __HMDRegisteredAccountIdentity *v7;
  __HMDRegisteredAccountIdentity *v8;
  __HMDRegisteredAccountIdentity *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  __registeredIdentitiesForIdentity(a1[4], a1[5]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(v2);
      v7 = (__HMDRegisteredAccountIdentity *)*(id *)(*((_QWORD *)&v18 + 1) + 8 * v6);
      objc_opt_class();
      v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      v9 = v8;

      -[__HMDRegisteredAccountIdentity account](v9, "account", (_QWORD)v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", a1[6]);

      if ((v11 & 1) != 0)
        break;

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }

    if (v9)
      goto LABEL_17;
  }
  else
  {
LABEL_12:

  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = a1[4];
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    objc_msgSend(a1[6], "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Adding identity, %@, for account: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v7 = -[__HMDRegisteredAccountIdentity initWithIdentity:account:]([__HMDRegisteredAccountIdentity alloc], "initWithIdentity:account:", a1[5], a1[6]);
  objc_msgSend(*((id *)a1[4] + 1), "addObject:", v7);
  __notifyRegisteredIdentityAdded(a1[4], v7);
LABEL_17:
  __registerObjectForRegisteredIdentity(a1[4], v7, a1[7]);

}

void __54__HMDIdentityRegistry_registerIdentity_device_object___block_invoke(void **a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __HMDRegisteredDeviceIdentity *v7;
  __HMDRegisteredDeviceIdentity *v8;
  __HMDRegisteredDeviceIdentity *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  __registeredIdentitiesForIdentity(a1[4], a1[5]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(v2);
      v7 = (__HMDRegisteredDeviceIdentity *)*(id *)(*((_QWORD *)&v18 + 1) + 8 * v6);
      objc_opt_class();
      v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      v9 = v8;

      -[__HMDRegisteredDeviceIdentity device](v9, "device", (_QWORD)v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", a1[6]);

      if ((v11 & 1) != 0)
        break;

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }

    if (v9)
      goto LABEL_17;
  }
  else
  {
LABEL_12:

  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = a1[4];
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    objc_msgSend(a1[6], "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Adding identity, %@, for device: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v7 = -[__HMDRegisteredDeviceIdentity initWithIdentity:device:]([__HMDRegisteredDeviceIdentity alloc], "initWithIdentity:device:", a1[5], a1[6]);
  objc_msgSend(*((id *)a1[4] + 1), "addObject:", v7);
  __notifyRegisteredIdentityAdded(a1[4], v7);
LABEL_17:
  __registerObjectForRegisteredIdentity(a1[4], v7, a1[7]);

}

void __43__HMDIdentityRegistry_accountsForIdentity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = a1;
  __registeredIdentitiesForIdentity(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
        v10 = v9;

        if (v10)
        {
          objc_msgSend(v10, "account");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            goto LABEL_11;
          goto LABEL_12;
        }
        v12 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v10 = v13;

        if (v10)
        {
          objc_msgSend(v10, "device");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "account");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            goto LABEL_12;
LABEL_11:
          objc_msgSend(v2, "addObject:", v11);
LABEL_12:

        }
        ++v7;
      }
      while (v5 != v7);
      v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v5 = v15;
    }
    while (v15);
  }

  objc_msgSend(v2, "array");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

void __54__HMDIdentityRegistry_identitiesForAccountIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1[4] + 8);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
        v8 = v7;

        objc_msgSend(v8, "account");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", a1[5]);

        if (v11)
        {
          objc_msgSend(v6, "identity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v12);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }

  objc_msgSend(v16, "array");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __44__HMDIdentityRegistry_identitiesForAccount___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1[4] + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;

        objc_msgSend(v9, "account");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", a1[5]);

        if (v11)
        {
          objc_msgSend(v7, "identity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v12);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  objc_msgSend(v16, "array");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __43__HMDIdentityRegistry_identitiesForDevice___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = *(id *)(a1[4] + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
        v10 = v9;

        objc_msgSend(v10, "device", (_QWORD)v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", a1[5]);

        if ((v12 & 1) != 0)
          goto LABEL_15;

        if (!a1[6])
          goto LABEL_17;
        v13 = v8;
        objc_opt_class();
        v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;
        v10 = v14;

        objc_msgSend(v10, "account");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", a1[6]);

        if (v16)
        {
LABEL_15:
          objc_msgSend(v8, "identity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v17);

        }
LABEL_17:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "array");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1[7] + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

}

void __45__HMDIdentityRegistry_identityForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1[4] + 8);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;

        objc_msgSend(v9, "identity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", a1[5]);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v9, "identity");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(a1[6] + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;

          v23 = obj;
          goto LABEL_21;
        }

        v13 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        objc_msgSend(v15, "identity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", a1[5]);

        if (v18)
        {
          objc_msgSend(v15, "identity");
          v19 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v19;
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v4 = 0;
  }

  v24 = *(_QWORD *)(a1[6] + 8);
  v4 = v4;
  v23 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v4;
LABEL_21:

}

void __43__HMDIdentityRegistry_registeredIdentities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDIdentityRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, block);
  return (id)sharedRegistry_identityRegistry;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_14944 != -1)
    dispatch_once(&logCategory__hmf_once_t27_14944, &__block_literal_global_14945);
  return (id)logCategory__hmf_once_v28_14946;
}

void __34__HMDIdentityRegistry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28_14946;
  logCategory__hmf_once_v28_14946 = v0;

}

void __37__HMDIdentityRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  HMDIdentityRegistry *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(HMDIdentityRegistry);
  v3 = (void *)sharedRegistry_identityRegistry;
  sharedRegistry_identityRegistry = (uint64_t)v2;

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating HMDIdentity Registry", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
}

@end
