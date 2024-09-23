@implementation BMDistributedContextEventTranslation

- (BMDistributedContextEventTranslation)initWithLocalDeviceIdentifier:(id)a3
{
  id v5;
  BMDistributedContextEventTranslation *v6;
  BMDistributedContextEventTranslation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDistributedContextEventTranslation;
  v6 = -[BMDistributedContextEventTranslation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localDeviceIdentifier, a3);

  return v7;
}

- (id)translateEvent:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  BMDistributedContextTranslatedEventMessage *v27;
  uint64_t v29;
  uint64_t v30;
  Class (*v31)(uint64_t);
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    -[BMDistributedContextEventTranslation contextSyncLOIFromSemanticLocationEvent:](self, "contextSyncLOIFromSemanticLocationEvent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "serialize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getBMContextSyncLOIIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v12 = (void *)getBMActivityLevelClass_softClass;
    v37 = getBMActivityLevelClass_softClass;
    if (!getBMActivityLevelClass_softClass)
    {
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __getBMActivityLevelClass_block_invoke;
      v32 = &unk_24D278770;
      v33 = &v34;
      __getBMActivityLevelClass_block_invoke((uint64_t)&v29);
      v12 = (void *)v35[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v34, 8);
    v14 = objc_opt_isKindOfClass();

    objc_msgSend(v4, "eventBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v14 & 1) != 0)
    {
      -[BMDistributedContextEventTranslation contextSyncActivityLevelEventFromEvent:](self, "contextSyncActivityLevelEventFromEvent:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "serialize");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      getBMContextSyncDeviceActivityLevelIdentifier();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x2050000000;
      v16 = (void *)getBMDeviceCellularAvailabilityStatusClass_softClass;
      v37 = getBMDeviceCellularAvailabilityStatusClass_softClass;
      if (!getBMDeviceCellularAvailabilityStatusClass_softClass)
      {
        v29 = MEMORY[0x24BDAC760];
        v30 = 3221225472;
        v31 = __getBMDeviceCellularAvailabilityStatusClass_block_invoke;
        v32 = &unk_24D278770;
        v33 = &v34;
        __getBMDeviceCellularAvailabilityStatusClass_block_invoke((uint64_t)&v29);
        v16 = (void *)v35[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v34, 8);
      v18 = objc_opt_isKindOfClass();

      objc_msgSend(v4, "eventBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 & 1) != 0)
      {
        -[BMDistributedContextEventTranslation contextSyncCellularStatusFromEvent:](self, "contextSyncCellularStatusFromEvent:", v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "serialize");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        getBMContextSyncCellularAvailabilityStatusIdentifier();
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = 0;
        v35 = &v34;
        v36 = 0x2050000000;
        v20 = (void *)getBMWalletTransactionClass_softClass;
        v37 = getBMWalletTransactionClass_softClass;
        if (!getBMWalletTransactionClass_softClass)
        {
          v29 = MEMORY[0x24BDAC760];
          v30 = 3221225472;
          v31 = __getBMWalletTransactionClass_block_invoke;
          v32 = &unk_24D278770;
          v33 = &v34;
          __getBMWalletTransactionClass_block_invoke((uint64_t)&v29);
          v20 = (void *)v35[3];
        }
        v21 = objc_retainAutorelease(v20);
        _Block_object_dispose(&v34, 8);
        v22 = objc_opt_isKindOfClass();

        objc_msgSend(v4, "eventBody");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 & 1) != 0)
        {
          -[BMDistributedContextEventTranslation contextSyncWalletTransactionFromEvent:](self, "contextSyncWalletTransactionFromEvent:", v23);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "serialize");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          getBMContextSyncWalletTransactionIdentifier();
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          getBMAppInFocusClass();
          v24 = objc_opt_isKindOfClass();

          if ((v24 & 1) == 0)
          {
            v10 = 0;
            v9 = 0;
            v26 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v4, "eventBody");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMDistributedContextEventTranslation contextSyncAppInFocusFromEvent:](self, "contextSyncAppInFocusFromEvent:", v25);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "serialize");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          getBMContextSyncAppInFocusIdentifier();
          v11 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v26 = (void *)v11;

LABEL_18:
  v27 = -[BMDistributedContextTranslatedEventMessage initWithStreamIdentifier:eventData:eventDataVersion:]([BMDistributedContextTranslatedEventMessage alloc], "initWithStreamIdentifier:eventData:eventDataVersion:", v26, v9, v10);

  return v27;
}

- (id)contextSyncLOIFromSemanticLocationEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString *localDeviceIdentifier;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "isStarting");
  v6 = objc_msgSend(v4, "userSpecificPlaceType");
  v7 = objc_msgSend(v4, "placeType");

  v8 = objc_alloc((Class)getBMContextSyncLOIClass());
  localDeviceIdentifier = self->_localDeviceIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithID:deviceUUID:starting:userSpecificPlaceType:placeType:", CFSTR("com.apple.biome.ContextSync"), localDeviceIdentifier, v10, v6, v7);

  return v11;
}

- (id)contextSyncActivityLevelEventFromEvent:(id)a3
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

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if ((objc_msgSend(v4, "inUseStatus") & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()), "initWithState:", 1);
    objc_msgSend(v5, "addObject:", v6);

  }
  if ((objc_msgSend(v4, "inUseStatus") & 2) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()), "initWithState:", 2);
    objc_msgSend(v5, "addObject:", v7);

  }
  if ((objc_msgSend(v4, "inUseStatus") & 4) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()), "initWithState:", 3);
    objc_msgSend(v5, "addObject:", v8);

  }
  if ((objc_msgSend(v4, "inUseStatus") & 8) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()), "initWithState:", 4);
    objc_msgSend(v5, "addObject:", v9);

  }
  if ((objc_msgSend(v4, "inUseStatus") & 0x10) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()), "initWithState:", 5);
    objc_msgSend(v5, "addObject:", v10);

  }
  if ((objc_msgSend(v4, "inUseStatus") & 0x20) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()), "initWithState:", 6);
    objc_msgSend(v5, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncDeviceActivityLevelClass()), "initWithID:deviceUUID:deviceActivityState:", CFSTR("com.apple.biome.ContextSync"), self->_localDeviceIdentifier, v5);

  return v12;
}

