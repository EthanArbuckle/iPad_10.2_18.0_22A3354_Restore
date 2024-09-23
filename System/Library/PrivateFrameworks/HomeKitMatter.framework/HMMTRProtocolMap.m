@implementation HMMTRProtocolMap

- (HMMTRProtocolMap)init
{
  HMMTRProtocolMap *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *rawPlist;
  uint64_t v7;
  NSNumber *version;
  uint64_t v9;
  NSNumber *schemaVersion;
  uint64_t v11;
  NSDictionary *hapToCHIPClusterMappingArray;
  id createClusterInstance;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMMTRProtocolMap;
  v2 = -[HMMTRProtocolMap init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("chipplugin-protocol-map"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    rawPlist = v2->_rawPlist;
    v2->_rawPlist = (NSDictionary *)v5;

    -[NSDictionary objectForKeyedSubscript:](v2->_rawPlist, "objectForKeyedSubscript:", CFSTR("Version"));
    v7 = objc_claimAutoreleasedReturnValue();
    version = v2->_version;
    v2->_version = (NSNumber *)v7;

    -[NSDictionary objectForKeyedSubscript:](v2->_rawPlist, "objectForKeyedSubscript:", CFSTR("SchemaVersion"));
    v9 = objc_claimAutoreleasedReturnValue();
    schemaVersion = v2->_schemaVersion;
    v2->_schemaVersion = (NSNumber *)v9;

    -[HMMTRProtocolMap retrieveHAPToCHIPClusterMapping](v2, "retrieveHAPToCHIPClusterMapping");
    v11 = objc_claimAutoreleasedReturnValue();
    hapToCHIPClusterMappingArray = v2->_hapToCHIPClusterMappingArray;
    v2->_hapToCHIPClusterMappingArray = (NSDictionary *)v11;

    createClusterInstance = v2->_createClusterInstance;
    v2->_createClusterInstance = &__block_literal_global_123;

  }
  return v2;
}

- (id)retrieveHAPToCHIPClusterMapping
{
  void *v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  HMMTRProtocolMap *v15;
  NSObject *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("HAPCharacteristics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = v3;
    v4 = v3;
    v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v4);
          v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v4, "objectForKeyedSubscript:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v24 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("CHIPClusterIDHex"), v19);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (v13)
                  objc_msgSend(v7, "addObject:", v13);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v10);
          }
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v7, v6, v19);

        }
        v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v22);
    }

    v3 = v19;
  }
  else
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v17;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPCharacteristic dictionary from HomeKitMatter's ProtocolMap.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v21 = 0;
  }

  return v21;
}

- (id)descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 endpointID:(unint64_t)a5 clusterIDCharacteristicMap:(id)a6
{
  return -[HMMTRProtocolMap descriptionForCharacteristicUUID:operation:value:endpointID:clusterIDCharacteristicMap:](self, "descriptionForCharacteristicUUID:operation:value:endpointID:clusterIDCharacteristicMap:", a3, a4, 0, a5, a6);
}

- (id)_chipParamsDictionaryForOperationType:(unint64_t)a3 operationDictionary:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  if (a3 == 1)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("BOOL")))
    {
      if (objc_msgSend(v8, "BOOLValue"))
        v10 = CFSTR("1");
      else
        v10 = CFSTR("0");
      objc_msgSend(v7, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Params"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Params"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_mtrClusterReadFunctionNameFromBaseClusterFunctionName:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  void *v10;
  HMMTRProtocolMap *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("WithCompletionHandler:")))
  {
    v5 = objc_msgSend(v4, "length");
    v6 = CFSTR("WithCompletionHandler:");
LABEL_5:
    objc_msgSend(v4, "substringToIndex:", v5 - -[__CFString length](v6, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("WithParams:"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("WithCompletion:")))
  {
    v5 = objc_msgSend(v4, "length");
    v6 = CFSTR("WithCompletion:");
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("WithParams:")))
  {
    v8 = v4;
  }
  else
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot derive MTRCluster function name from a bad MTRBaseCluster function name: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v8 = 0;
  }
LABEL_6:

  return v8;
}

- (id)_mtrClusterWriteFunctionNameFromBaseClusterFunctionName:(id)a3
{
  id v4;
  int v5;
  void *v6;
  const __CFString *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  HMMTRProtocolMap *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("WithCompletionHandler:")))
  {
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("writeAttribute"));
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - objc_msgSend(CFSTR("WithCompletionHandler:"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v7 = CFSTR("WithExpectedValueInterval:");
    else
      v7 = CFSTR("WithExpectedValues:expectedValueInterval:completionHandler:");
LABEL_12:
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_16;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(":completionHandler:")))
  {
    v8 = objc_msgSend(v4, "hasPrefix:", CFSTR("writeAttribute"));
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - objc_msgSend(CFSTR(":completionHandler:"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v7 = CFSTR(":expectedValues:expectedValueInterval:completionHandler:");
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(":completion:")))
  {
    v9 = objc_msgSend(v4, "hasPrefix:", CFSTR("writeAttribute"));
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - objc_msgSend(CFSTR(":completion:"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v7 = CFSTR(":expectedValues:expectedValueInterval:completion:");
      goto LABEL_12;
    }
LABEL_10:
    v7 = CFSTR(":expectedValueInterval:");
    goto LABEL_12;
  }
LABEL_13:
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot derive MTRCluster function name from a bad MTRBaseCluster function name: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v10 = 0;
LABEL_16:

  return v10;
}

- (id)_chipClusterFunctionNameForOperationType:(unint64_t)a3 operationDictionary:(id)a4 value:(id)a5 forMTRCluster:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  if (a3 == 1)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("BOOL")))
    {
      if (objc_msgSend(v11, "BOOLValue"))
        v13 = CFSTR("1");
      else
        v13 = CFSTR("0");
      objc_msgSend(v10, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Selector"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Selector"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
LABEL_16:

        v12 = v15;
        goto LABEL_17;
      }
    }
    -[HMMTRProtocolMap _mtrClusterWriteFunctionNameFromBaseClusterFunctionName:](self, "_mtrClusterWriteFunctionNameFromBaseClusterFunctionName:", v15);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
    goto LABEL_16;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Selector"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v6)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      -[HMMTRProtocolMap _mtrClusterReadFunctionNameFromBaseClusterFunctionName:](self, "_mtrClusterReadFunctionNameFromBaseClusterFunctionName:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v15 = (void *)v17;
      goto LABEL_16;
    }
  }
  else if (a3 == 4)
  {
    objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("WithCompletionHandler:"), CFSTR("WithAttributeCache:endpoint:queue:completionHandler:"));
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_17:

  return v12;
}

- (id)_protocolMapCharacteristicsKeyForOperationType:(unint64_t)a3
{
  void *v6;
  HMMTRProtocolMap *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3 < 5)
    return off_250F238F8[a3];
  v6 = (void *)MEMORY[0x242656984](self, a2);
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unsupported Operation type %lu", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  return 0;
}

- (id)reportDescriptionForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  HMMTRReportDescription *v22;
  void *v23;
  HMMTRReportDescription *v24;
  void *v25;
  HMMTRProtocolMap *v26;
  void *v27;
  void *v28;
  void *v29;
  HMMTRProtocolMap *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMMTRProtocolMap *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMMTRProtocolMap *v38;
  NSObject *v39;
  void *v40;
  HMMTRProtocolMap *v41;
  NSObject *v42;
  void *v43;
  HMMTRProtocolMap *v44;
  NSObject *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *context;
  void *contexta;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v57 = 0;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "scanHexInt:", &v57) & 1) != 0)
    {
      objc_msgSend(v8, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:", v16, objc_msgSend(v9, "unsignedIntegerValue"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ConfigureReport"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v51 = v15;
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CHIPAttributes"));
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CHIPEvents"));
          v20 = objc_claimAutoreleasedReturnValue();
          context = (void *)v19;
          if (v19 | v20)
          {
            objc_msgSend(v8, "type");
            v54 = v18;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRProtocolMap _buildValueMapper:characteristicsDict:operation:forMTRCluster:](self, "_buildValueMapper:characteristicsDict:operation:forMTRCluster:", v21, v17, 2, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            -[HMMTRProtocolMap _buildEventMapper:characteristicsDict:](self, "_buildEventMapper:characteristicsDict:", v8, v17);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = [HMMTRReportDescription alloc];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v57);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[HMMTRReportDescription initWithClusterId:attributeIds:eventIds:](v22, "initWithClusterId:attributeIds:eventIds:", v23, context, v20);

            -[HMMTRReportDescription setMapValue:](v24, "setMapValue:", v49);
            -[HMMTRReportDescription setMapEvent:](v24, "setMapEvent:", v48);
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CHIPCluster"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRReportDescription setClusterClass:](v24, "setClusterClass:", v25);

            v26 = self;
            v27 = context;
            -[HMMTRProtocolMap _chipClusterFunctionNameForOperationType:operationDictionary:value:forMTRCluster:](v26, "_chipClusterFunctionNameForOperationType:operationDictionary:value:forMTRCluster:", 2, v54, 0, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRReportDescription setClusterSelector:](v24, "setClusterSelector:", v28);

            v18 = v54;
          }
          else
          {
            v50 = (void *)MEMORY[0x242656984]();
            v44 = self;
            HMFGetOSLogHandle();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v56 = v18;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v59 = v46;
              v60 = 2112;
              v61 = v8;
              _os_log_impl(&dword_23E95B000, v45, OS_LOG_TYPE_DEBUG, "%{public}@Neither attributes array nor events array. Cannot handle reports for characteristic: %@", buf, 0x16u);

              v18 = v56;
            }

            objc_autoreleasePoolPop(v50);
            v24 = 0;
            v27 = context;
          }

          v15 = v51;
        }
        else
        {
          contexta = (void *)MEMORY[0x242656984]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v59 = v43;
            v60 = 2112;
            v61 = v8;
            _os_log_impl(&dword_23E95B000, v42, OS_LOG_TYPE_DEBUG, "%{public}@No subscription Dict. Cannot handle reports for characteristic: %@", buf, 0x16u);

            v18 = 0;
          }

          objc_autoreleasePoolPop(contexta);
          v24 = 0;
        }

      }
      else
      {
        v37 = (void *)MEMORY[0x242656984]();
        v38 = self;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v55 = v37;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v40;
          v60 = 2112;
          v61 = v8;
          _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_DEBUG, "%{public}@No characteristic Dict. Cannot handle reports for characteristic: %@", buf, 0x16u);

          v37 = v55;
        }

        objc_autoreleasePoolPop(v37);
        v24 = 0;
      }

    }
    else
    {
      v33 = (void *)MEMORY[0x242656984]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v36;
        v60 = 2112;
        v61 = v8;
        _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Unknown ClusterId. Cannot handle reports for characteristic: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      v24 = 0;
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x242656984]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v32;
      v60 = 2112;
      v61 = v8;
      _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Cannot handle reports for characteristic: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v24 = 0;
  }

  return v24;
}

