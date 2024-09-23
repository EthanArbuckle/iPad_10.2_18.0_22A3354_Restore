@implementation HMMTRUtilities

+ (id)identifierStringWithCHIPNodeID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmmtr_sha256hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringToIndex:", 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = v7 - 2;
  if (v7 != 2)
  {
    do
    {
      objc_msgSend(v6, "insertString:atIndex:", CFSTR(":"), v8);
      v8 -= 2;
    }
    while (v8);
  }

  return v6;
}

+ (id)setupIDFromSetupCode:(id)a3 discriminator:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(a4, "intValue") & 0xF);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hmmtr_sha256hash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmmtr_sha256hash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmmtr_sha256hash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "substringToIndex:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)hmmtr_shortTypeFromUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)*MEMORY[0x24BE1B908];
  if (objc_msgSend(v3, "hasSuffix:", *MEMORY[0x24BE1B908]))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - objc_msgSend(v4, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("^0+"), &stru_250F24B08, 1024, 0, objc_msgSend(v5, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)randomDiscriminator
{
  return arc4random_uniform(0x1000u);
}

+ (int64_t)nextServiceInstanceID:(int64_t)a3 previousCharacteristicsCount:(unint64_t)a4
{
  return a3 + 10 * (a4 / 0xA) + 10;
}

+ (BOOL)compareUnorderedUniqueNumberArray:(id)a3 withArray:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v8 = (void *)v7;
  if ((v6 != 0) != (v7 != 0))
  {
LABEL_11:
    LOBYTE(v12) = 0;
    goto LABEL_12;
  }
  if (!(v6 | v7))
  {
    LOBYTE(v12) = 1;
    goto LABEL_12;
  }
  v9 = objc_msgSend((id)v6, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    v17 = (void *)MEMORY[0x242656984]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v20;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@compareUnorderedUniqueNumberArray array %@ withArray %@ returned false", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);
  v13 = (void *)MEMORY[0x242656984]();
  v14 = a1;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544130;
    v23 = v16;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v8;
    v28 = 1024;
    v29 = v12;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@compareUnorderedUniqueNumberArray array %@ withArray %@ returned %d", (uint8_t *)&v22, 0x26u);

  }
  objc_autoreleasePoolPop(v13);

LABEL_12:
  return v12;
}

+ (unint64_t)randomNodeID
{
  return arc4random_uniform(0xFFFFFFFE) + 1;
}

+ (id)encodeObject:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1618];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, *MEMORY[0x24BDD0E88]);

  objc_msgSend(v5, "finishEncoding");
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_pathOfMTRClusterReadValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDDB4B0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v5 = v10;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)mtrBaseClusterValueFromMTRClusterReportValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_msgSend(a1, "_pathOfMTRClusterReadValue:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = (void *)MEMORY[0x242656984]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_pathOfMTRClusterReadValue:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Read value missing data key %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = (void *)MEMORY[0x242656984]();
      v17 = v12;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v19;
        v24 = 2112;
        v25 = v5;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_DEBUG, "%{public}@%@\nat%@", (uint8_t *)&v22, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)__baseClusterValueForAttributeDeviceListFromReadValue:(id)a3 forIdentify:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v37 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB500]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if ((objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDDB4F8]) & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v35 = v8;
      v36 = v5;
      v12 = (void *)objc_opt_new();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v34 = v11;
      obj = v11;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v41 != v15)
              objc_enumerationMutation(obj);
            v17 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v18 = v17;
            else
              v18 = 0;
            v19 = v18;

            if (!v19)
            {
              v20 = (void *)MEMORY[0x242656984]();
              v21 = a1;
              HMFGetOSLogHandle();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v23 = v15;
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v46 = v24;
                v47 = 2112;
                v48 = v37;
                _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_ERROR, "%{public}@Structure Value does not contain a dictionary %@", buf, 0x16u);

                v15 = v23;
              }

              objc_autoreleasePoolPop(v20);
            }
            objc_msgSend(v12, "addObject:", v19);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v14);
      }

      v8 = v35;
      v5 = v36;
      v11 = v34;
    }
    else
    {
      v29 = (void *)MEMORY[0x242656984]();
      v30 = a1;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v32;
        v47 = 2112;
        v48 = v37;
        _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_ERROR, "%{public}@Element data data array missing from array type %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      v12 = 0;
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = a1;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v28;
      v47 = 2112;
      v48 = v37;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@Dictionary element is not a structure type %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v12 = 0;
  }

  return v12;
}

