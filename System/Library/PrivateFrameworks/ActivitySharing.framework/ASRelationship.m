@implementation ASRelationship

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  -[ASRelationship systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (objc_msgSend(v7, "recordID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "zoneID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqual:", v6),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if (ASSecureCloudEnabled())
    {
      v12 = objc_alloc(MEMORY[0x24BDB91E8]);
      -[ASRelationship UUID](self, "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "initWithRecordName:zoneID:", v14, v6);

      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ActivitySharingRelationship"), v15);
      v8 = (void *)v15;
    }
    else
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:zoneID:", CFSTR("ActivitySharingRelationship"), v6);
    }

    v8 = (void *)v16;
  }
  -[ASRelationship populateRecord:recordEncryptionType:](self, "populateRecord:recordEncryptionType:", v8, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)populateRecord:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  _ASUpdateSchemaVersionOnRecord(3, v6, a4);
  -[ASRelationship remoteActivityDataShareID](self, "remoteActivityDataShareID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[ASRelationship cloudType](self, "cloudType");

    if (!v9)
    {
      v10 = objc_alloc(MEMORY[0x24BDB9218]);
      -[ASRelationship remoteActivityDataShareID](self, "remoteActivityDataShareID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithRecordID:action:", v11, 0);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("RemoteActivityDataShareReference"));

    }
  }
  -[ASRelationship remoteRelationshipShareID](self, "remoteRelationshipShareID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = -[ASRelationship cloudType](self, "cloudType");

    if (!v15)
    {
      v16 = objc_alloc(MEMORY[0x24BDB9218]);
      -[ASRelationship remoteRelationshipShareID](self, "remoteRelationshipShareID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithRecordID:action:", v17, 0);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("RemoteRelationshipShareReference"));

    }
  }
  if (ASSecureCloudEnabled())
  {
    -[ASRelationship remoteRelationshipZoneShareID](self, "remoteRelationshipZoneShareID");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = -[ASRelationship cloudType](self, "cloudType");

      if (v21 == 1)
      {
        v22 = objc_alloc(MEMORY[0x24BDB9218]);
        -[ASRelationship remoteRelationshipZoneShareID](self, "remoteRelationshipZoneShareID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithRecordID:action:", v23, 0);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("RemoteRelationshipZoneShareReference"));

      }
    }
  }
  -[ASRelationship codableRelationship](self, "codableRelationship");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encryptedValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("EncryptedData"));

  return v6;
}

- (ASCodableCloudKitRelationship)codableRelationship
{
  ASCodableCloudKitRelationship *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ASCodableCloudKitRelationship);
  -[ASRelationship UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dataForUUIDBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setUuid:](v3, "setUuid:", v5);

  -[ASRelationship incomingHandshakeToken](self, "incomingHandshakeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setIncomingHandshakeToken:](v3, "setIncomingHandshakeToken:", v6);

  -[ASRelationship outgoingHandshakeToken](self, "outgoingHandshakeToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setOutgoingHandshakeToken:](v3, "setOutgoingHandshakeToken:", v7);

  -[ASRelationship cloudKitAddress](self, "cloudKitAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setCloudKitAddress:](v3, "setCloudKitAddress:", v8);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[ASRelationship addresses](self, "addresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        -[ASCodableCloudKitRelationship addAddresses:](v3, "addAddresses:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  -[ASRelationship preferredReachableAddress](self, "preferredReachableAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setPreferredReachableAddress:](v3, "setPreferredReachableAddress:", v14);

  -[ASRelationship preferredReachableService](self, "preferredReachableService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setPreferredReachableService:](v3, "setPreferredReachableService:", v15);

  -[ASRelationship relationshipEvents](self, "relationshipEvents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setEventCount:](v3, "setEventCount:", objc_msgSend(v16, "count"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[ASRelationship relationshipEvents](self, "relationshipEvents", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v21), "_codableRelationshipEvent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCodableCloudKitRelationship addEvents:](v3, "addEvents:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v19);
  }

  -[ASCodableCloudKitRelationship setSupportedPhoneFeatures:](v3, "setSupportedPhoneFeatures:", -[ASRelationship supportedPhoneFeatures](self, "supportedPhoneFeatures"));
  -[ASCodableCloudKitRelationship setSupportedWatchFeatures:](v3, "setSupportedWatchFeatures:", -[ASRelationship supportedWatchFeatures](self, "supportedWatchFeatures"));
  -[ASCodableCloudKitRelationship setCloudType:](v3, "setCloudType:", -[ASRelationship cloudType](self, "cloudType"));
  -[ASRelationship secureCloudUpgradeToken](self, "secureCloudUpgradeToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship setSecureCloudUpgradeToken:](v3, "setSecureCloudUpgradeToken:", v23);

  -[ASRelationship sentInvitation](self, "sentInvitation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD1618];
    -[ASRelationship sentInvitation](self, "sentInvitation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCodableCloudKitRelationship setSentInvitation:](v3, "setSentInvitation:", v27);

  }
  -[ASRelationship receivedInvitation](self, "receivedInvitation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x24BDD1618];
    -[ASRelationship receivedInvitation](self, "receivedInvitation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCodableCloudKitRelationship setReceivedInvitation:](v3, "setReceivedInvitation:", v31);

  }
  return v3;
}

+ (void)_relationshipWithRecord:(id)a3 relationshipEventRecords:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, id);
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  void (**v68)(id, _QWORD, id);
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  ASCodableCloudKitRelationship *v76;
  void *v77;
  id obj;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  id v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = _ASCloudKitSchemaVersionForRecord(v7);
  if ((unint64_t)(v10 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v7, "encryptedValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EncryptedData"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    if (!v14)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.2();
      v9[2](v9, 0, v8);
      goto LABEL_53;
    }
    v76 = -[ASCodableCloudKitRelationship initWithData:]([ASCodableCloudKitRelationship alloc], "initWithData:", v14);
    +[ASRelationship relationshipWithCodableRelationship:version:](ASRelationship, "relationshipWithCodableRelationship:version:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RemoteActivityDataShareReference"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    v72 = v17;
    objc_msgSend(v17, "recordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRemoteActivityDataShareID:", v18);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RemoteRelationshipShareReference"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    v71 = v20;
    objc_msgSend(v20, "recordID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRemoteRelationshipShareID:", v21);

    objc_msgSend(v7, "share");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recordID");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v15;
    v25 = (void *)v23;
    v77 = v24;
    objc_msgSend(v24, "setRelationshipShareID:", v23);

    if (ASSecureCloudEnabled())
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RelationshipZoneShareReference"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v28 = v14;

      objc_msgSend(v27, "recordID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setRelationshipZoneShareID:", v29);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RemoteRelationshipZoneShareReference"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;

      objc_msgSend(v31, "recordID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setRemoteRelationshipZoneShareID:", v32);

      v14 = v28;
    }
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v7, "encodeSystemFieldsWithCoder:", v33);
    objc_msgSend(v33, "finishEncoding");
    v34 = objc_alloc(MEMORY[0x24BDD1620]);
    v74 = v33;
    objc_msgSend(v33, "encodedData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    v36 = objc_msgSend(v34, "initForReadingFromData:error:", v35, &v86);
    v37 = v86;

    v75 = v37;
    if (v37)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.5();
    }
    v73 = (void *)v36;
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithCoder:", v36);
    v39 = v77;
    objc_msgSend(v77, "setSystemFieldsOnlyRecord:", v38);

    v40 = -[ASCodableCloudKitRelationship eventCount](v76, "eventCount");
    v41 = v40;
    if (v10 == 2)
    {
      v70 = v40;
      v67 = v14;
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v69 = v8;
      obj = v8;
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      v68 = v9;
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v81;
        v50 = (void *)MEMORY[0x24BDBD1A8];
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v81 != v53)
              objc_enumerationMutation(obj);
            v55 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            objc_msgSend(v55, "parent");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "recordID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v7;
            objc_msgSend(v7, "recordID");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v57, "isEqual:", v59);

            if (v60)
            {
              +[ASRelationshipEvent relationshipEventWithRecord:](ASRelationshipEvent, "relationshipEventWithRecord:", v55);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "arrayByAddingObject:", v61);
              v62 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v79, "setByAddingObject:", v55);
              v63 = objc_claimAutoreleasedReturnValue();

              v50 = (void *)v62;
              v79 = (void *)v63;
            }
            v7 = v58;
          }
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
        }
        while (v52);
      }
      else
      {
        v50 = (void *)MEMORY[0x24BDBD1A8];
      }

      objc_msgSend(v77, "setRelationshipEvents:", v50);
      objc_msgSend(v77, "relationshipEvents");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "count");

      if (v70 != v65)
      {
        ASLoggingInitialize();
        v66 = (void *)ASLogCloudKit;
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.3(v66, v77);
      }
      v9 = v68;
      ((void (**)(id, void *, id))v68)[2](v68, v77, v79);

      v8 = v69;
      v14 = v67;
      v44 = v71;
      v43 = v72;
    }
    else
    {
      v42 = v10 == 3;
      v44 = v71;
      v43 = v72;
      if (!v42)
        goto LABEL_52;
      objc_msgSend(v77, "relationshipEvents");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v41;
      v47 = objc_msgSend(v45, "count");

      if (v46 != v47)
      {
        ASLoggingInitialize();
        v48 = (void *)ASLogCloudKit;
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.3(v48, v77);
      }
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __101__ASRelationship_CloudKitCodingSupport___relationshipWithRecord_relationshipEventRecords_completion___block_invoke;
      v84[3] = &unk_24D057118;
      v85 = v7;
      objc_msgSend(v8, "objectsPassingTest:", v84);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, id))v9)[2](v9, v77, v49);

      v50 = v85;
    }

    v39 = v77;