- (id)_characteristicDescriptionForCharacteristicWithUUID:(id)a3 characteristicsDict:(id)a4 chipClusterName:(id)a5 operationType:(unint64_t)a6 value:(id)a7 forMTRCluster:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HMMTRClusterDescription *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMMTRProtocolMap *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMMTRProtocolMap *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD);
  uint64_t v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *context;
  NSObject *log;
  HMMTRProtocolMap *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  unsigned int v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v8 = a8;
  v72 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  -[HMMTRProtocolMap _protocolMapCharacteristicsKeyForOperationType:](self, "_protocolMapCharacteristicsKeyForOperationType:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v16;
  if (v18)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v63 = v14;
      -[HMMTRProtocolMap _chipClusterFunctionNameForOperationType:operationDictionary:value:forMTRCluster:](self, "_chipClusterFunctionNameForOperationType:operationDictionary:value:forMTRCluster:", a6, v19, v17, v8);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMMTRClusterDescription initWithClass:selectorString:]([HMMTRClusterDescription alloc], "initWithClass:selectorString:", v16, v62);
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ConfigureReport"));
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v23 = objc_msgSend(v64, "hasPrefix:", CFSTR("HMMTR"));

        if ((v23 & 1) == 0)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CHIPAttributes"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count") == 1)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CHIPClusterIDHex"));
            v65 = 0;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v25, "scanHexInt:", &v65) & 1) != 0)
            {
              objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
              v59 = v25;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMTRClusterDescription setAttributeID:](v20, "setAttributeID:", v26);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v65);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMTRClusterDescription setClusterID:](v20, "setClusterID:", v27);

              v25 = v59;
            }
            else
            {
              context = (void *)MEMORY[0x242656984]();
              v58 = self;
              HMFGetOSLogHandle();
              log = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v60 = v25;
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v67 = v37;
                v68 = 2112;
                v69 = v61;
                v70 = 2112;
                v71 = v63;
                _os_log_impl(&dword_23E95B000, log, OS_LOG_TYPE_ERROR, "%{public}@Bad clusterId: %@ defined in protocol map for characteristic %@", buf, 0x20u);

                v25 = v60;
              }

              objc_autoreleasePoolPop(context);
            }

          }
        }
      }
      if (v8)
      {
        if (objc_msgSend(v62, "hasPrefix:", CFSTR("writeAttribute")))
          -[HMMTRClusterDescription setSyncWriteFunc:](v20, "setSyncWriteFunc:", 1);
        v39 = a6 != 2 || v62 == 0;
        -[HMMTRProtocolMap _buildValueMapper:characteristicsDict:operation:forMTRCluster:](self, "_buildValueMapper:characteristicsDict:operation:forMTRCluster:", v63, v15, a6, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRClusterDescription setMapValue:](v20, "setMapValue:", v40);

        -[HMMTRClusterDescription mapValue](v20, "mapValue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRProtocolMap _buildExpectedValueMapper:characteristicsDict:operation:valueMapper:](self, "_buildExpectedValueMapper:characteristicsDict:operation:valueMapper:", v63, v15, a6, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRClusterDescription setMapWriteValueToExpectedValues:](v20, "setMapWriteValueToExpectedValues:", v42);

      }
      else
      {
        -[HMMTRProtocolMap _buildValueMapper:characteristicsDict:operation:forMTRCluster:](self, "_buildValueMapper:characteristicsDict:operation:forMTRCluster:", v63, v15, a6, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRClusterDescription setMapValue:](v20, "setMapValue:", v41);
      }

      -[HMMTRProtocolMap _chipParamsDictionaryForOperationType:operationDictionary:value:](self, "_chipParamsDictionaryForOperationType:operationDictionary:value:", a6, v19, v17);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v44 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("DefaultArgs"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v44, "initWithDictionary:", v45);

        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PrimaryArgSelector"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          -[HMMTRClusterDescription mapValue](v20, "mapValue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            -[HMMTRClusterDescription mapValue](v20, "mapValue");
            v49 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id))v49)[2](v49, v17);
            v50 = objc_claimAutoreleasedReturnValue();

            v17 = (id)v50;
          }
          objc_msgSend(v46, "setObject:forKey:", v17, v47);
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ParamsClass"));
        v51 = (NSString *)objc_claimAutoreleasedReturnValue();
        -[HMMTRClusterDescription setParamsClass:](v20, "setParamsClass:", NSClassFromString(v51));

        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ParamsIndex"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRClusterDescription setParamsIndex:](v20, "setParamsIndex:", v52);

        -[HMMTRClusterDescription setParamsArguments:](v20, "setParamsArguments:", v46);
      }
      else
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("DefaultArgs"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRClusterDescription setArguments:](v20, "setArguments:", v53);

        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ArgIndex"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRClusterDescription setPrimaryArgIndex:](v20, "setPrimaryArgIndex:", v46);
      }

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Type"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRClusterDescription setPrimaryArgType:](v20, "setPrimaryArgType:", v54);

      v14 = v63;
    }
    else
    {
      v33 = (void *)MEMORY[0x242656984]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v36;
        v68 = 2112;
        v69 = v14;
        _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_INFO, "%{public}@No Information for Characteristic %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      v20 = 0;
    }

  }
  else
  {
    v28 = (void *)MEMORY[0x242656984]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v67 = v31;
      v68 = 2112;
      v69 = v14;
      v70 = 2112;
      v71 = v32;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@No dictionary key for Characteristic %@ for operation type %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    v20 = 0;
  }

  return v20;
}

- (id)_characteristicsDictionaryForCharacteristicUUID:(id)a3 endpointID:(unint64_t)a4 clusterIDCharacteristicMap:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRProtocolMap *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:", v10, a4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = 0;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristicUUID. Does not convert to a short integer. UUID:%@ shortened: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)_characteristicsDictionaryForCharacteristic:(id)a3 endpointID:(unint64_t)a4 clusterIDCharacteristicMap:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HMMTRProtocolMap *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  HMMTRProtocolMap *v29;
  NSObject *v30;
  void *v31;
  unint64_t v33;
  HMMTRProtocolMap *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("HAPCharacteristics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v8;
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v33 = a4;
    v34 = self;
    v36 = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v9;
    objc_msgSend(v9, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v35 = v11;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CHIPClusterIDHex"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v38);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqualToString:", v21);

          if ((v22 & 1) != 0)
          {
            v27 = v19;

            goto LABEL_14;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v16)
          continue;
        break;
      }
    }

    v23 = (void *)MEMORY[0x242656984]();
    v24 = v34;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v26;
      v46 = 2112;
      v47 = v38;
      v48 = 2048;
      v49 = v33;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported for endpoint %lu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    v27 = 0;
LABEL_14:
    v10 = v36;
    v9 = v37;
    v11 = v35;

  }
  else
  {
    v28 = (void *)MEMORY[0x242656984]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v31;
      v46 = 2112;
      v47 = v38;
      v48 = 2048;
      v49 = a4;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported for endpoint %lu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    v27 = 0;
  }

  return v27;
}

- (id)mtrClusterNameFromMTRBaseClusterName:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  id v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("MTRBaseCluster")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("MTRBaseCluster"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("MTRCluster");
LABEL_5:
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("HMMTR")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("HMMTR"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("HMMTRSyncCluster");
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("MTRCluster")))
    v6 = v3;
  else
    v6 = 0;
LABEL_6:

  return v6;
}

- (id)mtrBaseClusterNameFromMTRClusterName:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("MTRCluster")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("MTRCluster"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("MTRBaseCluster");
  }
  else
  {
    if (!objc_msgSend(v3, "hasPrefix:", CFSTR("HMMTRSyncCluster")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("HMMTRSyncCluster"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("HMMTR");
  }
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- (id)_descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 forMTRCluster:(BOOL)a6 endpointID:(unint64_t)a7 clusterIDCharacteristicMap:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  void *v27;
  void *context;
  HMMTRProtocolMap *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v10 = a6;
  v34 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a8;
  -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:", v14, a7, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CHIPCluster"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a4 == 3)
    {

      v20 = CFSTR("CHIPBinding");
    }
    else if (v10)
    {
      -[HMMTRProtocolMap mtrClusterNameFromMTRBaseClusterName:](self, "mtrClusterNameFromMTRBaseClusterName:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;

        v20 = v24;
      }
      else
      {
        context = (void *)MEMORY[0x242656984]();
        v29 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v27;
          v32 = 2112;
          v33 = v20;
          _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Sync variation of base cluster class %@ is unknown", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
      }

    }
    -[HMMTRProtocolMap _characteristicDescriptionForCharacteristicWithUUID:characteristicsDict:chipClusterName:operationType:value:forMTRCluster:](self, "_characteristicDescriptionForCharacteristicWithUUID:characteristicsDict:chipClusterName:operationType:value:forMTRCluster:", v14, v18, v20, a4, v15, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 endpointID:(unint64_t)a6 clusterIDCharacteristicMap:(id)a7
{
  return -[HMMTRProtocolMap _descriptionForCharacteristicUUID:operation:value:forMTRCluster:endpointID:clusterIDCharacteristicMap:](self, "_descriptionForCharacteristicUUID:operation:value:forMTRCluster:endpointID:clusterIDCharacteristicMap:", a3, a4, a5, 0, a6, a7);
}

- (id)descriptionOfMTRClusterForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 endpointID:(unint64_t)a6 clusterIDCharacteristicMap:(id)a7
{
  return -[HMMTRProtocolMap _descriptionForCharacteristicUUID:operation:value:forMTRCluster:endpointID:clusterIDCharacteristicMap:](self, "_descriptionForCharacteristicUUID:operation:value:forMTRCluster:endpointID:clusterIDCharacteristicMap:", a3, a4, a5, 1, a6, a7);
}

- (BOOL)_isValidCharacteristicValue:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRProtocolMap *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRProtocolMap *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Validating value for characteristics %@ %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "validateValue:outValue:", v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate value for characteristics %@ with error %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }

  return v12 == 0;
}

- (id)getUpdatedLinkedCharacteristics:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMMTRProtocolMap *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMMTRProtocolMap *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  HMMTRProtocolMap *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  HMMTRProtocolMap *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:", v11, objc_msgSend(v9, "unsignedIntegerValue"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LinkedCharacteristics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v45 = v12;
      v46 = v10;
      v47 = v9;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v44 = v13;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v52;
        v49 = self;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v52 != v16)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v8, "service", v44, v45, v46, v47);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "characteristicsOfType:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "firstObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v21, "copy");

            if (v22)
            {
              v23 = (void *)MEMORY[0x242656984]();
              v24 = self;
              HMFGetOSLogHandle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v56 = v26;
                v57 = 2112;
                v58 = v22;
                _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Found a linkedCharacteristic %@, checking if it needs to be updated", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v23);
              objc_msgSend(v22, "value");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "value");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27 != v28)
              {
                v29 = (void *)MEMORY[0x242656984]();
                v30 = v24;
                HMFGetOSLogHandle();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "value");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v56 = v32;
                  v57 = 2112;
                  v58 = v33;
                  v59 = 2112;
                  v60 = v22;
                  _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Linked Characteristic value differs, forcing an update to %@ for characteristic %@", buf, 0x20u);

                  self = v49;
                }

                objc_autoreleasePoolPop(v29);
                objc_msgSend(v8, "value");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = -[HMMTRProtocolMap _isValidCharacteristicValue:value:](v30, "_isValidCharacteristicValue:value:", v22, v34);

                if (v35)
                {
                  v36 = (void *)MEMORY[0x242656984]();
                  v37 = v30;
                  HMFGetOSLogHandle();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "value");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v56 = v39;
                    v57 = 2112;
                    v58 = v40;
                    _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@Update linked characteristics since value is valid %@", buf, 0x16u);

                    self = v49;
                  }

                  objc_autoreleasePoolPop(v36);
                  objc_msgSend(v8, "value");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setValue:", v41);

                  objc_msgSend(v8, "service");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setService:", v42);

                  objc_msgSend(v48, "addObject:", v22);
                }
              }
            }

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v15);
      }

      v10 = v46;
      v9 = v47;
      v13 = v44;
      v12 = v45;
    }

  }
  return v48;
}