+ (id)mtrBaseClusterValueFromMTRClusterReadResultValue:(id)a3 forIdentify:(id)a4
{
  return (id)objc_msgSend(a1, "mtrBaseClusterValueFromMTRClusterReadResultValue:clusterIdentifier:attributeIdentifier:forIdentify:", a3, 0, 0, a4);
}

+ (id)mtrBaseClusterValueFromMTRClusterReadResultValue:(id)a3 clusterIdentifier:(id)a4 attributeIdentifier:(id)a5 forIdentify:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = *MEMORY[0x24BDDB500];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDDB500]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v18 = *MEMORY[0x24BDDB458];
    v67 = v11;
    v68 = v12;
    if (objc_msgSend(v17, "isEqual:", *MEMORY[0x24BDDB458]))
    {
      v59 = *MEMORY[0x24BDDB518];
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      v60 = v21;
      if (v21)
      {
        v66 = v13;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        obj = v21;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
        if (v22)
        {
          v23 = v22;
          v64 = *(_QWORD *)v70;
          v63 = *MEMORY[0x24BDDB478];
          v61 = *MEMORY[0x24BDDB4F8];
          v57 = v17;
          v58 = v10;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v70 != v64)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v26 = (void *)MEMORY[0x242656984]();
                v27 = a1;
                HMFGetOSLogHandle();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v75 = v29;
                  v76 = 2112;
                  v77 = v66;
                  _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Array element is not a dictionary %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v26);
                v11 = v67;
              }
              objc_msgSend(v25, "objectForKeyedSubscript:", v63, v57);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v31 = v30;
              else
                v31 = 0;
              v32 = v31;

              if (!v32)
              {
                v52 = (void *)MEMORY[0x242656984]();
                v53 = a1;
                HMFGetOSLogHandle();
                v54 = objc_claimAutoreleasedReturnValue();
                v13 = v66;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v75 = v55;
                  v76 = 2112;
                  v77 = v66;
                  _os_log_impl(&dword_23E95B000, v54, OS_LOG_TYPE_ERROR, "%{public}@Array element data missing from array type %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v52);
                v10 = v58;
                v12 = v68;
                goto LABEL_54;
              }
              objc_msgSend(v32, "objectForKeyedSubscript:", v14);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v34 = v33;
              else
                v34 = 0;
              v35 = v34;

              if ((objc_msgSend(v35, "isEqual:", v18) & 1) != 0 || objc_msgSend(v35, "isEqual:", v61))
              {
                v12 = v68;
                if (!v11
                  || (v36 = objc_msgSend(v11, "isEqual:", &unk_250F3FB88), !v68)
                  || !v36
                  || !objc_msgSend(v68, "isEqual:", &unk_250F3FBA0))
                {
                  v48 = (void *)MEMORY[0x242656984]();
                  v49 = a1;
                  HMFGetOSLogHandle();
                  v50 = objc_claimAutoreleasedReturnValue();
                  v13 = v66;
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v75 = v51;
                    v76 = 2112;
                    v77 = v66;
                    _os_log_impl(&dword_23E95B000, v50, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nested aggregate type %@", buf, 0x16u);

                    v12 = v68;
                  }

                  objc_autoreleasePoolPop(v48);
                  v10 = v58;
LABEL_54:
                  v17 = v57;

                  v39 = 0;
                  v11 = v67;
                  v38 = v65;
                  goto LABEL_55;
                }
                objc_msgSend(a1, "__baseClusterValueForAttributeDeviceListFromReadValue:forIdentify:", v32, v66);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "addObjectsFromArray:", v37);
              }
              else
              {
                objc_msgSend(v32, "objectForKeyedSubscript:", v59);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "addObject:", v37);
                v12 = v68;
              }

            }
            v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
            v17 = v57;
            v10 = v58;
            if (v23)
              continue;
            break;
          }
        }

        v38 = v65;
        v39 = v65;
        v13 = v66;
