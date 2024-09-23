@implementation BMDistributedContextSubscribeMessage

- (BMDistributedContextSubscribeMessage)initWithMessageDictionary:(id)a3 fromRemoteDevice:(id)a4 localDevice:(id)a5
{
  id v8;
  BMDistributedContextSubscribeMessage *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  BMDistributedContextSubscribeMessage *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  BMDistributedContextSubscriptionConfiguration *v42;
  BMDistributedContextSubscription *v43;
  NSArray *subscriptions;
  NSArray *v45;
  uint64_t v46;
  NSString *messageVersion;
  id v49;
  BMDistributedContextSubscribeMessage *v50;
  void *v51;
  id obj;
  uint64_t v53;
  void *v54;
  NSArray *v55;
  id v56;
  id v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v56 = a4;
  v57 = a5;
  v67.receiver = self;
  v67.super_class = (Class)BMDistributedContextSubscribeMessage;
  v9 = -[BMDistributedContextSubscribeMessage init](&v67, sel_init);
  if (!v9)
    goto LABEL_27;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("messageVersion"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("messageVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("messageVersion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("1.0"));

      if ((v15 & 1) == 0)
        goto LABEL_5;
    }
    else
    {

    }
    v49 = a5;
    v50 = v9;
    v55 = (NSArray *)objc_opt_new();
    v58 = (void *)objc_opt_new();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dsls"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v64;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v64 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v22);
          v24 = (void *)MEMORY[0x2199D9B7C](v19);
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dsls"), v49);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSData bmdsl_deserialize](v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKeyedSubscript:", v27, v23);

          objc_autoreleasePoolPop(v24);
          ++v22;
        }
        while (v20 != v22);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        v20 = v19;
      }
      while (v19);
    }

    v51 = v8;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dslIdentifiers"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v57);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v54 = v29;
    objc_msgSend(v29, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v30)
    {
      v31 = v30;
      v53 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v60 != v53)
            objc_enumerationMutation(obj);
          v33 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x2199D9B7C]();
          objc_msgSend(v58, "objectForKeyedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("oneOffSubscription"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "BOOLValue"))
            v38 = 2;
          else
            v38 = 0;
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("wake"), v49);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v38 | objc_msgSend(v39, "BOOLValue");
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("lastChangeDate"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[BMDistributedContextSubscriptionConfiguration initWithOptions:lastChangedDate:]([BMDistributedContextSubscriptionConfiguration alloc], "initWithOptions:lastChangedDate:", v40, v41);
          v43 = -[BMDistributedContextSubscription initWithIdentifier:dsl:subscribingDevice:subscribedDevice:configuration:]([BMDistributedContextSubscription alloc], "initWithIdentifier:dsl:subscribingDevice:subscribedDevice:configuration:", v33, v35, v56, v57, v42);
          -[NSArray addObject:](v55, "addObject:", v43);

          objc_autoreleasePoolPop(v34);
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v31);
    }

    v9 = v50;
    subscriptions = v50->_subscriptions;
    v50->_subscriptions = v55;
    v45 = v55;

    v8 = v51;
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("messageVersion"));
    v46 = objc_claimAutoreleasedReturnValue();
    messageVersion = v50->_messageVersion;
    v50->_messageVersion = (NSString *)v46;

    objc_storeStrong((id *)&v50->_localDevice, v49);
LABEL_27:
    v17 = v9;
    goto LABEL_28;
  }
LABEL_5:
  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[BMDistributedContextSubscribeMessage initWithMessageDictionary:fromRemoteDevice:localDevice:].cold.1(v8);

  v17 = 0;
LABEL_28:

  return v17;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
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
  void *v19;
  void *v20;
  NSArray *obj;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *context;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[3];
  _QWORD v37[3];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v24 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_subscriptions;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v4);
        context = (void *)MEMORY[0x2199D9B7C]();
        objc_msgSend(v5, "subscribedDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          v8 = (void *)objc_opt_new();
          objc_msgSend(v5, "subscribedDevice");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

        }
        v36[0] = CFSTR("lastChangeDate");
        objc_msgSend(v5, "configuration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastChangedDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v27;
        v36[1] = CFSTR("wake");
        objc_msgSend(v5, "configuration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "wakeState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v10;
        v36[2] = CFSTR("oneOffSubscription");
        objc_msgSend(v5, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "oneOffSubscription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subscribedDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v16);

        objc_msgSend(v5, "dsl");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMDSL bmdsl_serialize]((uint64_t)v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, v19);

        objc_autoreleasePoolPop(context);
        ++v4;
      }
      while (v25 != v4);
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v25);
  }

  v34[0] = CFSTR("type");
  v34[1] = CFSTR("messageVersion");
  v35[0] = CFSTR("subscription");
  v35[1] = CFSTR("1.0");
  v34[2] = CFSTR("version");
  v34[3] = CFSTR("dslIdentifiers");
  v35[2] = &unk_24D27BA88;
  v35[3] = v3;
  v34[4] = CFSTR("dsls");
  v35[4] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BMDistributedContextSubscribeMessage)initWithSubscriptions:(id)a3 localDevice:(id)a4 messageIntent:(unint64_t)a5
{
  id v9;
  id v10;
  BMDistributedContextSubscribeMessage *v11;
  BMDistributedContextSubscribeMessage *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)BMDistributedContextSubscribeMessage;
  v11 = -[BMDistributedContextSubscribeMessage init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    v22 = v10;
    objc_storeStrong((id *)&v11->_subscriptions, a3);
    objc_storeStrong((id *)&v12->_localDevice, a4);
    v12->_messageIntent = a5;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "configuration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "wakeState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

          if (v20)
            v12->_shouldWake = 1;
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }

    v10 = v22;
  }

  return v12;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (NSString)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_localDevice, a3);
}

- (NSString)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (unint64_t)messageIntent
{
  return self->_messageIntent;
}

- (void)setMessageIntent:(unint64_t)a3
{
  self->_messageIntent = a3;
}

- (BOOL)shouldWake
{
  return self->_shouldWake;
}

- (void)setShouldWake:(BOOL)a3
{
  self->_shouldWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

- (void)initWithMessageDictionary:(void *)a1 fromRemoteDevice:localDevice:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("messageVersion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_214A1F000, v2, v3, "Incoming subscription is dropped. This message verson is not supported %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

@end