- (id)_buildValueMapper:(id)a3 characteristicsDict:(id)a4 operation:(unint64_t)a5 forMTRCluster:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMMTRProtocolMap *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  HMMTRProtocolMap *v43;
  unint64_t v44;
  BOOL v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v6 = a6;
  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HAPRange"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CHIPRange"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x242656984]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v18;
        v48 = 2112;
        v49 = v10;
        _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Setting up Linear mappings for Characteristic %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HAPRange"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CHIPRange"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke;
      v39[3] = &unk_250F23738;
      v44 = a5;
      v45 = v6;
      v40 = v10;
      v41 = v20;
      v42 = v19;
      v43 = v16;
      v21 = v19;
      v22 = v20;
      v23 = (void *)MEMORY[0x242656B10](v39);
      v24 = (void *)MEMORY[0x242656B10]();

      v25 = v40;
      goto LABEL_8;
    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SpecialMappingRequired"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HAPRange"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CHIPRange"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_172;
    v33[3] = &unk_250F23760;
    v37 = a5;
    v38 = v6;
    v34 = v10;
    v35 = v28;
    v36 = v27;
    v21 = v27;
    v22 = v28;
    v29 = (void *)MEMORY[0x242656B10](v33);
    v24 = (void *)MEMORY[0x242656B10]();

    v25 = v34;
LABEL_8:

    goto LABEL_9;
  }
  if (!v6)
    goto LABEL_15;
  switch(a5)
  {
    case 4uLL:
      goto LABEL_14;
    case 2uLL:
      v24 = &__block_literal_global_173_8774;
      break;
    case 0uLL:
LABEL_14:
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_2;
      v31[3] = &unk_250F24020;
      v32 = v10;
      v24 = (void *)MEMORY[0x242656B10](v31);

      break;
    default:
LABEL_15:
      v24 = 0;
      break;
  }
LABEL_9:

  return v24;
}

- (id)_buildExpectedValueMapper:(id)a3 characteristicsDict:(id)a4 operation:(unint64_t)a5 valueMapper:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v8 = a4;
  v9 = a6;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Read"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Write"));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Type"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqual:", CFSTR("String")) & 1) != 0)
  {
    v13 = (id *)MEMORY[0x24BDDB508];
  }
  else if ((objc_msgSend(v12, "isEqual:", CFSTR("BOOL")) & 1) != 0)
  {
    v13 = (id *)MEMORY[0x24BDDB468];
  }
  else if ((objc_msgSend(v12, "isEqual:", CFSTR("UINT8")) & 1) != 0
         || (objc_msgSend(v12, "isEqual:", CFSTR("UINT16")) & 1) != 0)
  {
    v13 = (id *)MEMORY[0x24BDDB510];
  }
  else
  {
    if ((objc_msgSend(v12, "isEqual:", CFSTR("INT8")) & 1) == 0
      && !objc_msgSend(v12, "isEqual:", CFSTR("INT16")))
    {
      v23 = 0;
      goto LABEL_16;
    }
    v13 = (id *)MEMORY[0x24BDDB4F0];
  }
  v14 = *v13;

  v15 = (void *)MEMORY[0x24BDD17A8];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CHIPClusterIDHex"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scannerWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  objc_msgSend(v17, "scanHexLongLong:", &v30);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CHIPAttributes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  if (objc_msgSend(v19, "count") == 1)
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __88__HMMTRProtocolMap__buildExpectedValueMapper_characteristicsDict_operation_valueMapper___block_invoke;
  v25[3] = &unk_250F237C8;
  v29 = v9;
  v12 = v14;
  v26 = v12;
  v27 = v20;
  v28 = v18;
  v21 = v18;
  v22 = v20;
  v23 = (void *)MEMORY[0x242656B10](v25);

LABEL_16:
  return v23;
}

- (id)_buildEventMapper:(id)a3 characteristicsDict:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRProtocolMap *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  HMMTRProtocolMap *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HAPRange"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CHIPRange"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v15;
        v33 = 2112;
        v34 = v8;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Setting up Linear mappings for Characteristic %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HAPRange"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CHIPRange"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke;
      v26[3] = &unk_250F237F0;
      v27 = v8;
      v28 = v17;
      v29 = v16;
      v30 = v13;
      v18 = v16;
      v19 = v17;
      v20 = (void *)MEMORY[0x242656B10](v26);
      v21 = (void *)MEMORY[0x242656B10]();

      goto LABEL_8;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SpecialMappingRequired"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke_188;
    v24[3] = &unk_250F23818;
    v25 = v6;
    v22 = (void *)MEMORY[0x242656B10](v24);
    v21 = (void *)MEMORY[0x242656B10]();

    v19 = v25;
LABEL_8:

  }
  return v21;
}

- (id)requiredCharacteristicsForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMMTRProtocolMap *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMMTRProtocolMap *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("HAPServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequiredHAPCharacteristics"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPService dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v9 = 0;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPServices dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (id)optionalCharacteristicsForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMMTRProtocolMap *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMMTRProtocolMap *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("HAPServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OptionalHAPCharacteristics"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPService dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v9 = 0;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPServices dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (BOOL)optionalServiceLabelIndexIncludedInService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  HMMTRProtocolMap *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMMTRProtocolMap *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("HAPServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OptionalServiceLabelIndex"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
        v12 = objc_msgSend(v11, "BOOLValue");
      else
        v12 = 0;

    }
    else
    {
      v17 = (void *)MEMORY[0x242656984]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPService dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v12 = 0;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPServices dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)categoriesForDeviceTypes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMMTRProtocolMap *v17;
  NSObject *v18;
  HMMTRProtocolMap *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMMTRProtocolMap *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  id obj;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("CHIPDeviceTypes"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v31 = v4;
    obj = v4;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v35)
    {
      v33 = *(_QWORD *)v44;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(obj);
          v36 = v6;
          v37 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v6);
          objc_msgSend(v37, "stringValue", v31);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v38 = v8;
          v9 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v40 != v11)
                  objc_enumerationMutation(v38);
                objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("HAPCategory"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = v13;
                if (v13)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v13, "integerValue"));
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v15);

                }
                else
                {
                  v16 = (void *)MEMORY[0x242656984]();
                  v17 = self;
                  HMFGetOSLogHandle();
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v19 = self;
                    v20 = v5;
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v48 = v21;
                    v49 = 2112;
                    v50 = v37;
                    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find HAP category for deviceType %@", buf, 0x16u);

                    v5 = v20;
                    self = v19;
                  }

                  objc_autoreleasePoolPop(v16);
                }

              }
              v10 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
            }
            while (v10);
          }

          v6 = v36 + 1;
        }
        while (v36 + 1 != v35);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v35);
    }

    v22 = objc_msgSend(v5, "count");
    v23 = (void *)MEMORY[0x242656984]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v27;
        v49 = 2112;
        v50 = obj;
        v51 = 2112;
        v52 = v5;
        _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_DEBUG, "%{public}@The categories for the device types %@ : %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      v28 = v5;
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v29;
        v49 = 2112;
        v50 = obj;
        _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_ERROR, "%{public}@No valid HAP categories were found for the device types %@. Returning \"Other\" category.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v28 = &unk_250F406C8;
    }

    v4 = v31;
  }
  else
  {
    v28 = &unk_250F406B0;
  }

  return v28;
}

- (void)_selectedServiceTypeForServiceArray:(id)a3 device:(id)a4 mtrDevice:(id)a5 endpoint:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  BOOL v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  HMMTRProtocolMap *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMMTRProtocolMap *v39;
  NSObject *v40;
  void *v41;
  HMMTRProtocolMap *v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  HMMTRProtocolMap *v49;
  void *context;
  NSObject *group;
  id v52;
  void *v53;
  id v54;
  id v55;
  NSObject *queue;
  id v57;
  id obj;
  uint64_t v60;
  uint64_t v61;
  _QWORD block[4];
  id v63;
  id v64;
  HMMTRProtocolMap *v65;
  id v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD v70[5];
  NSString *v71;
  NSObject *v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  id v80;
  _QWORD v81[5];
  id v82;
  _QWORD v83[5];
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  id v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v57 = a4;
  v54 = a5;
  v55 = a6;
  queue = a7;
  v48 = a8;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x3032000000;
  v83[3] = __Block_byref_object_copy__8691;
  v83[4] = __Block_byref_object_dispose__8692;
  v84 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__8691;
  v81[4] = __Block_byref_object_dispose__8692;
  v82 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__8691;
  v79[4] = __Block_byref_object_dispose__8692;
  v80 = 0;
  v52 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  group = dispatch_group_create();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v14)
  {
    v60 = *(_QWORD *)v76;
    do
    {
      v61 = v14;
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v76 != v60)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SelectionCriteria"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("RequiredFeaturesBitmap"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CHIPCluster"));
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
            v22 = v20 == 0;
          else
            v22 = 1;
          if (!v22)
          {
            if (v57)
            {
              v23 = (id)objc_msgSend(objc_alloc(NSClassFromString(v20)), "initWithDevice:endpoint:queue:", v57, (unsigned __int16)objc_msgSend(v55, "unsignedIntegerValue"), queue);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                dispatch_group_enter(group);
                v70[0] = MEMORY[0x24BDAC760];
                v70[1] = 3221225472;
                v70[2] = __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke;
                v70[3] = &unk_250F23840;
                v70[4] = self;
                v71 = v21;
                v72 = group;
                v73 = v52;
                v74 = v16;
                objc_msgSend(v23, "readAttributeFeatureMapWithCompletionHandler:", v70);

              }
              else
              {
                v34 = (void *)MEMORY[0x242656984]();
                v35 = self;
                HMFGetOSLogHandle();
                v36 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v86 = v37;
                  v87 = 2112;
                  v88 = v23;
                  _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@Feature map selector not found for cluster: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v34);
              }
            }
            else
            {
              if (!v54)
              {
                _HMFPreconditionFailure();
                __break(1u);
              }
              -[HMMTRProtocolMap mtrClusterNameFromMTRBaseClusterName:](self, "mtrClusterNameFromMTRBaseClusterName:", v20);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = (void *)v24;
              if (v24)
                v26 = (void *)v24;
              else
                v26 = v21;
              v23 = v26;

              -[HMMTRProtocolMap createClusterInstance](self, "createClusterInstance");
              v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, id, id, id, NSObject *))v27)[2](v27, v23, v54, v55, queue);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v29 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
                objc_msgSend(v28, "readAttributeFeatureMapWithParams:", v29);
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v53, CFSTR("featureMap"));
                v30 = (id)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v31 = v30;
                else
                  v31 = 0;
                v32 = v31;

                if (v32)
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HAPServiceType"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setValue:forKey:", v32, v33);

                }
                else
                {
                  context = (void *)MEMORY[0x242656984]();
                  v42 = self;
                  HMFGetOSLogHandle();
                  v43 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    v49 = v42;
                    HMFGetLogIdentifier();
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v86 = v44;
                    v87 = 2112;
                    v88 = v23;
                    _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Cluster class %@ feature map is absent from cache", buf, 0x16u);

                    v42 = v49;
                  }

                  objc_autoreleasePoolPop(context);
                }

              }
              else
              {
                v38 = (void *)MEMORY[0x242656984]();
                v39 = self;
                HMFGetOSLogHandle();
                v40 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v86 = v41;
                  v87 = 2112;
                  v88 = v28;
                  _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_ERROR, "%{public}@Feature map selector not found for cluster: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v38);
              }

            }
          }

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    }
    while (v14);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke_263;
  block[3] = &unk_250F23868;
  v63 = obj;
  v64 = v52;
  v65 = self;
  v66 = v48;
  v67 = v83;
  v68 = v79;
  v69 = v81;
  v45 = v48;
  v46 = v52;
  v47 = obj;
  dispatch_group_notify(group, queue, block);

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);

  _Block_object_dispose(v83, 8);
}

