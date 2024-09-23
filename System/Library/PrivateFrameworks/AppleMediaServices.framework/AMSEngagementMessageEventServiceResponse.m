@implementation AMSEngagementMessageEventServiceResponse

- (AMSEngagementMessageEventServiceResponse)initWithJSObject:(id)a3
{
  id v5;
  AMSEngagementMessageEventServiceResponse *v6;
  AMSEngagementMessageEventServiceResponse *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  AMSEngagementMessageRequest *v16;
  AMSEngagementMessageRequest *fullScreenMessageRequest;
  AMSEngagementRequest *v18;
  AMSEngagementRequest *engagementRequest;
  uint64_t v20;
  NSDictionary *placementsMap;
  AMSEngagementMessageEventServiceResponse *v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AMSEngagementMessageEventServiceResponse;
  v6 = -[AMSEngagementMessageEventServiceResponse init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionaryRepresentation, a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dialogRequest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("engagementRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placements"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    if (!v9)
      goto LABEL_22;
    objc_storeStrong((id *)&v7->_serviceType, v9);
    if (v11)
    {
      v16 = -[AMSEngagementMessageRequest initWithJSObject:]([AMSEngagementMessageRequest alloc], "initWithJSObject:", v11);
      fullScreenMessageRequest = v7->_fullScreenMessageRequest;
      v7->_fullScreenMessageRequest = v16;

    }
    v18 = -[AMSEngagementRequest initWithJSONDictionary:]([AMSEngagementRequest alloc], "initWithJSONDictionary:", v13);
    engagementRequest = v7->_engagementRequest;
    v7->_engagementRequest = v18;

    -[AMSEngagementMessageEventServiceResponse _placementsMapWithPayload:](v7, "_placementsMapWithPayload:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
    placementsMap = v7->_placementsMap;
    v7->_placementsMap = (NSDictionary *)v20;

    if (!v7->_placementsMap && !v7->_engagementRequest && !v7->_fullScreenMessageRequest)
    {
LABEL_22:

      v22 = 0;
      goto LABEL_23;
    }

  }
  v22 = v7;
LABEL_23:

  return v22;
}

- (id)_placementsMapWithPayload:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  AMSEngagementMessageRequest *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSString *serviceType;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  AMSEngagementMessageRequest *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  NSString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v13, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_48);
            v15 = (AMSEngagementMessageRequest *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v10);
            v16 = v14;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = v14;
            else
              v16 = 0;

            v15 = -[AMSEngagementMessageRequest initWithJSObject:]([AMSEngagementMessageRequest alloc], "initWithJSObject:", v16);
            if (v15)
            {
              v17 = v4;
              if (-[NSString isEqualToString:](self->_serviceType, "isEqualToString:", CFSTR("appStore"))
                && -[AMSEngagementMessageRequest style](v15, "style") == 6
                && objc_msgSend(v10, "isEqualToString:", CFSTR("appLevelAlert")))
              {
                +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v18)
                {
                  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v18, "OSLogObject");
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  v25 = objc_opt_class();
                  AMSLogKey();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  serviceType = self->_serviceType;
                  *(_DWORD *)buf = 138544130;
                  v34 = v25;
                  v35 = 2114;
                  v36 = v26;
                  v37 = 2114;
                  v38 = v10;
                  v39 = 2114;
                  v40 = serviceType;
                  _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Replacing Dashboard message style with Alert message style for placement %{public}@ serviceType %{public}@, ", buf, 0x2Au);

                }
                -[AMSEngagementMessageRequest setStyle:](v15, "setStyle:", 1);
              }
              v32 = v15;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, v10);

              v4 = v17;
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
      v22 = (void *)objc_msgSend(v4, "copy");
    else
      v22 = 0;

    v3 = v24;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

AMSEngagementMessageRequest *__70__AMSEngagementMessageEventServiceResponse__placementsMapWithPayload___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSEngagementMessageRequest *v3;

  v2 = a2;
  v3 = -[AMSEngagementMessageRequest initWithJSObject:]([AMSEngagementMessageRequest alloc], "initWithJSObject:", v2);

  return v3;
}

- (id)_placementRequestsWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "makeDialogRequest");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && objc_msgSend(v11, "presentationAction"))
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDictionary)placements
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AMSEngagementMessageEventServiceResponse placementsMap](self, "placementsMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (NSDictionary *)0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AMSEngagementMessageEventServiceResponse placementsMap](self, "placementsMap", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[AMSEngagementMessageEventServiceResponse placementsMap](self, "placementsMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return (NSDictionary *)v15;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, a3);
}

- (AMSEngagementRequest)engagementRequest
{
  return self->_engagementRequest;
}

- (void)setEngagementRequest:(id)a3
{
  objc_storeStrong((id *)&self->_engagementRequest, a3);
}

- (AMSEngagementMessageRequest)fullScreenMessageRequest
{
  return self->_fullScreenMessageRequest;
}

- (void)setFullScreenMessageRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenMessageRequest, a3);
}

- (NSDictionary)placementsMap
{
  return self->_placementsMap;
}

- (void)setPlacementsMap:(id)a3
{
  objc_storeStrong((id *)&self->_placementsMap, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placementsMap, 0);
  objc_storeStrong((id *)&self->_fullScreenMessageRequest, 0);
  objc_storeStrong((id *)&self->_engagementRequest, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