LABEL_52:

LABEL_53:
    goto LABEL_54;
  }
  ASLoggingInitialize();
  v11 = ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
    +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.1(v10, v11);
  v9[2](v9, 0, v8);
LABEL_54:

}

uint64_t __101__ASRelationship_CloudKitCodingSupport___relationshipWithRecord_relationshipEventRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

+ (id)relationshipWithCodableRelationship:(id)a3 version:(int64_t)a4
{
  id v5;
  ASRelationship *v6;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  ASRelationship *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[4];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(ASRelationship);
  -[ASRelationship setVersion:](v6, "setVersion:", a4);
  v7 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_UUIDWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setUUID:](v6, "setUUID:", v9);

  objc_msgSend(v5, "incomingHandshakeToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setIncomingHandshakeToken:](v6, "setIncomingHandshakeToken:", v10);

  objc_msgSend(v5, "outgoingHandshakeToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setOutgoingHandshakeToken:](v6, "setOutgoingHandshakeToken:", v11);

  objc_msgSend(v5, "cloudKitAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setCloudKitAddress:](v6, "setCloudKitAddress:", v12);

  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "addresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setAddresses:](v6, "setAddresses:", v15);

  objc_msgSend(v5, "preferredReachableAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setPreferredReachableAddress:](v6, "setPreferredReachableAddress:", v16);

  objc_msgSend(v5, "preferredReachableService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v6;
  -[ASRelationship setPreferredReachableService:](v6, "setPreferredReachableService:", v17);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "events");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    v22 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v24;
          +[ASRelationshipEvent _relationshipEventWithCodable:](ASRelationshipEvent, "_relationshipEventWithCodable:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "arrayByAddingObject:", v26);
          v27 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v27;
        }
        else
        {
          ASLoggingInitialize();
          v28 = (void *)ASLogCloudKit;
          if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
            +[ASRelationship(CloudKitCodingSupport) relationshipWithCodableRelationship:version:].cold.1(v42, v28, (uint64_t)v24, &v43);
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v20);
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDBD1A8];
  }

  -[ASRelationship setRelationshipEvents:](v37, "setRelationshipEvents:", v22);
  -[ASRelationship setSupportedPhoneFeatures:](v37, "setSupportedPhoneFeatures:", objc_msgSend(v5, "supportedPhoneFeatures"));
  -[ASRelationship setSupportedWatchFeatures:](v37, "setSupportedWatchFeatures:", objc_msgSend(v5, "supportedWatchFeatures"));
  -[ASRelationship setCloudType:](v37, "setCloudType:", objc_msgSend(v5, "cloudType"));
  objc_msgSend(v5, "secureCloudUpgradeToken");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setSecureCloudUpgradeToken:](v37, "setSecureCloudUpgradeToken:", v29);

  v30 = (objc_class *)objc_opt_class();
  objc_msgSend(v5, "sentInvitation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  ASSecureUnarchiveClassWithData(v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setSentInvitation:](v37, "setSentInvitation:", v32);

  v33 = (objc_class *)objc_opt_class();
  objc_msgSend(v5, "receivedInvitation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  ASSecureUnarchiveClassWithData(v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship setReceivedInvitation:](v37, "setReceivedInvitation:", v35);

  return v37;
}

+ (id)relationshipsWithRelationshipAndEventRecords:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  id obj;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectsPassingTest:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(v3, "objectsPassingTest:", &__block_literal_global_330);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v19[0] = v10;
        v19[1] = 3221225472;
        v19[2] = __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke_3;
        v19[3] = &unk_24D0571A0;
        v20 = v5;
        v21 = v6;
        +[ASRelationship _relationshipWithRecord:relationshipEventRecords:completion:](ASRelationship, "_relationshipWithRecord:relationshipEventRecords:completion:", v12, v18, v19);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v13, "removeObjectsInArray:", v6);
  if (objc_msgSend(v13, "count"))
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[ASRelationship(CloudKitCodingSupport) relationshipsWithRelationshipAndEventRecords:].cold.1();
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ActivitySharingRelationship"));

  return v3;
}

uint64_t __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ActivitySharingRelationshipEvent"));

  return v3;
}

void __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v7, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

}

- (id)codableRelationshipContainerIncludingCloudKitFields:(BOOL)a3
{
  _BOOL4 v3;
  ASCodableRelationshipContainer *v5;
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

  v3 = a3;
  v5 = objc_alloc_init(ASCodableRelationshipContainer);
  -[ASRelationship codableRelationship](self, "codableRelationship");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableRelationshipContainer setRelationship:](v5, "setRelationship:", v6);

  -[ASCodableRelationshipContainer setVersion:](v5, "setVersion:", -[ASRelationship version](self, "version"));
  if (v3)
  {
    -[ASRelationship systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD1618];
      -[ASRelationship systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCodableRelationshipContainer setSystemFieldsOnlyRecord:](v5, "setSystemFieldsOnlyRecord:", v10);

    }
    -[ASRelationship relationshipShareID](self, "relationshipShareID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD1618];
      -[ASRelationship relationshipShareID](self, "relationshipShareID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCodableRelationshipContainer setRelationshipShareID:](v5, "setRelationshipShareID:", v14);

    }
    -[ASRelationship remoteRelationshipShareID](self, "remoteRelationshipShareID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD1618];
      -[ASRelationship remoteRelationshipShareID](self, "remoteRelationshipShareID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCodableRelationshipContainer setRemoteRelationshipShareID:](v5, "setRemoteRelationshipShareID:", v18);

    }
    -[ASRelationship remoteActivityDataShareID](self, "remoteActivityDataShareID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDD1618];
      -[ASRelationship remoteActivityDataShareID](self, "remoteActivityDataShareID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCodableRelationshipContainer setRemoteActivityShareID:](v5, "setRemoteActivityShareID:", v22);

    }
    if (ASSecureCloudEnabled() && v3)
    {
      -[ASRelationship relationshipZoneShareID](self, "relationshipZoneShareID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x24BDD1618];
        -[ASRelationship relationshipZoneShareID](self, "relationshipZoneShareID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "archivedDataWithRootObject:requiringSecureCoding:error:", v25, 1, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCodableRelationshipContainer setRelationshipZoneShareID:](v5, "setRelationshipZoneShareID:", v26);

      }
      -[ASRelationship remoteRelationshipZoneShareID](self, "remoteRelationshipZoneShareID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)MEMORY[0x24BDD1618];
        -[ASRelationship remoteRelationshipZoneShareID](self, "remoteRelationshipZoneShareID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "archivedDataWithRootObject:requiringSecureCoding:error:", v29, 1, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCodableRelationshipContainer setRemoteRelationshipZoneShareID:](v5, "setRemoteRelationshipZoneShareID:", v30);

      }
    }
  }
  else
  {
    ASSecureCloudEnabled();
  }
  return v5;
}

+ (id)relationshipWithCodableRelationshipContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "relationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASRelationship relationshipWithCodableRelationship:version:](ASRelationship, "relationshipWithCodableRelationship:version:", v4, objc_msgSend(v3, "version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "systemFieldsOnlyRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ASSecureUnarchiveClassWithDataAndStrictness(v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemFieldsOnlyRecord:", v8);

  v9 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "relationshipShareID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ASSecureUnarchiveClassWithDataAndStrictness(v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipShareID:", v11);

  v12 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "remoteRelationshipShareID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ASSecureUnarchiveClassWithDataAndStrictness(v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteRelationshipShareID:", v14);

  v15 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "remoteActivityShareID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ASSecureUnarchiveClassWithDataAndStrictness(v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteActivityDataShareID:", v17);

  if (ASSecureCloudEnabled())
  {
    v18 = (objc_class *)objc_opt_class();
    objc_msgSend(v3, "relationshipZoneShareID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ASSecureUnarchiveClassWithDataAndStrictness(v18, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRelationshipZoneShareID:", v20);

    v21 = (objc_class *)objc_opt_class();
    objc_msgSend(v3, "remoteRelationshipZoneShareID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ASSecureUnarchiveClassWithDataAndStrictness(v21, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteRelationshipZoneShareID:", v23);

  }
  return v5;
}

