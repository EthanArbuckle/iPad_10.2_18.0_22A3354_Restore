@implementation BMHomeKitClientAccessoryControlEvent

- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 stringAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMHomeKitClientAccessoryControlEvent *v27;
  BMHomeKitClientAccessoryControlEvent *v28;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v43 = a4;
  v42 = a5;
  v31 = a6;
  v41 = a6;
  v32 = a7;
  v40 = a7;
  v33 = a8;
  v39 = a8;
  v38 = a9;
  v37 = a10;
  v36 = a11;
  v35 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v45.receiver = self;
  v45.super_class = (Class)BMHomeKitClientAccessoryControlEvent;
  v27 = -[BMEventBase init](&v45, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v28->_accessoryUniqueIdentifier, a5);
    objc_storeStrong((id *)&v28->_accessoryStateString, a4);
    objc_storeStrong((id *)&v28->_serviceUniqueIdentifier, v31);
    objc_storeStrong((id *)&v28->_serviceType, v32);
    objc_storeStrong((id *)&v28->_characteristicType, v33);
    objc_storeStrong((id *)&v28->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v28->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v28->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v28->_accessoryName, a12);
    objc_storeStrong((id *)&v28->_serviceName, a13);
    objc_storeStrong((id *)&v28->_roomName, a14);
    objc_storeStrong((id *)&v28->_serviceGroupName, a15);
    objc_storeStrong((id *)&v28->_zoneNames, a16);
    objc_storeStrong((id *)&v28->_homeName, a17);
  }

  return v28;
}

- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 numberAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMHomeKitClientAccessoryControlEvent *v27;
  BMHomeKitClientAccessoryControlEvent *v28;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v43 = a4;
  v42 = a5;
  v31 = a6;
  v41 = a6;
  v32 = a7;
  v40 = a7;
  v33 = a8;
  v39 = a8;
  v38 = a9;
  v37 = a10;
  v36 = a11;
  v35 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v45.receiver = self;
  v45.super_class = (Class)BMHomeKitClientAccessoryControlEvent;
  v27 = -[BMEventBase init](&v45, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v28->_accessoryUniqueIdentifier, a5);
    objc_storeStrong((id *)&v28->_accessoryStateNumber, a4);
    objc_storeStrong((id *)&v28->_serviceUniqueIdentifier, v31);
    objc_storeStrong((id *)&v28->_serviceType, v32);
    objc_storeStrong((id *)&v28->_characteristicType, v33);
    objc_storeStrong((id *)&v28->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v28->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v28->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v28->_accessoryName, a12);
    objc_storeStrong((id *)&v28->_serviceName, a13);
    objc_storeStrong((id *)&v28->_roomName, a14);
    objc_storeStrong((id *)&v28->_serviceGroupName, a15);
    objc_storeStrong((id *)&v28->_zoneNames, a16);
    objc_storeStrong((id *)&v28->_homeName, a17);
  }

  return v28;
}

- (BMHomeKitClientAccessoryControlEvent)initWithBase:(id)a3 dataAccessoryState:(id)a4 accessoryUniqueIdentifier:(id)a5 serviceUniqueIdentifier:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 serviceGroupUniqueIdentifier:(id)a9 zoneUniqueIdentifiers:(id)a10 roomUniqueIdentifier:(id)a11 accessoryName:(id)a12 serviceName:(id)a13 roomName:(id)a14 serviceGroupName:(id)a15 zoneNames:(id)a16 homeName:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMHomeKitClientAccessoryControlEvent *v27;
  BMHomeKitClientAccessoryControlEvent *v28;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v43 = a4;
  v42 = a5;
  v31 = a6;
  v41 = a6;
  v32 = a7;
  v40 = a7;
  v33 = a8;
  v39 = a8;
  v38 = a9;
  v37 = a10;
  v36 = a11;
  v35 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v45.receiver = self;
  v45.super_class = (Class)BMHomeKitClientAccessoryControlEvent;
  v27 = -[BMEventBase init](&v45, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_base, a3);
    objc_storeStrong((id *)&v28->_accessoryUniqueIdentifier, a5);
    objc_storeStrong((id *)&v28->_accessoryStateData, a4);
    objc_storeStrong((id *)&v28->_serviceUniqueIdentifier, v31);
    objc_storeStrong((id *)&v28->_serviceType, v32);
    objc_storeStrong((id *)&v28->_characteristicType, v33);
    objc_storeStrong((id *)&v28->_serviceGroupUniqueIdentifier, a9);
    objc_storeStrong((id *)&v28->_zoneUniqueIdentifiers, a10);
    objc_storeStrong((id *)&v28->_roomUniqueIdentifier, a11);
    objc_storeStrong((id *)&v28->_accessoryName, a12);
    objc_storeStrong((id *)&v28->_serviceName, a13);
    objc_storeStrong((id *)&v28->_roomName, a14);
    objc_storeStrong((id *)&v28->_serviceGroupName, a15);
    objc_storeStrong((id *)&v28->_zoneNames, a16);
    objc_storeStrong((id *)&v28->_homeName, a17);
  }

  return v28;
}

