@implementation HMDCharacteristicResponse

- (HMDCharacteristicResponse)initWithRequest:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  HMDCharacteristicResponse *v9;
  HMDCharacteristicResponse *v10;
  void *v11;
  uint64_t v12;
  id value;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDCharacteristicResponse;
  v9 = -[HMDCharacteristicResponse init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    objc_msgSend(v7, "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = (id)v12;

  }
  return v10;
}

- (void)setValue:(id)a3 updatedTime:(id)a4 stateNumber:(id)a5 notificationContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSDate *v15;
  NSDate *valueUpdatedTime;
  id v17;

  v17 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDCharacteristicResponse error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_storeStrong(&self->_value, a3);
    if (v11)
    {
      v15 = (NSDate *)v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    valueUpdatedTime = self->_valueUpdatedTime;
    self->_valueUpdatedTime = v15;

    if (v12)
      objc_storeStrong((id *)&self->_stateNumber, a5);
    objc_storeStrong((id *)&self->_notificationContext, a6);
  }

}

- (id)characteristicUpdateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  -[HMDCharacteristicResponse request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDBD1B8];
  if (v5 && v6)
  {
    v28[0] = CFSTR("kAccessoryUUID");
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v10;
    v28[1] = CFSTR("kServiceInstanceID");
    objc_msgSend(v5, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v11;
    v28[2] = CFSTR("kCharacteristicInstanceID");
    objc_msgSend(v4, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    -[HMDCharacteristicResponse error](self, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD1618];
      -[HMDCharacteristicResponse error](self, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = CFSTR("kCharacteristicErrorDataKey");
    }
    else
    {
      -[HMDCharacteristicResponse value](self, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("kCharacteristicValue"));

      -[HMDCharacteristicResponse valueUpdatedTime](self, "valueUpdatedTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("kCharacteristicValueUpdateTime"));
      }
      else
      {
        objc_msgSend(v4, "lastKnownValueUpdateTime");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("kCharacteristicValueUpdateTime"));

      }
      -[HMDCharacteristicResponse stateNumber](self, "stateNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("kCharacteristicValueUpdateStateNumberKey"));
      }
      else
      {
        objc_msgSend(v4, "stateNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("kCharacteristicValueUpdateStateNumberKey"));

      }
      -[HMDCharacteristicResponse notificationContext](self, "notificationContext");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        objc_msgSend(v4, "notificationContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("kCharacteristicNotificationContextKey"));

        v18 = 0;
        goto LABEL_14;
      }
      v18 = (void *)v25;
      v19 = CFSTR("kCharacteristicNotificationContextKey");
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v19);
LABEL_14:

    v8 = (void *)objc_msgSend(v14, "copy");
  }

  return v8;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[10];

  v48[8] = *MEMORY[0x24BDAC8D0];
  -[HMDCharacteristicResponse request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v47 = v5;
  objc_msgSend(v5, "name");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("(%@/%@)"), v46, v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Accessory"), v44);
  v48[0] = v43;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  v10 = (void *)MEMORY[0x24BDD17C8];
  v42 = v6;
  objc_msgSend(v6, "type");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  shortHAPTypeDescription(v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@/%@)"), v40, v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Service"), v37);
  v48[1] = v36;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  v39 = v4;
  objc_msgSend(v4, "type");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  shortHAPTypeDescription(v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@/%@)"), v34, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Characteristic"), v32);
  v48[2] = v31;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponse request](self, "request");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "previousValue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Previous Value"), v29);
  v48[3] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponse value](self, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Value"), v16);
  v48[4] = v17;
  v18 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponse value](self, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Type"), objc_opt_class());
  v48[5] = v20;
  v21 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponse notificationContext](self, "notificationContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Notification Context"), v22);
  v48[6] = v23;
  v24 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicResponse error](self, "error");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("Error"), v25);
  v48[7] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (HMDCharacteristicRequest)request
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

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (NSData)notificationContext
{
  return self->_notificationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (HMDCharacteristicResponse)responseWithRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:error:", v7, v6);

  return (HMDCharacteristicResponse *)v8;
}

+ (id)responsesWithRequests:(id)a3 error:(id)a4
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (HMDCharacteristicResponse)responseWithRequest:(id)a3 characteristicUpdateDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "errorFromDataForKey:", CFSTR("kCharacteristicErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "responseWithRequest:error:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmf_numberForKey:", CFSTR("kCharacteristicValueUpdateStateNumberKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmf_dateForKey:", CFSTR("kCharacteristicValueUpdateTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmf_dataForKey:", CFSTR("kCharacteristicNotificationContextKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:updatedTime:stateNumber:notificationContext:", v9, v11, v10, v12);

  }
  return (HMDCharacteristicResponse *)v8;
}