- (ASRelationship)initWithIdentifier:(id)a3 cloudType:(unint64_t)a4
{
  id v7;
  ASRelationship *v8;
  ASRelationship *v9;
  NSArray *relationshipEvents;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRelationship;
  v8 = -[ASRelationship init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    relationshipEvents = v8->_relationshipEvents;
    v8->_relationshipEvents = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_storeStrong((id *)&v9->_UUID, a3);
    v9->_supportedPhoneFeatures = ASSupportedPhoneFeaturesForCurrentDevice();
    v9->_supportedWatchFeatures = ASSupportedWatchFeaturesForCurrentDevice();
    v9->_cloudType = a4;
  }

  return v9;
}

- (ASRelationship)init
{
  void *v3;
  ASRelationship *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASRelationship initWithIdentifier:cloudType:](self, "initWithIdentifier:cloudType:", v3, 0);

  return v4;
}

- (NSString)secureCloudZoneName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("RelationshipZone-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 48) = self->_version;
  objc_storeStrong((id *)(v5 + 56), self->_UUID);
  objc_storeStrong((id *)(v5 + 72), self->_outgoingHandshakeToken);
  objc_storeStrong((id *)(v5 + 64), self->_incomingHandshakeToken);
  objc_storeStrong((id *)(v5 + 80), self->_cloudKitAddress);
  v6 = -[NSSet copyWithZone:](self->_addresses, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  objc_storeStrong((id *)(v5 + 96), self->_preferredReachableAddress);
  objc_storeStrong((id *)(v5 + 104), self->_preferredReachableService);
  objc_storeStrong((id *)(v5 + 112), self->_systemFieldsOnlyRecord);
  objc_storeStrong((id *)(v5 + 120), self->_relationshipShareID);
  objc_storeStrong((id *)(v5 + 128), self->_remoteRelationshipShareID);
  objc_storeStrong((id *)(v5 + 136), self->_remoteActivityDataShareID);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_relationshipEvents, 0);
  v9 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v8;

  *(_DWORD *)(v5 + 40) = self->_supportedPhoneFeatures;
  *(_DWORD *)(v5 + 44) = self->_supportedWatchFeatures;
  *(_QWORD *)(v5 + 152) = self->_cloudType;
  objc_storeStrong((id *)(v5 + 160), self->_relationshipZoneShareID);
  objc_storeStrong((id *)(v5 + 168), self->_remoteRelationshipZoneShareID);
  objc_storeStrong((id *)(v5 + 192), self->_secureCloudUpgradeToken);
  objc_storeStrong((id *)(v5 + 176), self->_sentInvitation);
  objc_storeStrong((id *)(v5 + 184), self->_receivedInvitation);
  objc_msgSend((id)v5, "_updateCurrentRelationshipState");
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  ASRelationship *v4;
  BOOL v5;

  v4 = (ASRelationship *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ASRelationship isEqualToRelationship:](self, "isEqualToRelationship:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRelationship:(id)a3
{
  id v4;
  int64_t version;
  unsigned int supportedPhoneFeatures;
  unsigned int supportedWatchFeatures;
  NSUUID *UUID;
  void *v9;
  NSString *incomingHandshakeToken;
  void *v11;
  NSString *outgoingHandshakeToken;
  void *v13;
  NSString *cloudKitAddress;
  void *v15;
  NSString *preferredReachableAddress;
  void *v17;
  NSString *preferredReachableService;
  void *v19;
  void *v20;
  void *v21;
  CKRecordID *relationshipShareID;
  CKRecordID *remoteRelationshipShareID;
  CKRecordID *remoteActivityDataShareID;
  NSArray *relationshipEvents;
  unint64_t cloudType;
  CKRecordID *relationshipZoneShareID;
  CKRecordID *remoteRelationshipZoneShareID;
  NSString *secureCloudUpgradeToken;
  IDSSentInvitation *sentInvitation;
  IDSReceivedInvitation *receivedInvitation;
  void *v32;
  char v33;
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

  v4 = a3;
  version = self->_version;
  if (version == objc_msgSend(v4, "version")
    && (supportedPhoneFeatures = self->_supportedPhoneFeatures,
        supportedPhoneFeatures == objc_msgSend(v4, "supportedPhoneFeatures"))
    && (supportedWatchFeatures = self->_supportedWatchFeatures,
        supportedWatchFeatures == objc_msgSend(v4, "supportedWatchFeatures")))
  {
    UUID = self->_UUID;
    objc_msgSend(v4, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (ASObjectsAreEqual(UUID, v9))
    {
      incomingHandshakeToken = self->_incomingHandshakeToken;
      objc_msgSend(v4, "incomingHandshakeToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (ASStringsAreEqual(incomingHandshakeToken, v11))
      {
        outgoingHandshakeToken = self->_outgoingHandshakeToken;
        objc_msgSend(v4, "outgoingHandshakeToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (ASStringsAreEqual(outgoingHandshakeToken, v13))
        {
          cloudKitAddress = self->_cloudKitAddress;
          objc_msgSend(v4, "cloudKitAddress");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (ASStringsAreEqual(cloudKitAddress, v15))
          {
            preferredReachableAddress = self->_preferredReachableAddress;
            objc_msgSend(v4, "preferredReachableAddress");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (ASStringsAreEqual(preferredReachableAddress, v17))
            {
              preferredReachableService = self->_preferredReachableService;
              objc_msgSend(v4, "preferredReachableService");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (ASStringsAreEqual(preferredReachableService, v19))
              {
                -[CKRecord recordID](self->_systemFieldsOnlyRecord, "recordID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "systemFieldsOnlyRecord");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "recordID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (ASObjectsAreEqual(v20, v21))
                {
                  v42 = v20;
                  relationshipShareID = self->_relationshipShareID;
                  objc_msgSend(v4, "relationshipShareID");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  if (ASObjectsAreEqual(relationshipShareID, v43))
                  {
                    remoteRelationshipShareID = self->_remoteRelationshipShareID;
                    objc_msgSend(v4, "remoteRelationshipShareID");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (ASObjectsAreEqual(remoteRelationshipShareID, v41))
                    {
                      remoteActivityDataShareID = self->_remoteActivityDataShareID;
                      objc_msgSend(v4, "remoteActivityDataShareID");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      if (ASObjectsAreEqual(remoteActivityDataShareID, v40))
                      {
                        relationshipEvents = self->_relationshipEvents;
                        objc_msgSend(v4, "relationshipEvents");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        if (-[NSArray isEqualToArray:](relationshipEvents, "isEqualToArray:")
                          && (cloudType = self->_cloudType, cloudType == objc_msgSend(v4, "cloudType")))
                        {
                          relationshipZoneShareID = self->_relationshipZoneShareID;
                          objc_msgSend(v4, "relationshipZoneShareID");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          if (ASObjectsAreEqual(relationshipZoneShareID, v38))
                          {
                            remoteRelationshipZoneShareID = self->_remoteRelationshipZoneShareID;
                            objc_msgSend(v4, "remoteRelationshipZoneShareID");
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            if (ASObjectsAreEqual(remoteRelationshipZoneShareID, v37))
                            {
                              secureCloudUpgradeToken = self->_secureCloudUpgradeToken;
                              objc_msgSend(v4, "secureCloudUpgradeToken");
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              if (ASStringsAreEqual(secureCloudUpgradeToken, v36))
                              {
                                sentInvitation = self->_sentInvitation;
                                objc_msgSend(v4, "sentInvitation");
                                v35 = (void *)objc_claimAutoreleasedReturnValue();
                                if (ASObjectsAreEqual(sentInvitation, v35))
                                {
                                  receivedInvitation = self->_receivedInvitation;
                                  objc_msgSend(v4, "receivedInvitation", v35, v36, v37, v38);
                                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                                  v33 = ASObjectsAreEqual(receivedInvitation, v32);

                                }
                                else
                                {
                                  v33 = 0;
                                }

                              }
                              else
                              {
                                v33 = 0;
                              }

                            }
                            else
                            {
                              v33 = 0;
                            }

                          }
                          else
                          {
                            v33 = 0;
                          }

                        }
                        else
                        {
                          v33 = 0;
                        }

                      }
                      else
                      {
                        v33 = 0;
                      }
                      v20 = v42;

                    }
                    else
                    {
                      v33 = 0;
                      v20 = v42;
                    }

                  }
                  else
                  {
                    v33 = 0;
                    v20 = v42;
                  }

                }
                else
                {
                  v33 = 0;
                }

              }
              else
              {
                v33 = 0;
              }

            }
            else
            {
              v33 = 0;
            }

          }
          else
          {
            v33 = 0;
          }

        }
        else
        {
          v33 = 0;
        }

      }
      else
      {
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *cloudKitAddress;
  NSString *preferredReachableAddress;
  uint64_t supportedPhoneFeatures;
  uint64_t supportedWatchFeatures;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;

  _MostRecentEventsWithCount(self->_relationshipEvents, 8uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v13 = *(_OWORD *)&self->_version;
  cloudKitAddress = self->_cloudKitAddress;
  preferredReachableAddress = self->_preferredReachableAddress;
  supportedPhoneFeatures = self->_supportedPhoneFeatures;
  supportedWatchFeatures = self->_supportedWatchFeatures;
  -[CKRecord recordChangeTag](self->_systemFieldsOnlyRecord, "recordChangeTag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromASCloudType(self->_cloudType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Relationship v%ld uuid=%@ cloudKitAddress=[%@], preferredAddress=[%@], supportedFeatures=[iOS:%d, wOS:%d] recent events=%@, etag=%@, cloud type=%@"), v13, cloudKitAddress, preferredReachableAddress, supportedPhoneFeatures, supportedWatchFeatures, v3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)fullDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _MostRecentEventsWithCount(self->_relationshipEvents, 0xFuLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v4, "appendFormat:", CFSTR("Relationship v%ld %@ (%@)\n"), self->_version, self->_cloudKitAddress, self->_UUID);
  objc_msgSend(v4, "appendFormat:", CFSTR("CloudKit Address: %@\n"), self->_cloudKitAddress);
  objc_msgSend(v4, "appendFormat:", CFSTR("Preferred Reachable Address: %@\n"), self->_preferredReachableAddress);
  objc_msgSend(v4, "appendFormat:", CFSTR("Preferred Service Identifier: %@\n"), self->_preferredReachableService);
  objc_msgSend(v4, "appendFormat:", CFSTR("All Addresses: %@\n"), self->_addresses);
  objc_msgSend(v4, "appendFormat:", CFSTR("Incoming Handshake Token: %@\n"), self->_incomingHandshakeToken);
  objc_msgSend(v4, "appendFormat:", CFSTR("Outgoing Handshake Token: %@\n"), self->_outgoingHandshakeToken);
  NSStringFromASCloudType(self->_cloudType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Cloud Type: %@\n"), v5);

  objc_msgSend(v4, "appendFormat:", CFSTR("Sent Invitation: %@\n"), self->_sentInvitation);
  objc_msgSend(v4, "appendFormat:", CFSTR("Received Invitation: %@\n"), self->_receivedInvitation);
  -[CKRecord recordID](self->_systemFieldsOnlyRecord, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecord recordChangeTag](self->_systemFieldsOnlyRecord, "recordChangeTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Record: %@, etag %@\n"), v6, v7);

  objc_msgSend(v4, "appendFormat:", CFSTR("Remote Zone Share ID: %@\n"), self->_remoteRelationshipZoneShareID);
  objc_msgSend(v4, "appendFormat:", CFSTR("Events: %@\n"), v3);
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (BOOL)isActivityDataVisible
{
  return (self->_isFriendshipActive || self->_hasOutgoingInviteRequest || self->_sentInviteResponse)
      && !self->_isHidingActivityData;
}

- (BOOL)hasInviteRequestEvent
{
  return -[ASRelationship hasOutgoingInviteRequest](self, "hasOutgoingInviteRequest")
      || -[ASRelationship hasIncomingInviteRequest](self, "hasIncomingInviteRequest");
}

- (void)setRelationshipEvents:(id)a3
{
  id v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASRelationship _setRelationshipEvents:](self, "_setRelationshipEvents:", v4);

}

- (void)insertEventWithType:(unsigned __int16)a3
{
  uint64_t v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASRelationship insertEventWithType:timestamp:](self, "insertEventWithType:timestamp:", v3, v5);

}

- (void)insertEventWithType:(unsigned __int16)a3 timestamp:(id)a4
{
  uint64_t v4;
  id v6;
  ASRelationshipEvent *v7;
  void *v8;
  _QWORD v9[2];

  v4 = a3;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[ASRelationshipEvent initWithType:anchor:timestamp:]([ASRelationshipEvent alloc], "initWithType:anchor:timestamp:", v4, (unsigned __int16)-[ASRelationship _nextAnchor](self, "_nextAnchor"), v6);

  v9[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationship insertEvents:](self, "insertEvents:", v8);

}

- (void)insertEvents:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  int v46;
  void *v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[4];
  void *v58;
  uint8_t v59[128];
  __int128 buf;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  ASLoggingInitialize();
  v4 = ASLogRelationships;
  if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21381F000, v4, OS_LOG_TYPE_DEFAULT, "Inserting events: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  -[NSArray arrayByAddingObjectsFromArray:](self->_relationshipEvents, "arrayByAddingObjectsFromArray:", v3, v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v40)
  {
    v43 = 0;
    v46 = 0;
    v48 = 0;
    v47 = 0;
    v39 = *(_QWORD *)v50;
    v44 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v50 != v39)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v5);
        v7 = objc_msgSend(v6, "type") == 4 || objc_msgSend(v6, "type") == 104;
        v42 = v7;
        v8 = objc_msgSend(v6, "type") == 8 || objc_msgSend(v6, "type") == 9;
        v45 = v8;
        v9 = objc_msgSend(v6, "type");
        v10 = objc_msgSend(v6, "type") == 10
           || objc_msgSend(v6, "type") == 105
           || objc_msgSend(v6, "type") == 12
           || objc_msgSend(v6, "type") == 11
           || objc_msgSend(v6, "type") == 106
           || objc_msgSend(v6, "type") == 14
           || objc_msgSend(v6, "type") == 13;
        v11 = objc_msgSend(v6, "type");
        if (v47)
        {
          v12 = objc_msgSend(v6, "type");
          v41 = v12 == objc_msgSend(v47, "type");
        }
        else
        {
          v41 = 0;
        }
        if (v48 & 1 | !v10)
        {
          v13 = 1;
        }
        else
        {
          v14 = objc_msgSend(v6, "type");
          v15 = v44;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, &buf, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v54;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v54 != v18)
                  objc_enumerationMutation(v16);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "type") == v14)
                {
                  v13 = 1;
                  goto LABEL_36;
                }
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, &buf, 16);
              if (v17)
                continue;
              break;
            }
          }
          v13 = 0;
LABEL_36:

        }
        v20 = v46;
        if (!((v9 == 15) & BYTE4(v43) | (v10 & v48 | v45 & v43 | v41) & 1 | v46 & v13 & 1))
        {
          v21 = v11 == 14;
          v22 = v6;

          objc_msgSend(v44, "arrayByAddingObject:", v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v20 = v46;
          LODWORD(v43) = v43 | v45;
          v48 |= v21;
          BYTE4(v43) |= v9 == 15;
          v47 = v22;
          v44 = (void *)v23;
        }
        v46 = v42 | v20;
        ++v5;
      }
      while (v5 != v40);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      v40 = v24;
    }
    while (v24);
  }
  else
  {
    v47 = 0;
    v44 = (void *)MEMORY[0x24BDBD1A8];
  }

  objc_msgSend(v44, "reverseObjectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  v64 = (id)MEMORY[0x24BDBD1A8];
  *(_QWORD *)&v53 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v53 + 1) = 3221225472;
  *(_QWORD *)&v54 = ___ConsolidatedEvents_block_invoke;
  *((_QWORD *)&v54 + 1) = &unk_24D057518;
  *(_QWORD *)&v55 = &buf;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", &v53);
  v27 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
  if (v27 != objc_msgSend(v37, "count"))
  {
    ASLoggingInitialize();
    v28 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_21381F000, v28, OS_LOG_TYPE_DEFAULT, "Consolidation updated event count", v57, 2u);
    }
    ASLoggingInitialize();
    v29 = (id)ASLogRelationships;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      _MostRecentEventsWithCount(v37, 0xAuLL);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138412290;
      v58 = v30;
      _os_log_impl(&dword_21381F000, v29, OS_LOG_TYPE_DEFAULT, "Previous events: %@", v57, 0xCu);

    }
    ASLoggingInitialize();
    v31 = (id)ASLogRelationships;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      _MostRecentEventsWithCount(*(void **)(*((_QWORD *)&buf + 1) + 40), 0xAuLL);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138412290;
      v58 = v32;
      _os_log_impl(&dword_21381F000, v31, OS_LOG_TYPE_DEFAULT, "New events: %@", v57, 0xCu);

    }
  }
  v33 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  -[ASRelationship _setRelationshipEvents:](self, "_setRelationshipEvents:", v33);
}

