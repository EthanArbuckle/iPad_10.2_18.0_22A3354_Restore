@implementation DSIDRecord

- (id)idAccountsDictionaryRepresentation
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

  -[DSIDRecord idForClientType:](self, "idForClientType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIDRecord idForClientType:](self, "idForClientType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIDRecord idForClientType:](self, "idForClientType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIDRecord idForClientType:](self, "idForClientType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIDRecord idForClientType:](self, "idForClientType:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIDRecord idForClientType:](self, "idForClientType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIDRecord _parseItunesFlags](self, "_parseItunesFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v9);
  objc_msgSend(v10, "setValue:forKey:", v3, CFSTR("deviceNewsPlusSubscriberID"));
  objc_msgSend(v10, "setValue:forKey:", v4, CFSTR("anonymousDemandID"));
  objc_msgSend(v10, "setValue:forKey:", v5, CFSTR("contentID"));
  objc_msgSend(v10, "setValue:forKey:", v6, CFSTR("toroID"));
  objc_msgSend(v10, "setValue:forKey:", v7, CFSTR("DPID"));
  objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("iAdID"));
  -[DSIDRecord segmentData](self, "segmentData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("segmentData"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (DSIDRecord)initWithDSID:(id)a3 serializedRecord:(id)a4 version:(int)a5
{
  id v8;
  id v9;
  DSIDRecord *v10;
  DSIDRecord *v11;
  id *p_DSID;
  NSMutableDictionary *v13;
  NSMutableDictionary *ADIDRecords;
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
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  NSString *segmentData;
  const __CFString *v38;
  DSIDRecord *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  DSIDRecord *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  OSStatus v51;
  _QWORD v52[4];
  DSIDRecord *v53;
  objc_super v54;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v54.receiver = self;
    v54.super_class = (Class)DSIDRecord;
    v10 = -[DSIDRecord init](&v54, sel_init);
    v11 = v10;
    if (v10)
    {
      p_DSID = (id *)&v10->_DSID;
      objc_storeStrong((id *)&v10->_DSID, a3);
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      ADIDRecords = v11->_ADIDRecords;
      v11->_ADIDRecords = v13;

      v11->_lastJingleAccountStatus = -1;
      if (v9)
      {
        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_AccountIs13Key"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_accountIsT13 = objc_msgSend(v15, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_AccountIsU13Key"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_accountIsU13 = objc_msgSend(v16, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_AccountIsU18Key"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_accountIsU18 = objc_msgSend(v17, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_AccountAgeUnknownKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_accountAgeUnknown = objc_msgSend(v18, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_SensitiveContentEligibleKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_sensitiveContentEligible = objc_msgSend(v19, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_EffectiveBirthYearKey"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_effectiveBirthYear = objc_msgSend(v20, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_NoiseAppliedVersionKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_noiseAppliedVersion = objc_msgSend(v21, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_IsDPIDManatee"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_isDPIDManatee = objc_msgSend(v22, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_IsDPIDLocal"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_isDPIDLocal = objc_msgSend(v23, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_PersonalizedAdsTimestampKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_personalizedAdsTimestamp = objc_msgSend(v24, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_LastJingleAccountStatusKey"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_lastJingleAccountStatus = objc_msgSend(v25, "integerValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADiAdIDRecord_LastSentPersonalizedAdsStatusKey"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_lastSentPersonalizedAdsStatus = objc_msgSend(v26, "BOOLValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADiAdIDRecord_LastSentPersonalizedAdsTimestampKey"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_lastSentPersonalizedAdsTimestamp = objc_msgSend(v27, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_SegmentDataTimestampKey"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_segmentDataTimestamp = objc_msgSend(v28, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADiAdIDRecord_LastSentSegmentDataTimestampKey"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_lastSentSegmentDataTimestamp = objc_msgSend(v29, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADiAdIDRecord_LastSegmentServedTimestampKey"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_lastSegmentServedTimestamp = objc_msgSend(v30, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADiAdIDRecord_NextReconcileTimestamp"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_nextReconcileTimestamp = objc_msgSend(v31, "intValue");

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_DeviceIDRotationTimestampKey"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v11->_deviceIDRotationTimestamp = objc_msgSend(v32, "intValue");

        +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "BOOLForKey:", CFSTR("EnableCustomPayload"));

        if ((v34 & 1) != 0)
        {
          +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "customJinglePayload");
          v36 = objc_claimAutoreleasedReturnValue();
          segmentData = v11->_segmentData;
          v11->_segmentData = (NSString *)v36;

          v38 = CFSTR("CUSTOM");
        }
        else
        {
          objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_SegmentDataKey"));
          v40 = objc_claimAutoreleasedReturnValue();
          v35 = v11->_segmentData;
          v11->_segmentData = (NSString *)v40;
          v38 = CFSTR("ACTUAL");
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saving the %@ segment payload with data: %@"), v38, v11->_segmentData);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdIDLogging"), v41, 0);

        objc_msgSend(v9, "valueForKey:", CFSTR("kADDSIDRecord_iAdIDRecordsKey"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __52__DSIDRecord_initWithDSID_serializedRecord_version___block_invoke;
        v52[3] = &unk_1E82B1E18;
        v43 = v11;
        v53 = v43;
        objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v52);
        v51 = 0;
        GetKeychainPropertyListForKey(CFSTR("_ADClientDPIDStorageContainerKey"), &v51);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (!v51 && v44)
        {
          objc_msgSend(v44, "valueForKey:", *p_DSID);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (v46)
          {
            objc_msgSend(v46, "valueForKey:", CFSTR("ADClientDPIDRecordKey"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (v48)
            {
              if (objc_msgSend(*p_DSID, "isEqualToString:", CFSTR("0")))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found a DPID record for DSID 0 in keychain. Please file a radar."));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                _ADLog(CFSTR("iAdIDLogging"), v49, 0);

              }
              else
              {
                -[DSIDRecord setID:forClientType:](v43, "setID:forClientType:", v48, 5);
              }
            }

          }
        }

      }
      -[DSIDRecord setDirty:](v11, "setDirty:", 1);
    }
    self = v11;
    v39 = self;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

void __52__DSIDRecord_initWithDSID_serializedRecord_version___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "valueForKey:", CFSTR("kADiAdIDRecord_iAdIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setID:forClientType:", v5, objc_msgSend(v6, "integerValue"));

}

- (void)setID:(id)a3 forClientType:(int64_t)a4
{
  DSIDRecord *v6;
  ADIDRecord *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[ADIDRecord initWithID:]([ADIDRecord alloc], "initWithID:", v10);
  -[DSIDRecord ADIDRecords](v6, "ADIDRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  objc_sync_exit(v6);
}

- (NSMutableDictionary)ADIDRecords
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDirty:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  self->_dirty = a3;
  if (!a3)
  {
    -[DSIDRecord ADIDRecords](self, "ADIDRecords");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __23__DSIDRecord_setDirty___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v32__0__NSNumber_8__ADIDRecord_16_B24l;
    v6 = a3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

- (id)idForClientType:(int64_t)a3
{
  DSIDRecord *v4;
  NSMutableDictionary *ADIDRecords;
  void *v6;
  void *v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  ADIDRecords = v4->_ADIDRecords;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](ADIDRecords, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v8;
}

- (NSString)segmentData
{
  return self->_segmentData;
}

- (id)_parseItunesFlags
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[10];
  _QWORD v29[12];

  v29[10] = *MEMORY[0x1E0C80C00];
  -[DSIDRecord DSID](self, "DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIDRecord iCloudDSID](self, "iCloudDSID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  v4 = objc_msgSend(v3, "isEqualToString:");
  v5 = -[DSIDRecord accountAgeUnknown](self, "accountAgeUnknown");
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v8 = -[DSIDRecord accountIsU13](self, "accountIsU13");
    if (-[DSIDRecord accountIsU18](self, "accountIsU18") && -[DSIDRecord accountIsT13](self, "accountIsT13"))
    {
      v6 = 1;
    }
    else if (-[DSIDRecord accountIsU18](self, "accountIsU18") && !-[DSIDRecord accountIsT13](self, "accountIsT13"))
    {
      v6 = -[DSIDRecord accountIsU13](self, "accountIsU13") ^ 1;
    }
    else
    {
      v6 = 0;
    }
    if (-[DSIDRecord accountAgeUnknown](self, "accountAgeUnknown") || -[DSIDRecord accountIsU13](self, "accountIsU13"))
      v7 = 0;
    else
      v7 = -[DSIDRecord accountIsU18](self, "accountIsU18") ^ 1;
  }
  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("iTunesDSID");
  -[DSIDRecord DSID](self, "DSID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("isChild");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v28[2] = CFSTR("isAdolescent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v23;
  v28[3] = CFSTR("isAdult");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v22;
  v28[4] = CFSTR("ageUnknown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v10;
  v28[5] = CFSTR("isiCloudLoggedIn");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[DSIDRecord iCloudDSID](self, "iCloudDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", v12 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v13;
  v28[6] = CFSTR("isiTunesLoggedIn");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[DSIDRecord DSID](self, "DSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInt:", v15 != 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v16;
  v28[7] = CFSTR("isiCloudSameAsiTunes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v17;
  v28[8] = CFSTR("isNoServicesRegion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isRestrictedRegion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v18;
  v28[9] = CFSTR("sensitiveContentEligible");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord sensitiveContentEligible](self, "sensitiveContentEligible"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (BOOL)accountIsU18
{
  return self->_accountIsU18;
}

- (NSString)iCloudDSID
{
  return self->_iCloudDSID;
}

- (BOOL)accountIsU13
{
  return self->_accountIsU13;
}

- (BOOL)accountAgeUnknown
{
  return self->_accountAgeUnknown;
}

- (BOOL)sensitiveContentEligible
{
  return self->_sensitiveContentEligible;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  DSIDRecord *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[DSIDRecord DSID](v6, "DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
    objc_msgSend(v5, "setDSID:", v8);

    objc_msgSend(v5, "setAccountIsT13:", -[DSIDRecord accountIsT13](v6, "accountIsT13"));
    objc_msgSend(v5, "setAccountIsU13:", -[DSIDRecord accountIsU13](v6, "accountIsU13"));
    objc_msgSend(v5, "setAccountIsU18:", -[DSIDRecord accountIsU18](v6, "accountIsU18"));
    objc_msgSend(v5, "setAccountAgeUnknown:", -[DSIDRecord accountAgeUnknown](v6, "accountAgeUnknown"));
    objc_msgSend(v5, "setSensitiveContentEligible:", -[DSIDRecord sensitiveContentEligible](v6, "sensitiveContentEligible"));
    objc_msgSend(v5, "setEffectiveBirthYear:", -[DSIDRecord effectiveBirthYear](v6, "effectiveBirthYear"));
    objc_msgSend(v5, "setNoiseAppliedVersion:", -[DSIDRecord noiseAppliedVersion](v6, "noiseAppliedVersion"));
    -[DSIDRecord ADIDRecords](v6, "ADIDRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopyWithZone:", a3);
    objc_msgSend(v5, "setADIDRecords:", v10);

    objc_msgSend(v5, "setLastJingleAccountStatus:", -[DSIDRecord lastJingleAccountStatus](v6, "lastJingleAccountStatus"));
    objc_msgSend(v5, "setPersonalizedAdsTimestamp:", -[DSIDRecord personalizedAdsTimestamp](v6, "personalizedAdsTimestamp"));
    objc_msgSend(v5, "setLastSentPersonalizedAdsStatus:", -[DSIDRecord lastSentPersonalizedAdsStatus](v6, "lastSentPersonalizedAdsStatus"));
    -[DSIDRecord segmentData](v6, "segmentData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
    objc_msgSend(v5, "setSegmentData:", v12);

    objc_msgSend(v5, "setSegmentDataTimestamp:", -[DSIDRecord segmentDataTimestamp](v6, "segmentDataTimestamp"));
    objc_msgSend(v5, "setLastSentPersonalizedAdsTimestamp:", -[DSIDRecord lastSentPersonalizedAdsTimestamp](v6, "lastSentPersonalizedAdsTimestamp"));
    objc_msgSend(v5, "setLastSentSegmentDataTimestamp:", -[DSIDRecord lastSentSegmentDataTimestamp](v6, "lastSentSegmentDataTimestamp"));
    objc_msgSend(v5, "setLastSegmentServedTimestamp:", -[DSIDRecord lastSegmentServedTimestamp](v6, "lastSegmentServedTimestamp"));
    objc_msgSend(v5, "setNextReconcileTimestamp:", -[DSIDRecord nextReconcileTimestamp](v6, "nextReconcileTimestamp"));
    objc_msgSend(v5, "setDeviceIDRotationTimestamp:", -[DSIDRecord deviceIDRotationTimestamp](v6, "deviceIDRotationTimestamp"));
    objc_sync_exit(v6);

  }
  return v5;
}

- (id)encryptedIDForClientType:(int64_t)a3
{
  DSIDRecord *v4;
  NSMutableDictionary *ADIDRecords;
  void *v6;
  void *v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  ADIDRecords = v4->_ADIDRecords;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](ADIDRecords, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "encryptedID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)DSIDRecord;
  -[DSIDRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dumpObject(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  DSIDRecord *v23;
  NSMutableDictionary *ADIDRecords;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord accountIsU13](self, "accountIsU13"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kADDSIDRecord_AccountIsU13Key"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord accountIsT13](self, "accountIsT13"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kADDSIDRecord_AccountIs13Key"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord accountIsU18](self, "accountIsU18"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("kADDSIDRecord_AccountIsU18Key"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord accountAgeUnknown](self, "accountAgeUnknown"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("kADDSIDRecord_AccountAgeUnknownKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord sensitiveContentEligible](self, "sensitiveContentEligible"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kADDSIDRecord_SensitiveContentEligibleKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord effectiveBirthYear](self, "effectiveBirthYear"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kADDSIDRecord_EffectiveBirthYearKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord noiseAppliedVersion](self, "noiseAppliedVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("kADDSIDRecord_NoiseAppliedVersionKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord isDPIDManatee](self, "isDPIDManatee"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("kADDSIDRecord_IsDPIDManatee"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord isDPIDLocal](self, "isDPIDLocal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("kADDSIDRecord_IsDPIDLocal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord personalizedAdsTimestamp](self, "personalizedAdsTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("kADDSIDRecord_PersonalizedAdsTimestampKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DSIDRecord lastSentPersonalizedAdsStatus](self, "lastSentPersonalizedAdsStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("kADiAdIDRecord_LastSentPersonalizedAdsStatusKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord lastSentPersonalizedAdsTimestamp](self, "lastSentPersonalizedAdsTimestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("kADiAdIDRecord_LastSentPersonalizedAdsTimestampKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DSIDRecord lastJingleAccountStatus](self, "lastJingleAccountStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("kADDSIDRecord_LastJingleAccountStatusKey"));

  -[DSIDRecord segmentData](self, "segmentData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("kADDSIDRecord_SegmentDataKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord segmentDataTimestamp](self, "segmentDataTimestamp"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("kADDSIDRecord_SegmentDataTimestampKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord lastSentSegmentDataTimestamp](self, "lastSentSegmentDataTimestamp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("kADiAdIDRecord_LastSentSegmentDataTimestampKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord lastSegmentServedTimestamp](self, "lastSegmentServedTimestamp"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("kADiAdIDRecord_LastSegmentServedTimestampKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord nextReconcileTimestamp](self, "nextReconcileTimestamp"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("kADiAdIDRecord_NextReconcileTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DSIDRecord deviceIDRotationTimestamp](self, "deviceIDRotationTimestamp"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("kADDSIDRecord_DeviceIDRotationTimestampKey"));

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = self;
  objc_sync_enter(v23);
  ADIDRecords = v23->_ADIDRecords;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __38__DSIDRecord_dictionaryRepresentation__block_invoke;
  v26[3] = &unk_1E82B1E40;
  v26[4] = &v27;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](ADIDRecords, "enumerateKeysAndObjectsUsingBlock:", v26);
  objc_sync_exit(v23);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28[5], CFSTR("kADDSIDRecord_iAdIDRecordsKey"));
  _Block_object_dispose(&v27, 8);

  return v3;
}

void __38__DSIDRecord_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

- (BOOL)isPlaceholderAccount
{
  NSString *DSID;
  void *v4;

  DSID = self->_DSID;
  if (DSID)
    return -[NSString isEqualToString:](DSID, "isEqualToString:", CFSTR("0"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current DSID is null!"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdIDLogging"), v4, 0);

  return 1;
}

- (BOOL)isRestrictedByApple
{
  char v3;
  void *v4;
  void *v5;

  if (-[DSIDRecord accountIsU13](self, "accountIsU13") || -[DSIDRecord accountIsU18](self, "accountIsU18"))
    return 1;
  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isManagedAppleID") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "educationModeEnabled");

  }
  return v3;
}

uint64_t __23__DSIDRecord_setDirty___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "setDirty:", *(unsigned __int8 *)(a1 + 32));
  *a4 = 0;
  return result;
}

- (BOOL)iAdIDRecordsDirty
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[DSIDRecord ADIDRecords](self, "ADIDRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__DSIDRecord_iAdIDRecordsDirty__block_invoke;
  v4[3] = &unk_1E82B1E40;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __31__DSIDRecord_iAdIDRecordsDirty__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "dirty");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (BOOL)dirty
{
  return self->_dirty || -[DSIDRecord iAdIDRecordsDirty](self, "iAdIDRecordsDirty");
}

- (BOOL)shouldSendNotification
{
  return -[DSIDRecord notificationRequired](self, "notificationRequired")
      || -[DSIDRecord iAdIDRecordsDirty](self, "iAdIDRecordsDirty");
}

- (void)setNotificationRequired:(BOOL)a3
{
  self->_notificationRequired = a3;
}

- (void)setAccountIsU13:(BOOL)a3
{
  if (self->_accountIsU13 != a3)
  {
    self->_accountIsU13 = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setAccountIsT13:(BOOL)a3
{
  if (self->_accountIsT13 != a3)
  {
    self->_accountIsT13 = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setAccountIsU18:(BOOL)a3
{
  if (self->_accountIsU18 != a3)
  {
    self->_accountIsU18 = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setAccountAgeUnknown:(BOOL)a3
{
  if (self->_accountAgeUnknown != a3)
  {
    self->_accountAgeUnknown = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setSensitiveContentEligible:(BOOL)a3
{
  if (self->_sensitiveContentEligible != a3)
  {
    self->_sensitiveContentEligible = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setEffectiveBirthYear:(int)a3
{
  if (self->_effectiveBirthYear != a3)
  {
    self->_effectiveBirthYear = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setNoiseAppliedVersion:(int)a3
{
  if (self->_noiseAppliedVersion != a3)
  {
    self->_noiseAppliedVersion = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setIsDPIDManatee:(BOOL)a3
{
  if (self->_isDPIDManatee != a3)
  {
    self->_isDPIDManatee = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setIsDPIDLocal:(BOOL)a3
{
  if (self->_isDPIDLocal != a3)
  {
    self->_isDPIDLocal = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setLastSentPersonalizedAdsStatus:(BOOL)a3
{
  if (self->_lastSentPersonalizedAdsStatus != a3)
  {
    self->_lastSentPersonalizedAdsStatus = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setLastSentPersonalizedAdsTimestamp:(int)a3
{
  if (self->_lastSentPersonalizedAdsTimestamp != a3)
  {
    self->_lastSentPersonalizedAdsTimestamp = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setLastJingleAccountStatus:(int64_t)a3
{
  if (self->_lastJingleAccountStatus != a3)
  {
    self->_lastJingleAccountStatus = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setSegmentData:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_segmentData, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_segmentData, a3);
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
    -[DSIDRecord setNotificationRequired:](self, "setNotificationRequired:", 1);
  }

}

- (void)setSegmentDataTimestamp:(int)a3
{
  if (self->_segmentDataTimestamp != a3)
  {
    self->_segmentDataTimestamp = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setLastSentSegmentDataTimestamp:(int)a3
{
  if (self->_lastSentSegmentDataTimestamp != a3)
  {
    self->_lastSentSegmentDataTimestamp = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setLastSegmentServedTimestamp:(int)a3
{
  if (self->_lastSegmentServedTimestamp != a3)
  {
    self->_lastSegmentServedTimestamp = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setPersonalizedAdsTimestamp:(int)a3
{
  if (self->_personalizedAdsTimestamp != a3)
  {
    self->_personalizedAdsTimestamp = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setDeviceIDRotationTimestamp:(int)a3
{
  if (self->_deviceIDRotationTimestamp != a3)
  {
    self->_deviceIDRotationTimestamp = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (int)nextReconcileTimestamp
{
  return self->_nextReconcileTimestamp;
}

- (void)setNextReconcileTimestamp:(int)a3
{
  if (self->_nextReconcileTimestamp != a3)
  {
    self->_nextReconcileTimestamp = a3;
    -[DSIDRecord setDirty:](self, "setDirty:", 1);
  }
}

- (void)setDSID:(id)a3
{
  objc_storeStrong((id *)&self->_DSID, a3);
}

- (void)setICloudDSID:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudDSID, a3);
}

- (BOOL)accountIsT13
{
  return self->_accountIsT13;
}

- (int)effectiveBirthYear
{
  return self->_effectiveBirthYear;
}

- (int)noiseAppliedVersion
{
  return self->_noiseAppliedVersion;
}

- (BOOL)isActiveRecord
{
  return self->_isActiveRecord;
}

- (void)setIsPlaceholderAccount:(BOOL)a3
{
  self->_isPlaceholderAccount = a3;
}

- (NSString)iAdIDBeforeReset
{
  return self->_iAdIDBeforeReset;
}

- (void)setIAdIDBeforeReset:(id)a3
{
  objc_storeStrong((id *)&self->_iAdIDBeforeReset, a3);
}

- (BOOL)isDPIDManatee
{
  return self->_isDPIDManatee;
}

- (BOOL)isDPIDLocal
{
  return self->_isDPIDLocal;
}

- (int)personalizedAdsTimestamp
{
  return self->_personalizedAdsTimestamp;
}

- (int)segmentDataTimestamp
{
  return self->_segmentDataTimestamp;
}

- (int)lastSentSegmentDataTimestamp
{
  return self->_lastSentSegmentDataTimestamp;
}

- (int)lastSegmentServedTimestamp
{
  return self->_lastSegmentServedTimestamp;
}

- (int)deviceIDRotationTimestamp
{
  return self->_deviceIDRotationTimestamp;
}

- (void)setADIDRecords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int64_t)lastJingleAccountStatus
{
  return self->_lastJingleAccountStatus;
}

- (BOOL)lastSentPersonalizedAdsStatus
{
  return self->_lastSentPersonalizedAdsStatus;
}

- (int)lastSentPersonalizedAdsTimestamp
{
  return self->_lastSentPersonalizedAdsTimestamp;
}

- (BOOL)notificationRequired
{
  return self->_notificationRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ADIDRecords, 0);
  objc_storeStrong((id *)&self->_iAdIDBeforeReset, 0);
  objc_storeStrong((id *)&self->_segmentData, 0);
  objc_storeStrong((id *)&self->_iCloudDSID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end
