@implementation HAPMetadataService

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (NSString)svcDescription
{
  return self->_svcDescription;
}

- (NSSet)mandatoryCharacteristics
{
  return self->_mandatoryCharacteristics;
}

- (NSString)name
{
  return self->_name;
}

- (HAPMetadataService)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 mandatoryChrTypes:(id)a6 properties:(id)a7 linkedServices:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = 0;
  if (v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataService;
    v20 = -[HAPMetadataService init](&v29, sel_init);
    if (v20)
    {
      v21 = objc_msgSend(v14, "copy");
      v22 = (void *)*((_QWORD *)v20 + 2);
      *((_QWORD *)v20 + 2) = v21;

      v23 = objc_msgSend(v15, "copy");
      v24 = (void *)*((_QWORD *)v20 + 4);
      *((_QWORD *)v20 + 4) = v23;

      v25 = objc_msgSend(v16, "copy");
      v26 = (void *)*((_QWORD *)v20 + 3);
      *((_QWORD *)v20 + 3) = v25;

      objc_storeStrong((id *)v20 + 8, a6);
      objc_storeStrong((id *)v20 + 6, a7);
      v27 = v19;
      self = (HAPMetadataService *)*((_QWORD *)v20 + 7);
      *((_QWORD *)v20 + 7) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataService *)v20;
}

- (id)generateDictionary:(id)a3 metadata:(id)a4
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataService uuidStr](self, "uuidStr");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  +[HAPMetadata shortenHAPType:baseUUIDSuffix:](HAPMetadata, "shortenHAPType:baseUUIDSuffix:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("ShortUUID"));

  -[HAPMetadataService svcDescription](self, "svcDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("DefaultDescription"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &stru_1E894EFE8, CFSTR("LocalizationKey"));
  -[HAPMetadataService btleuuidStr](self, "btleuuidStr");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HAPMetadataService btleuuidStr](self, "btleuuidStr");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("BTLE_ShortUUID"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v7, "characteristicUTIFromType:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("Required"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v7, "characteristicUTIFromType:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v27));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v22, "addObject:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v25);
  }

  if (objc_msgSend(v22, "count"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("Optional"));
  if (objc_msgSend(v14, "count"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("Characteristics"));
  if (-[HAPMetadataService allowAssociatedService](self, "allowAssociatedService"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AllowAssociatedService"));

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuidStr");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@(%@),"), v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HAPMetadataService optionalCharacteristics](self, "optionalCharacteristics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uuidStr");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR("%@(%@),"), v19, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v15);
  }

  v21 = (void *)MEMORY[0x1E0CB3940];
  -[HAPMetadataService name](self, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataService uuidStr](self, "uuidStr");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataService svcDescription](self, "svcDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("HAPMetadataService %@(%@) - %@ - mandatory %@, optional %@"), v22, v23, v24, v3, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)dump
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  id obja;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataService name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataService uuidStr](self, "uuidStr");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataService svcDescription](self, "svcDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v58 = v5;
    v59 = 2112;
    v60 = (unint64_t)v6;
    v61 = 2112;
    v62 = v7;
    v63 = 2112;
    v64 = v8;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharacteristic %@(%@):  description: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  if (-[HAPMetadataService allowAssociatedService](self, "allowAssociatedService"))
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HAPMetadataService allowAssociatedService](self, "allowAssociatedService");
      *(_DWORD *)buf = 138543618;
      v58 = v11;
      v59 = 2048;
      v60 = v12;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@AllowAssociatedService: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  -[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Mandatory characteristics:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uuidStr");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "chrDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v58 = v25;
            v59 = 2112;
            v60 = (unint64_t)v26;
            v61 = 2112;
            v62 = v27;
            v63 = 2112;
            v64 = v28;
            _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v23);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v19);
    }

  }
  -[HAPMetadataService optionalCharacteristics](self, "optionalCharacteristics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    v31 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v33;
      _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_INFO, "%{public}@Optional characteristics:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[HAPMetadataService optionalCharacteristics](self, "optionalCharacteristics");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v48 != v36)
            objc_enumerationMutation(obja);
          v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          v39 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "name");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "uuidStr");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "chrDescription");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v58 = v41;
            v59 = 2112;
            v60 = (unint64_t)v42;
            v61 = 2112;
            v62 = v43;
            v63 = 2112;
            v64 = v44;
            _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v39);
        }
        v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v35);
    }

  }
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setSvcDescription:(id)a3
{
  objc_storeStrong((id *)&self->_svcDescription, a3);
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (NSString)btleuuidStr
{
  return self->_btleuuidStr;
}

- (void)setBtleuuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_btleuuidStr, a3);
}

- (NSNumber)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServices, a3);
}

- (void)setMandatoryCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_mandatoryCharacteristics, a3);
}

- (NSSet)optionalCharacteristics
{
  return self->_optionalCharacteristics;
}

- (void)setOptionalCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_optionalCharacteristics, a3);
}

- (BOOL)allowAssociatedService
{
  return self->_allowAssociatedService;
}

- (void)setAllowAssociatedService:(BOOL)a3
{
  self->_allowAssociatedService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalCharacteristics, 0);
  objc_storeStrong((id *)&self->_mandatoryCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_btleuuidStr, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_svcDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