- (NSDate)timestampForMostRecentRelationshipEvent
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSArray firstObject](self->_relationshipEvents, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_relationshipEvents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "timestamp", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "compare:", v4);

        if (v12 == 1)
        {
          objc_msgSend(v10, "timestamp");
          v13 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v13;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return (NSDate *)v4;
}

- (id)relationshipSnapshotForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)-[ASRelationship copy](self, "copy");
  objc_msgSend(v5, "relationshipEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1758];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = ___EventsPriorToDate_block_invoke;
  v12[3] = &unk_24D057490;
  v13 = v4;
  v8 = v4;
  objc_msgSend(v7, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRelationshipEvents:", v10);
  return v5;
}

- (void)traverseRelationshipHistoryStartingAtEventWithAnchor:(unint64_t)a3 block:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  NSArray *relationshipEvents;
  void *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = (void (**)(id, void *))a4;
  if (-[ASRelationship currentRelationshipEventAnchor](self, "currentRelationshipEventAnchor") >= a3)
  {
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v8 = (void *)-[ASRelationship copy](self, "copy");
      relationshipEvents = self->_relationshipEvents;
      ++a3;
      v10 = (void *)MEMORY[0x24BDD1758];
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = ___EventsPriorToAnchor_block_invoke;
      v14[3] = &__block_descriptor_40_e46_B24__0__ASRelationshipEvent_8__NSDictionary_16l;
      v14[4] = a3;
      v11 = relationshipEvents;
      objc_msgSend(v10, "predicateWithBlock:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray filteredArrayUsingPredicate:](v11, "filteredArrayUsingPredicate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setRelationshipEvents:", v13);
      v6[2](v6, v8);

    }
    while (a3 <= -[ASRelationship currentRelationshipEventAnchor](self, "currentRelationshipEventAnchor"));
  }

}

