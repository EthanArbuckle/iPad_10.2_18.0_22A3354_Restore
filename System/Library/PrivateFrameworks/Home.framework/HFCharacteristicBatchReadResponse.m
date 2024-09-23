@implementation HFCharacteristicBatchReadResponse

uint64_t __78__HFCharacteristicBatchReadResponse__aggregatedMetadataForCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __75__HFCharacteristicBatchReadResponse_initWithReadResponses_contextProvider___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

uint64_t __55__HFCharacteristicBatchReadResponse_allCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "service");
}

uint64_t __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

void __48__HFCharacteristicBatchReadResponse_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_18_4);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_19_10);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED379A78;
  qword_1ED379A78 = v3;

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_296 != -1)
    dispatch_once(&_MergedGlobals_296, &__block_literal_global_13_12);
  return (NAIdentity *)(id)qword_1ED379A78;
}

- (id)allResponsesForCharacteristicRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[HFCharacteristicBatchReadResponse responsesKeyedByCharacteristicType](self, "responsesKeyedByCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_map:", &__block_literal_global_32_9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_34_7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchResultForServices:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allCharacteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_setByIntersectingWithSet:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke_3;
  v16[3] = &unk_1EA72ADF8;
  v17 = v12;
  v13 = v12;
  objc_msgSend(v7, "na_filter:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)responseForCharacteristicRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HFCharacteristicBatchReadResponse allResponsesForCharacteristicRecipe:](self, "allResponsesForCharacteristicRecipe:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "aggregatedReadResponseFromResponses:withAggregationPolicy:", v5, -[HFCharacteristicBatchReadResponse defaultAggregationPolicyForCharacteristicType:](self, "defaultAggregationPolicyForCharacteristicType:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)batchResponseForService:(id)a3 includeChildServices:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  HFCharacteristicBatchReadResponse *v13;
  void *v14;
  HFCharacteristicBatchReadResponse *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "hf_childServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__HFCharacteristicBatchReadResponse_batchResponseForService_includeChildServices___block_invoke;
  v17[3] = &unk_1EA73B758;
  v20 = v4;
  v18 = v8;
  v19 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "na_filter:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [HFCharacteristicBatchReadResponse alloc];
  -[HFCharacteristicBatchReadResponse contextProvider](self, "contextProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:](v13, "initWithReadResponses:contextProvider:", v12, v14);

  return v15;
}

- (NSSet)allCharacteristics
{
  NSSet *allCharacteristics;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  allCharacteristics = self->_allCharacteristics;
  if (!allCharacteristics)
  {
    -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_26_2);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allCharacteristics;
    self->_allCharacteristics = v5;

    allCharacteristics = self->_allCharacteristics;
  }
  return allCharacteristics;
}

- (NSSet)allReadResponses
{
  return self->_allReadResponses;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  return self->_contextProvider;
}

- (NSSet)allServices
{
  NSSet *allServices;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  allServices = self->_allServices;
  if (!allServices)
  {
    -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_35_5);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allServices;
    self->_allServices = v5;

    allServices = self->_allServices;
  }
  return allServices;
}

uint64_t __82__HFCharacteristicBatchReadResponse_batchResponseForService_includeChildServices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_4;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v7);

  if ((v5 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
LABEL_4:
    objc_msgSend(v4, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

  }
  return v8;
}

- (HFCharacteristicBatchReadResponse)initWithReadResponses:(id)a3 contextProvider:(id)a4
{
  id v7;
  id v8;
  HFCharacteristicBatchReadResponse *v9;
  HFCharacteristicBatchReadResponse *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSDictionary *responseKeyedByCharacteristicUUID;
  NSDictionary *v26;
  NSDictionary *responsesKeyedByCharacteristicType;
  HFCharacteristicBatchReadResponse *v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HFCharacteristicBatchReadResponse;
  v9 = -[HFCharacteristicBatchReadResponse init](&v37, sel_init);
  v10 = v9;
  if (v9)
  {
    v30 = v8;
    objc_storeStrong((id *)&v9->_allReadResponses, a3);
    v29 = v10;
    objc_storeStrong((id *)&v10->_contextProvider, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v31 = v7;
    obj = v7;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v17, "characteristic");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "uniqueIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("Got multiple HFCharacteristicReadResponse's for a single characteristic: %@ and %@"), v17, v21);

          }
          -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, v19);
          objc_msgSend(v17, "characteristic");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "characteristicType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary na_objectForKey:withDefaultValue:](v12, "na_objectForKey:withDefaultValue:", v23, &__block_literal_global_183);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v17);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v14);
    }

    v10 = v29;
    responseKeyedByCharacteristicUUID = v29->_responseKeyedByCharacteristicUUID;
    v29->_responseKeyedByCharacteristicUUID = v11;
    v26 = v11;

    responsesKeyedByCharacteristicType = v29->_responsesKeyedByCharacteristicType;
    v29->_responsesKeyedByCharacteristicType = v12;

    v8 = v30;
    v7 = v31;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsesKeyedByCharacteristicType, 0);
  objc_storeStrong((id *)&self->_responseKeyedByCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_allReadResponses, 0);
  objc_storeStrong((id *)&self->_contextProvider, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
  objc_storeStrong((id *)&self->_allCharacteristicTypes, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
}

- (id)responseForCharacteristicType:(id)a3 inServicesOfTypes:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = -[HFCharacteristicBatchReadResponse defaultAggregationPolicyForCharacteristicType:](self, "defaultAggregationPolicyForCharacteristicType:", v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inServicesOfTypes___block_invoke;
  v12[3] = &unk_1EA72ADF8;
  v13 = v6;
  v9 = v6;
  -[HFCharacteristicBatchReadResponse _responseForCharacteristicType:aggregationPolicy:filter:](self, "_responseForCharacteristicType:aggregationPolicy:filter:", v7, v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)responseForCharacteristicType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFCharacteristicBatchReadResponse responseForCharacteristicType:aggregationPolicy:](self, "responseForCharacteristicType:aggregationPolicy:", v4, -[HFCharacteristicBatchReadResponse defaultAggregationPolicyForCharacteristicType:](self, "defaultAggregationPolicyForCharacteristicType:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)defaultAggregationPolicyForCharacteristicType:(id)a3
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[HFCharacteristicBatchReadResponse _aggregatedMetadataForCharacteristicType:](self, "_aggregatedMetadataForCharacteristicType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hf_isNumeric") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "format");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB86F8]) ^ 1;

  }
  return v4;
}

