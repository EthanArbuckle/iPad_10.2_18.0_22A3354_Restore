@implementation HMDUnpairedHAPAccessory

- (HMDUnpairedHAPAccessory)initWithAccessoryServer:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDUnpairedHAPAccessory *v13;
  void *v14;
  uint64_t v15;
  NSData *setupHash;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CBA1D8];
  v8 = a4;
  objc_msgSend(v6, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryWithCategoryIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDUnpairedHAPAccessory initWithIdentifier:name:category:messageDispatcher:](self, "initWithIdentifier:name:category:messageDispatcher:", v11, v12, v10, v8);

  if (v13)
  {
    -[NSMutableArray addObject:](v13->_accessoryServers, "addObject:", v6);
    objc_msgSend(v6, "setupHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    setupHash = v13->_setupHash;
    v13->_setupHash = (NSData *)v15;

    v13->_linkType = objc_msgSend(v6, "linkType");
  }

  return v13;
}

- (HMDUnpairedHAPAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6
{
  HMDUnpairedHAPAccessory *v6;
  uint64_t v7;
  NSMutableArray *accessoryServers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDUnpairedHAPAccessory;
  v6 = -[HMDUnassociatedAccessory initWithIdentifier:name:category:messageDispatcher:](&v10, sel_initWithIdentifier_name_category_messageDispatcher_, a3, a4, a5, a6);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    accessoryServers = v6->_accessoryServers;
    v6->_accessoryServers = (NSMutableArray *)v7;

    v6->_certificationStatus = 0;
    v6->_linkType = 0;
  }
  return v6;
}

- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUnpairedHAPAccessory transportTypes](self, "transportTypes", a3, a4);
  HMAccessoryTransportTypesToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("transportTypes = %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HMDUnpairedHAPAccessory;
  -[HMDUnassociatedAccessory descriptionWithPointer:additionalDescription:](&v11, sel_descriptionWithPointer_additionalDescription_, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HMDUnpairedHAPAccessory;
  -[HMDUnassociatedAccessory dumpDescription](&v29, sel_dumpDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0D27F80];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D27F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[HMDUnpairedHAPAccessory setupHash](self, "setupHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnpairedHAPAccessory transportTypes](self, "transportTypes");
  HMAccessoryTransportTypesToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("  setupHash %@  transportTypes %@  linkType "), v8, v9);

  v24 = v4;
  objc_msgSend(v4, "setObject:forKey:", v7, v5);
  v10 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "linkType");
        v20 = CFSTR("Undefined");
        if (v19 <= 2)
          v20 = off_1E89ABEB0[v19];
        v21 = v20;
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ "), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v12, "count"))
    objc_msgSend(v24, "setObject:forKey:", v12, *MEMORY[0x1E0D27E50]);

  return v24;
}

- (BOOL)isReachable
{
  void *v2;
  BOOL v3;

  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)identifyWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDUnpairedHAPAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUnpairedHAPAccessory preferredAccessoryServer](self, "preferredAccessoryServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Identify by /identify URL or unpaired BTLE characteristic write", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_initWeak((id *)buf, v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__HMDUnpairedHAPAccessory_identifyWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E89BE698;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v4;
    objc_msgSend(v5, "identifyWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v10);

  }
}

- (NSArray)accessoryServers
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)-[NSMutableArray copy](self->_accessoryServers, "copy");
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (void)addAccessoryServer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = objc_msgSend(v4, "linkType");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)-[NSMutableArray copy](self->_accessoryServers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v5 == objc_msgSend(v10, "linkType"))
          -[NSMutableArray removeObject:](self->_accessoryServers, "removeObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NSMutableArray addObject:](self->_accessoryServers, "addObject:", v4);
  objc_msgSend(v4, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory updateCategoryWithCategoryIdentifier:](self, "updateCategoryWithCategoryIdentifier:", v11);

  os_unfair_recursive_lock_unlock();
}

- (void)removeAccessoryServer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = objc_msgSend(v4, "linkType");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)-[NSMutableArray copy](self->_accessoryServers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (v5 == objc_msgSend(v10, "linkType"))
        {
          -[NSMutableArray removeObject:](self->_accessoryServers, "removeObject:", v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
}

- (id)preferredAccessoryServer
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    v8 = v5;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v2);
      v5 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v7);

      if (objc_msgSend(v5, "linkType") == 1)
        break;
      ++v7;
      v8 = v5;
      if (v4 == v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)transportTypes
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v26;
    v8 = 0x1E0D16000uLL;
    *(_QWORD *)&v4 = 138543618;
    v24 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "linkType", v24);
        if (v11 == 2)
        {
          v6 |= 2uLL;
        }
        else if (v11 == 1)
        {
          v12 = v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
          v14 = v13;

          v15 = objc_msgSend(v14, "isWacAccessory");
          if (v15)
            v16 = 9;
          else
            v16 = 1;
          v6 |= v16;
        }
        else
        {
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = v10;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = v8;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v18, "linkType");
            *(_DWORD *)buf = v24;
            v30 = v21;
            v31 = 2048;
            v32 = v22;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unhandled linkType: %tu", buf, 0x16u);

            v8 = v20;
          }

          objc_autoreleasePoolPop(v17);
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasBTLELink
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "linkType") == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasIPLink
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;

        if (v9)
        {
          if (!objc_msgSend(v9, "isWacAccessory") || (objc_msgSend(v9, "isWacComplete") & 1) != 0)
            goto LABEL_19;
        }
        else if (objc_msgSend(v7, "linkType") == 1)
        {
          v7 = 0;
LABEL_19:

          v10 = 1;
          goto LABEL_20;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_20:

  return v10;
}

- (BOOL)supportsCHIP
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "communicationProtocol") == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isKnownToSystemCommissioner
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isKnownToSystemCommissioner") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)rootPublicKey
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "rootPublicKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "rootPublicKey");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)nodeID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "nodeID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "nodeID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)commissioningID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "commissioningID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "commissioningID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)vendorID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "vendorID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "vendorID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)productID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "productID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "productID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)serialNumber
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "primaryAccessory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "serialNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v6, "primaryAccessory");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "serialNumber");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)requiresThreadRouter
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "requiresThreadRouter") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (int64_t)associationOptions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t i;
  id v8;
  char isKindOfClass;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDUnpairedHAPAccessory accessoryServers](self, "accessoryServers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 1;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0 && v8)
        {
          v6 = 0;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = 1;
  }
LABEL_13:

  return v6;
}

- (int64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setCertificationStatus:(int64_t)a3
{
  self->_certificationStatus = a3;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_accessoryServers, 0);
}

void __57__HMDUnpairedHAPAccessory_identifyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Identify by /identify URL completed with error: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

@end