- (unint64_t)currentRelationshipEventAnchor
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_relationshipEvents;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "anchor", (_QWORD)v10);
        if (v5 <= v8)
          v5 = v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsCompetitions
{
  if ((self->_supportedPhoneFeatures & 1) != 0)
    return 1;
  else
    return self->_supportedWatchFeatures & 1;
}

- (void)_setRelationshipEvents:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipEvents, a3);
  -[ASRelationship _updateCurrentRelationshipState](self, "_updateCurrentRelationshipState");
}

- (unint64_t)_nextAnchor
{
  return -[ASRelationship currentRelationshipEventAnchor](self, "currentRelationshipEventAnchor") + 1;
}

- (void)_clearRelationshipState
{
  NSDate *dateForLatestOutgoingInviteRequest;
  NSDate *dateForLatestDataHidden;
  NSDate *dateForLatestRelationshipStart;
  NSDate *dateForLatestRelationshipEnd;
  NSDate *dateActivityDataInitiallyBecameVisible;
  NSDate *dateForLatestIncomingCompetitionRequest;
  NSDate *dateForLatestOutgoingCompetitionRequest;
  NSDate *dateForLatestIgnoredCompetitionRequest;
  NSDate *dateForLatestUpgradeCompleted;
  NSDate *dateForLatestUpgradeFailure;
  NSDate *dateForLatestOutgoingUpgradeRequest;
  NSDate *dateForLatestIncomingUpgradeRequest;
  NSDate *dateForLatestMigrationStarted;
  NSDate *dateForLatestMigrationCompleted;
  NSDate *dateForLatestMigrationFailed;
  NSDate *dateForLatestInviteRequestEvent;
  NSDate *dateForLatestRepairRequest;
  NSDate *dateForLatestDowngradeCompleted;

  self->_isHidingActivityData = 0;
  *(_QWORD *)&self->_isFriendshipActive = 0;
  *(_DWORD *)&self->_hasOutgoingCompetitionRequest = 0;
  dateForLatestOutgoingInviteRequest = self->_dateForLatestOutgoingInviteRequest;
  self->_dateForLatestOutgoingInviteRequest = 0;

  dateForLatestDataHidden = self->_dateForLatestDataHidden;
  self->_dateForLatestDataHidden = 0;

  dateForLatestRelationshipStart = self->_dateForLatestRelationshipStart;
  self->_dateForLatestRelationshipStart = 0;

  dateForLatestRelationshipEnd = self->_dateForLatestRelationshipEnd;
  self->_dateForLatestRelationshipEnd = 0;

  dateActivityDataInitiallyBecameVisible = self->_dateActivityDataInitiallyBecameVisible;
  self->_dateActivityDataInitiallyBecameVisible = 0;

  dateForLatestIncomingCompetitionRequest = self->_dateForLatestIncomingCompetitionRequest;
  self->_dateForLatestIncomingCompetitionRequest = 0;

  dateForLatestOutgoingCompetitionRequest = self->_dateForLatestOutgoingCompetitionRequest;
  self->_dateForLatestOutgoingCompetitionRequest = 0;

  dateForLatestIgnoredCompetitionRequest = self->_dateForLatestIgnoredCompetitionRequest;
  self->_dateForLatestIgnoredCompetitionRequest = 0;

  *(_QWORD *)&self->_secureCloudUpgradeAvailable = 0;
  *(_QWORD *)&self->_secureCloudDowngradeRequested = 0;
  *(_DWORD *)&self->_secureCloudNeedsRepair = 0;
  dateForLatestUpgradeCompleted = self->_dateForLatestUpgradeCompleted;
  self->_dateForLatestUpgradeCompleted = 0;

  dateForLatestUpgradeFailure = self->_dateForLatestUpgradeFailure;
  self->_dateForLatestUpgradeFailure = 0;

  dateForLatestOutgoingUpgradeRequest = self->_dateForLatestOutgoingUpgradeRequest;
  self->_dateForLatestOutgoingUpgradeRequest = 0;

  dateForLatestIncomingUpgradeRequest = self->_dateForLatestIncomingUpgradeRequest;
  self->_dateForLatestIncomingUpgradeRequest = 0;

  dateForLatestMigrationStarted = self->_dateForLatestMigrationStarted;
  self->_dateForLatestMigrationStarted = 0;

  dateForLatestMigrationCompleted = self->_dateForLatestMigrationCompleted;
  self->_dateForLatestMigrationCompleted = 0;

  dateForLatestMigrationFailed = self->_dateForLatestMigrationFailed;
  self->_dateForLatestMigrationFailed = 0;

  dateForLatestInviteRequestEvent = self->_dateForLatestInviteRequestEvent;
  self->_dateForLatestInviteRequestEvent = 0;

  dateForLatestRepairRequest = self->_dateForLatestRepairRequest;
  self->_dateForLatestRepairRequest = 0;

  dateForLatestDowngradeCompleted = self->_dateForLatestDowngradeCompleted;
  self->_dateForLatestDowngradeCompleted = 0;

}

- (void)_updateDateActivityDataBecameVisibleWithDate:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_dateActivityDataInitiallyBecameVisible)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dateActivityDataInitiallyBecameVisible, a3);
    v5 = v6;
  }

}

- (void)_updateDateFriendshipBeganWithDate:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_dateForLatestRelationshipStart)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dateForLatestRelationshipStart, a3);
    v5 = v6;
  }

}