- (NSString)description
{
  return (NSString *)objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("BMHomeKitClientAccessoryControlEvent event with base: %@, accessoryUniqueIdentifier: %@, accessoryStateString: %@, accessoryStateNumber: %@, accessoryStateData: %@, serviceUniqueIdentifier: %@, serviceType: %@, characteristicType: %@, serviceGroupUniqueIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, serviceName: %@, roomName: %@, serviceGroupName: %@, zoneNames: %@, homeName: %@"), self->_base, self->_accessoryUniqueIdentifier, self->_accessoryStateString, self->_accessoryStateNumber, self->_accessoryStateData, self->_serviceUniqueIdentifier, self->_serviceType, self->_characteristicType, self->_serviceGroupUniqueIdentifier, self->_zoneUniqueIdentifiers, self->_roomUniqueIdentifier, self->_accessoryName, self->_serviceName, self->_roomName, self->_serviceGroupName, self->_zoneNames,
                                                       self->_homeName));
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  if (!a4)
  {
    v7 = (objc_class *)a1;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = (objc_class *)BMHomeKitClientAccessoryControlEvent_v1;
LABEL_5:
    v8 = (void *)objc_msgSend([v7 alloc], "initWithProtoData:", v6);
    goto LABEL_9;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[BMHomeKitClientAccessoryControlEvent eventWithData:dataVersion:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMHomeKitClientAccessoryControlEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMHomeKitClientAccessoryControlEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  BMHomeKitClientBase *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BMHomeKitClientAccessoryControlEvent *v19;
  NSObject *v20;
  BMHomeKitClientAccessoryControlEvent *v21;
  BMHomeKitClientBase *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BMHomeKitClientBase *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  BMHomeKitClientBase *v62;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "accessoryState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "valueType");
      if (v7)
      {
        if (v7 == 2)
        {
          v27 = [BMHomeKitClientBase alloc];
          objc_msgSend(v5, "base");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[BMHomeKitClientBase initWithProto:](v27, "initWithProto:");
          v28 = (void *)MEMORY[0x1E0CB37E8];
          v57 = v6;
          objc_msgSend(v6, "numValue");
          objc_msgSend(v28, "numberWithDouble:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessoryUniqueIdentifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceUniqueIdentifier");
          v51 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceType");
          v48 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "characteristicType");
          v45 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceGroupUniqueIdentifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "zoneUniqueIdentifiers");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "roomUniqueIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessoryName");
          v30 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceName");
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "roomName");
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceGroupName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "zoneNames");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "homeName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v32;
          v52 = (void *)v32;
          v53 = (void *)v31;
          v39 = v30;
          v54 = (void *)v30;
          v55 = (void *)v29;
          v36 = v29;
          v16 = (void *)v51;
          v17 = (void *)v48;
          v18 = (void *)v45;
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v36, v39, v31, v42, v13, v14, v15);
        }
        else
        {
          if (v7 != 1)
          {
            v21 = 0;
            goto LABEL_15;
          }
          v8 = [BMHomeKitClientBase alloc];
          objc_msgSend(v5, "base");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[BMHomeKitClientBase initWithProto:](v8, "initWithProto:");
          v57 = v6;
          objc_msgSend(v6, "stringValue");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessoryUniqueIdentifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceUniqueIdentifier");
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceType");
          v46 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "characteristicType");
          v43 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceGroupUniqueIdentifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "zoneUniqueIdentifiers");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "roomUniqueIdentifier");
          v9 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessoryName");
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceName");
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "roomName");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceGroupName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "zoneNames");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "homeName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v12;
          v52 = (void *)v12;
          v53 = (void *)v11;
          v37 = v10;
          v54 = (void *)v10;
          v55 = (void *)v9;
          v34 = v9;
          v16 = (void *)v49;
          v17 = (void *)v46;
          v18 = (void *)v43;
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v34, v37, v11, v40, v13, v14, v15);
        }
      }
      else
      {
        v22 = [BMHomeKitClientBase alloc];
        objc_msgSend(v5, "base");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[BMHomeKitClientBase initWithProto:](v22, "initWithProto:");
        v57 = v6;
        objc_msgSend(v6, "dataValue");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessoryUniqueIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceUniqueIdentifier");
        v50 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceType");
        v47 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "characteristicType");
        v44 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceGroupUniqueIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "zoneUniqueIdentifiers");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "roomUniqueIdentifier");
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessoryName");
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceName");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "roomName");
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceGroupName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "zoneNames");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "homeName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v26;
        v52 = (void *)v26;
        v53 = (void *)v25;
        v38 = v24;
        v54 = (void *)v24;
        v55 = (void *)v23;
        v35 = v23;
        v16 = (void *)v50;
        v17 = (void *)v47;
        v18 = (void *)v44;
        v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v35, v38, v25, v41, v13, v14, v15);
      }
      self = v19;

      v21 = self;
      v6 = v57;
