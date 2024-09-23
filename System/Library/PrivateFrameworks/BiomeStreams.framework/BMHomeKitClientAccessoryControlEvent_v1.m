@implementation BMHomeKitClientAccessoryControlEvent_v1

- (BMHomeKitClientAccessoryControlEvent_v1)initWithProto:(id)a3
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
  BMHomeKitClientAccessoryControlEvent_v1 *v19;
  NSObject *v20;
  BMHomeKitClientAccessoryControlEvent_v1 *v21;
  BMHomeKitClientBase *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BMHomeKitClientBase *v28;
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
      switch(v7)
      {
        case 3:
          v22 = [BMHomeKitClientBase alloc];
          objc_msgSend(v5, "base");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[BMHomeKitClientBase initWithProto:](v22, "initWithProto:");
          v23 = (void *)MEMORY[0x1E0CB37E8];
          v57 = v6;
          objc_msgSend(v6, "numValue");
          objc_msgSend(v23, "numberWithDouble:");
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
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessoryName");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceName");
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "roomName");
          v27 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "serviceGroupName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "zoneNames");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "homeName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v27;
          v52 = (void *)v27;
          v53 = (void *)v26;
          v38 = v25;
          v54 = (void *)v25;
          v55 = (void *)v24;
          v35 = v24;
          v16 = (void *)v50;
          v17 = (void *)v47;
          v18 = (void *)v44;
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v35, v38, v26, v41, v13, v14, v15);
          break;
        case 2:
          v28 = [BMHomeKitClientBase alloc];
          objc_msgSend(v5, "base");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[BMHomeKitClientBase initWithProto:](v28, "initWithProto:");
          v57 = v6;
          objc_msgSend(v6, "stringValue");
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
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v36, v39, v31, v42, v13, v14, v15);
          break;
        case 1:
          v8 = [BMHomeKitClientBase alloc];
          objc_msgSend(v5, "base");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[BMHomeKitClientBase initWithProto:](v8, "initWithProto:");
          v57 = v6;
          objc_msgSend(v6, "dataValue");
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
          v19 = -[BMHomeKitClientAccessoryControlEvent initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:](self, "initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v62, v61, v60, v59, v58, v34, v37, v11, v40, v13, v14, v15);
          break;
        default:
          v21 = 0;
          goto LABEL_15;
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

@end