- (void)servicesForDeviceTypes:(id)a3 device:(id)a4 endpoint:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id obj;
  id v23;
  id v24;
  NSObject *queue;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[6];
  NSObject *v32;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v24 = a4;
  v23 = a5;
  queue = a6;
  v21 = a7;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("CHIPDeviceTypes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__8691;
    v38[4] = __Block_byref_object_dispose__8692;
    v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = dispatch_group_create();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v20;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v16, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          dispatch_group_enter(v12);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke;
          v31[3] = &unk_250F23890;
          v33 = v38;
          v31[4] = self;
          v31[5] = v16;
          v32 = v12;
          -[HMMTRProtocolMap _selectedServiceTypeForServiceArray:device:mtrDevice:endpoint:callbackQueue:completionHandler:](self, "_selectedServiceTypeForServiceArray:device:mtrDevice:endpoint:callbackQueue:completionHandler:", v18, v24, 0, v23, queue, v31);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v13);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke_266;
    block[3] = &unk_250F238B8;
    v30 = v38;
    v29 = v21;
    block[4] = self;
    v28 = obj;
    dispatch_group_notify(v12, queue, block);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v21 + 2))(v21, 0, v19);

  }
}

- (void)servicesOfMTRDevice:(id)a3 forDeviceTypes:(id)a4 endpoint:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id obj;
  id v23;
  id v24;
  NSObject *queue;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[6];
  NSObject *v32;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v20 = a4;
  v23 = a5;
  queue = a6;
  v21 = a7;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("CHIPDeviceTypes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__8691;
    v38[4] = __Block_byref_object_dispose__8692;
    v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = dispatch_group_create();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v20;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v16, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          dispatch_group_enter(v12);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke;
          v31[3] = &unk_250F23890;
          v33 = v38;
          v31[4] = self;
          v31[5] = v16;
          v32 = v12;
          -[HMMTRProtocolMap _selectedServiceTypeForServiceArray:device:mtrDevice:endpoint:callbackQueue:completionHandler:](self, "_selectedServiceTypeForServiceArray:device:mtrDevice:endpoint:callbackQueue:completionHandler:", v18, 0, v24, v23, queue, v31);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v13);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke_267;
    block[3] = &unk_250F238B8;
    v30 = v38;
    v29 = v21;
    block[4] = self;
    v28 = obj;
    dispatch_group_notify(v12, queue, block);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v21 + 2))(v21, 0, v19);

  }
}

- (id)getCHIPAttributesForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMMTRProtocolMap *v16;
  NSObject *v17;
  void *v18;
  _OWORD v20[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_rawPlist, "objectForKeyedSubscript:", CFSTR("HAPCharacteristics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)))
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v6);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            memset(v20, 0, sizeof(v20));
            v13 = v12;
            if (objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v20, v25, 16))
            {
              objc_msgSend(**((id **)&v20[0] + 1), "objectForKeyedSubscript:", CFSTR("CHIPAttributes"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_17;
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  }
  else
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPCharacteristic dictionary from HomeKitMatter's ProtocolMap.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)getIDForCharacteristic:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HAPCharacteristic"));
}

- (id)getRequiredFeaturesBitmapForCharacteristic:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ConfigureCharacteristic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequiredFeaturesBitmap"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isRequiresOptionalMatterAttributeForCharacteristic:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ConfigureCharacteristic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequiresOptionalMatterAttribute"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getClusterClassForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMTRProtocolMap *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:", v8, objc_msgSend(v9, "unsignedIntegerValue"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CHIPCluster"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (id)getMTRClusterClassForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMMTRProtocolMap *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:", v8, objc_msgSend(v9, "unsignedIntegerValue"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CHIPCluster"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRProtocolMap mtrClusterNameFromMTRBaseClusterName:](self, "mtrClusterNameFromMTRBaseClusterName:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v13;
    v17 = v16;

  }
  else
  {
    v18 = (void *)MEMORY[0x242656984]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (void)updateMetadataForCharacteristic:(id)a3 metadata:(id)a4 endpointID:(id)a5 topology:(id)a6 clusterIDCharacteristicMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HMMTRProtocolMap *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMMTRProtocolMap *v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMMTRProtocolMap *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HMMTRProtocolMap *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  HMMTRProtocolMap *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  HMMTRProtocolMap *v91;
  NSObject *v92;
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
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  HMMTRProtocolMap *v158;
  NSObject *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  HMMTRProtocolMap *v190;
  NSObject *v191;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  HMMTRProtocolMap *v216;
  NSObject *v217;
  void *v218;
  void *v219;
  void *v220;
  id v221;
  void *v222;
  id v223;
  uint64_t v224;
  uint64_t v225;
  id v226;
  id v227;
  uint64_t v228;
  uint64_t i;
  void *v230;
  unint64_t v231;
  id v232;
  unint64_t v233;
  id v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  HMMTRProtocolMap *v240;
  NSObject *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *context;
  void *contexta;
  void *contextb;
  void *contextc;
  void *contextd;
  id v254;
  id v255;
  id v256;
  id v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  id v262;
  id v263;
  id v264;
  id v265;
  id v266;
  id v267;
  void *v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  uint8_t v273[128];
  uint8_t buf[4];
  void *v275;
  __int16 v276;
  id v277;
  __int16 v278;
  id v279;
  __int16 v280;
  void *v281;
  __int16 v282;
  void *v283;
  __int16 v284;
  void *v285;
  uint64_t v286;

  v286 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v267 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v268 = v12;
  +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v16)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v275 = v21;
      v276 = 2112;
      v277 = v267;
      v278 = 2112;
      v279 = v12;
      v280 = 2112;
      v281 = v13;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Update Metadata %@ for characteristic %@ on endpoint %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    -[HMMTRProtocolMap getClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:](v18, "getClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:", v16, v13, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = v13;
    objc_msgSend(v14, "getFeatureMapForClusterClassName:endpoint:", v22, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v22, "isEqualToString:", CFSTR("HMMTRWindowCovering")) & 1) != 0
       || (objc_msgSend(v22, "isEqualToString:", CFSTR("MTRBaseClusterWindowCovering")) & 1) != 0
       || objc_msgSend(v22, "isEqualToString:", CFSTR("MTRClusterWindowCovering")))
      && objc_msgSend(v12, "isEqualToString:", CFSTR("0000007C-0000-1000-8000-0026BB765291")))
    {
      if ((objc_msgSend(v23, "unsignedIntValue") & 4) == 0)
      {
        v24 = v23;
        v25 = v22;
        v26 = v16;
        objc_msgSend(v267, "constraints");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "maximumValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "constraints");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setStepValue:", v28);

        v30 = (void *)MEMORY[0x242656984]();
        v31 = v18;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v275 = v33;
          v34 = "%{public}@Accessory is not position aware, setting target position step size to maximum value.";
LABEL_21:
          _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_DEBUG, v34, buf, 0xCu);

          goto LABEL_22;
        }
        goto LABEL_22;
      }
      goto LABEL_58;
    }
    if (((objc_msgSend(v22, "isEqualToString:", CFSTR("HMMTRWindowCovering")) & 1) != 0
       || (objc_msgSend(v22, "isEqualToString:", CFSTR("MTRBaseClusterWindowCovering")) & 1) != 0
       || objc_msgSend(v22, "isEqualToString:", CFSTR("MTRClusterWindowCovering")))
      && objc_msgSend(v12, "isEqualToString:", CFSTR("000000C2-0000-1000-8000-0026BB765291")))
    {
      if ((objc_msgSend(v23, "unsignedIntValue") & 0x10) == 0)
      {
        v24 = v23;
        v25 = v22;
        v26 = v16;
        objc_msgSend(v267, "constraints");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "maximumValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "constraints");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setStepValue:", v37);

        v30 = (void *)MEMORY[0x242656984]();
        v31 = v18;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v275 = v33;
          v34 = "%{public}@Accessory is not position aware, setting target tilt step size to maximum value.";
          goto LABEL_21;
        }
LABEL_22:

        objc_autoreleasePoolPop(v30);
        v16 = v26;
        v22 = v25;
        v23 = v24;
      }