- (id)contextSyncCellularStatusFromEvent:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSString *localDeviceIdentifier;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "deviceType");
  LODWORD(v6) = objc_msgSend(v4, "deviceRegistrationStatus");
  LODWORD(v7) = objc_msgSend(v4, "previousDeviceRegistrationStatus");
  if (objc_msgSend(v4, "hasAboveThreshold"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "aboveThreshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if ((v7 - 1) >= 4)
    v7 = 0;
  else
    v7 = v7;
  if ((v6 - 1) >= 4)
    v6 = 0;
  else
    v6 = v6;
  if (v5 == 2)
    v9 = 2;
  else
    v9 = v5 == 1;
  v10 = objc_alloc((Class)getBMContextSyncCellularAvailabilityStatusClass());
  localDeviceIdentifier = self->_localDeviceIdentifier;
  objc_msgSend(v4, "timeStamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestStrongTimeStamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithID:deviceUUID:timeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", CFSTR("com.apple.biome.ContextSync"), localDeviceIdentifier, v12, v9, v6, v7, v8, v13);

  return v14;
}

- (id)contextSyncWalletTransactionFromEvent:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  int v8;
  id v9;
  NSString *localDeviceIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionType");
  if (v5 - 1 >= 6)
    v6 = 0;
  else
    v6 = v5;
  v7 = objc_msgSend(v4, "merchantType");
  if ((v7 - 1) >= 7)
    v8 = 0;
  else
    v8 = v7;
  v9 = objc_alloc((Class)getBMContextSyncWalletTransactionClass());
  localDeviceIdentifier = self->_localDeviceIdentifier;
  objc_msgSend(v4, "passUniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passLocalizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poiCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = v8;
  v15 = (void *)objc_msgSend(v9, "initWithID:deviceUUID:passUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", CFSTR("com.apple.biome.ContextSync"), localDeviceIdentifier, v11, v12, v6, v13, v17, v14);

  return v15;
}

- (id)contextSyncAppInFocusFromEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = objc_alloc((Class)getBMAppInFocusClass());
  objc_msgSend(v3, "launchReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "starting"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteTimestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionHostID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortVersionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exactVersionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "dyldPlatform"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v3, "isNativeArchitecture");

  objc_msgSend(v11, "numberWithBool:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v4, "initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", v5, v6, v20, v19, v18, v17, v7, v8, v9, v10, v13);

  v14 = (void *)objc_msgSend(objc_alloc((Class)getBMContextSyncAppInFocusClass()), "initWithID:deviceUUID:AppInFocus:", CFSTR("com.apple.biome.ContextSync"), self->_localDeviceIdentifier, v16);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceIdentifier, 0);
}

@end