- (void)_updateCurrentRelationshipState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  NSDate *v13;
  NSDate *dateForLatestInviteRequestEvent;
  NSDate *v15;
  NSDate *dateForLatestOutgoingInviteRequest;
  NSDate *v17;
  NSDate *dateForLatestRelationshipEnd;
  NSDate *v19;
  NSDate *v20;
  NSDate *v21;
  NSDate *dateForLatestIncomingInviteRequest;
  NSDate *v23;
  NSDate *v24;
  NSDate *v25;
  NSDate *v26;
  NSDate *v27;
  NSDate *dateForLatestOutgoingCompetitionRequest;
  NSDate *v29;
  NSDate *v30;
  NSDate *v31;
  NSDate *v32;
  NSDate *v33;
  NSDate *v34;
  NSDate *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSDate *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[ASRelationship _clearRelationshipState](self, "_clearRelationshipState");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = self->_relationshipEvents;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type", (_QWORD)v42);
        if (v12 <= 199)
        {
          switch(v12)
          {
            case 1:
LABEL_10:
              objc_msgSend(v11, "timestamp");
              v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestInviteRequestEvent = self->_dateForLatestInviteRequestEvent;
              self->_dateForLatestInviteRequestEvent = v13;

              self->_hasOutgoingInviteRequest = 1;
              objc_msgSend(v11, "timestamp");
              v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestOutgoingInviteRequest = self->_dateForLatestOutgoingInviteRequest;
              self->_dateForLatestOutgoingInviteRequest = v15;

              goto LABEL_50;
            case 2:
              *(_WORD *)&self->_isAwaitingInviteResponse = 256;
LABEL_50:
              objc_msgSend(v11, "timestamp");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[ASRelationship _updateDateActivityDataBecameVisibleWithDate:](self, "_updateDateActivityDataBecameVisibleWithDate:", v40);

              continue;
            case 3:
LABEL_15:
              -[ASRelationship _clearRelationshipState](self, "_clearRelationshipState");
              continue;
            case 4:
LABEL_16:
              -[ASRelationship _clearRelationshipState](self, "_clearRelationshipState");
              objc_msgSend(v11, "timestamp");
              v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestRelationshipEnd;
              self->_dateForLatestRelationshipEnd = v23;
              goto LABEL_52;
            case 5:
              self->_isHidingActivityData = 1;
              objc_msgSend(v11, "timestamp");
              v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestDataHidden;
              self->_dateForLatestDataHidden = v25;
              goto LABEL_52;
            case 6:
              self->_isHidingActivityData = 0;
              continue;
            case 7:
              self->_hasIncomingInviteRequest = 0;
              self->_isAwaitingInviteResponse = 0;
              continue;
            case 8:
              self->_isMuteEnabled = 1;
              continue;
            case 9:
              self->_isMuteEnabled = 0;
              continue;
            case 10:
              self->_hasOutgoingCompetitionRequest = 1;
              self->_isAwaitingCompetitionResponse = 1;
              self->_hasCompletedCompetition = 0;
              objc_msgSend(v11, "timestamp");
              v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestOutgoingCompetitionRequest;
              self->_dateForLatestOutgoingCompetitionRequest = v26;
              goto LABEL_52;
            case 11:
LABEL_17:
              *(_WORD *)&self->_isAwaitingCompetitionResponse = 256;
              continue;
            case 12:
              self->_hasIncomingCompetitionRequest = 0;
              self->_hasIgnoredCompetitionRequest = 1;
              objc_msgSend(v11, "timestamp");
              v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestIgnoredCompetitionRequest;
              self->_dateForLatestIgnoredCompetitionRequest = v27;
              goto LABEL_52;
            case 13:
              continue;
            case 14:
              *(_WORD *)&self->_hasIncomingCompetitionRequest = 0;
              self->_hasCompletedCompetition = 1;
              *(_WORD *)&self->_isAwaitingCompetitionResponse = 0;
              dateForLatestOutgoingCompetitionRequest = self->_dateForLatestOutgoingCompetitionRequest;
              self->_dateForLatestOutgoingCompetitionRequest = 0;

              dateForLatestRelationshipEnd = self->_dateForLatestIncomingCompetitionRequest;
              self->_dateForLatestIncomingCompetitionRequest = 0;
LABEL_52:

              break;
            default:
              switch(v12)
              {
                case 'd':
LABEL_14:
                  objc_msgSend(v11, "timestamp");
                  v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  v20 = self->_dateForLatestInviteRequestEvent;
                  self->_dateForLatestInviteRequestEvent = v19;

                  self->_hasIncomingInviteRequest = 1;
                  objc_msgSend(v11, "timestamp");
                  v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dateForLatestIncomingInviteRequest = self->_dateForLatestIncomingInviteRequest;
                  self->_dateForLatestIncomingInviteRequest = v21;

                  self->_isAwaitingInviteResponse = 1;
                  break;
                case 'f':
                  goto LABEL_15;
                case 'g':
                  self->_isFriendshipActive = 1;
                  *(_DWORD *)&self->_hasIncomingInviteRequest = 0;
                  objc_msgSend(v11, "timestamp");
                  v36 = v3;
                  v37 = v4;
                  v38 = v2;
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ASRelationship _updateDateFriendshipBeganWithDate:](self, "_updateDateFriendshipBeganWithDate:", v39);

                  v2 = v38;
                  v4 = v37;
                  v3 = v36;
                  goto LABEL_50;
                case 'h':
                  goto LABEL_16;
                case 'i':
                  self->_hasIncomingCompetitionRequest = 1;
                  self->_hasCompletedCompetition = 0;
                  self->_hasIgnoredCompetitionRequest = 0;
                  objc_msgSend(v11, "timestamp");
                  v41 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dateForLatestRelationshipEnd = self->_dateForLatestIncomingCompetitionRequest;
                  self->_dateForLatestIncomingCompetitionRequest = v41;
                  goto LABEL_52;
                case 'j':
                  goto LABEL_17;
                default:
                  continue;
              }
              break;
          }
        }
        else
        {
          switch(v12)
          {
            case 200:
              goto LABEL_10;
            case 201:
              self->_secureCloudUpgradeAvailable = 1;
              continue;
            case 202:
              self->_secureCloudUpgradeAvailable = 0;
              continue;
            case 203:
              self->_secureCloudUpgradeFailed = 0;
              self->_hasOutgoingSecureCloudUpgradeRequest = 1;
              objc_msgSend(v11, "timestamp");
              v29 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestOutgoingUpgradeRequest;
              self->_dateForLatestOutgoingUpgradeRequest = v29;
              goto LABEL_52;
            case 204:
LABEL_18:
              *(_DWORD *)&self->_hasOutgoingSecureCloudUpgradeRequest = 0x1000000;
              objc_msgSend(v11, "timestamp");
              v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestUpgradeFailure;
              self->_dateForLatestUpgradeFailure = v24;
              goto LABEL_52;
            case 205:
              *(_DWORD *)&self->_secureCloudMigrationAvailable = 1;
              self->_secureCloudDowngradeAcknowledged = 0;
              continue;
            case 206:
              *(_WORD *)&self->_secureCloudMigrationStarted = 1;
              self->_secureCloudDowngradeCompleted = 0;
              objc_msgSend(v11, "timestamp");
              v31 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestMigrationStarted;
              self->_dateForLatestMigrationStarted = v31;
              goto LABEL_52;
            case 207:
              *(_WORD *)&self->_secureCloudMigrationStarted = 0;
              objc_msgSend(v11, "timestamp");
              v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestMigrationFailed;
              self->_dateForLatestMigrationFailed = v32;
              goto LABEL_52;
            case 208:
              self->_secureCloudMigrationAvailable = 0;
              self->_secureCloudDowngradeRequested = 1;
              continue;
            case 209:
              *(_WORD *)&self->_secureCloudDowngradeStarted = 1;
              goto LABEL_39;
            case 210:
              *(_WORD *)&self->_secureCloudDowngradeStarted = 256;
LABEL_39:
              self->_secureCloudDowngradeCompleted = 0;
              break;
            case 211:
              self->_secureCloudDowngradeNeedsAcknowledgement = 1;
              break;
            case 212:
              *(_WORD *)&self->_secureCloudDowngradeNeedsAcknowledgement = 256;
              break;
            case 213:
              *(_WORD *)&self->_secureCloudDowngradeNeedsAcknowledgement = 0;
              break;
            case 214:
              self->_secureCloudNeedsZoneDeletion = 1;
              break;
            case 215:
              *(_WORD *)&self->_secureCloudNeedsZoneDeletion = 256;
              break;
            case 216:
              self->_hasOutgoingSecureCloudRepairRequest = 1;
              objc_msgSend(v11, "timestamp");
              v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
              dateForLatestRelationshipEnd = self->_dateForLatestRepairRequest;
              self->_dateForLatestRepairRequest = v30;
              goto LABEL_52;
            case 217:
              self->_secureCloudRepairFailed = 1;
              *(_WORD *)&self->_hasOutgoingSecureCloudRepairRequest = 0;
              break;
            case 218:
              *(_DWORD *)&self->_secureCloudNeedsRepair = 0;
              break;
            default:
              switch(v12)
              {
                case 300:
                  goto LABEL_14;
                case 301:
                  self->_secureCloudUpgradeFailed = 0;
                  self->_hasIncomingSecureCloudUpgradeRequest = 1;
                  objc_msgSend(v11, "timestamp");
                  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dateForLatestRelationshipEnd = self->_dateForLatestIncomingUpgradeRequest;
                  self->_dateForLatestIncomingUpgradeRequest = v17;
                  goto LABEL_52;
                case 302:
                  goto LABEL_18;
                case 303:
                  *(_DWORD *)&self->_hasOutgoingSecureCloudUpgradeRequest = 0x10000;
                  objc_msgSend(v11, "timestamp");
                  v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dateForLatestRelationshipEnd = self->_dateForLatestUpgradeCompleted;
                  self->_dateForLatestUpgradeCompleted = v33;
                  goto LABEL_52;
                case 304:
                  self->_secureCloudDowngradeAcknowledged = 0;
                  self->_secureCloudDowngradeCompleted = 0;
                  *(_DWORD *)&self->_secureCloudMigrationAvailable = 0x10000;
                  objc_msgSend(v11, "timestamp");
                  v34 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dateForLatestRelationshipEnd = self->_dateForLatestMigrationCompleted;
                  self->_dateForLatestMigrationCompleted = v34;
                  goto LABEL_52;
                case 305:
                  self->_secureCloudMigrationAvailable = 0;
                  *(_WORD *)&self->_secureCloudMigrationCompleted = 0;
                  *(_DWORD *)&self->_secureCloudDowngradeAcknowledged = 0x1000000;
                  objc_msgSend(v11, "timestamp");
                  v35 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dateForLatestRelationshipEnd = self->_dateForLatestDowngradeCompleted;
                  self->_dateForLatestDowngradeCompleted = v35;
                  goto LABEL_52;
                case 306:
                  self->_hasIncomingSecureCloudRepairRequest = 1;
                  break;
                default:
                  continue;
              }
              break;
          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v8);
  }

}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)incomingHandshakeToken
{
  return self->_incomingHandshakeToken;
}