- (id)responseForCharacteristicType:(id)a3 aggregationPolicy:(unint64_t)a4
{
  return -[HFCharacteristicBatchReadResponse _responseForCharacteristicType:aggregationPolicy:filter:](self, "_responseForCharacteristicType:aggregationPolicy:filter:", a3, a4, 0);
}

- (id)_aggregatedMetadataForCharacteristicType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCharacteristicBatchReadResponse allResponsesForCharacteristicType:](self, "allResponsesForCharacteristicType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_46_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "aggregatedMetadataForCharacteristics:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)aggregatedMetadataForCharacteristics:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v5 = 138412802;
    v18 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "metadata", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v7)
        {
          if ((objc_msgSend(v7, "hf_isEqualToMetadata:", v11) & 1) == 0)
          {
            HFLogForCategory(0);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v10, "hf_characteristicTypeDescription");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "hf_prettyDescription");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "hf_prettyDescription");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v18;
              v24 = v14;
              v25 = 2112;
              v26 = v15;
              v27 = 2112;
              v28 = v16;
              _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Found different metadata for characteristic type %@! %@ and %@ are not identical. Using the first metadata found.", buf, 0x20u);

            }
          }
        }
        else
        {
          v7 = v11;
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_responseForCharacteristicType:(id)a3 aggregationPolicy:(unint64_t)a4 filter:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = a3;
  -[HFCharacteristicBatchReadResponse responsesKeyedByCharacteristicType](self, "responsesKeyedByCharacteristicType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v11, "na_filter:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend((id)objc_opt_class(), "aggregatedReadResponseFromResponses:withAggregationPolicy:", v11, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)allResponsesForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFCharacteristicBatchReadResponse responsesKeyedByCharacteristicType](self, "responsesKeyedByCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)responsesKeyedByCharacteristicType
{
  return self->_responsesKeyedByCharacteristicType;
}

+ (id)aggregatedReadResponseFromResponses:(id)a3 withAggregationPolicy:(unint64_t)a4
{
  id v6;
  HFCharacteristicReadResponse *v7;
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

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3550];
    objc_msgSend(v6, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_41_2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "na_map:", &__block_literal_global_42_5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "aggregatedMetadataForCharacteristics:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_aggregatedValueForValues:withAggregationPolicy:metadata:", v11, a4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_43_3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_setByFlattening");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setByAddingObject:", CFSTR("Aggregated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "characteristic");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_44_4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:]([HFCharacteristicReadResponse alloc], "initWithCharacteristic:readTraits:value:error:", v19, v17, v14, v21);
  }
  else
  {
    objc_msgSend(v6, "anyObject");
    v7 = (HFCharacteristicReadResponse *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)allResponsesForCharacteristicTypes:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicTypes___block_invoke;
  v4[3] = &unk_1EA726AB8;
  v4[4] = self;
  objc_msgSend(a3, "na_flatMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__HFCharacteristicBatchReadResponse_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contextProvider");
}

uint64_t __48__HFCharacteristicBatchReadResponse_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allReadResponses");
}

id __48__HFCharacteristicBatchReadResponse_allServices__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)batchResponseForService:(id)a3
{
  return -[HFCharacteristicBatchReadResponse batchResponseForService:includeChildServices:](self, "batchResponseForService:includeChildServices:", a3, 0);
}

uint64_t __72__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "allResponsesForCharacteristicType:", a2);
}