LABEL_55:

      }
      else
      {
        v44 = (void *)MEMORY[0x242656984]();
        v45 = a1;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v75 = v47;
          v76 = 2112;
          v77 = v13;
          _os_log_impl(&dword_23E95B000, v46, OS_LOG_TYPE_ERROR, "%{public}@Array missing from array type %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
        v39 = 0;
        v11 = v67;
      }

    }
    else if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x24BDDB4D0]) & 1) != 0)
    {
      v39 = 0;
    }
    else if (objc_msgSend(v17, "isEqual:", *MEMORY[0x24BDDB4F8]))
    {
      v40 = (void *)MEMORY[0x242656984]();
      v41 = a1;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v43;
        v76 = 2112;
        v77 = v13;
        _os_log_impl(&dword_23E95B000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unexpected structure type value %@", buf, 0x16u);

        v12 = v68;
      }

      objc_autoreleasePoolPop(v40);
      v39 = 0;
      v11 = v67;
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

+ (unsigned)randomCASEAuthenticatedTagIdentifier
{
  return arc4random_uniform(0xFFFFu);
}

+ (id)caseAuthenticatedTagWithIdentifier:(unsigned __int16)a3 version:(unsigned __int16)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4 | ((unint64_t)a3 << 16));
}

+ (void)parseCaseAuthenticatedTag:(id)a3 identifier:(unsigned __int16 *)a4 version:(unsigned __int16 *)a5
{
  id v7;

  v7 = a3;
  *a4 = objc_msgSend(v7, "unsignedIntValue") >> 16;
  LOWORD(a4) = objc_msgSend(v7, "unsignedIntValue");

  *a5 = (unsigned __int16)a4;
}

+ (BOOL)isValidCATSubject:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "longLongValue");
  return (_WORD)v3 && (~v3 & 0xFFFFFFFD00000000) == 0;
}

+ (id)mtrPrivilegeAsString:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "integerValue") == 5)
  {
    v4 = CFSTR("Administrator");
  }
  else if (objc_msgSend(v3, "integerValue") == 3)
  {
    v4 = CFSTR("Operate");
  }
  else if (objc_msgSend(v3, "integerValue") == 4)
  {
    v4 = CFSTR("Manage");
  }
  else if (objc_msgSend(v3, "integerValue") == 1)
  {
    v4 = CFSTR("View");
  }
  else if (objc_msgSend(v3, "integerValue") == 2)
  {
    v4 = CFSTR("ProxyView");
  }
  else
  {
    v4 = CFSTR("Unknown");
  }

  return (id)v4;
}

+ (id)mtrAuthModeAsString:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "integerValue") == 1)
  {
    v4 = CFSTR("PASE");
  }
  else if (objc_msgSend(v3, "integerValue") == 2)
  {
    v4 = CFSTR("CASE");
  }
  else if (objc_msgSend(v3, "integerValue") == 3)
  {
    v4 = CFSTR("Group");
  }
  else
  {
    v4 = CFSTR("Unknown");
  }

  return (id)v4;
}

+ (void)printAccessControlList:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a3;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v37;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v3);
        v5 = (void *)MEMORY[0x242656984]();
        HMFGetOSLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "privilege");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMMTRUtilities mtrPrivilegeAsString:](HMMTRUtilities, "mtrPrivilegeAsString:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v7;
          v42 = 2112;
          v43 = v9;
          _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Privilege: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v5);
        v10 = (void *)MEMORY[0x242656984]();
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "authMode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMMTRUtilities mtrAuthModeAsString:](HMMTRUtilities, "mtrAuthModeAsString:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v12;
          v42 = 2112;
          v43 = v14;
          _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@AuthMode: %@", buf, 0x16u);

        }
        v31 = v3;

        objc_autoreleasePoolPop(v10);
        v15 = (void *)MEMORY[0x242656984]();
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v17;
          _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@    Subjects:", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v4, "subjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v33 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v24 = (void *)MEMORY[0x242656984]();
              HMFGetOSLogHandle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v23, "integerValue");
                *(_DWORD *)buf = 138543874;
                v41 = v26;
                v42 = 2112;
                v43 = v23;
                v44 = 1024;
                v45 = v27;
                _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@    %@ (0x%016X)", buf, 0x1Cu);

              }
              objc_autoreleasePoolPop(v24);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
          }
          while (v20);
        }

        v3 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v30);
  }

}

+ (id)sanitizeHAPName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1690];
  v4 = a3;
  objc_msgSend(v3, "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

  objc_msgSend(v5, "addCharactersInString:", CFSTR(".’',-&#"));
  objc_msgSend(v5, "invertedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsJoinedByString:", &stru_250F24B08);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)dateToMatterEpoch:(id)a3
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:", v4 + -946684800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  if (v6 < 1)
  {
    v7 = &unk_250F3FBB8;
  }
  else if ((unint64_t)v6 <= 0xFFFFFFFE)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_250F3FBD0;
  }
  return v7;
}

+ (id)matterEpochToDate:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "longLongValue") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "longLongValue") < 0xFFFFFFFFLL)
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v3, "longLongValue") + 946684800));
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