LABEL_58:

      v13 = v266;
      goto LABEL_59;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("00000073-0000-1000-8000-0026BB765291")))
    {
      v262 = v15;
      -[HMMTRProtocolMap getClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:](v18, "getClusterClassForCharacteristic:endpointID:clusterIDCharacteristicMap:", v16, v266, v15);
      context = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getFeatureMapForClusterClassName:endpoint:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if ((v40 & 2) != 0)
      {
        v43 = &unk_250F40068;
        v41 = (void *)objc_msgSend(v41, "addObject:", &unk_250F40068);
      }
      else
      {
        v43 = 0;
      }
      v71 = v43;
      if ((~v40 & 0x16) == 0)
      {
        v71 = &unk_250F40080;
        v41 = (void *)objc_msgSend(v42, "addObject:", &unk_250F40080);
      }
      v259 = v16;
      if ((~v40 & 0xELL) == 0)
      {
        v71 = &unk_250F40098;
        v41 = (void *)objc_msgSend(v42, "addObject:", &unk_250F40098);
      }
      v72 = (void *)MEMORY[0x242656984](v41);
      v73 = v18;
      HMFGetOSLogHandle();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v255 = v14;
        v75 = v39;
        v76 = v23;
        v77 = v22;
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v275 = v78;
        v276 = 2112;
        v277 = v42;
        _os_log_impl(&dword_23E95B000, v74, OS_LOG_TYPE_DEBUG, "%{public}@Constraining input-event characteristic valid values to %@", buf, 0x16u);

        v22 = v77;
        v23 = v76;
        v39 = v75;
        v14 = v255;
      }

      objc_autoreleasePoolPop(v72);
      objc_msgSend(v267, "constraints");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v79)
      {
        v80 = objc_alloc_init(MEMORY[0x24BE1BB28]);
        objc_msgSend(v267, "setConstraints:", v80);

      }
      objc_msgSend(v267, "constraints");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setMinimumValue:", v43);

      objc_msgSend(v267, "constraints");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setMaximumValue:", v71);

      objc_msgSend(v267, "constraints");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setStepValue:", &unk_250F40080);

      objc_msgSend(v267, "constraints");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setValidValues:", v42);

      v16 = v259;
      v15 = v262;
      goto LABEL_58;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("000000CE-0000-1000-8000-0026BB765291")))
    {
      v247 = v22;
      objc_msgSend(v267, "constraints");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        v45 = objc_alloc_init(MEMORY[0x24BE1BB28]);
        objc_msgSend(v267, "setConstraints:", v45);

      }
      objc_msgSend(v267, "constraints");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setMinimumValue:", &unk_250F3FF48);

      objc_msgSend(v267, "constraints");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setMaximumValue:", &unk_250F3FF60);

      objc_msgSend(v267, "constraints");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setStepValue:", &unk_250F40080);

      v254 = v14;
      objc_msgSend(v14, "getAttributesForClusterClassName:endpoint:", v22, v266);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      v263 = v15;
      if (v49)
      {
        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("ColorTempPhysicalMinMireds"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v258 = v16;
        if (objc_msgSend(v51, "count"))
        {
          objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "constraints");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setMinimumValue:", v52);

          v54 = (void *)MEMORY[0x242656984]();
          v55 = v18;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v267, "constraints");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "minimumValue");
            v59 = v23;
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v275 = v57;
            v276 = 2112;
            v277 = v60;
            _os_log_impl(&dword_23E95B000, v56, OS_LOG_TYPE_DEBUG, "%{public}@ColorTempPhysicalMinMireds %@", buf, 0x16u);

            v23 = v59;
            v22 = v247;

          }
          objc_autoreleasePoolPop(v54);
          v16 = v258;
        }
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("ColorTempPhysicalMaxMireds"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v61, "count"))
        {
          objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "constraints");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setMaximumValue:", v62);

          v64 = (void *)MEMORY[0x242656984]();
          v65 = v18;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v267, "constraints");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "maximumValue");
            v69 = v23;
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v275 = v67;
            v276 = 2112;
            v277 = v70;
            _os_log_impl(&dword_23E95B000, v66, OS_LOG_TYPE_DEBUG, "%{public}@ColorTempPhysicalMaxMireds %@", buf, 0x16u);

            v23 = v69;
            v22 = v247;

          }
          objc_autoreleasePoolPop(v64);
          v16 = v258;
        }

      }
      else
      {
        v90 = v23;
        contexta = (void *)MEMORY[0x242656984]();
        v91 = v18;
        HMFGetOSLogHandle();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v93 = v16;
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v275 = v94;
          v276 = 2112;
          v277 = v247;
          v278 = 2112;
          v279 = v266;
          v280 = 2112;
          v281 = &unk_250F3FF48;
          v282 = 2112;
          v283 = &unk_250F3FF60;
          _os_log_impl(&dword_23E95B000, v92, OS_LOG_TYPE_ERROR, "%{public}@No attributes found for cluster %@ on endpoint %@. Use default ColorTemperature Min/Max %@, %@", buf, 0x34u);

          v16 = v93;
          v22 = v247;
        }

        objc_autoreleasePoolPop(contexta);
        v23 = v90;
      }

      v14 = v254;
      v15 = v263;
      goto LABEL_58;
    }
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("0000007B-0000-1000-8000-0026BB765291")) & 1) != 0
      || objc_msgSend(v12, "isEqualToString:", CFSTR("0000007D-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(v267, "constraints");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v85)
      {
        v86 = objc_alloc_init(MEMORY[0x24BE1BB28]);
        objc_msgSend(v267, "setConstraints:", v86);

      }
      objc_msgSend(v267, "constraints");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setMinimumValue:", &unk_250F40068);

      objc_msgSend(v267, "constraints");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setMaximumValue:", &unk_250F400E0);

      objc_msgSend(v267, "constraints");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setStepValue:", &unk_250F40080);

      goto LABEL_58;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("00000033-0000-1000-8000-0026BB765291")))
    {
      if (((objc_msgSend(v22, "isEqualToString:", CFSTR("MTRBaseClusterThermostat")) & 1) != 0
         || objc_msgSend(v22, "isEqualToString:", CFSTR("MTRClusterThermostat")))
        && v23)
      {
        v95 = v16;
        objc_msgSend(v267, "constraints");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v96)
        {
          v97 = objc_alloc_init(MEMORY[0x24BE1BB28]);
          objc_msgSend(v267, "setConstraints:", v97);

        }
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "addObject:", &unk_250F40068);
        objc_msgSend(v267, "constraints");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setMinimumValue:", &unk_250F40068);

        objc_msgSend(v267, "constraints");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setMaximumValue:", &unk_250F400B0);

        objc_msgSend(v267, "constraints");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "setStepValue:", &unk_250F40080);

        if ((objc_msgSend(v23, "unsignedIntValue") & 1) != 0)
          objc_msgSend(v98, "addObject:", &unk_250F40080);
        if ((objc_msgSend(v23, "unsignedIntValue") & 2) != 0)
          objc_msgSend(v98, "addObject:", &unk_250F40098);
        v16 = v95;
        if ((objc_msgSend(v23, "unsignedIntValue") & 0x20) != 0)
          objc_msgSend(v98, "addObject:", &unk_250F400B0);
        objc_msgSend(v267, "constraints");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "setValidValues:", v98);

      }
      goto LABEL_58;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("00000035-0000-1000-8000-0026BB765291")))
    {
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("HMMTRThermostat")) & 1) == 0
        && (objc_msgSend(v22, "isEqualToString:", CFSTR("HMMTRSyncThermostat")) & 1) == 0
        && !objc_msgSend(v22, "isEqualToString:", CFSTR("MTRClusterThermostat"))
        || !v23)
      {
        goto LABEL_58;
      }
      objc_msgSend(v267, "constraints");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v103)
      {
        v104 = objc_alloc_init(MEMORY[0x24BE1BB28]);
        objc_msgSend(v267, "setConstraints:", v104);

      }
      objc_msgSend(v267, "constraints");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setMinimumValue:", &unk_250F400F8);

      objc_msgSend(v267, "constraints");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setMaximumValue:", &unk_250F40110);

      objc_msgSend(v267, "constraints");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setStepValue:", &unk_250F406F0);

      objc_msgSend(v267, "constraints");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "minimumValue");
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v267, "constraints");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "maximumValue");
      contextb = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v267, "constraints");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "minimumValue");
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v267, "constraints");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "maximumValue");
      v246 = (void *)objc_claimAutoreleasedReturnValue();

      v256 = v14;
      objc_msgSend(v14, "getAttributesForClusterClassName:endpoint:", v22, v266);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v114;
      if (v114)
      {
        v116 = v16;
        objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("AbsMinCoolSetpointLimit"));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v117, "count"))
        {
          objc_msgSend(v117, "objectAtIndexedSubscript:", 0);
          v118 = objc_claimAutoreleasedReturnValue();

          v109 = (void *)v118;
        }
        objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("AbsMaxCoolSetpointLimit"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v119, "count"))
        {
          objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
          v120 = objc_claimAutoreleasedReturnValue();

          contextb = (void *)v120;
        }
        objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("AbsMinHeatSetpointLimit"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v121, "count"))
        {
          objc_msgSend(v121, "objectAtIndexedSubscript:", 0);
          v122 = objc_claimAutoreleasedReturnValue();

          v112 = (void *)v122;
        }
        objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("AbsMaxHeatSetpointLimit"));
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v123, "count"))
        {
          objc_msgSend(v123, "objectAtIndexedSubscript:", 0);
          v124 = objc_claimAutoreleasedReturnValue();

          v246 = (void *)v124;
        }
        v16 = v116;

      }
      v260 = v16;
      v264 = v15;
      v248 = v22;
      v244 = v109;
      if ((objc_msgSend(v23, "unsignedIntValue") & 0x20) != 0)
      {
        v187 = objc_msgSend(v109, "integerValue");
        if (v187 != objc_msgSend(v112, "integerValue")
          || (v188 = objc_msgSend(contextb, "integerValue"), v188 != objc_msgSend(v246, "integerValue")))
        {
          v189 = (void *)MEMORY[0x242656984]();
          v190 = v18;
          HMFGetOSLogHandle();
          v191 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v192 = v112;
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v275 = v193;
            _os_log_impl(&dword_23E95B000, v191, OS_LOG_TYPE_INFO, "%{public}@Thermostat min/max setpoints for heat and cool are not the same", buf, 0xCu);

            v112 = v192;
            v109 = v244;
          }

          objc_autoreleasePoolPop(v189);
        }
        v194 = (void *)MEMORY[0x24BDD16E0];
        v195 = objc_msgSend(v109, "integerValue", v244);
        v125 = v112;
        v196 = objc_msgSend(v112, "integerValue");
        if (v195 >= v196)
          v197 = v196;
        else
          v197 = v195;
        objc_msgSend(v194, "numberWithInteger:", v197);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "constraints");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "setMinimumValue:", v198);

        v200 = (void *)MEMORY[0x24BDD16E0];
        v201 = objc_msgSend(contextb, "integerValue");
        v202 = objc_msgSend(v246, "integerValue");
        if (v201 <= v202)
          v203 = v202;
        else
          v203 = v201;
        objc_msgSend(v200, "numberWithInteger:", v203);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "constraints");
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "setMaximumValue:", v129);

      }
      else
      {
        v125 = v112;
        if ((objc_msgSend(v23, "unsignedIntValue") & 2) != 0)
        {
          objc_msgSend(v267, "constraints");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "setMinimumValue:", v244);

          objc_msgSend(v267, "constraints");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "setMaximumValue:", contextb);

        }
        if ((objc_msgSend(v23, "unsignedIntValue", v244) & 1) == 0)
          goto LABEL_137;
        objc_msgSend(v267, "constraints");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "setMinimumValue:", v112);

        objc_msgSend(v267, "constraints");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setMaximumValue:", v246);
      }