id __59__HFCharacteristicBatchReadResponse_allCharacteristicTypes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __85__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "containsObject:", v5);

  return v6;
}

- (NSSet)allCharacteristicTypes
{
  NSSet *allCharacteristicTypes;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  allCharacteristicTypes = self->_allCharacteristicTypes;
  if (!allCharacteristicTypes)
  {
    -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_27_8);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allCharacteristicTypes;
    self->_allCharacteristicTypes = v5;

    allCharacteristicTypes = self->_allCharacteristicTypes;
  }
  return allCharacteristicTypes;
}

- (HFCharacteristicBatchReadResponse)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithReadResponses_contextProvider_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicBatchReadResponse.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCharacteristicBatchReadResponse init]",
    v5);

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("readResponses"), 0);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSSet)allFailedReadResponses
{
  void *v2;
  void *v3;

  -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_24_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

BOOL __59__HFCharacteristicBatchReadResponse_allFailedReadResponses__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)responseForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFCharacteristicBatchReadResponse responseKeyedByCharacteristicUUID](self, "responseKeyedByCharacteristicUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)responseForCharacteristicType:(id)a3 inService:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService___block_invoke;
  v14[3] = &unk_1EA72ADF8;
  v8 = v7;
  v15 = v8;
  -[HFCharacteristicBatchReadResponse _responseForCharacteristicType:aggregationPolicy:filter:](self, "_responseForCharacteristicType:aggregationPolicy:filter:", v6, 1, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("Aggregated"));

  if (v11)
  {
    objc_msgSend(v8, "hf_prettyDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Asked for a response from characteristic type: %@ in service: %@, and eneded up with an aggregated response. Does that mean there are multiple characteristics of the same type in a single service? That would mean the accessory is violating the spec. The result was instead aggregated by picking the most common value."), v6, v12);

  }
  return v9;
}

uint64_t __77__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)responseForCharacteristicType:(id)a3 inService:(id)a4 aggregationPolicy:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService_aggregationPolicy___block_invoke;
  v12[3] = &unk_1EA72ADF8;
  v13 = v8;
  v9 = v8;
  -[HFCharacteristicBatchReadResponse _responseForCharacteristicType:aggregationPolicy:filter:](self, "_responseForCharacteristicType:aggregationPolicy:filter:", a3, a5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __95__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService_aggregationPolicy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)allResponsesForCharacteristicType:(id)a3 inServicesOfTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  -[HFCharacteristicBatchReadResponse responsesKeyedByCharacteristicType](self, "responsesKeyedByCharacteristicType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicType_inServicesOfTypes___block_invoke;
  v13[3] = &unk_1EA72ADF8;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "na_filter:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __89__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicType_inServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "containsObject:", v5);

  return v6;
}