- (void)setIncomingHandshakeToken:(id)a3
{
  objc_storeStrong((id *)&self->_incomingHandshakeToken, a3);
}

- (NSString)outgoingHandshakeToken
{
  return self->_outgoingHandshakeToken;
}

- (void)setOutgoingHandshakeToken:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingHandshakeToken, a3);
}

- (NSString)cloudKitAddress
{
  return self->_cloudKitAddress;
}

- (void)setCloudKitAddress:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitAddress, a3);
}

- (NSSet)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (NSString)preferredReachableAddress
{
  return self->_preferredReachableAddress;
}

- (void)setPreferredReachableAddress:(id)a3
{
  objc_storeStrong((id *)&self->_preferredReachableAddress, a3);
}

- (NSString)preferredReachableService
{
  return self->_preferredReachableService;
}

- (void)setPreferredReachableService:(id)a3
{
  objc_storeStrong((id *)&self->_preferredReachableService, a3);
}

- (CKRecord)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, a3);
}

- (CKRecordID)relationshipShareID
{
  return self->_relationshipShareID;
}

- (void)setRelationshipShareID:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipShareID, a3);
}

- (CKRecordID)remoteRelationshipShareID
{
  return self->_remoteRelationshipShareID;
}

- (void)setRemoteRelationshipShareID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRelationshipShareID, a3);
}

- (CKRecordID)remoteActivityDataShareID
{
  return self->_remoteActivityDataShareID;
}

- (void)setRemoteActivityDataShareID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteActivityDataShareID, a3);
}

- (NSArray)relationshipEvents
{
  return self->_relationshipEvents;
}

- (unsigned)supportedPhoneFeatures
{
  return self->_supportedPhoneFeatures;
}

- (void)setSupportedPhoneFeatures:(unsigned int)a3
{
  self->_supportedPhoneFeatures = a3;
}

- (unsigned)supportedWatchFeatures
{
  return self->_supportedWatchFeatures;
}

- (void)setSupportedWatchFeatures:(unsigned int)a3
{
  self->_supportedWatchFeatures = a3;
}

- (unint64_t)cloudType
{
  return self->_cloudType;
}

- (void)setCloudType:(unint64_t)a3
{
  self->_cloudType = a3;
}

- (CKRecordID)relationshipZoneShareID
{
  return self->_relationshipZoneShareID;
}

- (void)setRelationshipZoneShareID:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipZoneShareID, a3);
}

- (CKRecordID)remoteRelationshipZoneShareID
{
  return self->_remoteRelationshipZoneShareID;
}

- (void)setRemoteRelationshipZoneShareID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRelationshipZoneShareID, a3);
}

- (IDSSentInvitation)sentInvitation
{
  return self->_sentInvitation;
}

- (void)setSentInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_sentInvitation, a3);
}

- (IDSReceivedInvitation)receivedInvitation
{
  return self->_receivedInvitation;
}

- (void)setReceivedInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_receivedInvitation, a3);
}

- (BOOL)secureCloudUpgradeAvailable
{
  return self->_secureCloudUpgradeAvailable;
}

- (void)setSecureCloudUpgradeAvailable:(BOOL)a3
{
  self->_secureCloudUpgradeAvailable = a3;
}

- (BOOL)hasOutgoingSecureCloudUpgradeRequest
{
  return self->_hasOutgoingSecureCloudUpgradeRequest;
}

- (void)setHasOutgoingSecureCloudUpgradeRequest:(BOOL)a3
{
  self->_hasOutgoingSecureCloudUpgradeRequest = a3;
}

- (BOOL)hasIncomingSecureCloudUpgradeRequest
{
  return self->_hasIncomingSecureCloudUpgradeRequest;
}

- (void)setHasIncomingSecureCloudUpgradeRequest:(BOOL)a3
{
  self->_hasIncomingSecureCloudUpgradeRequest = a3;
}

- (BOOL)secureCloudUpgradeCompleted
{
  return self->_secureCloudUpgradeCompleted;
}

- (void)setSecureCloudUpgradeCompleted:(BOOL)a3
{
  self->_secureCloudUpgradeCompleted = a3;
}

- (BOOL)secureCloudUpgradeFailed
{
  return self->_secureCloudUpgradeFailed;
}

- (void)setSecureCloudUpgradeFailed:(BOOL)a3
{
  self->_secureCloudUpgradeFailed = a3;
}

- (BOOL)secureCloudMigrationAvailable
{
  return self->_secureCloudMigrationAvailable;
}

- (void)setSecureCloudMigrationAvailable:(BOOL)a3
{
  self->_secureCloudMigrationAvailable = a3;
}

- (BOOL)secureCloudMigrationStarted
{
  return self->_secureCloudMigrationStarted;
}

- (void)setSecureCloudMigrationStarted:(BOOL)a3
{
  self->_secureCloudMigrationStarted = a3;
}

- (BOOL)secureCloudMigrationCompleted
{
  return self->_secureCloudMigrationCompleted;
}

- (void)setSecureCloudMigrationCompleted:(BOOL)a3
{
  self->_secureCloudMigrationCompleted = a3;
}

- (BOOL)secureCloudDowngradeRequested
{
  return self->_secureCloudDowngradeRequested;
}

- (void)setSecureCloudDowngradeRequested:(BOOL)a3
{
  self->_secureCloudDowngradeRequested = a3;
}

- (BOOL)secureCloudDowngradeNeedsAcknowledgement
{
  return self->_secureCloudDowngradeNeedsAcknowledgement;
}

- (void)setSecureCloudDowngradeNeedsAcknowledgement:(BOOL)a3
{
  self->_secureCloudDowngradeNeedsAcknowledgement = a3;
}

- (BOOL)secureCloudDowngradeAcknowledged
{
  return self->_secureCloudDowngradeAcknowledged;
}

- (void)setSecureCloudDowngradeAcknowledged:(BOOL)a3
{
  self->_secureCloudDowngradeAcknowledged = a3;
}

- (BOOL)secureCloudDowngradeStarted
{
  return self->_secureCloudDowngradeStarted;
}

- (void)setSecureCloudDowngradeStarted:(BOOL)a3
{
  self->_secureCloudDowngradeStarted = a3;
}

- (BOOL)secureCloudDowngradeFailed
{
  return self->_secureCloudDowngradeFailed;
}

- (void)setSecureCloudDowngradeFailed:(BOOL)a3
{
  self->_secureCloudDowngradeFailed = a3;
}

- (BOOL)secureCloudDowngradeCompleted
{
  return self->_secureCloudDowngradeCompleted;
}

- (void)setSecureCloudDowngradeCompleted:(BOOL)a3
{
  self->_secureCloudDowngradeCompleted = a3;
}

- (BOOL)secureCloudNeedsZoneDeletion
{
  return self->_secureCloudNeedsZoneDeletion;
}

- (void)setSecureCloudNeedsZoneDeletion:(BOOL)a3
{
  self->_secureCloudNeedsZoneDeletion = a3;
}

- (BOOL)secureCloudNeedsRepair
{
  return self->_secureCloudNeedsRepair;
}

- (void)setSecureCloudNeedsRepair:(BOOL)a3
{
  self->_secureCloudNeedsRepair = a3;
}

- (BOOL)hasOutgoingSecureCloudRepairRequest
{
  return self->_hasOutgoingSecureCloudRepairRequest;
}

- (void)setHasOutgoingSecureCloudRepairRequest:(BOOL)a3
{
  self->_hasOutgoingSecureCloudRepairRequest = a3;
}

- (BOOL)hasIncomingSecureCloudRepairRequest
{
  return self->_hasIncomingSecureCloudRepairRequest;
}

- (void)setHasIncomingSecureCloudRepairRequest:(BOOL)a3
{
  self->_hasIncomingSecureCloudRepairRequest = a3;
}

- (BOOL)secureCloudRepairFailed
{
  return self->_secureCloudRepairFailed;
}

- (void)setSecureCloudRepairFailed:(BOOL)a3
{
  self->_secureCloudRepairFailed = a3;
}

- (NSString)secureCloudUpgradeToken
{
  return self->_secureCloudUpgradeToken;
}

- (void)setSecureCloudUpgradeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)dateForLatestUpgradeFailure
{
  return self->_dateForLatestUpgradeFailure;
}