LABEL_137:
      v205 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v267, "constraints");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "minimumValue");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "numberWithDouble:", (double)objc_msgSend(v207, "integerValue") / 100.0);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "constraints");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "setMinimumValue:", v208);

      v210 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v267, "constraints");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "maximumValue");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "numberWithDouble:", (double)objc_msgSend(v212, "integerValue") / 100.0);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "constraints");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "setMaximumValue:", v213);

      v215 = (void *)MEMORY[0x242656984]();
      v216 = v18;
      HMFGetOSLogHandle();
      v217 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "constraints");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v275 = v218;
        v276 = 2112;
        v277 = v245;
        v278 = 2112;
        v279 = contextb;
        v280 = 2112;
        v281 = v125;
        v282 = 2112;
        v283 = v246;
        v284 = 2112;
        v285 = v219;
        _os_log_impl(&dword_23E95B000, v217, OS_LOG_TYPE_INFO, "%{public}@Device Abs min/max cool setpoint: %@/%@, min/max heat setpoint: %@/%@. Setting metadata constraints: %@", buf, 0x3Eu);

      }
      objc_autoreleasePoolPop(v215);

      goto LABEL_140;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("0000000D-0000-1000-8000-0026BB765291")))
    {
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MTRBaseClusterThermostat")) & 1) == 0
        && !objc_msgSend(v22, "isEqualToString:", CFSTR("MTRClusterThermostat"))
        || !v23)
      {
        goto LABEL_58;
      }
      objc_msgSend(v267, "constraints");
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v130)
      {
        v131 = objc_alloc_init(MEMORY[0x24BE1BB28]);
        objc_msgSend(v267, "setConstraints:", v131);

      }
      objc_msgSend(v267, "constraints");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setMinimumValue:", &unk_250F400F8);

      objc_msgSend(v267, "constraints");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "setMaximumValue:", &unk_250F40128);

      objc_msgSend(v267, "constraints");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "setStepValue:", &unk_250F406F0);

      objc_msgSend(v267, "constraints");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "minimumValue");
      v136 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v267, "constraints");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "maximumValue");
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      v256 = v14;
      objc_msgSend(v14, "getAttributesForClusterClassName:endpoint:", v22, v266);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = v139;
      v260 = v16;
      v264 = v15;
      v248 = v22;
      if (v139)
      {
        objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("AbsMinCoolSetpointLimit"));
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v141, "count"))
        {
          objc_msgSend(v141, "objectAtIndexedSubscript:", 0);
          v142 = objc_claimAutoreleasedReturnValue();

          v136 = (void *)v142;
        }
        objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("AbsMaxCoolSetpointLimit"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v143, "count"))
        {
          objc_msgSend(v143, "objectAtIndexedSubscript:", 0);
          v144 = objc_claimAutoreleasedReturnValue();

          v138 = (void *)v144;
        }

      }
      objc_msgSend(v267, "constraints");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "setMinimumValue:", v136);

      objc_msgSend(v267, "constraints");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      contextc = v138;
      objc_msgSend(v146, "setMaximumValue:", v138);

      v147 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v267, "constraints");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "minimumValue");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "numberWithDouble:", (double)objc_msgSend(v149, "integerValue") / 100.0);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "constraints");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "setMinimumValue:", v150);

      v152 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v267, "constraints");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "maximumValue");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "numberWithDouble:", (double)objc_msgSend(v154, "integerValue") / 100.0);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "constraints");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setMaximumValue:", v155);

      v157 = (void *)MEMORY[0x242656984]();
      v158 = v18;
      HMFGetOSLogHandle();
      v159 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
        goto LABEL_123;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("00000012-0000-1000-8000-0026BB765291")))
      {
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("000000B2-0000-1000-8000-0026BB765291"))
          && ((objc_msgSend(v22, "isEqualToString:", CFSTR("HMMTRThermostat")) & 1) != 0
           || (objc_msgSend(v22, "isEqualToString:", CFSTR("HMMTRSyncThermostat")) & 1) != 0
           || objc_msgSend(v22, "isEqualToString:", CFSTR("MTRClusterThermostat")))
          && v23)
        {
          objc_msgSend(v267, "constraints");
          v220 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v220)
          {
            v221 = objc_alloc_init(MEMORY[0x24BE1BB28]);
            objc_msgSend(v267, "setConstraints:", v221);

          }
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "unsignedIntValue") & 2) != 0)
            objc_msgSend(v222, "addObject:", &unk_250F40098);
          if ((objc_msgSend(v23, "unsignedIntValue") & 1) != 0)
            objc_msgSend(v222, "addObject:", &unk_250F40080);
          contextd = v23;
          v257 = v14;
          v261 = v16;
          v265 = v15;
          v271 = 0u;
          v272 = 0u;
          v269 = 0u;
          v270 = 0u;
          v223 = v222;
          v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v269, v273, 16);
          if (v224)
          {
            v225 = v224;
            v226 = 0;
            v227 = 0;
            v228 = *(_QWORD *)v270;
            do
            {
              for (i = 0; i != v225; ++i)
              {
                if (*(_QWORD *)v270 != v228)
                  objc_enumerationMutation(v223);
                v230 = *(void **)(*((_QWORD *)&v269 + 1) + 8 * i);
                if (!v226)
                  v226 = v230;
                if (!v227)
                  v227 = v230;
                v231 = objc_msgSend(v230, "unsignedIntegerValue");
                if (v231 < objc_msgSend(v226, "unsignedIntegerValue"))
                {
                  v232 = v230;

                  v226 = v232;
                }
                v233 = objc_msgSend(v230, "unsignedIntegerValue");
                if (v233 > objc_msgSend(v227, "unsignedIntegerValue"))
                {
                  v234 = v230;

                  v227 = v234;
                }
              }
              v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v269, v273, 16);
            }
            while (v225);
          }
          else
          {
            v226 = 0;
            v227 = 0;
          }

          objc_msgSend(v267, "constraints");
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v235, "setMinimumValue:", v226);

          objc_msgSend(v267, "constraints");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "setMaximumValue:", v227);

          objc_msgSend(v267, "constraints");
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "setValidValues:", v223);

          objc_msgSend(v267, "constraints");
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v238, "setStepValue:", &unk_250F40080);

          v239 = (void *)MEMORY[0x242656984]();
          v240 = v18;
          HMFGetOSLogHandle();
          v241 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v267, "constraints");
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v275 = v242;
            v276 = 2112;
            v277 = v243;
            v278 = 2112;
            v279 = v268;
            _os_log_impl(&dword_23E95B000, v241, OS_LOG_TYPE_INFO, "%{public}@Setting metadata constraints: %@ for characteristic %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v239);

          v14 = v257;
          v16 = v261;
          v15 = v265;
          v23 = contextd;
        }
        goto LABEL_58;
      }
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MTRBaseClusterThermostat")) & 1) == 0
        && !objc_msgSend(v22, "isEqualToString:", CFSTR("MTRClusterThermostat"))
        || !v23)
      {
        goto LABEL_58;
      }
      objc_msgSend(v267, "constraints");
      v160 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v160)
      {
        v161 = objc_alloc_init(MEMORY[0x24BE1BB28]);
        objc_msgSend(v267, "setConstraints:", v161);

      }
      objc_msgSend(v267, "constraints");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "setMinimumValue:", &unk_250F40068);

      objc_msgSend(v267, "constraints");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "setMaximumValue:", &unk_250F40140);

      objc_msgSend(v267, "constraints");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "setStepValue:", &unk_250F406F0);

      objc_msgSend(v267, "constraints");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "minimumValue");
      v136 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v267, "constraints");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "maximumValue");
      v167 = (void *)objc_claimAutoreleasedReturnValue();

      v256 = v14;
      objc_msgSend(v14, "getAttributesForClusterClassName:endpoint:", v22, v266);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = v168;
      v260 = v16;
      v264 = v15;
      v248 = v22;
      if (v168)
      {
        objc_msgSend(v168, "objectForKeyedSubscript:", CFSTR("AbsMinHeatSetpointLimit"));
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v169, "count"))
        {
          objc_msgSend(v169, "objectAtIndexedSubscript:", 0);
          v170 = objc_claimAutoreleasedReturnValue();

          v136 = (void *)v170;
        }
        objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("AbsMaxHeatSetpointLimit"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v171, "count"))
        {
          objc_msgSend(v171, "objectAtIndexedSubscript:", 0);
          v172 = objc_claimAutoreleasedReturnValue();

          v167 = (void *)v172;
        }

      }
      objc_msgSend(v267, "constraints");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "setMinimumValue:", v136);

      objc_msgSend(v267, "constraints");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      contextc = v167;
      objc_msgSend(v174, "setMaximumValue:", v167);

      v175 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v267, "constraints");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "minimumValue");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "numberWithDouble:", (double)objc_msgSend(v177, "integerValue") / 100.0);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "constraints");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "setMinimumValue:", v178);

      v180 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v267, "constraints");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "maximumValue");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "numberWithDouble:", (double)objc_msgSend(v182, "integerValue") / 100.0);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "constraints");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "setMaximumValue:", v183);

      v157 = (void *)MEMORY[0x242656984]();
      v158 = v18;
      HMFGetOSLogHandle();
      v159 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
        goto LABEL_123;
    }
    HMFGetLogIdentifier();
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "constraints");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v275 = v185;
    v276 = 2112;
    v277 = v186;
    v278 = 2112;
    v279 = v268;
    _os_log_impl(&dword_23E95B000, v159, OS_LOG_TYPE_INFO, "%{public}@Setting metadata constraints: %@ for characteristic %@", buf, 0x20u);

LABEL_123:
    objc_autoreleasePoolPop(v157);

LABEL_140:
    v14 = v256;
    v16 = v260;
    v15 = v264;
    v22 = v248;
    goto LABEL_58;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v275 = v35;
    v276 = 2112;
    v277 = v12;
    v278 = 2112;
    v279 = 0;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristicUUID. Does not convert to a short integer. UUID:%@ shortened: %@. Using default characteristic metadata", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
LABEL_59:

}

- (NSNumber)version
{
  return self->_version;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSDictionary)hapToCHIPClusterMappingArray
{
  return self->_hapToCHIPClusterMappingArray;
}