- (id)servicesWithValue:(id)a3 forCharacteristicType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__HFCharacteristicBatchReadResponse_servicesWithValue_forCharacteristicType___block_invoke;
  v10[3] = &unk_1EA73B780;
  v11 = v6;
  v7 = v6;
  -[HFCharacteristicBatchReadResponse servicesWithValuesPassingTest:forCharacteristicType:](self, "servicesWithValuesPassingTest:forCharacteristicType:", v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __77__HFCharacteristicBatchReadResponse_servicesWithValue_forCharacteristicType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (id)servicesWithValuesPassingTest:(id)a3 forCharacteristicType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __89__HFCharacteristicBatchReadResponse_servicesWithValuesPassingTest_forCharacteristicType___block_invoke;
  v17 = &unk_1EA73B7A8;
  v18 = v7;
  v19 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "na_filter:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_map:", &__block_literal_global_38_1, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __89__HFCharacteristicBatchReadResponse_servicesWithValuesPassingTest_forCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __89__HFCharacteristicBatchReadResponse_servicesWithValuesPassingTest_forCharacteristicType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)servicesWithErrorForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFCharacteristicBatchReadResponse allReadResponses](self, "allReadResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HFCharacteristicBatchReadResponse_servicesWithErrorForCharacteristicType___block_invoke;
  v10[3] = &unk_1EA72ADF8;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_39_5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __76__HFCharacteristicBatchReadResponse_servicesWithErrorForCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 != 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __76__HFCharacteristicBatchReadResponse_servicesWithErrorForCharacteristicType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "readTraits");
}

BOOL __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)_aggregatedValueForValues:(id)a3 withAggregationPolicy:(unint64_t)a4 metadata:(id)a5
{
  void *v5;
  id v9;
  id v10;
  uint64_t v11;

  v9 = a3;
  v10 = a5;
  switch(a4)
  {
    case 2uLL:
      objc_msgSend(a1, "_averageValueForValues:metadata:", v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(a1, "_mostCommonValueForValues:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0uLL:
      objc_msgSend(a1, "_mostAbnormalValueForValues:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (void *)v11;
      break;
  }

  return v5;
}

+ (id)_mostAbnormalValueForValues:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSLog(CFSTR("Attempting to use a most abnormal aggregation policy for unsupported (non-numeric) value %@!"), v10);
          objc_msgSend(a1, "_mostCommonValueForValues:", v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_19;
        }
        if (v7)
        {
          if (objc_msgSend(v7, "na_compareAbsoluteValue:", v10) == -1)
            v11 = v10;
          else
            v11 = v7;
          v12 = v11;

          v7 = v12;
        }
        else
        {
          v7 = v10;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v7 = v7;
  v13 = v7;
LABEL_19:

  return v13;
}

+ (id)_mostCommonValueForValues:(id)a3
{
  return (id)objc_msgSend(a3, "na_mostCommonObject");
}

+ (id)_averageValueForValues:(id)a3 metadata:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  double v26;
  uint64_t v27;
  void *v28;
  SEL v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED379A80 != -1)
    dispatch_once(&qword_1ED379A80, &__block_literal_global_51_4);
  v9 = (id)qword_1ED379A88;
  if ((objc_msgSend(v9, "containsObject:", v8) & 1) != 0)
  {
    v30 = a2;
    v31 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("HFCharacteristicBatchReadResponse.m"), 401, CFSTR("Expected a numeric value, but received %@ instead!"), v16);

          }
          for (j = objc_msgSend(v11, "countForObject:", v16); j; --j)
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    v21 = 0.0;
    v22 = 0.0;
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "doubleValue");
          v22 = v22 + v26;
        }
        v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v19, "count"))
      v21 = v22 / (double)(unint64_t)objc_msgSend(v19, "count");
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB8700]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB8728]))
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)v21);
      else
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v21);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v27;

  }
  else
  {
    NSLog(CFSTR("Cannot take the average of characteristic values with a format of %@!"), v8);
    objc_msgSend(a1, "_mostCommonValueForValues:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

void __69__HFCharacteristicBatchReadResponse__averageValueForValues_metadata___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8700];
  v5[0] = *MEMORY[0x1E0CB8708];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0CB8718];
  v5[2] = *MEMORY[0x1E0CB8730];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0CB8728];
  v5[4] = *MEMORY[0x1E0CB8720];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379A88;
  qword_1ED379A88 = v3;

}

- (NSDictionary)responseKeyedByCharacteristicUUID
{
  return self->_responseKeyedByCharacteristicUUID;
}

@end