+ (id)responsesWithRequests:(id)a3 characteristicUpdateDictionary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v47;
  id obj;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v61;
  void *v62;
  id v63;
  char v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _QWORD v89[4];

  v89[1] = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v5 = a4;
  objc_msgSend(v5, "hmf_dictionaryForKey:", CFSTR("kModifiedCharacteristicsForAccessoryKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "hmf_dictionaryForKey:", CFSTR("kCharacteristicNotificationsKey"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (objc_msgSend(v51, "count") == 1)
      {
        objc_msgSend(v5, "hmf_stringForKey:", CFSTR("kAccessoryUUID"));
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v6 && v7)
        {
          objc_msgSend(v51, "firstObject");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "characteristic");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "accessory");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v6))
          {
            objc_msgSend(v9, "characteristic");
            v14 = v8;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "instanceID");
            v16 = v9;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v17, "isEqualToNumber:", v14);

            v9 = v16;
            v8 = v14;

            if ((v64 & 1) != 0)
            {
              +[HMDCharacteristicResponse responseWithRequest:characteristicUpdateDictionary:](HMDCharacteristicResponse, "responseWithRequest:characteristicUpdateDictionary:", v16, v5);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v89[0] = v18;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_51;
            }
          }
          else
          {

          }
        }

      }
      v6 = v5;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v9, "setNumberStyle:", 1);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (v52)
  {
    v49 = *(_QWORD *)v77;
    v50 = v6;
    v59 = v9;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v77 != v49)
          objc_enumerationMutation(obj);
        v53 = v20;
        v21 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v20);
        objc_msgSend(v6, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
        v24 = v23;

        objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = MEMORY[0x24BDAC760];
        v74[1] = 3221225472;
        v74[2] = __82__HMDCharacteristicResponse_responsesWithRequests_characteristicUpdateDictionary___block_invoke;
        v74[3] = &unk_24E79BA38;
        v74[4] = v21;
        v63 = v25;
        v75 = v63;
        objc_msgSend(v51, "na_each:", v74);
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v56 = v24;
        objc_msgSend(v24, "allKeys");
        v54 = (id)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
        if (v57)
        {
          v55 = *(_QWORD *)v71;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v71 != v55)
                objc_enumerationMutation(v54);
              v58 = v26;
              objc_msgSend(v56, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v26));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v28 = v27;
              else
                v28 = 0;
              v29 = v28;

              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              v62 = v29;
              objc_msgSend(v29, "allKeys");
              v61 = (id)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
              if (v30)
              {
                v31 = v30;
                v65 = *(_QWORD *)v67;
                do
                {
                  for (i = 0; i != v31; ++i)
                  {
                    if (*(_QWORD *)v67 != v65)
                      objc_enumerationMutation(v61);
                    v33 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
                    objc_msgSend(v9, "numberFromString:", v33);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "objectForKey:", v34);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v35)
                    {
                      objc_msgSend(v62, "objectForKeyedSubscript:", v33);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v37 = v36;
                      else
                        v37 = 0;
                      v38 = v37;

                      if (v38)
                      {
                        +[HMDCharacteristicResponse responseWithRequest:characteristicUpdateDictionary:](HMDCharacteristicResponse, "responseWithRequest:characteristicUpdateDictionary:", v35, v38);
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v8, "addObject:", v39);

                      }
                      else
                      {
                        v40 = v8;
                        v41 = (void *)MEMORY[0x227676638]();
                        v42 = a1;
                        HMFGetOSLogHandle();
                        v43 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                        {
                          HMFGetLogIdentifier();
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v62, "objectForKeyedSubscript:", v33);
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          v81 = v44;
                          v82 = 2112;
                          v83 = v35;
                          v84 = 2112;
                          v85 = v45;
                          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristic update for request: %@. Update Dict: %@", buf, 0x20u);

                        }
                        objc_autoreleasePoolPop(v41);
                        v8 = v40;
                        v9 = v59;
                      }

                    }
                  }
                  v31 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
                }
                while (v31);
              }

              v26 = v58 + 1;
            }
            while (v58 + 1 != v57);
            v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
          }
          while (v57);
        }

        v20 = v53 + 1;
        v6 = v50;
      }
      while (v53 + 1 != v52);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    }
    while (v52);
  }

  v19 = (void *)objc_msgSend(v8, "copy");
  v5 = v47;
LABEL_51:

  return v19;
}

void __82__HMDCharacteristicResponse_responsesWithRequests_characteristicUpdateDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v11, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "instanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, v10);

  }
}

@end