- (id)createClusterInstance
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setCreateClusterInstance:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createClusterInstance, 0);
  objc_storeStrong((id *)&self->_hapToCHIPClusterMappingArray, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

void __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to find HAP service type for deviceType %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke_267(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsObject:", CFSTR("96")) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", CFSTR("96"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@The services for the device types  %@ : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

  }
}

void __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to find HAP service type for deviceType %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke_266(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsObject:", CFSTR("96")) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", CFSTR("96"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@The services for the device types %@ : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

  }
}

void __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received error response from accessory for cluster class %@, Error: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v12 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("HAPServiceType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v5, v13);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke_263(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  id obj;
  id obja;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (!v2)
    goto LABEL_21;
  v3 = v2;
  v54 = *(_QWORD *)v60;
  while (2)
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v60 != v54)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SelectionCriteria"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);
        goto LABEL_21;
      }
      v7 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PriorityOrder"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequiredFeaturesBitmap"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HAPServiceType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v8)
      {
        v41 = (void *)MEMORY[0x242656984]();
        v42 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v65 = v44;
          _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Error in protocol map plist. Required value for priority order not found", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v41);
        v45 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v45 + 16))(v45, 0, v46);

        v8 = 0;
        goto LABEL_43;
      }
      if (v9)
        v13 = v11 == 0;
      else
        v13 = 0;
      if (v13)
      {
        v47 = (void *)MEMORY[0x242656984]();
        v48 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v65 = v50;
          _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_ERROR, "%{public}@Could not get feature map value from accessory, aborting HAP service selection", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v47);
        v51 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v51 + 16))(v51, 0, v12);
LABEL_43:

        goto LABEL_44;
      }
      if (!v9
        || (v14 = objc_msgSend(v11, "unsignedIntegerValue"),
            v15 = objc_msgSend(v9, "unsignedIntegerValue") & v14,
            v15 == objc_msgSend(v9, "unsignedIntegerValue")))
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
          || (v16 = objc_msgSend(v8, "integerValue"),
              v16 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "integerValue")))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v8);
        }
      }

    }
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v3)
      continue;
    break;
  }
LABEL_21:

  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v17)
  {
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("HAPServiceType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    v20 = (void *)MEMORY[0x242656984]();
    v21 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", CFSTR("Description"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", CFSTR("HAPServiceType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v23;
      v66 = 2112;
      v67 = v24;
      v68 = 2112;
      v69 = v25;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Primary selected service: %@, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", CFSTR("OptionalHAPServiceTypes"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v26 = obj;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v56 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("HAPServiceType"), obj);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v32);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v28);
      }

    }
    v33 = (void *)MEMORY[0x242656984]();
    v34 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v65 = v36;
      v66 = 2112;
      v67 = v37;
      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_INFO, "%{public}@All selected service types: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v38 = *(_QWORD *)(a1 + 56);
    v39 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v38 + 16))(v38, v39, 0);

LABEL_44:
  }
  else
  {
    v40 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    obja = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v40 + 16))(v40, 0);

  }
}

id __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRProtocolMap linearMapForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "linearMapForCharacteristic:value:fromRange:toRange:", *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x242656984]();
  v10 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Mapped event value from dictionary %@ to %@.", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

  return v8;
}

id __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke_188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HMMTRProtocolMap customMapEventForCharacteristic:event:value:](HMMTRProtocolMap, "customMapEventForCharacteristic:event:value:", *(_QWORD *)(a1 + 32), a2, a3);
}

id __88__HMMTRProtocolMap__buildExpectedValueMapper_characteristicsDict_operation_valueMapper___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a1[7];
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[4];
  v10 = *MEMORY[0x24BDDB518];
  v18[0] = *MEMORY[0x24BDDB500];
  v18[1] = v10;
  v19[0] = v9;
  v19[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDDB478]);

  if (a1[5])
  {
    v12 = (void *)MEMORY[0x24BDDB538];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributePathWithEndpointId:clusterId:attributeId:", v13, a1[6], a1[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDDB460]);
  }
  v17 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  switch(*(_QWORD *)(a1 + 64))
  {
    case 0:
    case 2:
    case 4:
      v6 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;

      if (*(_BYTE *)(a1 + 72))
      {
        if (*(_QWORD *)(a1 + 64) == 2)
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v6);
        else
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v6, *(_QWORD *)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        v8 = v11;
      }
      if (v8)
      {
        +[HMMTRProtocolMap linearMapForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "linearMapForCharacteristic:value:fromRange:toRange:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

      goto LABEL_18;
    case 1:
      +[HMMTRProtocolMap linearMapForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "linearMapForCharacteristic:value:fromRange:toRange:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v12 = (void *)MEMORY[0x242656984]();
      v13 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        v18 = 138544130;
        v19 = v15;
        v20 = 2112;
        v21 = v4;
        v22 = 2112;
        v23 = v5;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Mapped value from dictionary %@ to %@ for %@.", (uint8_t *)&v18, 0x2Au);

      }
      objc_autoreleasePoolPop(v12);
      break;
    default:
      break;
  }

  return v5;
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  switch(*(_QWORD *)(a1 + 56))
  {
    case 0:
    case 2:
    case 4:
      v6 = v3;
      if (*(_BYTE *)(a1 + 64))
      {
        if (*(_QWORD *)(a1 + 56) == 2)
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v6);
        else
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", v6, *(_QWORD *)(a1 + 32));
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v7;
      }
      +[HMMTRProtocolMap customMapReadForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "customMapReadForCharacteristic:value:fromRange:toRange:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1:
      +[HMMTRProtocolMap customMapWriteForCharacteristic:value:](HMMTRProtocolMap, "customMapWriteForCharacteristic:value:", *(_QWORD *)(a1 + 32), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v5;
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReadResultValue:forIdentify:", a2, *(_QWORD *)(a1 + 32));
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", a2);
}

id __24__HMMTRProtocolMap_init__block_invoke(uint64_t a1, NSString *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc(NSClassFromString(a2)), "initWithDevice:endpointID:queue:", v10, v9, v8);

  return v11;
}

+ (id)protocolMap
{
  if (protocolMap_onceToken != -1)
    dispatch_once(&protocolMap_onceToken, &__block_literal_global_8910);
  return (id)cachedProtocolmap;
}

+ (id)linearMapForCharacteristic:(id)a3 value:(id)a4 fromRange:(id)a5 toRange:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v44;
  void *v45;
  int v46;
  int v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_retainAutorelease(v11);
  v47 = *(unsigned __int8 *)objc_msgSend(v14, "objCType");
  v15 = (void *)MEMORY[0x242656984]();
  v16 = a1;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v49 = v18;
    v50 = 2112;
    v51 = v14;
    v52 = 2112;
    v53 = v10;
    v54 = 2112;
    v55 = v12;
    v56 = 2112;
    v57 = v13;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Scaling value:%@ for characteristic: %@ linearly from %@ to %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v14, "doubleValue");
  v20 = v19;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v20 - v22;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v23 / (v26 - v28);
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = v31;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  v35 = v32 - v34;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleValue");
  v38 = v37 + v29 * v35;

  if ((v47 | 2) != 0x66)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(v38));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 == v41)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v44 = objc_claimAutoreleasedReturnValue();
      if ((id)v44 != v14)
      {
        v45 = (void *)v44;
        v46 = objc_msgSend(v10, "isEqualToString:", CFSTR("00000008-0000-1000-8000-0026BB765291"));

        if (v46)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", vcvtpd_s64_f64(v38));
          v42 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_7:
        v42 = v40;
LABEL_8:
        v39 = v42;

        goto LABEL_9;
      }

      v41 = v40;
    }

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v39;
}

+ (id)mapActiveState:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = &unk_250F3FF90;
  if (v3 != 1)
    v4 = 0;
  if (v3)
    return v4;
  else
    return &unk_250F3FF78;
}

+ (id)mapTargetFanState:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = &unk_250F3FFA8;
  if (v3 != 1)
    v4 = 0;
  if (v3)
    return v4;
  else
    return &unk_250F3FF90;
}

+ (id)mapRotationDirection:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = &unk_250F3FFC0;
  if (v3 != 1)
    v4 = 0;
  if (v3)
    return v4;
  else
    return &unk_250F3FF78;
}

+ (id)mapTargetAirPuriferState:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = &unk_250F3FFA8;
  if (v3 != 1)
    v4 = 0;
  if (v3)
    return v4;
  else
    return &unk_250F3FF90;
}

+ (id)mapFanModeToActive:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 5)
    return 0;
  else
    return (id)qword_250F23920[v3];
}

+ (id)mapAirflowDirection:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = &unk_250F3FFD8;
  if (v3 != 1)
    v4 = 0;
  if (v3)
    return v4;
  else
    return &unk_250F3FFF0;
}

+ (id)mapFanModeToTargetFanState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 5)
    return 0;
  else
    return (id)qword_250F23950[v3];
}

+ (id)mapFanModeToTargetAirPurifier:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 5)
    return 0;
  else
    return (id)qword_250F23950[v3];
}

+ (id)mapAirQuality:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 6)
    return 0;
  else
    return (id)qword_250F23980[v3];
}

+ (id)mapCurrentHeatingCoolingState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 2)
    return 0;
  else
    return (id)qword_250F239B8[v3];
}

+ (id)mapTargetHeatingCoolingState:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  if (v5 >= 3)
  {
    if (v5 == 3)
      v6 = &unk_250F3FFD8;
    else
      v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "mapCurrentHeatingCoolingState:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)mapCurrentSystemMode:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  if (v5 < 5 && ((0x1Bu >> v5) & 1) != 0)
  {
    v10 = (void *)qword_250F239D0[v5];
  }
  else
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Current System Mode: Mapping unknown value:%@ to HomeKit HeatingCooling State Off", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = &unk_250F3FFF0;
  }

  return v10;
}

+ (id)mapTargetSystemMode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  if ((unint64_t)(v5 - 3) < 2)
    goto LABEL_4;
  if (v5 == 1)
  {
    v6 = &unk_250F40020;
    goto LABEL_9;
  }
  if (v5)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Target System Mode: Mapping unknown value:%@ to HomeKit HeatingCooling State Off", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = &unk_250F3FFF0;
  }
  else
  {
LABEL_4:
    objc_msgSend(a1, "mapCurrentSystemMode:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v6;
}

+ (id)mapPositionState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 2)
    return 0;
  else
    return (id)qword_250F239F8[v3];
}

+ (BOOL)checkIfCharacteristicsIsOfTypeTemp:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("00000011-0000-1000-8000-0026BB765291")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("00000035-0000-1000-8000-0026BB765291")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("0000000D-0000-1000-8000-0026BB765291")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("00000012-0000-1000-8000-0026BB765291"));
  }

  return v4;
}

