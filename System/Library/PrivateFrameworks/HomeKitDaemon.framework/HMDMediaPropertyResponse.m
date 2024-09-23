@implementation HMDMediaPropertyResponse

- (HMDMediaPropertyResponse)initWithRequest:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  HMDMediaPropertyResponse *v9;
  HMDMediaPropertyResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaPropertyResponse;
  v9 = -[HMDMediaPropertyResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (HMDMediaPropertyResponse)initWithRequest:(id)a3 value:(id)a4 updatedTime:(id)a5
{
  id v8;
  id v9;
  HMDMediaPropertyResponse *v10;
  HMDMediaPropertyResponse *v11;
  NSDate *valueUpdatedTime;
  NSDate *v13;
  NSDate *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDMediaPropertyResponse;
  v10 = -[HMDMediaPropertyResponse init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a3);
    objc_storeStrong(&v11->_value, a4);
    valueUpdatedTime = v11->_valueUpdatedTime;
    if (valueUpdatedTime)
    {
      v13 = valueUpdatedTime;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v11->_valueUpdatedTime;
    v11->_valueUpdatedTime = v13;

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDMediaPropertyResponse request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPropertyResponse value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPropertyResponse error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MPRes: %@ (val: %@, err: %@)>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDMediaPropertyRequest)request
{
  return self->_request;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSError)error
{
  return self->_error;
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (id)propertyResponsesFromRequests:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
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
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v6, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

+ (id)groupedProfileResponses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "request", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mediaProfile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v7);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v15 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "addObject:", v15);
          objc_msgSend(v12, "uniqueIdentifier");
          v16 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v15;
          v7 = (void *)v16;
        }
        objc_msgSend(v6, "addObject:", v10);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  v17 = (void *)objc_msgSend(v19, "copy");
  return v17;
}

+ (id)serializeResponses:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  id obj;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v3;
  +[HMDMediaPropertyResponse groupedProfileResponses:](HMDMediaPropertyResponse, "groupedProfileResponses:", v3);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v44;
    v32 = *MEMORY[0x24BDD66B8];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(obj);
        v38 = v4;
        v5 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v8)
        {
          v9 = v8;
          v10 = 0;
          v11 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v40 != v11)
                objc_enumerationMutation(v7);
              v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v13, "request");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (!v10)
              {
                objc_msgSend(v14, "mediaProfile");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v13, "error");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                v17 = (void *)MEMORY[0x24BDD1618];
                objc_msgSend(v13, "error");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                objc_msgSend(v13, "value");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v15, "property");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v20);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v9);
        }
        else
        {
          v10 = 0;
        }

        if (objc_msgSend(v6, "count"))
          v21 = v10 == 0;
        else
          v21 = 1;
        if (!v21)
        {
          objc_msgSend(v10, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v10, "mediaSession");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "sessionIdentifier");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)v25;
            if (v25)
              v27 = (void *)v25;
            else
              v27 = v23;
            v28 = v27;

            objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, v32);
            v29 = (void *)objc_msgSend(v6, "copy");
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v29, v23);

          }
        }

        v4 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v37);
  }
  v30 = (void *)objc_msgSend(v33, "copy");

  return v30;
}

+ (id)responsesFromSerializedResponse:(id)a3 requests:(id)a4 home:(id)a5
{
  id v7;
  __int128 v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __int128 v34;
  id obj;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v44 = a4;
  v38 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v36 = v7;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v59;
    *(_QWORD *)&v8 = 138543618;
    v34 = v8;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v59 != v37)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
        objc_msgSend(v38, "mediaProfileWithUUID:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v40 = i;
          objc_msgSend(v36, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v11, "allKeys");
          v41 = (id)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
          if (v47)
          {
            v45 = *(_QWORD *)v55;
            v46 = v11;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v55 != v45)
                  objc_enumerationMutation(v41);
                v48 = v12;
                v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v12);
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v14 = v44;
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v51;
LABEL_14:
                  v18 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v51 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v18);
                    objc_msgSend(v19, "mediaProfile", v34);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "uniqueIdentifier");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v21, "isEqual:", v49) & 1) != 0)
                    {
                      objc_msgSend(v19, "property");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = objc_msgSend(v13, "isEqual:", v22);

                      if ((v23 & 1) != 0)
                      {
                        v24 = v19;

                        if (v24)
                          goto LABEL_26;
                        goto LABEL_25;
                      }
                    }
                    else
                    {

                    }
                    if (v16 == ++v18)
                    {
                      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
                      if (v16)
                        goto LABEL_14;
                      break;
                    }
                  }
                }

LABEL_25:
                +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", v13, v42, v34);
                v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
                v11 = v46;
                objc_msgSend(v46, "errorFromDataForKey:", v13);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", v24, v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v46, "objectForKeyedSubscript:", v13);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v24, v27, v28);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v43, "addObject:", v26);

                v12 = v48 + 1;
              }
              while (v48 + 1 != v47);
              v47 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
            }
            while (v47);
          }

          i = v40;
        }
        else
        {
          v29 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v34;
            v65 = v31;
            v66 = 2112;
            v67 = v10;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@deserializeMediaResponse: Cannot find mediaProfile with identifier %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
        }

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v39);
  }

  +[HMDMediaPropertyResponse groupedProfileResponses:](HMDMediaPropertyResponse, "groupedProfileResponses:", v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)responseWithRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:error:", v7, v6);

  return v8;
}

+ (id)responseWithRequest:(id)a3 value:(id)a4 updatedTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:value:updatedTime:", v10, v9, v8);

  return v11;
}

@end