- (void)setDateForLatestUpgradeFailure:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestUpgradeFailure, a3);
}

- (NSDate)dateForLatestOutgoingUpgradeRequest
{
  return self->_dateForLatestOutgoingUpgradeRequest;
}

- (void)setDateForLatestOutgoingUpgradeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestOutgoingUpgradeRequest, a3);
}

- (NSDate)dateForLatestIncomingUpgradeRequest
{
  return self->_dateForLatestIncomingUpgradeRequest;
}

- (void)setDateForLatestIncomingUpgradeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestIncomingUpgradeRequest, a3);
}

- (NSDate)dateForLatestUpgradeCompleted
{
  return self->_dateForLatestUpgradeCompleted;
}

- (void)setDateForLatestUpgradeCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestUpgradeCompleted, a3);
}

- (NSDate)dateForLatestMigrationStarted
{
  return self->_dateForLatestMigrationStarted;
}

- (void)setDateForLatestMigrationStarted:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestMigrationStarted, a3);
}

- (NSDate)dateForLatestMigrationCompleted
{
  return self->_dateForLatestMigrationCompleted;
}

- (void)setDateForLatestMigrationCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestMigrationCompleted, a3);
}

- (NSDate)dateForLatestMigrationFailed
{
  return self->_dateForLatestMigrationFailed;
}

- (void)setDateForLatestMigrationFailed:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestMigrationFailed, a3);
}

- (NSDate)dateForLatestInviteRequestEvent
{
  return self->_dateForLatestInviteRequestEvent;
}

- (void)setDateForLatestInviteRequestEvent:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestInviteRequestEvent, a3);
}

- (NSDate)dateForLatestRepairRequest
{
  return self->_dateForLatestRepairRequest;
}

- (void)setDateForLatestRepairRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestRepairRequest, a3);
}

- (NSDate)dateForLatestDowngradeCompleted
{
  return self->_dateForLatestDowngradeCompleted;
}

- (void)setDateForLatestDowngradeCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestDowngradeCompleted, a3);
}

- (BOOL)isFriendshipActive
{
  return self->_isFriendshipActive;
}

- (void)setIsFriendshipActive:(BOOL)a3
{
  self->_isFriendshipActive = a3;
}

- (BOOL)isMuteEnabled
{
  return self->_isMuteEnabled;
}

- (void)setIsMuteEnabled:(BOOL)a3
{
  self->_isMuteEnabled = a3;
}

- (BOOL)hasIncomingInviteRequest
{
  return self->_hasIncomingInviteRequest;
}

- (void)setHasIncomingInviteRequest:(BOOL)a3
{
  self->_hasIncomingInviteRequest = a3;
}

- (BOOL)hasOutgoingInviteRequest
{
  return self->_hasOutgoingInviteRequest;
}

- (void)setHasOutgoingInviteRequest:(BOOL)a3
{
  self->_hasOutgoingInviteRequest = a3;
}

- (BOOL)isAwaitingInviteResponse
{
  return self->_isAwaitingInviteResponse;
}

- (void)setIsAwaitingInviteResponse:(BOOL)a3
{
  self->_isAwaitingInviteResponse = a3;
}

- (BOOL)sentInviteResponse
{
  return self->_sentInviteResponse;
}

- (void)setSentInviteResponse:(BOOL)a3
{
  self->_sentInviteResponse = a3;
}

- (BOOL)hasIncomingCompetitionRequest
{
  return self->_hasIncomingCompetitionRequest;
}

- (void)setHasIncomingCompetitionRequest:(BOOL)a3
{
  self->_hasIncomingCompetitionRequest = a3;
}

- (BOOL)hasOutgoingCompetitionRequest
{
  return self->_hasOutgoingCompetitionRequest;
}

- (void)setHasOutgoingCompetitionRequest:(BOOL)a3
{
  self->_hasOutgoingCompetitionRequest = a3;
}

- (BOOL)hasIgnoredCompetitionRequest
{
  return self->_hasIgnoredCompetitionRequest;
}

- (void)setHasIgnoredCompetitionRequest:(BOOL)a3
{
  self->_hasIgnoredCompetitionRequest = a3;
}

- (BOOL)isAwaitingCompetitionResponse
{
  return self->_isAwaitingCompetitionResponse;
}

- (void)setIsAwaitingCompetitionResponse:(BOOL)a3
{
  self->_isAwaitingCompetitionResponse = a3;
}

- (BOOL)isCompetitionActive
{
  return self->_isCompetitionActive;
}

- (void)setIsCompetitionActive:(BOOL)a3
{
  self->_isCompetitionActive = a3;
}

- (BOOL)hasCompletedCompetition
{
  return self->_hasCompletedCompetition;
}

- (void)setHasCompletedCompetition:(BOOL)a3
{
  self->_hasCompletedCompetition = a3;
}

- (NSDate)dateForLatestOutgoingCompetitionRequest
{
  return self->_dateForLatestOutgoingCompetitionRequest;
}

- (void)setDateForLatestOutgoingCompetitionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestOutgoingCompetitionRequest, a3);
}

- (NSDate)dateForLatestIncomingCompetitionRequest
{
  return self->_dateForLatestIncomingCompetitionRequest;
}

- (void)setDateForLatestIncomingCompetitionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestIncomingCompetitionRequest, a3);
}

- (NSDate)dateForLatestIgnoredCompetitionRequest
{
  return self->_dateForLatestIgnoredCompetitionRequest;
}

- (void)setDateForLatestIgnoredCompetitionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestIgnoredCompetitionRequest, a3);
}

- (BOOL)isHidingActivityData
{
  return self->_isHidingActivityData;
}

- (NSDate)dateForLatestDataHidden
{
  return self->_dateForLatestDataHidden;
}

- (void)setDateForLatestDataHidden:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestDataHidden, a3);
}

- (NSDate)dateForLatestIncomingInviteRequest
{
  return self->_dateForLatestIncomingInviteRequest;
}

- (void)setDateForLatestIncomingInviteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestIncomingInviteRequest, a3);
}

- (NSDate)dateForLatestOutgoingInviteRequest
{
  return self->_dateForLatestOutgoingInviteRequest;
}

- (void)setDateForLatestOutgoingInviteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestOutgoingInviteRequest, a3);
}

- (NSDate)dateForLatestRelationshipStart
{
  return self->_dateForLatestRelationshipStart;
}

- (void)setDateForLatestRelationshipStart:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestRelationshipStart, a3);
}

- (NSDate)dateActivityDataInitiallyBecameVisible
{
  return self->_dateActivityDataInitiallyBecameVisible;
}

- (void)setDateActivityDataInitiallyBecameVisible:(id)a3
{
  objc_storeStrong((id *)&self->_dateActivityDataInitiallyBecameVisible, a3);
}

- (NSDate)dateForLatestRelationshipEnd
{
  return self->_dateForLatestRelationshipEnd;
}

- (void)setDateForLatestRelationshipEnd:(id)a3
{
  objc_storeStrong((id *)&self->_dateForLatestRelationshipEnd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateForLatestRelationshipEnd, 0);
  objc_storeStrong((id *)&self->_dateActivityDataInitiallyBecameVisible, 0);
  objc_storeStrong((id *)&self->_dateForLatestRelationshipStart, 0);
  objc_storeStrong((id *)&self->_dateForLatestOutgoingInviteRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestIncomingInviteRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestDataHidden, 0);
  objc_storeStrong((id *)&self->_dateForLatestIgnoredCompetitionRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestIncomingCompetitionRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestOutgoingCompetitionRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestDowngradeCompleted, 0);
  objc_storeStrong((id *)&self->_dateForLatestRepairRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestInviteRequestEvent, 0);
  objc_storeStrong((id *)&self->_dateForLatestMigrationFailed, 0);
  objc_storeStrong((id *)&self->_dateForLatestMigrationCompleted, 0);
  objc_storeStrong((id *)&self->_dateForLatestMigrationStarted, 0);
  objc_storeStrong((id *)&self->_dateForLatestUpgradeCompleted, 0);
  objc_storeStrong((id *)&self->_dateForLatestIncomingUpgradeRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestOutgoingUpgradeRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestUpgradeFailure, 0);
  objc_storeStrong((id *)&self->_secureCloudUpgradeToken, 0);
  objc_storeStrong((id *)&self->_receivedInvitation, 0);
  objc_storeStrong((id *)&self->_sentInvitation, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_relationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_relationshipEvents, 0);
  objc_storeStrong((id *)&self->_remoteActivityDataShareID, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipShareID, 0);
  objc_storeStrong((id *)&self->_relationshipShareID, 0);
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_preferredReachableService, 0);
  objc_storeStrong((id *)&self->_preferredReachableAddress, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_cloudKitAddress, 0);
  objc_storeStrong((id *)&self->_outgoingHandshakeToken, 0);
  objc_storeStrong((id *)&self->_incomingHandshakeToken, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