+ (id)customMapReadForCharacteristic:(id)a3 value:(id)a4 fromRange:(id)a5 toRange:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  int v37;
  void *v38;
  id v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("0000006B-0000-1000-8000-0026BB765291")))
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("0000001D-0000-1000-8000-0026BB765291")) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", CFSTR("0000001E-0000-1000-8000-0026BB765291")))
    {
      v22 = objc_msgSend(v11, "integerValue");
      if (v22 < 3)
      {
        v21 = (void *)qword_250F23A10[v22];
        goto LABEL_22;
      }
    }
    if (+[HMMTRProtocolMap checkIfCharacteristicsIsOfTypeTemp:](HMMTRProtocolMap, "checkIfCharacteristicsIsOfTypeTemp:", v10)|| objc_msgSend(v10, "isEqualToString:", CFSTR("00000010-0000-1000-8000-0026BB765291")))
    {
      v23 = (void *)MEMORY[0x24BDD16E0];
      v24 = v11;
      objc_msgSend(v23, "numberWithDouble:", (double)objc_msgSend(v24, "integerValue") / 100.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("0000006A-0000-1000-8000-0026BB765291")))
    {
      v37 = objc_msgSend(v11, "BOOLValue");
      v38 = &unk_250F40080;
      if (v37)
        v38 = &unk_250F40068;
      v39 = v38;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("0000000F-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(a1, "mapCurrentSystemMode:", v11);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("00000033-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(a1, "mapTargetSystemMode:", v11);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("00000072-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(a1, "mapPositionState:", v11);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("00000079-0000-1000-8000-0026BB765291")))
      {
        if (objc_msgSend(v11, "integerValue") <= 0)
          v21 = &unk_250F3FFF0;
        else
          v21 = &unk_250F3FFD8;
        goto LABEL_22;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("0000008F-0000-1000-8000-0026BB765291")))
      {
        if (objc_msgSend(v11, "integerValue") == 1)
          v21 = &unk_250F3FFD8;
        else
          v21 = &unk_250F3FFF0;
        goto LABEL_22;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("000000B0-0000-1000-8000-0026BB765291")))
      {
        objc_msgSend(a1, "mapFanModeToActive:", v11);
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("000000BF-0000-1000-8000-0026BB765291")))
      {
        objc_msgSend(a1, "mapFanModeToTargetFanState:", v11);
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("00000028-0000-1000-8000-0026BB765291")))
          goto LABEL_49;
        objc_msgSend(a1, "mapAirflowDirection:", v11);
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_33:
    v21 = v39;
    goto LABEL_22;
  }
  if (!v13)
  {
    _HMFPreconditionFailure();
LABEL_49:
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("000000A8-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(a1, "mapFanModeToTargetAirPurifier:", v11);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("00000095-0000-1000-8000-0026BB765291")))
      {
        v21 = 0;
        goto LABEL_22;
      }
      objc_msgSend(a1, "mapAirQuality:", v11);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_33;
  }
  v14 = v11;
  v15 = v14;
  if (v14)
  {
    if (objc_msgSend(v14, "isEqualToNumber:", &unk_250F40068))
    {
      v16 = (void *)MEMORY[0x242656984]();
      v17 = a1;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543618;
        v41 = v19;
        v42 = 2112;
        v43 = v20;
        _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Illuminance value was too low to be measured.  Return min HAP light level value %@", (uint8_t *)&v40, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v15, "floatValue");
      v31 = __exp10((float)((float)(v30 + -1.0) / 10000.0));
      *(float *)&v31 = v31;
      objc_msgSend(v29, "numberWithFloat:", v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x242656984]();
      v33 = a1;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543874;
        v41 = v35;
        v42 = 2112;
        v43 = v15;
        v44 = 2112;
        v45 = v21;
        _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Read CurrentLightLevel measured value: %@, lux value: %@", (uint8_t *)&v40, 0x20u);

      }
      objc_autoreleasePoolPop(v32);
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = a1;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v28;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Illuminance value was invalid, return nil.", (uint8_t *)&v40, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v21 = 0;
  }

LABEL_22:
  return v21;
}

+ (id)customMapWriteForCharacteristic:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (+[HMMTRProtocolMap checkIfCharacteristicsIsOfTypeTemp:](HMMTRProtocolMap, "checkIfCharacteristicsIsOfTypeTemp:", v6))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "numberWithDouble:", v9 * 100.0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("0000000F-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(a1, "mapCurrentHeatingCoolingState:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("00000033-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(a1, "mapTargetHeatingCoolingState:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("000000B0-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(a1, "mapActiveState:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("000000BF-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(a1, "mapTargetFanState:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("00000028-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(a1, "mapRotationDirection:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("000000A8-0000-1000-8000-0026BB765291")))
    {
      v11 = 0;
      goto LABEL_16;
    }
    objc_msgSend(a1, "mapTargetAirPuriferState:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_16:

  return v11;
}

+ (id)customMapEventForCharacteristic:(id)a3 event:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  int v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  int v78;
  unsigned int v79;
  void *v80;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  id v107;
  __int16 v108;
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x242656984]();
  v13 = a1;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v103 = v15;
    v104 = 2112;
    v105 = v8;
    v106 = 2112;
    v107 = v9;
    v108 = 2112;
    v109 = v10;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@customMapEventForCharacteristic characteristic %@ event %@ value %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("00000073-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(v8, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "validValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    objc_msgSend(v23, "protocolMappingStateForCharacteristic:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = v18;
    if (objc_msgSend(v9, "isEqualToNumber:", &unk_250F40080))
    {
      objc_msgSend(v24, "setShouldIgnoreSingleMultiPressComplete:", 0);
      if ((objc_msgSend(v18, "containsObject:", &unk_250F40080) & 1) == 0)
      {
        if (objc_msgSend(v18, "containsObject:", &unk_250F40098))
          v25 = 0;
        else
          v25 = &unk_250F40068;
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    if (objc_msgSend(v9, "isEqualToNumber:", &unk_250F40098))
    {
      if (objc_msgSend(v18, "containsObject:", &unk_250F40098))
      {
        objc_msgSend(v24, "setShouldIgnoreSingleMultiPressComplete:", 1);
        v25 = &unk_250F40098;
      }
      else
      {
        v47 = v24;
        v48 = (void *)MEMORY[0x242656984]();
        v49 = v13;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v103 = v51;
          v104 = 2112;
          v105 = v8;
          _os_log_impl(&dword_23E95B000, v50, OS_LOG_TYPE_ERROR, "%{public}@Unexpected (feature-map excluded) LongPress event for %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v48);
        v25 = 0;
        v24 = v47;
      }
      goto LABEL_92;
    }
    if (objc_msgSend(v9, "isEqualToNumber:", &unk_250F400B0))
    {
      if ((objc_msgSend(v18, "containsObject:", &unk_250F40080) & 1) == 0)
      {
        if (objc_msgSend(v18, "containsObject:", &unk_250F40098))
          v25 = &unk_250F40068;
        else
          v25 = 0;
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    if (objc_msgSend(v9, "isEqualToNumber:", &unk_250F400C8))
    {
      v88 = v11;
      v52 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v53 = v52;
      else
        v53 = 0;
      v54 = v53;

      v82 = v54;
      objc_msgSend(v54, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v56 = v55;
      else
        v56 = 0;
      v57 = v56;

      v58 = v57;
      objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x24BDDB500]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "isEqual:", *MEMORY[0x24BDDB4F8]);

      v61 = 0;
      if (v60)
      {
        objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v63 = v62;
        else
          v63 = 0;
        v64 = v63;

        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v65 = v64;
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
        if (v66)
        {
          v67 = v66;
          v90 = v24;
          v84 = v10;
          v86 = v9;
          v68 = *(_QWORD *)v97;
          v69 = *MEMORY[0x24BDDB470];
          while (2)
          {
            for (i = 0; i != v67; ++i)
            {
              if (*(_QWORD *)v97 != v68)
                objc_enumerationMutation(v65);
              v71 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
              objc_msgSend(v71, "objectForKeyedSubscript:", v69);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = objc_msgSend(v72, "isEqual:", &unk_250F40080);

              if (v73)
              {
                +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v71);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v77 = v76;
                else
                  v77 = 0;
                v61 = v77;

                goto LABEL_78;
              }
            }
            v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
            if (v67)
              continue;
            break;
          }
          v61 = 0;
LABEL_78:
          v10 = v84;
          v9 = v86;
          v24 = v90;
          v18 = v91;
        }
        else
        {
          v61 = 0;
        }

      }
      v78 = objc_msgSend(v24, "shouldIgnoreSingleMultiPressComplete");
      objc_msgSend(v24, "setShouldIgnoreSingleMultiPressComplete:", 0);
      if (!objc_msgSend(v18, "containsObject:", &unk_250F40080))
      {
        v25 = 0;
        v11 = v88;
LABEL_89:

        goto LABEL_92;
      }
      v11 = v88;
      if (v61)
      {
        v79 = objc_msgSend(v61, "unsignedCharValue");
        v80 = &unk_250F40068;
        if (v78)
          v80 = 0;
        if (v79 >= 2)
          v25 = &unk_250F40080;
        else
          v25 = v80;
        goto LABEL_89;
      }

    }
LABEL_91:
    v25 = 0;
    goto LABEL_92;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("0000001D-0000-1000-8000-0026BB765291"))
    && objc_msgSend(v9, "isEqualToNumber:", &unk_250F40068))
  {
    v87 = v11;
    v26 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    v91 = v28;
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
    v31 = v30;

    v89 = v31;
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x24BDDB500]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqual:", *MEMORY[0x24BDDB4F8]);

    v34 = 0;
    if (v33)
    {
      v83 = v10;
      v85 = v9;
      objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v36 = v35;
      else
        v36 = 0;
      v37 = v36;

      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v93;
        v42 = *MEMORY[0x24BDDB470];
LABEL_26:
        v43 = 0;
        while (1)
        {
          if (*(_QWORD *)v93 != v41)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v43);
          objc_msgSend(v44, "objectForKeyedSubscript:", v42);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqual:", &unk_250F40068);

          if ((v46 & 1) != 0)
            break;
          if (v40 == ++v43)
          {
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
            if (v40)
              goto LABEL_26;
            goto LABEL_32;
          }
        }
        +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v44);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v74 = v34;
        else
          v74 = 0;
        v75 = v74;

        if (!v75)
          goto LABEL_71;
        v10 = v83;
        v9 = v85;
        if (!objc_msgSend(v75, "isEqualToNumber:", &unk_250F3FF78))
          goto LABEL_72;

        v25 = &unk_250F40008;
        goto LABEL_73;
      }
LABEL_32:

LABEL_71:
      v34 = 0;
      v10 = v83;
      v9 = v85;
    }
LABEL_72:

    v25 = 0;
LABEL_73:
    v11 = v87;
    v24 = v89;
LABEL_92:

    goto LABEL_93;
  }
  v25 = 0;
LABEL_93:

  return v25;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t86 != -1)
    dispatch_once(&logCategory__hmf_once_t86, &__block_literal_global_312);
  return (id)logCategory__hmf_once_v87;
}

void __31__HMMTRProtocolMap_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v87;
  logCategory__hmf_once_v87 = v0;

}

void __31__HMMTRProtocolMap_protocolMap__block_invoke()
{
  HMMTRProtocolMap *v0;
  void *v1;

  v0 = objc_alloc_init(HMMTRProtocolMap);
  v1 = (void *)cachedProtocolmap;
  cachedProtocolmap = (uint64_t)v0;

}

@end