LABEL_15:

      goto LABEL_16;
    }
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BMHomeKitClientAccessoryControlEvent initWithProto:].cold.1();

  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (BMHomeKitClientAccessoryControlEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBHomeKitClientAccessoryControlEvent *v5;
  BMHomeKitClientAccessoryControlEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBHomeKitClientAccessoryControlEvent initWithData:]([BMPBHomeKitClientAccessoryControlEvent alloc], "initWithData:", v4);

    self = -[BMHomeKitClientAccessoryControlEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v3 = (void *)objc_opt_new();
  -[BMHomeKitClientAccessoryControlEvent base](self, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBase:", v5);

  -[BMHomeKitClientAccessoryControlEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessoryUniqueIdentifier:", v6);

  v7 = (void *)objc_opt_new();
  -[BMHomeKitClientAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMHomeKitClientAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v7, "setNumValue:");
    v10 = 2;
LABEL_7:

    objc_msgSend(v7, "setValueType:", v10);
    objc_msgSend(v3, "setAccessoryState:", v7);
    -[BMHomeKitClientAccessoryControlEvent serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceUniqueIdentifier:", v13);

    -[BMHomeKitClientAccessoryControlEvent serviceType](self, "serviceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceType:", v14);

    -[BMHomeKitClientAccessoryControlEvent characteristicType](self, "characteristicType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCharacteristicType:", v15);

    -[BMHomeKitClientAccessoryControlEvent serviceGroupUniqueIdentifier](self, "serviceGroupUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceGroupUniqueIdentifier:", v16);

    v17 = (void *)MEMORY[0x1E0C99DE8];
    -[BMHomeKitClientAccessoryControlEvent zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setZoneUniqueIdentifiers:", v19);

    -[BMHomeKitClientAccessoryControlEvent roomUniqueIdentifier](self, "roomUniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRoomUniqueIdentifier:", v20);

    -[BMHomeKitClientAccessoryControlEvent accessoryName](self, "accessoryName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessoryName:", v21);

    -[BMHomeKitClientAccessoryControlEvent serviceName](self, "serviceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceName:", v22);

    -[BMHomeKitClientAccessoryControlEvent roomName](self, "roomName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRoomName:", v23);

    -[BMHomeKitClientAccessoryControlEvent serviceGroupName](self, "serviceGroupName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setServiceGroupName:", v24);

    v25 = (void *)MEMORY[0x1E0C99DE8];
    -[BMHomeKitClientAccessoryControlEvent zoneNames](self, "zoneNames");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setZoneNames:", v27);

    -[BMHomeKitClientAccessoryControlEvent homeName](self, "homeName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHomeName:", v28);

    v29 = v3;
    goto LABEL_8;
  }
  -[BMHomeKitClientAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[BMHomeKitClientAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStringValue:", v9);
    v10 = 1;
    goto LABEL_7;
  }
  -[BMHomeKitClientAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[BMHomeKitClientAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDataValue:", v9);
    v10 = 0;
    goto LABEL_7;
  }
  __biome_log_for_category();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[BMHomeKitClientAccessoryControlEvent proto].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

  v29 = 0;
LABEL_8:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  char v10;
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
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    -[BMHomeKitClientAccessoryControlEvent base](self, "base");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v8, "base"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMHomeKitClientAccessoryControlEvent base](self, "base");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "base");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v4, "isEqual:", v5);

      if (v9)
      {
LABEL_9:

        -[BMHomeKitClientAccessoryControlEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11
          || (objc_msgSend(v8, "accessoryUniqueIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMHomeKitClientAccessoryControlEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "accessoryUniqueIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v4, "isEqual:", v5);

          if (v11)
          {
LABEL_15:

            -[BMHomeKitClientAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12
              || (objc_msgSend(v8, "accessoryStateString"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[BMHomeKitClientAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "accessoryStateString");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v4, "isEqual:", v5);

              if (v12)
              {
LABEL_21:

                -[BMHomeKitClientAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (v13
                  || (objc_msgSend(v8, "accessoryStateNumber"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[BMHomeKitClientAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
                  v4 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "accessoryStateNumber");
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v4, "isEqual:", v5);

                  if (v13)
                  {
LABEL_27:

                    -[BMHomeKitClientAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v14
                      || (objc_msgSend(v8, "accessoryStateData"),
                          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      -[BMHomeKitClientAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
                      v4 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v8, "accessoryStateData");
                      v5 = (void *)objc_claimAutoreleasedReturnValue();
                      v45 = objc_msgSend(v4, "isEqual:", v5);

                      if (v14)
                      {
LABEL_33:

                        -[BMHomeKitClientAccessoryControlEvent serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
                        v15 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v15
                          || (objc_msgSend(v8, "serviceUniqueIdentifier"),
                              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          -[BMHomeKitClientAccessoryControlEvent serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
                          v4 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v8, "serviceUniqueIdentifier");
                          v5 = (void *)objc_claimAutoreleasedReturnValue();
                          v44 = objc_msgSend(v4, "isEqual:", v5);

                          if (v15)
                          {
LABEL_39:

                            -[BMHomeKitClientAccessoryControlEvent serviceType](self, "serviceType");
                            v16 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v16
                              || (objc_msgSend(v8, "serviceType"),
                                  (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                            {
                              -[BMHomeKitClientAccessoryControlEvent serviceType](self, "serviceType");
                              v4 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v8, "serviceType");
                              v5 = (void *)objc_claimAutoreleasedReturnValue();
                              v43 = objc_msgSend(v4, "isEqual:", v5);

                              if (v16)
                              {
LABEL_45:

                                -[BMHomeKitClientAccessoryControlEvent characteristicType](self, "characteristicType");
                                v17 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v17
                                  || (objc_msgSend(v8, "characteristicType"),
                                      (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                {
                                  -[BMHomeKitClientAccessoryControlEvent characteristicType](self, "characteristicType");
                                  v4 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v8, "characteristicType");
                                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                                  v42 = objc_msgSend(v4, "isEqual:", v5);

                                  if (v17)
                                  {
LABEL_51:

                                    -[BMHomeKitClientAccessoryControlEvent serviceGroupUniqueIdentifier](self, "serviceGroupUniqueIdentifier");
                                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (v18
                                      || (objc_msgSend(v8, "serviceGroupUniqueIdentifier"),
                                          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                    {
                                      -[BMHomeKitClientAccessoryControlEvent serviceGroupUniqueIdentifier](self, "serviceGroupUniqueIdentifier");
                                      v4 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v8, "serviceGroupUniqueIdentifier");
                                      v5 = (void *)objc_claimAutoreleasedReturnValue();
                                      v41 = objc_msgSend(v4, "isEqual:", v5);

                                      if (v18)
                                      {
LABEL_57:

                                        -[BMHomeKitClientAccessoryControlEvent zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
                                        v19 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v19
                                          || (objc_msgSend(v8, "zoneUniqueIdentifiers"),
                                              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                        {
                                          -[BMHomeKitClientAccessoryControlEvent zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
                                          v4 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v8, "zoneUniqueIdentifiers");
                                          v5 = (void *)objc_claimAutoreleasedReturnValue();
                                          v40 = objc_msgSend(v4, "isEqual:", v5);

                                          if (v19)
                                          {
LABEL_63:

                                            -[BMHomeKitClientAccessoryControlEvent roomUniqueIdentifier](self, "roomUniqueIdentifier");
                                            v20 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (v20
                                              || (objc_msgSend(v8, "roomUniqueIdentifier"),
                                                  (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                            {
                                              -[BMHomeKitClientAccessoryControlEvent roomUniqueIdentifier](self, "roomUniqueIdentifier");
                                              v4 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v8, "roomUniqueIdentifier");
                                              v5 = (void *)objc_claimAutoreleasedReturnValue();
                                              v39 = objc_msgSend(v4, "isEqual:", v5);

                                              if (v20)
                                              {
LABEL_69:

                                                -[BMHomeKitClientAccessoryControlEvent accessoryName](self, "accessoryName");
                                                v21 = (void *)objc_claimAutoreleasedReturnValue();
                                                if (v21
                                                  || (objc_msgSend(v8, "accessoryName"),
                                                      (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                                {
                                                  -[BMHomeKitClientAccessoryControlEvent accessoryName](self, "accessoryName");
                                                  v4 = (void *)objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v8, "accessoryName");
                                                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v38 = objc_msgSend(v4, "isEqual:", v5);

                                                  if (v21)
                                                  {
LABEL_75:

                                                    -[BMHomeKitClientAccessoryControlEvent serviceName](self, "serviceName");
                                                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if (v22
                                                      || (objc_msgSend(v8, "serviceName"),
                                                          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                                    {
                                                      -[BMHomeKitClientAccessoryControlEvent serviceName](self, "serviceName");
                                                      v4 = (void *)objc_claimAutoreleasedReturnValue();
                                                      objc_msgSend(v8, "serviceName");
                                                      v5 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v37 = objc_msgSend(v4, "isEqual:", v5);

                                                      if (v22)
                                                      {
LABEL_81:

                                                        -[BMHomeKitClientAccessoryControlEvent roomName](self, "roomName");
                                                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if (v23
                                                          || (objc_msgSend(v8, "roomName"),
                                                              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                                        {
                                                          -[BMHomeKitClientAccessoryControlEvent roomName](self, "roomName");
                                                          v4 = (void *)objc_claimAutoreleasedReturnValue();
                                                          objc_msgSend(v8, "roomName");
                                                          v5 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v24 = objc_msgSend(v4, "isEqual:", v5);

                                                          if (v23)
                                                          {
LABEL_87:

                                                            -[BMHomeKitClientAccessoryControlEvent serviceGroupName](self, "serviceGroupName");
                                                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if (v25
                                                              || (objc_msgSend(v8, "serviceGroupName"),
                                                                  (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                                            {
                                                              -[BMHomeKitClientAccessoryControlEvent serviceGroupName](self, "serviceGroupName");
                                                              v5 = (void *)objc_claimAutoreleasedReturnValue();
                                                              objc_msgSend(v8, "serviceGroupName");
                                                              v26 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v27 = objc_msgSend(v5, "isEqual:", v26);

                                                              if (v25)
                                                              {
LABEL_93:

                                                                -[BMHomeKitClientAccessoryControlEvent zoneNames](self, "zoneNames");
                                                                v28 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (v28
                                                                  || (objc_msgSend(v8, "zoneNames"),
                                                                      (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                                                {
                                                                  -[BMHomeKitClientAccessoryControlEvent zoneNames](self, "zoneNames");
                                                                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  objc_msgSend(v8, "zoneNames");
                                                                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v31 = objc_msgSend(v29, "isEqual:", v30);

                                                                  if (v28)
                                                                  {
LABEL_99:

                                                                    -[BMHomeKitClientAccessoryControlEvent homeName](self, "homeName");
                                                                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if (v32
                                                                      || (objc_msgSend(v8, "homeName"),
                                                                          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                                                    {
                                                                      -[BMHomeKitClientAccessoryControlEvent homeName](self, "homeName");
                                                                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      objc_msgSend(v8, "homeName");
                                                                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v35 = objc_msgSend(v33, "isEqual:", v34);

                                                                      if (v32)
                                                                      {
LABEL_105:

                                                                        v10 = v49 & v48 & v47 & v46 & v45 & v44 & v43 & v42 & v41 & v40 & v39 & v38 & v37 & v24 & v27 & v31 & v35;
                                                                        goto LABEL_106;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v35 = 1;
                                                                    }

                                                                    goto LABEL_105;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v31 = 1;
                                                                }

                                                                goto LABEL_99;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v27 = 1;
                                                            }

                                                            goto LABEL_93;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v24 = 1;
                                                        }

                                                        goto LABEL_87;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v37 = 1;
                                                    }

                                                    goto LABEL_81;
                                                  }
                                                }
                                                else
                                                {
                                                  v38 = 1;
                                                }

                                                goto LABEL_75;
                                              }
                                            }
                                            else
                                            {
                                              v39 = 1;
                                            }

                                            goto LABEL_69;
                                          }
                                        }
                                        else
                                        {
                                          v40 = 1;
                                        }

                                        goto LABEL_63;
                                      }
                                    }
                                    else
                                    {
                                      v41 = 1;
                                    }

                                    goto LABEL_57;
                                  }
                                }
                                else
                                {
                                  v42 = 1;
                                }

                                goto LABEL_51;
                              }
                            }
                            else
                            {
                              v43 = 1;
                            }

                            goto LABEL_45;
                          }
                        }
                        else
                        {
                          v44 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      v45 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  v46 = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              v47 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          v48 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v49 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_106:

  return v10;
}

- (BMHomeKitClientBase)base
{
  return self->_base;
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (NSString)accessoryStateString
{
  return self->_accessoryStateString;
}

- (NSNumber)accessoryStateNumber
{
  return self->_accessoryStateNumber;
}

- (NSData)accessoryStateData
{
  return self->_accessoryStateData;
}

- (NSString)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSString)serviceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier;
}

- (NSArray)zoneUniqueIdentifiers
{
  return self->_zoneUniqueIdentifiers;
}

- (NSString)roomUniqueIdentifier
{
  return self->_roomUniqueIdentifier;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)serviceGroupName
{
  return self->_serviceGroupName;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_serviceGroupName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceGroupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryStateData, 0);
  objc_storeStrong((id *)&self->_accessoryStateNumber, 0);
  objc_storeStrong((id *)&self->_accessoryStateString, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

+ (void)eventWithData:(uint64_t)a3 dataVersion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Mismatched BMHomeKitClientAccessoryControlEvent data versions, cannot deserialize", a5, a6, a7, a8, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBHomeKitClientAccessoryControlEvent proto", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Accessory State value for BMHomeKitClientAccessoryControlEvent is not a supported type, cannot serialize.", a5, a6, a7, a8, 0);
}

@end
