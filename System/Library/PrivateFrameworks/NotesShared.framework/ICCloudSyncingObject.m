@implementation ICCloudSyncingObject

- (id)shortLoggingDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ICCloudSyncingObject recordName](self, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@[%@]>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didTurnIntoFault
{
  CKRecord *serverRecord;
  CKShare *serverShare;
  CKRecord *userSpecificServerRecord;
  CKRecord *unappliedEncryptedRecord;
  ICMergeableDictionary *replicaIDToNotesVersion;
  ICTTOrderedSetVersionedDocument *activityEventsDocument;
  id persistedActivityEventsStorage;
  id checklistItemToActivityEventsStorage;
  NSMutableDictionary *participantHandlesToParticipants;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICCloudSyncingObject;
  -[ICCloudSyncingObject didTurnIntoFault](&v12, sel_didTurnIntoFault);
  serverRecord = self->_serverRecord;
  self->_serverRecord = 0;

  serverShare = self->_serverShare;
  self->_serverShare = 0;

  userSpecificServerRecord = self->_userSpecificServerRecord;
  self->_userSpecificServerRecord = 0;

  unappliedEncryptedRecord = self->_unappliedEncryptedRecord;
  self->_unappliedEncryptedRecord = 0;

  replicaIDToNotesVersion = self->_replicaIDToNotesVersion;
  self->_replicaIDToNotesVersion = 0;

  activityEventsDocument = self->_activityEventsDocument;
  self->_activityEventsDocument = 0;

  persistedActivityEventsStorage = self->_persistedActivityEventsStorage;
  self->_persistedActivityEventsStorage = 0;

  checklistItemToActivityEventsStorage = self->_checklistItemToActivityEventsStorage;
  self->_checklistItemToActivityEventsStorage = 0;

  participantHandlesToParticipants = self->_participantHandlesToParticipants;
  self->_participantHandlesToParticipants = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantHandlesToParticipants, 0);
  objc_storeStrong((id *)&self->_replicaIDToNotesVersion, 0);
  objc_storeStrong((id *)&self->_currentReplicaID, 0);
  objc_storeStrong(&self->_checklistItemToActivityEventsStorage, 0);
  objc_storeStrong(&self->_persistedActivityEventsStorage, 0);
  objc_storeStrong((id *)&self->_activityEventsDocument, 0);
  objc_storeStrong((id *)&self->_unappliedEncryptedRecord, 0);
  objc_storeStrong((id *)&self->_lastUpdateChangeCountReason, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_userSpecificServerRecord, 0);
  objc_storeStrong((id *)&self->_serverShare, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_cryptoStrategyForMergingEncryptedData, 0);
  objc_storeStrong((id *)&self->_cryptoStrategy, 0);
  objc_storeStrong((id *)&self->_decryptedValues, 0);
}

- (id)valueForEncryptableKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ICCloudSyncingObject willAccessValueForKey:](self, "willAccessValueForKey:", v4);
  -[ICCloudSyncingObject primitiveValueForEncryptableKey:](self, "primitiveValueForEncryptableKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject didAccessValueForKey:](self, "didAccessValueForKey:", v4);

  return v5;
}

- (id)primitiveValueForEncryptableKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected"))
    -[ICCloudSyncingObject decryptedValueForKey:](self, "decryptedValueForKey:", v4);
  else
    -[ICCloudSyncingObject primitiveValueForKey:](self, "primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAuthenticated
{
  void *v2;
  char v3;

  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  return v3;
}

- (ICCloudSyncingObjectCryptoStrategy)cryptoStrategy
{
  void *v3;
  NSObject *v4;
  ICCloudSyncingObjectCryptoStrategy *v5;
  void *v6;
  BOOL v7;
  ICCloudSyncingObjectCryptoStrategy **p_cryptoStrategy;
  ICCloudSyncingObjectCryptoStrategy *cryptoStrategy;
  NSObject *v10;
  ICCloudSyncingObjectCryptoStrategy *v11;

  -[ICCloudSyncingObject cryptoStrategyForMergingEncryptedData](self, "cryptoStrategyForMergingEncryptedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject cryptoStrategy].cold.2();

    -[ICCloudSyncingObject cryptoStrategyForMergingEncryptedData](self, "cryptoStrategyForMergingEncryptedData");
    v5 = (ICCloudSyncingObjectCryptoStrategy *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = -[ICCloudSyncingObject canHaveCryptoStrategy](self, "canHaveCryptoStrategy");
  p_cryptoStrategy = &self->_cryptoStrategy;
  cryptoStrategy = self->_cryptoStrategy;
  if (v7)
  {
    if (cryptoStrategy)
    {
      v5 = cryptoStrategy;
LABEL_5:
      v6 = v5;
      return (ICCloudSyncingObjectCryptoStrategy *)v6;
    }
    -[ICCloudSyncingObject validatedCreateCryptoStrategy](self, "validatedCreateCryptoStrategy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[ICCloudSyncingObject cryptoStrategyIsTransient](self, "cryptoStrategyIsTransient"))
      objc_storeStrong((id *)&self->_cryptoStrategy, v6);
  }
  else
  {
    if (cryptoStrategy)
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject cryptoStrategy].cold.1();

      -[ICCloudSyncingObjectCryptoStrategy invalidateStrategy](*p_cryptoStrategy, "invalidateStrategy");
      v11 = *p_cryptoStrategy;
      *p_cryptoStrategy = 0;

    }
    v6 = 0;
  }
  return (ICCloudSyncingObjectCryptoStrategy *)v6;
}

- (ICCloudSyncingObjectCryptoStrategy)cryptoStrategyForMergingEncryptedData
{
  return self->_cryptoStrategyForMergingEncryptedData;
}

- (BOOL)canHaveCryptoStrategy
{
  int v3;

  v3 = -[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected");
  if (v3)
  {
    if ((-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported");
  }
  return v3;
}

- (CKShare)serverShareCheckingParent
{
  ICCloudSyncingObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  v3 = 0;
  v4 = v2;
  while (v4)
  {
    objc_msgSend(v4, "serverShare");
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "parentCloudObject");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
    v4 = (void *)v6;
    if (v5)
    {
      if (-[ICCloudSyncingObject shareMatchesRecord](v2, "shareMatchesRecord"))
        break;
    }
  }

  return (CKShare *)v3;
}

- (BOOL)isSharedViaICloud
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_nonCurrentUserParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[ICCloudSyncingObject shareMatchesRecord](self, "shareMatchesRecord");

    if (v5)
      return 1;
  }
  else
  {

  }
  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "share");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      return 1;
  }
  -[ICCloudSyncingObject zoneOwnerName](self, "zoneOwnerName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ICCloudSyncingObject zoneOwnerName](self, "zoneOwnerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C94730]);

    if (!v10)
      return 1;
  }
  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ic_isPublicShare");

  if ((v12 & 1) != 0)
    return 1;
  -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "isSharedViaICloud");
  else
    v15 = 0;

  return v15;
}

- (CKShare)serverShare
{
  CKShare *serverShare;
  void *v4;
  void *v5;
  CKShare *v6;
  CKShare *v7;

  serverShare = self->_serverShare;
  if (!serverShare)
  {
    -[ICCloudSyncingObject serverShareData](self, "serverShareData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "shareSystemFieldsTransformer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reverseTransformedValue:", v4);
      v6 = (CKShare *)objc_claimAutoreleasedReturnValue();
      v7 = self->_serverShare;
      self->_serverShare = v6;

    }
    serverShare = self->_serverShare;
  }
  return serverShare;
}

- (NSString)zoneOwnerName
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCloudSyncingObject willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("zoneOwnerName"));
  -[ICCloudSyncingObject primitiveZoneOwnerName](self, "primitiveZoneOwnerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("zoneOwnerName"));
  if (!v3)
  {
    -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "zoneOwnerName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return (NSString *)v3;
}

- (BOOL)isUnsupported
{
  uint64_t v3;
  void *v5;
  char v6;

  v3 = +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion");
  if (v3 < -[ICCloudSyncingObject minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion"))
    return 1;
  -[ICCloudSyncingObject parentCloudObjectForMinimumSupportedVersionPropagation](self, "parentCloudObjectForMinimumSupportedVersionPropagation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnsupported");

  return v6;
}

+ (int64_t)currentNotesVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)ICDebugDecrementedNotesVersion;
  if (!ICDebugDecrementedNotesVersion)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("DebugNotesVersionDecrementAmount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0CB37E8];
    if (v4)
    {
      objc_opt_class();
      ICDynamicCast();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");
      if (v7 >= 0)
        v8 = v7;
      else
        v8 = -v7;

      v5 = (void *)MEMORY[0x1E0CB37E8];
      v9 = (15 - v8) & ~((15 - v8) >> 63);
    }
    else
    {
      v9 = 15;
    }
    objc_msgSend(v5, "numberWithInteger:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)ICDebugDecrementedNotesVersion;
    ICDebugDecrementedNotesVersion = v10;

    v2 = (void *)ICDebugDecrementedNotesVersion;
    if (!ICDebugDecrementedNotesVersion)
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((ICDebugDecrementedNotesVersion) != nil)", "+[ICCloudSyncingObject currentNotesVersion]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "ICDebugDecrementedNotesVersion");
      v2 = (void *)ICDebugDecrementedNotesVersion;
    }
  }
  return (int)objc_msgSend(v2, "intValue");
}

- (CKRecord)serverRecord
{
  CKRecord *serverRecord;
  void *v4;
  void *v5;
  CKRecord *v6;
  CKRecord *v7;

  serverRecord = self->_serverRecord;
  if (!serverRecord)
  {
    -[ICCloudSyncingObject serverRecordData](self, "serverRecordData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "recordSystemFieldsTransformer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reverseTransformedValue:", v4);
      v6 = (CKRecord *)objc_claimAutoreleasedReturnValue();
      v7 = self->_serverRecord;
      self->_serverRecord = v6;

    }
    serverRecord = self->_serverRecord;
  }
  return serverRecord;
}

- (BOOL)isVisible
{
  if ((-[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion") & 1) != 0
    || (-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return !-[ICCloudSyncingObject isDeprecated](self, "isDeprecated");
  }
}

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICCloudSyncingObject;
  -[ICCloudSyncingObject awakeFromFetch](&v11, sel_awakeFromFetch);
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0C97B20];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_cloudState);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, v9);

    NSStringFromSelector(sel_cloudSyncingObject);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrimitiveValue:forKey:", self, v10);

  }
  -[ICCloudSyncingObject setNeedsToLoadDecryptedValues:](self, "setNeedsToLoadDecryptedValues:", 1);
  -[ICCloudSyncingObject addAuthenticationStateObserversIfNeeded](self, "addAuthenticationStateObserversIfNeeded");
}

- (ICCloudSyncingObject)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  ICCloudSyncingObject *v4;
  ICCloudSyncingObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICCloudSyncingObject;
  v4 = -[ICCloudSyncingObject initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_needsToLoadDecryptedValues = 1;
    -[ICCloudSyncingObject addAuthenticationStateObserversIfNeeded](v4, "addAuthenticationStateObserversIfNeeded");
  }
  return v5;
}

- (void)addAuthenticationStateObserversIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[ICCloudSyncingObject didAddAuthenticationStateObservers](self, "didAddAuthenticationStateObservers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_authenticationStateWillDeauthenticate_, CFSTR("ICAuthenticationStateWillDeauthenticateNotification"), v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_authenticationStateDidDeauthenticate_, CFSTR("ICAuthenticationStateDidDeauthenticateNotification"), v6);

    -[ICCloudSyncingObject setDidAddAuthenticationStateObservers:](self, "setDidAddAuthenticationStateObservers:", 1);
  }
}

- (BOOL)didAddAuthenticationStateObservers
{
  return self->_didAddAuthenticationStateObservers;
}

- (void)setDidAddAuthenticationStateObservers:(BOOL)a3
{
  self->_didAddAuthenticationStateObservers = a3;
}

- (void)setNeedsToLoadDecryptedValues:(BOOL)a3
{
  self->_needsToLoadDecryptedValues = a3;
}

- (BOOL)isDeprecated
{
  return 0;
}

- (id)parentCloudObject
{
  return 0;
}

- (BOOL)mergeUnappliedEncryptedRecordRecursively
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[ICCloudSyncingObject mergeUnappliedEncryptedRecord](self, "mergeUnappliedEncryptedRecord");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICCloudSyncingObject allChildCloudObjects](self, "allChildCloudObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 &= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "mergeUnappliedEncryptedRecordRecursively");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)mergeUnappliedEncryptedRecord
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[ICCloudSyncingObject isMergingUnappliedEncryptedRecord](self, "isMergingUnappliedEncryptedRecord"))
    return 1;
  -[ICCloudSyncingObject unappliedEncryptedRecord](self, "unappliedEncryptedRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  if (-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Merging unapplied encrypted record… {object: %@}", (uint8_t *)&v15, 0xCu);

    }
    -[ICCloudSyncingObject unappliedEncryptedRecord](self, "unappliedEncryptedRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[ICCloudSyncingObject setMergingRecord:](self, "setMergingRecord:", 1);
      -[ICCloudSyncingObject setMergingUnappliedEncryptedRecord:](self, "setMergingUnappliedEncryptedRecord:", 1);
      -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:](self, "mergeCloudKitRecord:accountID:approach:", v6, v8, 0);

      -[ICCloudSyncingObject setMergingUnappliedEncryptedRecord:](self, "setMergingUnappliedEncryptedRecord:", 0);
      -[ICCloudSyncingObject setMergingRecord:](self, "setMergingRecord:", 0);
      -[ICCloudSyncingObject unappliedEncryptedRecord](self, "unappliedEncryptedRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = os_log_create("com.apple.notes", "Crypto");
      v11 = v10;
      if (!v9)
      {
        v12 = 1;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_INFO, "Merged unapplied encrypted record {object: %@}", (uint8_t *)&v15, 0xCu);

        }
        goto LABEL_16;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObject mergeUnappliedEncryptedRecord].cold.2(self);
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObject mergeUnappliedEncryptedRecord].cold.1(self);
    }
    v12 = 0;
LABEL_16:

    return v12;
  }
  return 0;
}

- (BOOL)isMergingUnappliedEncryptedRecord
{
  return self->mergingUnappliedEncryptedRecord;
}

- (NSUUID)currentReplicaID
{
  NSUUID *currentReplicaID;
  NSUUID *v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUUID *v13;
  void *v14;
  void *v15;
  NSUUID *v16;

  currentReplicaID = self->_currentReplicaID;
  if (currentReplicaID)
  {
    v3 = currentReplicaID;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICTestHostBundleIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      ICNotesAppBundleIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replicaIDForBundleIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      v3 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replicaIDForBundleIdentifier:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      v3 = v16;

    }
  }
  return v3;
}

- (NSArray)allChildCloudObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[ICCloudSyncingObject childCloudObjects](self, "childCloudObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICCloudSyncingObject childCloudObjects](self, "childCloudObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "allChildCloudObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSArray)childCloudObjects
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isSharedReadOnly
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "currentUserParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "permission") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)predicateForVisibleObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForUnmarkedForDeletionObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForFetchedFromCloudObjects", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForDeprecatedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notPredicateWithSubpredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForFetchedFromCloudObjects
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsInitialFetchFromCloud == NO"));
}

+ (id)predicateForUnmarkedForDeletionObjects
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("markedForDeletion == NO"));
}

+ (id)predicateForDeprecatedObjects
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (BOOL)isSharedRootObject
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[ICCloudSyncingObject serverRecord](self, "serverRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "share");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v5 = -[ICCloudSyncingObject shareMatchesRecord](self, "shareMatchesRecord");
  else
    v5 = 0;

  return v5;
}

void __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject ic_existingObjectWithID:context:](ICCloudSyncingObject, "ic_existingObjectWithID:context:", v2, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "mergeUnappliedEncryptedRecordRecursively");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v5, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_saveWithLogDescription:", CFSTR("Merged unapplied encrypted records {object: %@}"), v4);

}

void __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "workerManagedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke_2;
  v4[3] = &unk_1E76C73B0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

void __59__ICCloudSyncingObject_mergeUnappliedEncryptedRecordsQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.merge-unapplied-encrypted-records-queue", v2);
  v1 = (void *)mergeUnappliedEncryptedRecordsQueue_mergeUnappliedEncryptedRecordsQueue;
  mergeUnappliedEncryptedRecordsQueue_mergeUnappliedEncryptedRecordsQueue = (uint64_t)v0;

}

- (void)mergeUnappliedEncryptedRecordRecursivelyInBackground
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "mergeUnappliedEncryptedRecordsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ICCloudSyncingObject_mergeUnappliedEncryptedRecordRecursivelyInBackground__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isPubliclyShared
{
  void *v2;
  char v3;

  -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_isPublicShare");

  return v3;
}

- (BOOL)isPubliclySharedOrHasInvitees
{
  return -[ICCloudSyncingObject isPubliclyShared](self, "isPubliclyShared")
      || -[ICCloudSyncingObject hasInvitees](self, "hasInvitees");
}

- (BOOL)isPasswordProtectedAndLocked
{
  int v3;

  v3 = -[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected");
  if (v3)
    LOBYTE(v3) = !-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated");
  return v3;
}

- (BOOL)hasInvitees
{
  void *v2;
  BOOL v3;

  -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_nonOwnerInvitedParticipantsCount") != 0;

  return v3;
}

- (BOOL)canBeSharedViaICloud
{
  void *v3;
  int v4;

  if ((-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
    return 0;
  -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accountType");

  if (v4 != 1)
    return 0;
  else
    return !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported");
}

- (BOOL)canAuthenticate
{
  void *v2;
  char v3;

  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canAuthenticate");

  return v3;
}

+ (id)mergeUnappliedEncryptedRecordsQueue
{
  if (mergeUnappliedEncryptedRecordsQueue_onceToken != -1)
    dispatch_once(&mergeUnappliedEncryptedRecordsQueue_onceToken, &__block_literal_global_371);
  return (id)mergeUnappliedEncryptedRecordsQueue_mergeUnappliedEncryptedRecordsQueue;
}

+ (id)keyPathsForValuesAffectingZoneOwnerName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("parentCloudObject"), 0);
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("serverShare"), CFSTR("zoneOwnerName"), CFSTR("serverRecord"), 0);
}

- (void)awakeFromInsert
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICCloudSyncingObject;
  -[ICCloudSyncingObject awakeFromInsert](&v9, sel_awakeFromInsert);
  v3 = (void *)MEMORY[0x1E0C97B20];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_cloudState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v8);

  -[ICCloudSyncingObject setNeedsToLoadDecryptedValues:](self, "setNeedsToLoadDecryptedValues:", 1);
  -[ICCloudSyncingObject addAuthenticationStateObserversIfNeeded](self, "addAuthenticationStateObserversIfNeeded");

}

- (void)willSave
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "%@ - willSave - changedValues = [%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (BOOL)validateIdentifier:(id *)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  int v9;
  ICCloudSyncingObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!*a3)
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "Trying to save an object with a nil identifier: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

+ (id)keyPathsForValuesAffectingCloudAccount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("parentCloudObject.cloudAccount"));
}

- (id)cloudAccount
{
  void *v3;
  void *v4;
  NSObject *v5;

  -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject cloudAccount].cold.1(self, v5);

  }
  return v4;
}

- (void)assignToPersistentStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  if (!v4)
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject assignToPersistentStore:].cold.1(self);

    goto LABEL_7;
  }
  -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assignObject:toPersistentStore:", self, v4);

  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
    v7 = objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject cloudState](self, "cloudState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject assignObject:toPersistentStore:](v7, "assignObject:toPersistentStore:", v8, v4);

LABEL_7:
  }

}

- (void)setNeedsToBeFetchedFromCloud:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[ICCloudSyncingObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("needsToBeFetchedFromCloud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    if (v3)
      -[ICCloudSyncingObject clearServerRecords](self, "clearServerRecords");
    -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("needsToBeFetchedFromCloud"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("needsToBeFetchedFromCloud"));

    -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("needsToBeFetchedFromCloud"));
  }
}

- (void)updateChangeCountWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ICCloudSyncingObject updateChangeCountWithReason:].cold.1();
LABEL_11:

    goto LABEL_12;
  }
  if (-[ICCloudSyncingObject isMergingRecord](self, "isMergingRecord"))
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ICCloudSyncingObject updateChangeCountWithReason:].cold.2();
    goto LABEL_11;
  }
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject updateChangeCountWithReason:].cold.3();
    goto LABEL_11;
  }
  -[ICCloudSyncingObject unsafelyUpdateChangeCountWithReason:](self, "unsafelyUpdateChangeCountWithReason:", v4);
LABEL_12:

}

- (void)clearChangeCountWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICCloudSyncingObject unsafelyClearChangeCountWithReason:](self, "unsafelyClearChangeCountWithReason:", v4);
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject clearChangeCountWithReason:].cold.1();

  }
}

- (void)unsafelyClearChangeCountWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentLocalVersion:", 0);

  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLatestVersionSyncedToCloud:", 0);

  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalVersionDate:", 0);

  v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObject unsafelyClearChangeCountWithReason:].cold.1();

}

- (void)updateUserSpecificChangeCountWithReason:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "supportsUserSpecificRecords") & 1) == 0)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:].cold.3();
    goto LABEL_10;
  }
  if (!-[ICCloudSyncingObject wantsUserSpecificRecord](self, "wantsUserSpecificRecord"))
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:].cold.2();
    goto LABEL_10;
  }
  if ((-[ICCloudSyncingObject needsToSaveUserSpecificRecord](self, "needsToSaveUserSpecificRecord") & 1) == 0)
  {
    -[ICCloudSyncingObject setNeedsToSaveUserSpecificRecord:](self, "setNeedsToSaveUserSpecificRecord:", 1);
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:].cold.1();
LABEL_10:

  }
}

- (void)clearServerRecords
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Clearing server records… {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (ICCloudSyncingObject)objectWithRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  objc_msgSend(a1, "objectsWithRecordID:context:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ICCloudSyncingObject_objectWithRecordID_accountID_context___block_invoke;
  v13[3] = &unk_1E76CAAF0;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "ic_objectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCloudSyncingObject *)v11;
}

uint64_t __61__ICCloudSyncingObject_objectWithRecordID_accountID_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "cloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)objectsWithRecordID:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)failureCountQueue
{
  if (failureCountQueue_onceToken != -1)
    dispatch_once(&failureCountQueue_onceToken, &__block_literal_global_26);
  return (id)failureCountQueue_failureCountQueue;
}

void __41__ICCloudSyncingObject_failureCountQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.cloud.failure-counts", v2);
  v1 = (void *)failureCountQueue_failureCountQueue;
  failureCountQueue_failureCountQueue = (uint64_t)v0;

}

+ (id)failedToSyncCountsByIdentifier
{
  if (failedToSyncCountsByIdentifier_onceToken != -1)
    dispatch_once(&failedToSyncCountsByIdentifier_onceToken, &__block_literal_global_93);
  return (id)failedToSyncCountsByIdentifier_failedToSyncCountsByIdentifier;
}

void __54__ICCloudSyncingObject_failedToSyncCountsByIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)failedToSyncCountsByIdentifier_failedToSyncCountsByIdentifier;
  failedToSyncCountsByIdentifier_failedToSyncCountsByIdentifier = v0;

}

- (int64_t)failedToSyncCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend((id)objc_opt_class(), "failureCountQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__ICCloudSyncingObject_failedToSyncCount__block_invoke;
  v6[3] = &unk_1E76C76B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __41__ICCloudSyncingObject_failedToSyncCount__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "failedToSyncCountsByIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Trying to get failed to sync count without identifier", v6, 2u);
    }

  }
}

- (void)setFailedToSyncCount:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  objc_msgSend((id)objc_opt_class(), "failureCountQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ICCloudSyncingObject_setFailedToSyncCount___block_invoke;
  v6[3] = &unk_1E76CAB58;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

void __45__ICCloudSyncingObject_setFailedToSyncCount___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_t v5;
  void *v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "failedToSyncCountsByIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v6, v2);

    }
    else
    {
      -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", v2);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Trying to set failed to sync count without identifier", v7, 2u);
    }
  }

}

+ (id)numberOfPushAttemptsToWaitByIdentifier
{
  if (numberOfPushAttemptsToWaitByIdentifier_onceToken != -1)
    dispatch_once(&numberOfPushAttemptsToWaitByIdentifier_onceToken, &__block_literal_global_95);
  return (id)numberOfPushAttemptsToWaitByIdentifier_numberOfPushAttemptsToWaitByIdentifier;
}

void __62__ICCloudSyncingObject_numberOfPushAttemptsToWaitByIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)numberOfPushAttemptsToWaitByIdentifier_numberOfPushAttemptsToWaitByIdentifier;
  numberOfPushAttemptsToWaitByIdentifier_numberOfPushAttemptsToWaitByIdentifier = v0;

}

- (int64_t)numberOfPushAttemptsToWaitCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend((id)objc_opt_class(), "failureCountQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__ICCloudSyncingObject_numberOfPushAttemptsToWaitCount__block_invoke;
  v6[3] = &unk_1E76C76B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __55__ICCloudSyncingObject_numberOfPushAttemptsToWaitCount__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "numberOfPushAttemptsToWaitByIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Trying to get number of push attempts to wait without identifier", v6, 2u);
    }

  }
}

- (void)setNumberOfPushAttemptsToWaitCount:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  objc_msgSend((id)objc_opt_class(), "failureCountQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ICCloudSyncingObject_setNumberOfPushAttemptsToWaitCount___block_invoke;
  v6[3] = &unk_1E76CAB58;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

void __59__ICCloudSyncingObject_setNumberOfPushAttemptsToWaitCount___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_t v5;
  void *v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "numberOfPushAttemptsToWaitByIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v6, v2);

    }
    else
    {
      -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", v2);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Trying to set number of push attempts to wait without identifier", v7, 2u);
    }
  }

}

- (void)incrementFailureCounts
{
  NSObject *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[ICCloudSyncingObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount"))
    -[ICCloudSyncingObject setNumberOfPushAttemptsToWaitCount:](self, "setNumberOfPushAttemptsToWaitCount:", 3);
  -[ICCloudSyncingObject setFailedToSyncCount:](self, "setFailedToSyncCount:", -[ICCloudSyncingObject failedToSyncCount](self, "failedToSyncCount") + 1);
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject className](self, "className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICCloudSyncingObject failedToSyncCount](self, "failedToSyncCount");
    v6 = -[ICCloudSyncingObject failedToSyncCount](self, "failedToSyncCount");
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413570;
    v9 = v4;
    v10 = 1024;
    v11 = v5;
    v12 = 1024;
    v13 = 3;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = 6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed. Incrementing failedToSyncCount, failure (%d/%d) before being temporarily ignored. (%d/%d) before deleting change tokens and full re-sync. %@", (uint8_t *)&v8, 0x2Eu);

  }
  if (-[ICCloudSyncingObject failedToSyncCount](self, "failedToSyncCount") >= 6)
  {
    -[ICCloudSyncingObject clearServerRecords](self, "clearServerRecords");
    -[ICCloudSyncingObject deleteChangeTokensAndReSync](self, "deleteChangeTokensAndReSync");
  }
}

- (void)decrementFailureCounts
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[ICCloudSyncingObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount") >= 1)
    -[ICCloudSyncingObject setNumberOfPushAttemptsToWaitCount:](self, "setNumberOfPushAttemptsToWaitCount:", -[ICCloudSyncingObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount") - 1);
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject className](self, "className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICCloudSyncingObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount");
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v4;
    v9 = 1024;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Decrementing failure counts for %@, %d push attempts before it is retried. %@", (uint8_t *)&v7, 0x1Cu);

  }
}

- (void)deleteChangeTokensAndReSync
{
  NSObject *v0;
  void *v1;
  int v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_6_0();
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v3, "className");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "failedToSyncCount");
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = v1;
  v7 = 1024;
  v8 = v2;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Failed to sync %@ %d times. Now resetting failure counts, deleting change tokens, and trying full re-sync. %@", (uint8_t *)&v5, 0x1Cu);

  OUTLINED_FUNCTION_7();
}

void __51__ICCloudSyncingObject_deleteChangeTokensAndReSync__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "numberOfPushAttemptsToWaitByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend((id)objc_opt_class(), "failedToSyncCountsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "cloudContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteAllServerChangeTokens");

  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 2);
  objc_msgSend(*(id *)(a1 + 32), "cloudContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncWithReason:completionHandler:", CFSTR("DeletedChangeTokensDueToFailures"), 0);

}

- (void)resetFailureCounts
{
  -[ICCloudSyncingObject setFailedToSyncCount:](self, "setFailedToSyncCount:", 0);
  -[ICCloudSyncingObject setNumberOfPushAttemptsToWaitCount:](self, "setNumberOfPushAttemptsToWaitCount:", 0);
}

- (BOOL)shouldBeIgnoredForSync
{
  NSObject *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[ICCloudSyncingObject failedToSyncCount](self, "failedToSyncCount") < 3
    || -[ICCloudSyncingObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount") < 1)
  {
    return 0;
  }
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject className](self, "className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICCloudSyncingObject failedToSyncCount](self, "failedToSyncCount");
    v6 = -[ICCloudSyncingObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount");
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413314;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v13 = 1024;
    v14 = 3;
    v15 = 1024;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed %d times. Max number of retries is %d. It will now be ignored for %d push attempts. %@", (uint8_t *)&v9, 0x28u);

  }
  return 1;
}

- (NSString)recordZoneName
{
  return (NSString *)CFSTR("Notes");
}

- (NSString)recordType
{
  return (NSString *)&stru_1E76DB108;
}

- (CKRecordID)recordID
{
  void *v3;
  void *v4;
  os_log_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;

  -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICCloudSyncingObject recordName](self, "recordName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[ICCloudSyncingObject recordZoneName](self, "recordZoneName");
      v5 = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v5, "length"))
      {
        -[ICCloudSyncingObject zoneOwnerName](self, "zoneOwnerName");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)v6;
        v8 = (void *)*MEMORY[0x1E0C94730];
        if (v6)
          v8 = (void *)v6;
        v9 = v8;

        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v5, v9);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v4, v10);

        goto LABEL_17;
      }
      v12 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject recordID].cold.3(self);

    }
    else
    {
      v5 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject recordID].cold.2(self);

    }
    v11 = 0;
    goto LABEL_17;
  }
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObject recordID].cold.1(self);
  v11 = 0;
  v4 = v5;
LABEL_17:

  return (CKRecordID *)v11;
}

- (int64_t)databaseScope
{
  void *v2;
  int64_t v3;

  -[ICCloudSyncingObject recordID](self, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "databaseScope");

  return v3;
}

- (BOOL)needsToBeDeletedFromCloud
{
  if (-[ICCloudSyncingObject supportsDeletionByTTL](self, "supportsDeletionByTTL")
    || !-[ICCloudSyncingObject isInCloud](self, "isInCloud"))
  {
    return 0;
  }
  else
  {
    return -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion");
  }
}

- (BOOL)isInICloudAccount
{
  return 0;
}

- (BOOL)isValidObject
{
  ICCloudSyncingObject *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ICCloudSyncingObject_isValidObject__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __37__ICCloudSyncingObject_isValidObject__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newObjectWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[6];
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  char v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__21;
  v24 = __Block_byref_object_dispose__21;
  objc_msgSend(a1, "entity");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21[5])
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__ICCloudSyncingObject_newObjectWithIdentifier_context___block_invoke;
    v19[3] = &unk_1E76C76E0;
    v19[4] = &v20;
    v19[5] = a1;
    objc_msgSend(v7, "performBlockAndWait:", v19);
  }
  objc_msgSend(v7, "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entitiesByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[5], "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 && v12 != v21[5])
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[ICCloudSyncingObject newObjectWithIdentifier:context:].cold.2();

    objc_storeStrong(v21 + 5, v12);
  }
  v14 = objc_alloc((Class)objc_opt_class());
  v15 = (void *)objc_msgSend(v14, "initWithEntity:insertIntoManagedObjectContext:", v21[5], v7);
  objc_msgSend(v15, "setIdentifier:", v6);
  v16 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "shortLoggingDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCloudSyncingObject newObjectWithIdentifier:context:].cold.1(v17, (uint64_t)v26, v16);
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __56__ICCloudSyncingObject_newObjectWithIdentifier_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "entity");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", a3, v8);
  objc_msgSend(v10, "setNeedsInitialFetchFromCloud:", 1);
  objc_msgSend(v10, "setInCloud:", 1);
  +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "persistentStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assignToPersistentStore:", v12);

  return v10;
}

+ (id)cloudObjectWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  if (v6
    && (objc_msgSend(v6, "ic_trimmedString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ICCloudSyncingObject cloudObjectWithIdentifier:context:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v12 = 0;
  }

  return v12;
}

+ (id)allCloudObjectIDsInContext:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21;
  v21 = __Block_byref_object_dispose__21;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __63__ICCloudSyncingObject_allCloudObjectIDsInContext_passingTest___block_invoke;
  v14 = &unk_1E76CABA0;
  v8 = v7;
  v15 = v8;
  v16 = &v17;
  objc_msgSend(a1, "enumerateAllCloudObjectsInContext:batchSize:saveAfterBatch:usingBlock:", v6, 20, 0, &v11);
  v9 = (void *)objc_msgSend((id)v18[5], "copy", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __63__ICCloudSyncingObject_allCloudObjectIDsInContext_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  if (!v6 || (v7 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3), v5 = v10, v7))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v5 = v10;
  }

}

+ (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
  objc_msgSend(a1, "enumerateAllCloudObjectsInContext:predicate:sortDescriptors:relationshipKeyPathsForPrefetching:batchSize:saveAfterBatch:usingBlock:", a3, 0, 0, 0, a4, a5, a6);
}

+ (void)enumerateAllCloudObjectsInContext:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 batchSize:(unint64_t)a7 saveAfterBatch:(BOOL)a8 usingBlock:(id)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t aBlock;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;

  v9 = a8;
  v16 = a9;
  aBlock = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __155__ICCloudSyncingObject_enumerateAllCloudObjectsInContext_predicate_sortDescriptors_relationshipKeyPathsForPrefetching_batchSize_saveAfterBatch_usingBlock___block_invoke;
  v26 = &unk_1E76CABC8;
  v27 = v16;
  v17 = v16;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = _Block_copy(&aBlock);
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v20, v19, v18, v21, a7, v9, v22, aBlock, v24, v25, v26);

}

void __155__ICCloudSyncingObject_enumerateAllCloudObjectsInContext_predicate_sortDescriptors_relationshipKeyPathsForPrefetching_batchSize_saveAfterBatch_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isInICloudAccount"))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v6, a3);
  }

}

- (id)newlyCreatedRecord
{
  return -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](self, "makeCloudKitRecordForApproach:mergeableFieldState:", 0, 0);
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3
{
  return -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](self, "makeCloudKitRecordForApproach:mergeableFieldState:", a3, 0);
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
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
  NSObject *v45;

  v6 = a4;
  if (a3 == 1)
  {
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_copyWithUserFields:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      goto LABEL_11;
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
  }
  v9 = (void *)v8;

  if (v9)
  {
    -[ICCloudSyncingObject recordName](self, "recordName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_17;
    v11 = (void *)v10;
    objc_msgSend(v9, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject recordName](self, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "ic_isCaseInsensitiveEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_17;
    v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:].cold.3();

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 1, CFSTR("Object has server record with mismatched record name"));
  }
LABEL_11:
  -[ICCloudSyncingObject recordID](self, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0C95048]);
    -[ICCloudSyncingObject recordType](self, "recordType");
    v19 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v18, "initWithRecordType:recordID:", v19, v17);
  }
  else
  {
    v19 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:].cold.2(self);

    v9 = 0;
  }

LABEL_17:
  -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recordID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "zoneID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "zoneID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "isEqual:", v25);

    if (v26)
    {
      objc_msgSend(v9, "setParent:", 0);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v22, 0);
      objc_msgSend(v9, "setParent:", v27);

    }
  }
  else if (objc_msgSend(v9, "ic_isOwnedByCurrentUser"))
  {
    objc_msgSend(v9, "setParent:", 0);
  }
  if (-[ICCloudSyncingObject shouldSyncMinimumSupportedNotesVersion](self, "shouldSyncMinimumSupportedNotesVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICCloudSyncingObject minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("MinimumSupportedNotesVersion"));

  }
  if (!a3)
  {
    if (objc_msgSend((id)objc_opt_class(), "supportsActivityEvents")
      && (!-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected")
       || !-[ICCloudSyncingObject needsToLoadDecryptedValues](self, "needsToLoadDecryptedValues")))
    {
      -[ICCloudSyncingObject activityEventsData](self, "activityEventsData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[ICCloudSyncingObject activityEventsData](self, "activityEventsData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v30, CFSTR("ActivityEventsData"), 0);

      }
    }
    if (objc_msgSend((id)objc_opt_class(), "supportsNotesVersionTracking"))
    {
      -[ICCloudSyncingObject replicaIDToNotesVersionData](self, "replicaIDToNotesVersionData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[ICCloudSyncingObject replicaIDToNotesVersionData](self, "replicaIDToNotesVersionData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v32, CFSTR("ReplicaIDToNotesVersionData"), 0);

      }
    }
    if (-[ICCloudSyncingObject supportsDeletionByTTL](self, "supportsDeletionByTTL")
      && (-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser")
       || !-[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("Deleted"));

    }
    if ((-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected") & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[ICCloudSyncingObject cryptoSalt](self, "cryptoSalt");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, CFSTR("CryptoSalt"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICCloudSyncingObject cryptoIterationCount](self, "cryptoIterationCount"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, CFSTR("CryptoIterationCount"));

      -[ICCloudSyncingObject cryptoInitializationVector](self, "cryptoInitializationVector");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("CryptoInitializationVector"));

      -[ICCloudSyncingObject cryptoTag](self, "cryptoTag");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v37, CFSTR("CryptoTag"));

      -[ICCloudSyncingObject cryptoWrappedKey](self, "cryptoWrappedKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v38, CFSTR("CryptoWrappedKey"));

      -[ICCloudSyncingObject passwordHint](self, "passwordHint");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "dataUsingEncoding:", 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encryptedValues");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("PasswordHint"));

    }
    if (-[ICCloudSyncingObject supportsEncryptedValuesDictionary](self, "supportsEncryptedValuesDictionary")
      && (-[ICCloudSyncingObject encryptedValuesJSON](self, "encryptedValuesJSON"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v42,
          v42))
    {
      -[ICCloudSyncingObject encryptedValuesJSON](self, "encryptedValuesJSON");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ic_setInlineableDataAsset:forKeyPrefix:approach:", v43, CFSTR("EncryptedValues"), 0);

    }
    else
    {
      -[ICCloudSyncingObject encryptedValuesJSON](self, "encryptedValuesJSON");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        v45 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:].cold.1(self);

        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 1, CFSTR("Encrypted values being ignored for sync"));
      }
    }
  }

  return v9;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5
{
  return -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](self, "mergeCloudKitRecord:accountID:approach:mergeableFieldState:", a3, a4, a5, 0);
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  ICTTOrderedSetVersionedDocument *v21;
  void *v22;
  ICTTOrderedSetVersionedDocument *v23;
  void *v24;
  ICMergeableDictionary *v25;
  void *v26;
  ICMergeableDictionary *v27;
  NSObject *v28;

  v8 = a3;
  objc_msgSend(v8, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject recordID](self, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "ic_hasEqualRecordNameWithRecordID:", v10);

  v12 = os_log_create("com.apple.notes", "Cloud");
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:].cold.3();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MinimumSupportedNotesVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MinimumSupportedNotesVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject setMinimumSupportedNotesVersion:](self, "setMinimumSupportedNotesVersion:", objc_msgSend(v15, "unsignedIntegerValue"));

    }
    if (!a5)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Deleted"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Deleted"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        if ((_DWORD)v18 != -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"))
        {
          v19 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:].cold.2(self);

          -[ICCloudSyncingObject setMarkedForDeletion:](self, "setMarkedForDeletion:", v18);
        }
      }
      -[ICCloudSyncingObject mergeCryptoFieldsFromRecord:](self, "mergeCryptoFieldsFromRecord:", v8);
      objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("ActivityEventsData"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = [ICTTOrderedSetVersionedDocument alloc];
        -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[ICTTVersionedDocument initWithData:replicaID:](v21, "initWithData:replicaID:", v20, v22);
        -[ICCloudSyncingObject mergeActivityEventsDocument:](self, "mergeActivityEventsDocument:", v23);

      }
      objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("ReplicaIDToNotesVersionData"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = [ICMergeableDictionary alloc];
        -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[ICMergeableDictionary initWithData:replicaID:](v25, "initWithData:replicaID:", v24, v26);

        -[ICCloudSyncingObject mergeReplicaIDToNotesVersion:](self, "mergeReplicaIDToNotesVersion:", v27);
      }
      if (-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected")
        && !-[ICCloudSyncingObject mergeEncryptedDataFromRecord:](self, "mergeEncryptedDataFromRecord:", v8))
      {
        v28 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:].cold.1(self);

      }
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:].cold.4();

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 1, CFSTR("Record mismatch when merging remote record"));
    objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 9);
  }

  return v11;
}

- (CKRecord)unappliedEncryptedRecord
{
  CKRecord **p_unappliedEncryptedRecord;
  CKRecord *unappliedEncryptedRecord;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;

  p_unappliedEncryptedRecord = &self->_unappliedEncryptedRecord;
  unappliedEncryptedRecord = self->_unappliedEncryptedRecord;
  if (unappliedEncryptedRecord)
    return unappliedEncryptedRecord;
  -[ICCloudSyncingObject unappliedEncryptedRecordData](self, "unappliedEncryptedRecordData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject unappliedEncryptedRecord].cold.2(self, v7);

    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v9)
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObject unappliedEncryptedRecord].cold.1();

      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject unappliedEncryptedRecord]", 1, 1, CFSTR("Error unarchiving unapplied encrypted record data"));
      v11 = 0;
    }
    else
    {
      objc_storeStrong((id *)p_unappliedEncryptedRecord, v8);
      v11 = v8;
    }

  }
  else
  {
    v11 = 0;
  }

  return (CKRecord *)v11;
}

- (void)setUnappliedEncryptedRecord:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;

  v5 = a3;
  v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObject setUnappliedEncryptedRecord:].cold.3();

  if (!v5)
  {
    v7 = 0;
    goto LABEL_10;
  }
  if ((-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
  {
    -[ICCloudSyncingObject inlineAssetsForRecord:](self, "inlineAssetsForRecord:", v5);
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v11);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v8)
    {
      v9 = v8;
      v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObject setUnappliedEncryptedRecord:].cold.1();

      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject setUnappliedEncryptedRecord:]", 1, 1, CFSTR("Error archiving unapplied encrypted record"));
      goto LABEL_14;
    }
LABEL_10:
    objc_storeStrong((id *)&self->_unappliedEncryptedRecord, a3);
    -[ICCloudSyncingObject setUnappliedEncryptedRecordData:](self, "setUnappliedEncryptedRecordData:", v7);
    goto LABEL_14;
  }
  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ICCloudSyncingObject setUnappliedEncryptedRecord:].cold.2(self);

LABEL_14:
}

- (void)inlineAssetsForRecord:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ICCloudSyncingObject supportsEncryptedValuesDictionary](self, "supportsEncryptedValuesDictionary"))
    objc_msgSend(v4, "ic_inlineDataAssetForKeyPrefix:", CFSTR("EncryptedValues"));

}

- (void)mergeCryptoFieldsFromRecord:(id)a3
{
  id v4;
  NSObject *v5;
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

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObject mergeCryptoFieldsFromRecord:].cold.1();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CryptoSalt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CryptoSalt"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoSalt:](self, "setCryptoSalt:", v7);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CryptoIterationCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CryptoIterationCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoIterationCount:](self, "setCryptoIterationCount:", objc_msgSend(v9, "unsignedIntegerValue"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CryptoWrappedKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CryptoWrappedKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoWrappedKey:](self, "setCryptoWrappedKey:", v11);

  }
  objc_msgSend(v4, "encryptedValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PasswordHint"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject setPasswordHint:](self, "setPasswordHint:", v14);

  -[ICCloudSyncingObject cryptoSalt](self, "cryptoSalt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[ICCloudSyncingObject setIsPasswordProtected:](self, "setIsPasswordProtected:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ICCloudSyncingObject mergeCryptoTagAndInitializationVectorFromRecord:](self, "mergeCryptoTagAndInitializationVectorFromRecord:", v4);

}

- (void)mergeCryptoTagAndInitializationVectorFromRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoInitializationVector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoInitializationVector"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoInitializationVector:](self, "setCryptoInitializationVector:", v5);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoTag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoTag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoTag:](self, "setCryptoTag:", v7);

  }
}

- (BOOL)needsToBePushedToCloud
{
  NSObject *v3;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  if ((-[ICCloudSyncingObject needsToBeFetchedFromCloud](self, "needsToBeFetchedFromCloud") & 1) != 0
    || -[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject needsToBePushedToCloud].cold.1(self);
LABEL_5:

    return 0;
  }
  if (-[ICCloudSyncingObject hasSuccessfullyPushedLatestVersionToCloud](self, "hasSuccessfullyPushedLatestVersionToCloud"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject needsToBePushedToCloud].cold.2(self);
    goto LABEL_5;
  }
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICCloudSyncingObject isPushingSameOrLaterThanVersion:](self, "isPushingSameOrLaterThanVersion:", objc_msgSend(v5, "currentLocalVersion"));

  if (v6)
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject needsToBePushedToCloud].cold.8(self);
    goto LABEL_5;
  }
  if (-[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion")
    && !-[ICCloudSyncingObject isInCloud](self, "isInCloud"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject needsToBePushedToCloud].cold.7(self);
    goto LABEL_5;
  }
  -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "markedForDeletion") & 1) != 0)
  {
    -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInCloud");

    if ((v9 & 1) == 0)
    {
      v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject needsToBePushedToCloud].cold.6();
      goto LABEL_5;
    }
  }
  else
  {

  }
  -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "needsInitialFetchFromCloud") & 1) != 0)
  {
    -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isInCloud");

    if ((v12 & 1) == 0)
    {
      v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject needsToBePushedToCloud].cold.5();
      goto LABEL_5;
    }
  }
  else
  {

  }
  if (-[ICCloudSyncingObject isSharedReadOnly](self, "isSharedReadOnly"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject needsToBePushedToCloud].cold.3(self);
    goto LABEL_5;
  }
  if (-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICCloudSyncingObject unappliedEncryptedRecord](self, "unappliedEncryptedRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || -[ICCloudSyncingObject isMergingUnappliedEncryptedRecord](self, "isMergingUnappliedEncryptedRecord"))
    {
      v14 = -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion");

      if ((v14 & 1) == 0)
      {
        v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
          -[ICCloudSyncingObject needsToBePushedToCloud].cold.4(self);
        goto LABEL_5;
      }
    }
  }
  return 1;
}

+ (id)keyPathsForValuesAffectingNeedsToBePushedToCloud
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("needsToBeFetchedFromCloud"), CFSTR("needsInitialFetchFromCloud"), 0);
}

- (BOOL)hasSuccessfullyPushedLatestVersionToCloud
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "latestVersionSyncedToCloud");
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 >= objc_msgSend(v5, "currentLocalVersion");

  return v4;
}

- (BOOL)needsToFetchAfterServerRecordChanged:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend((id)objc_opt_class(), "needsToReFetchServerRecordValue:", v9);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)needsToReFetchServerRecordValue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            if ((objc_msgSend(a1, "needsToReFetchServerRecordValue:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
            {

              v6 = 1;
              goto LABEL_15;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    v6 = 0;
  }
LABEL_15:

  return v6;
}

- (void)objectWasDeletedFromCloud
{
  -[ICCloudSyncingObject setInCloud:](self, "setInCloud:", 0);
  -[ICCloudSyncingObject resetFailureCounts](self, "resetFailureCounts");
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Marking %@ for deletion after being deleted from cloud by another device", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)objectWillBePushedToCloudWithOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject setVersion:forOperation:](self, "setVersion:forOperation:", objc_msgSend(v5, "currentLocalVersion"), v4);

}

- (BOOL)objectFailedToBePushedToCloudWithOperation:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
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
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICCloudSyncingObject cloudContext](self, "cloudContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountIDForDatabase:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v10, "code");
  v15 = 1;
  if (v14 <= 19)
  {
    if ((unint64_t)(v14 - 6) < 2)
      goto LABEL_35;
    if (v14 == 11)
    {
      v29 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v9, "ic_loggingDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_loggingDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138413058;
        v47 = v13;
        v48 = 2112;
        v49 = v39;
        v50 = 2112;
        v51 = v40;
        v52 = 2112;
        v53 = v10;
        _os_log_debug_impl(&dword_1BD918000, v29, OS_LOG_TYPE_DEBUG, "Invalid cached server record in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);

      }
      -[ICCloudSyncingObject setServerRecord:](self, "setServerRecord:", 0);
    }
    else
    {
      if (v14 == 14)
      {
        objc_msgSend(v10, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "recordID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCloudSyncingObject recordID](self, "recordID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "ic_hasEqualRecordNameWithRecordID:", v20);

          if (!v21)
          {
            v31 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v18, "ic_loggingDescription");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "ic_loggingDescription");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 138413058;
              v47 = v13;
              v48 = 2112;
              v49 = v44;
              v50 = 2112;
              v51 = v45;
              v52 = 2112;
              v53 = v10;
              _os_log_error_impl(&dword_1BD918000, v31, OS_LOG_TYPE_ERROR, "Non-matching server record changed in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);

            }
            -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 1);
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject objectFailedToBePushedToCloudWithOperation:recordID:error:]", 1, 1, CFSTR("Record mismatch when merging oplock result"));
            objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 8);
            v15 = 0;
            goto LABEL_34;
          }
          v22 = -[ICCloudSyncingObject needsToFetchAfterServerRecordChanged:](self, "needsToFetchAfterServerRecordChanged:", v18);
          v23 = os_log_create("com.apple.notes", "Cloud");
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (!v22)
          {
            if (v24)
            {
              objc_msgSend(v18, "ic_loggingDescription");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "ic_loggingDescription");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 138413058;
              v47 = v13;
              v48 = 2112;
              v49 = v32;
              v50 = 2112;
              v51 = v33;
              v52 = 2112;
              v53 = v10;
              _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_INFO, "Server record changed in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);

            }
            -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:](self, "objectWasFetchedFromCloudWithRecord:accountID:", v18, v13);
            v15 = 1;
            goto LABEL_34;
          }
          if (v24)
          {
            objc_msgSend(v18, "ic_loggingDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "ic_loggingDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 138413058;
            v47 = v13;
            v48 = 2112;
            v49 = v25;
            v50 = 2112;
            v51 = v26;
            v52 = 2112;
            v53 = v10;
            v27 = "Server record changed (needs refetch) in account ID %@: %@ %@: %@";
LABEL_26:
            _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v46, 0x2Au);

          }
        }
        else
        {
          v23 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "ic_loggingDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 138413058;
            v47 = v13;
            v48 = 2112;
            v49 = v25;
            v50 = 2112;
            v51 = v26;
            v52 = 2112;
            v53 = v10;
            v27 = "Server record changed with no server record in the error in account ID %@: %@ %@: %@";
            goto LABEL_26;
          }
        }

        v15 = 1;
        -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 1);
LABEL_34:

        goto LABEL_35;
      }
LABEL_20:
      v30 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "ic_loggingDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_loggingDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138413314;
        v47 = v13;
        v48 = 2112;
        v49 = v41;
        v50 = 2112;
        v51 = v42;
        v52 = 2112;
        v53 = v10;
        v54 = 2112;
        v55 = v43;
        _os_log_error_impl(&dword_1BD918000, v30, OS_LOG_TYPE_ERROR, "Error pushing in account ID %@: %@ %@: %@\nuserInfo: %@", (uint8_t *)&v46, 0x34u);

      }
    }
LABEL_23:
    v15 = 1;
    goto LABEL_35;
  }
  switch(v14)
  {
    case 20:
    case 22:
    case 26:
      break;
    case 30:
      v16 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "ic_loggingDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_loggingDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138412802;
        v47 = v13;
        v48 = 2112;
        v49 = v35;
        v50 = 2112;
        v51 = v36;
        _os_log_error_impl(&dword_1BD918000, v16, OS_LOG_TYPE_ERROR, "Already Shared error in account ID %@: for %@ %@", (uint8_t *)&v46, 0x20u);

      }
      -[ICCloudSyncingObject setServerShare:](self, "setServerShare:", 0);
      v15 = 1;
      -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 1);
      break;
    case 31:
      v28 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "ic_loggingDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_loggingDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138413058;
        v47 = v13;
        v48 = 2112;
        v49 = v37;
        v50 = 2112;
        v51 = v38;
        v52 = 2112;
        v53 = v10;
        _os_log_error_impl(&dword_1BD918000, v28, OS_LOG_TYPE_ERROR, "Reference violation for server record in account ID %@: %@ %@: %@", (uint8_t *)&v46, 0x2Au);

      }
      -[ICCloudSyncingObject fixBrokenReferences](self, "fixBrokenReferences");
      goto LABEL_23;
    default:
      goto LABEL_20;
  }
LABEL_35:
  objc_msgSend((id)objc_opt_class(), "deleteTemporaryAssetFilesForOperation:", v8);

  return v15;
}

- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[ICCloudSyncingObject versionForOperation:](self, "versionForOperation:", v7);
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "latestVersionSyncedToCloud");

  if (v8 > v10)
  {
    -[ICCloudSyncingObject cloudState](self, "cloudState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLatestVersionSyncedToCloud:", v8);

  }
  objc_msgSend((id)objc_opt_class(), "deleteTemporaryAssetFilesForOperation:", v7);

  -[ICCloudSyncingObject resetFailureCounts](self, "resetFailureCounts");
  -[ICCloudSyncingObject setInCloud:](self, "setInCloud:", 1);
  -[ICCloudSyncingObject serverRecord](self, "serverRecord");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
  v13 = (void *)v12;
  -[ICCloudSyncingObject serverRecord](self, "serverRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modificationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "ic_isLaterThanDate:", v16);

  if ((v17 & 1) != 0)
  {
    v18 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "recordID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recordName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v20;
      _os_log_impl(&dword_1BD918000, v18, OS_LOG_TYPE_DEFAULT, "Tried to cache a record that is older than or equal to our current version: %@", (uint8_t *)&v21, 0xCu);

    }
  }
  else
  {
LABEL_8:
    -[ICCloudSyncingObject setServerRecord:](self, "setServerRecord:", v6);
  }

}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4
{
  -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](self, "objectWasFetchedFromCloudWithRecord:accountID:force:", a3, a4, 0);
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v8 = a3;
  v9 = a4;
  if (a5)
    goto LABEL_6;
  -[ICCloudSyncingObject serverRecord](self, "serverRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordChangeTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordChangeTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
LABEL_6:
    -[ICCloudSyncingObject setMergingRecord:](self, "setMergingRecord:", 1);
    -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:](self, "mergeCloudKitRecord:accountID:approach:", v8, v9, 0);
    -[ICCloudSyncingObject setMergingRecord:](self, "setMergingRecord:", 0);
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_11;
    v16 = (void *)v15;
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "modificationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modificationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "ic_isLaterThanDate:", v19);

    if ((v20 & 1) != 0)
    {
      v21 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:].cold.2(v8);

    }
    else
    {
LABEL_11:
      -[ICCloudSyncingObject setServerRecord:](self, "setServerRecord:", v8);
    }
    objc_msgSend(v8, "share");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else
    {
      -[ICCloudSyncingObject serverShare](self, "serverShare");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:].cold.1(self);

        -[ICCloudSyncingObject setServerShare:](self, "setServerShare:", 0);
      }
    }
    -[ICCloudSyncingObject setNeedsInitialFetchFromCloud:](self, "setNeedsInitialFetchFromCloud:", 0);
    -[ICCloudSyncingObject setInCloud:](self, "setInCloud:", 1);
    if (!-[ICCloudSyncingObject supportsDeletionByTTL](self, "supportsDeletionByTTL"))
      -[ICCloudSyncingObject setMarkedForDeletion:](self, "setMarkedForDeletion:", 0);
    -[ICCloudSyncingObject updateParentReferenceIfNecessary](self, "updateParentReferenceIfNecessary");
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:].cold.3(v8);

  }
  -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 0);

}

- (void)objectWasFetchedButDoesNotExistInCloud
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ICCloudSyncingObject recordID](self, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_isOwnedByCurrentUser");

  if (v4)
  {
    -[ICCloudSyncingObject setServerRecord:](self, "setServerRecord:", 0);
    -[ICCloudSyncingObject setNeedsInitialFetchFromCloud:](self, "setNeedsInitialFetchFromCloud:", 0);
    -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 0);
    -[ICCloudSyncingObject setInCloud:](self, "setInCloud:", 0);
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Deleting shared %@ because it no longer exists in cloud", (uint8_t *)&v7, 0xCu);

    }
    -[ICCloudSyncingObject deleteFromLocalDatabase](self, "deleteFromLocalDatabase");
  }
}

+ (BOOL)supportsActivityEvents
{
  return 0;
}

- (NSData)activityEventsData
{
  return (NSData *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("activityEventsData"));
}

- (void)setActivityEventsData:(id)a3
{
  id persistedActivityEventsStorage;
  id checklistItemToActivityEventsStorage;
  id v6;

  persistedActivityEventsStorage = self->_persistedActivityEventsStorage;
  self->_persistedActivityEventsStorage = 0;
  v6 = a3;

  checklistItemToActivityEventsStorage = self->_checklistItemToActivityEventsStorage;
  self->_checklistItemToActivityEventsStorage = 0;

  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v6, CFSTR("activityEventsData"));
}

- (ICTTOrderedSetVersionedDocument)activityEventsDocument
{
  ICTTOrderedSetVersionedDocument *activityEventsDocument;
  ICTTOrderedSetVersionedDocument *v4;
  void *v5;
  void *v6;
  ICTTOrderedSetVersionedDocument *v7;
  ICTTOrderedSetVersionedDocument *v8;
  id persistedActivityEventsStorage;
  id checklistItemToActivityEventsStorage;
  ICTTOrderedSetVersionedDocument *v11;
  NSObject *v12;

  if ((objc_msgSend((id)objc_opt_class(), "supportsActivityEvents") & 1) != 0)
  {
    activityEventsDocument = self->_activityEventsDocument;
    if (!activityEventsDocument)
    {
      v4 = [ICTTOrderedSetVersionedDocument alloc];
      -[ICCloudSyncingObject activityEventsData](self, "activityEventsData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[ICTTVersionedDocument initWithData:replicaID:](v4, "initWithData:replicaID:", v5, v6);
      v8 = self->_activityEventsDocument;
      self->_activityEventsDocument = v7;

      persistedActivityEventsStorage = self->_persistedActivityEventsStorage;
      self->_persistedActivityEventsStorage = 0;

      checklistItemToActivityEventsStorage = self->_checklistItemToActivityEventsStorage;
      self->_checklistItemToActivityEventsStorage = 0;

      activityEventsDocument = self->_activityEventsDocument;
    }
    v11 = activityEventsDocument;
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject activityEventsDocument].cold.1(self);

    v11 = 0;
  }
  return v11;
}

- (unint64_t)mergeActivityEventsDocument:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsActivityEvents"))
  {
    -[ICCloudSyncingObject activityEventsDocument](self, "activityEventsDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mergeWithOrderedSetVersionedDocument:", v4);

    if (v6 == 2)
    {
      -[ICCloudSyncingObject activityEventsDocument](self, "activityEventsDocument");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serialize");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject setActivityEventsData:](self, "setActivityEventsData:", v8);

      v6 = 2;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)intrinsicNotesVersion
{
  return -[ICCloudSyncingObject intrinsicNotesVersionForScenario:](self, "intrinsicNotesVersionForScenario:", 0);
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  void *v6;
  int64_t v7;

  if (-[ICCloudSyncingObject isUnsupported](self, "isUnsupported")
    || -[ICCloudSyncingObject needsInitialFetchFromCloudCheckingParent](self, "needsInitialFetchFromCloudCheckingParent"))
  {
    return -[ICCloudSyncingObject minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  }
  if (a3 == 1 || !-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected"))
    return 0;
  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intrinsicNotesVersion");

  return v7;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 0;
}

- (void)resetToIntrinsicNotesVersionAndPropagateToChildObjects
{
  -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:](self, "requireMinimumSupportedVersionAndPropagateToChildObjects:", 0);
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[ICCloudSyncingObject isUnsupported](self, "isUnsupported"))
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:].cold.1();
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  if (-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:].cold.2(self);
    goto LABEL_7;
  }
  -[ICCloudSyncingObject parentCloudObjectForMinimumSupportedVersionPropagation](self, "parentCloudObjectForMinimumSupportedVersionPropagation");
  v7 = objc_claimAutoreleasedReturnValue();
  v6 = v7;
  if (v7)
    v8 = -[NSObject minimumSupportedNotesVersion](v7, "minimumSupportedNotesVersion");
  else
    v8 = 0;
  v9 = -[ICCloudSyncingObject intrinsicNotesVersion](self, "intrinsicNotesVersion");
  if (v8 <= v9)
    v10 = v9;
  else
    v10 = v8;
  if (v10 <= a3)
    v11 = a3;
  else
    v11 = v10;
  if (-[ICCloudSyncingObject minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion") != v11)
  {
    v12 = -[ICCloudSyncingObject minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
    v13 = os_log_create("com.apple.notes", "Cloud");
    v14 = v13;
    if (v12 <= v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:].cold.3();
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[ICCloudSyncingObject minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v34 = v15;
      v35 = 2048;
      v36 = v11;
      v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_DEFAULT, "Downgrading minimumSupportedNotesVersion from %lld to %lld for object: %@", buf, 0x20u);

    }
    -[ICCloudSyncingObject setMinimumSupportedNotesVersion:](self, "setMinimumSupportedNotesVersion:", v11);
    -[ICCloudSyncingObject updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Updated minimum version"));
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ICCloudSyncingObject childCloudObjectsForMinimumSupportedVersionPropagation](self, "childCloudObjectsForMinimumSupportedVersionPropagation");
  obj = objc_claimAutoreleasedReturnValue();
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v26 = v6;
    v19 = *(_QWORD *)v29;
    v20 = obj;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v20);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1C3B7AC74]();
        v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v22, "shortLoggingDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v34 = a3;
          v35 = 2112;
          v36 = (int64_t)v25;
          _os_log_debug_impl(&dword_1BD918000, v24, OS_LOG_TYPE_DEBUG, "Propagating minimumSupportedNotesVersion %lld to child object: %@", buf, 0x16u);

          v20 = obj;
        }

        objc_msgSend(v22, "requireMinimumSupportedVersionAndPropagateToChildObjects:", a3);
        objc_autoreleasePoolPop(v23);
      }
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
    v5 = v20;
    v6 = v26;
  }
  else
  {
    v5 = obj;
  }
LABEL_8:

}

- (BOOL)allowsExporting
{
  return 0;
}

- (BOOL)allowsImporting
{
  return 0;
}

+ (NSArray)bundleIdentifiersWithReplicaID
{
  if (bundleIdentifiersWithReplicaID_onceToken != -1)
    dispatch_once(&bundleIdentifiersWithReplicaID_onceToken, &__block_literal_global_141);
  return (NSArray *)(id)bundleIdentifiersWithReplicaID_bundleIdentifiersWithReplicaID;
}

void __54__ICCloudSyncingObject_bundleIdentifiersWithReplicaID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  ICNotesAppBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  ICIntentsExtensionBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  ICSharingExtensionBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)bundleIdentifiersWithReplicaID_bundleIdentifiersWithReplicaID;
  bundleIdentifiersWithReplicaID_bundleIdentifiersWithReplicaID = v3;

}

- (NSSet)deviceReplicaIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", self->_currentReplicaID);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "bundleIdentifiersWithReplicaID", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "replicaIDForBundleIdentifier:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "ic_addNonNilObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v12;
}

- (void)setCurrentReplicaID:(id)a3
{
  objc_storeStrong((id *)&self->_currentReplicaID, a3);
}

+ (BOOL)supportsNotesVersionTracking
{
  return 0;
}

- (ICMergeableDictionary)replicaIDToNotesVersion
{
  ICMergeableDictionary *replicaIDToNotesVersion;
  ICMergeableDictionary *v4;
  void *v5;
  NSObject *v6;
  ICMergeableDictionary *v7;
  ICMergeableDictionary *v8;
  void *v9;
  ICMergeableDictionary *v10;
  ICMergeableDictionary *v11;

  if ((objc_msgSend((id)objc_opt_class(), "supportsNotesVersionTracking") & 1) != 0)
  {
    replicaIDToNotesVersion = self->_replicaIDToNotesVersion;
    if (replicaIDToNotesVersion)
    {
      v4 = replicaIDToNotesVersion;
      v5 = self->_replicaIDToNotesVersion;
      self->_replicaIDToNotesVersion = v4;
    }
    else
    {
      v8 = [ICMergeableDictionary alloc];
      -[ICCloudSyncingObject replicaIDToNotesVersionData](self, "replicaIDToNotesVersionData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ICMergeableDictionary initWithData:replicaID:](v8, "initWithData:replicaID:", v5, v9);
      v11 = self->_replicaIDToNotesVersion;
      self->_replicaIDToNotesVersion = v10;

    }
    v7 = self->_replicaIDToNotesVersion;
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ICCloudSyncingObject replicaIDToNotesVersion].cold.1(self, v6);

    v7 = 0;
  }
  return v7;
}

- (id)notesVersionForReplicaID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_opt_class(), "currentNotesVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setNotesVersion:(id)a3 forReplicaID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v20)
    v10 = 0;
  else
    v10 = v20;
  v11 = v10;
  if (v9 == v8)
    v12 = 0;
  else
    v12 = v8;
  v13 = v12;
  if (v11 | v13)
  {
    v14 = (void *)v13;
    if (v11)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
    {

LABEL_15:
      -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, v6);

      -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "encodedData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject setReplicaIDToNotesVersionData:](self, "setReplicaIDToNotesVersionData:", v19);

      goto LABEL_16;
    }
    v16 = objc_msgSend((id)v11, "isEqual:", v13);

    if ((v16 & 1) == 0)
      goto LABEL_15;
  }
LABEL_16:

}

- (unint64_t)mergeReplicaIDToNotesVersion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  ICMergeableDictionary *replicaIDToNotesVersion;
  unint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  ICMergeableDictionary *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  ICCloudSyncingObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "supportsNotesVersionTracking"))
  {
    v13 = 0;
    goto LABEL_7;
  }
  -[ICCloudSyncingObject replicaIDToNotesVersionData](self, "replicaIDToNotesVersionData");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject deviceReplicaIDs](self, "deviceReplicaIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
LABEL_4:
    -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("replicaIDToNotesVersion"));
    objc_msgSend(v4, "encodedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setReplicaIDToNotesVersionData:](self, "setReplicaIDToNotesVersionData:", v11);

    replicaIDToNotesVersion = self->_replicaIDToNotesVersion;
    self->_replicaIDToNotesVersion = 0;

    -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("replicaIDToNotesVersion"));
LABEL_5:
    v13 = 2;
    goto LABEL_7;
  }
  objc_msgSend(v4, "replicaID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "replicaID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqual:", v17);

  if (v18)
  {
    v19 = [ICMergeableDictionary alloc];
    objc_msgSend(v4, "encodedData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ICMergeableDictionary initWithData:replicaID:](v19, "initWithData:replicaID:", v20, v21);

    v4 = (id)v22;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v43)
  {
    v40 = 0;
    v42 = *(_QWORD *)v45;
    while (1)
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v45 != v42)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v24);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
          v28 = self;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v4;
          objc_msgSend(v4, "objectForKeyedSubscript:", v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v30, "isEqual:", v32);

          if ((v33 & 1) != 0)
          {
            v4 = v31;
            self = v28;
            continue;
          }
          -[ICCloudSyncingObject deviceReplicaIDs](v28, "deviceReplicaIDs");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "containsObject:", v24);

          self = v28;
          if (v35)
          {
            -[ICCloudSyncingObject replicaIDToNotesVersion](v28, "replicaIDToNotesVersion");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v24);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v31;
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v36, v24);
          }
          else
          {
            v4 = v31;
            objc_msgSend(v31, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICCloudSyncingObject replicaIDToNotesVersion](v28, "replicaIDToNotesVersion");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v25, v24);
            v40 = 1;
          }

        }
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (!v43)
        goto LABEL_27;
    }
  }
  v40 = 0;
LABEL_27:

  -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v37, "mergeWithDictionary:", v4);

  if ((v40 & 1) != 0 || v13 == 2)
  {
    -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "encodedData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setReplicaIDToNotesVersionData:](self, "setReplicaIDToNotesVersionData:", v39);

    goto LABEL_5;
  }
LABEL_7:

  return v13;
}

- (BOOL)updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "supportsNotesVersionTracking"))
  {
    if ((-[ICCloudSyncingObject isDeleted](self, "isDeleted") & 1) != 0
      || -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"))
    {
      v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded].cold.1(self);
      v4 = 0;
      v5 = v3;
      goto LABEL_15;
    }
    -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICNotesAppBundleIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replicaIDForBundleIdentifier:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
      {
        v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
          -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded].cold.3(self);
      }
      else if (-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected")
             && !-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
      {
        v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
          -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded].cold.5(self);
      }
      else
      {
        if (!-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected")
          || (-[ICCloudSyncingObject unappliedEncryptedRecord](self, "unappliedEncryptedRecord"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v9,
              !v9))
        {
          -[ICCloudSyncingObject notesVersionForReplicaID:](self, "notesVersionForReplicaID:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "integerValue");

          v12 = objc_msgSend((id)objc_opt_class(), "currentNotesVersion");
          v13 = v12;
          if (v11 >= v12)
          {
            if (v11 == v12)
            {
              v4 = 0;
              goto LABEL_16;
            }
            if (v11 > v12)
            {
              v24 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                -[ICCloudSyncingObject objectID](self, "objectID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v32 = v25;
                _os_log_impl(&dword_1BD918000, v24, OS_LOG_TYPE_INFO, "Device Notes version is greater than current Notes version {objectID: %@}", buf, 0xCu);

              }
            }
          }
          else
          {
            do
            {
              ++v11;
              -[ICCloudSyncingObject cloudState](self, "cloudState");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "currentLocalVersion");

              -[ICCloudSyncingObject willUpdateDeviceReplicaIDsToNotesVersion:](self, "willUpdateDeviceReplicaIDsToNotesVersion:", v11);
              -[ICCloudSyncingObject cloudState](self, "cloudState");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "currentLocalVersion");

              if (v17 != v15)
                objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.cloudState.currentLocalVersion == currentLocalVersion", "-[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded]", 1, 0, CFSTR("Updating the device replica IDs must not update the object's change count"));
            }
            while (v13 != v11);
          }
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          -[ICCloudSyncingObject deviceReplicaIDs](self, "deviceReplicaIDs", 0);
          v3 = objc_claimAutoreleasedReturnValue();
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v27 != v20)
                  objc_enumerationMutation(v3);
                v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICCloudSyncingObject setNotesVersion:forReplicaID:](self, "setNotesVersion:forReplicaID:", v23, v22);

              }
              v19 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
              v4 = 1;
            }
            while (v19);
          }
          else
          {
            v4 = 1;
          }
LABEL_15:

LABEL_16:
          return v4;
        }
        v3 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
          -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded].cold.4(self);
      }
    }
    else
    {
      v3 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded].cold.2(self);
    }

    v4 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (void)clearReplicaIDsToNotesVersion
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ICCloudSyncingObject ic_loggingDescription](self, "ic_loggingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Clearing replicaIDToNotesVersion for: %@", (uint8_t *)&v11, 0xCu);

    }
    -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    -[ICCloudSyncingObject replicaIDToNotesVersion](self, "replicaIDToNotesVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodedData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setReplicaIDToNotesVersionData:](self, "setReplicaIDToNotesVersionData:", v10);

  }
}

+ (BOOL)supportsUserSpecificRecords
{
  return 0;
}

- (BOOL)wantsUserSpecificRecord
{
  return 0;
}

- (NSString)userSpecificRecordType
{
  void *v2;
  void *v3;

  -[ICCloudSyncingObject recordType](self, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserSpecificRecordIDParser userSpecificRecordTypeForSharedRecordType:](ICUserSpecificRecordIDParser, "userSpecificRecordTypeForSharedRecordType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CKRecordID)userSpecificRecordID
{
  void *v3;
  void *v4;
  void *v5;
  os_log_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_log_t v12;
  NSObject *v13;
  ICUserSpecificRecordIDParser *v14;
  void *v15;
  ICUserSpecificRecordIDParser *v16;
  void *v17;
  NSObject *v18;

  -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICCloudSyncingObject recordID](self, "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userRecordName");
      v6 = (os_log_t)objc_claimAutoreleasedReturnValue();

      if (-[NSObject length](v6, "length"))
      {
        -[ICCloudSyncingObject zoneOwnerName](self, "zoneOwnerName");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        v9 = *MEMORY[0x1E0C94730];
        if (v7)
          v10 = (void *)v7;
        else
          v10 = (void *)*MEMORY[0x1E0C94730];
        v11 = v10;

        if (-[NSObject isEqualToString:](v11, "isEqualToString:", v9))
          v12 = v6;
        else
          v12 = v11;
        v13 = v12;
        v14 = [ICUserSpecificRecordIDParser alloc];
        -[ICCloudSyncingObject recordType](self, "recordType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[ICUserSpecificRecordIDParser initWithSharedRecordType:sharedRecordID:userRecordName:ownerName:](v14, "initWithSharedRecordType:sharedRecordID:userRecordName:ownerName:", v15, v4, v6, v13);

        -[ICUserSpecificRecordIDParser recordID](v16, "recordID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
      v18 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject userSpecificRecordID].cold.3(self);

    }
    else
    {
      v6 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject userSpecificRecordID].cold.2(self);

    }
    v17 = 0;
    goto LABEL_21;
  }
  v6 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObject userSpecificRecordID].cold.1(self);
  v17 = 0;
  v4 = v6;
LABEL_21:

  return (CKRecordID *)v17;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  ICUserSpecificRecordIDParser *v7;
  void *v8;
  uint64_t v9;
  ICUserSpecificRecordIDParser *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (!v5)
  {
LABEL_7:
    -[ICCloudSyncingObject userSpecificRecordID](self, "userSpecificRecordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v15 = objc_alloc(MEMORY[0x1E0C95048]);
      -[ICCloudSyncingObject userSpecificRecordType](self, "userSpecificRecordType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject userSpecificRecordID](self, "userSpecificRecordID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v15, "initWithRecordType:recordID:", v16, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:]", 1, 0, CFSTR("Asking for user specific record but no record ID could be created"));
      v5 = 0;
    }
    goto LABEL_10;
  }
  -[ICCloudSyncingObject recordName](self, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_11;
  v7 = [ICUserSpecificRecordIDParser alloc];
  objc_msgSend(v5, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[ICUserSpecificRecordIDParser initWithRecordName:](v7, "initWithRecordName:", v9);
  -[ICUserSpecificRecordIDParser sharedRecordID](v10, "sharedRecordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCloudSyncingObject recordName](self, "recordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v12, "ic_isCaseInsensitiveEqualToString:", v13);

  if ((v9 & 1) == 0)
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:].cold.1();

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:]", 1, 1, CFSTR("Object has user-specific server record with mismatched record name"));
    goto LABEL_7;
  }
LABEL_10:

LABEL_11:
  if (-[ICCloudSyncingObject supportsDeletionByTTL](self, "supportsDeletionByTTL"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("Deleted"));

  }
  return v5;
}

- (void)didFetchUserSpecificRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;

  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordChangeTag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordChangeTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
    {
      v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject didFetchUserSpecificRecord:accountID:force:].cold.2((uint64_t)v9, v8);
LABEL_10:

      goto LABEL_11;
    }
  }
  -[ICCloudSyncingObject mergeDataFromUserSpecificRecord:accountID:](self, "mergeDataFromUserSpecificRecord:accountID:", v8, v9);
  -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "modificationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modificationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "ic_isEarlierThanDate:", v19);

    if (!v20)
    {
      v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObject didFetchUserSpecificRecord:accountID:force:].cold.1((uint64_t)v9, v8);
      goto LABEL_10;
    }
  }
  -[ICCloudSyncingObject setUserSpecificServerRecord:](self, "setUserSpecificServerRecord:", v8);
LABEL_11:

}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  return 1;
}

- (void)didSaveUserSpecificRecord:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_3;
  v6 = (void *)v5;
  -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "ic_isEarlierThanDate:", v9);

  if (!v10)
  {
    v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_loggingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ic_loggingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEFAULT, "Tried to cache user-specific record older than or equal to ours: ours=%@ theirs=%@", (uint8_t *)&v15, 0x16u);

    }
  }
  else
  {
LABEL_3:
    -[ICCloudSyncingObject setUserSpecificServerRecord:](self, "setUserSpecificServerRecord:", v4);
  }
  -[ICCloudSyncingObject setNeedsToSaveUserSpecificRecord:](self, "setNeedsToSaveUserSpecificRecord:", 0);

}

- (BOOL)didFailToSaveUserSpecificRecordWithID:(id)a3 accountID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "code");
  if (v11 > 0x1A)
    goto LABEL_15;
  if (((1 << v11) & 0x45000C0) == 0)
  {
    if (v11 == 11)
    {
      v21 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "ic_loggingDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        v34 = v9;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_1BD918000, v21, OS_LOG_TYPE_INFO, "Invalid cached user-specific server record in account ID %@: %@", (uint8_t *)&v33, 0x16u);

      }
      -[ICCloudSyncingObject setUserSpecificServerRecord:](self, "setUserSpecificServerRecord:", 0);
      goto LABEL_3;
    }
    if (v11 == 14)
    {
      objc_msgSend(v10, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "recordID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCloudSyncingObject userSpecificRecordID](self, "userSpecificRecordID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "ic_hasEqualRecordNameWithRecordID:", v17);

        if (!v18)
        {
          -[ICCloudSyncingObject userSpecificRecordID](self, "userSpecificRecordID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = os_log_create("com.apple.notes", "Cloud");
          v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          if (v26)
          {
            if (v28)
            {
              objc_msgSend(v15, "ic_loggingDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICCloudSyncingObject userSpecificRecordID](self, "userSpecificRecordID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "recordName");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = 138413058;
              v34 = v9;
              v35 = 2112;
              v36 = v30;
              v37 = 2112;
              v38 = v32;
              v39 = 2112;
              v40 = v10;
              _os_log_error_impl(&dword_1BD918000, v27, OS_LOG_TYPE_ERROR, "Non-matching user-specific server record changed in account ID %@; record=%@; expectedRecordName=%@; error=%@",
                (uint8_t *)&v33,
                0x2Au);

            }
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject didFailToSaveUserSpecificRecordWithID:accountID:error:]", 1, 1, CFSTR("User-specific record mismatch when merging oplock result"));
            objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 8);
          }
          else
          {
            if (v28)
              -[ICCloudSyncingObject didFailToSaveUserSpecificRecordWithID:accountID:error:].cold.1();

            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject didFailToSaveUserSpecificRecordWithID:accountID:error:]", 1, 1, CFSTR("Missed merge of user-specific record because record ID was missing"));
          }
          v12 = 0;
          goto LABEL_30;
        }
        v19 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "ic_loggingDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v9;
          v35 = 2112;
          v36 = v20;
          _os_log_impl(&dword_1BD918000, v19, OS_LOG_TYPE_INFO, "User-specific server record changed in account ID %@: %@", (uint8_t *)&v33, 0x16u);

        }
        -[ICCloudSyncingObject didFetchUserSpecificRecord:accountID:force:](self, "didFetchUserSpecificRecord:accountID:force:", v15, v9, 0);
      }
      else
      {
        v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412802;
          v34 = v9;
          v35 = 2112;
          v36 = v25;
          v37 = 2112;
          v38 = v10;
          _os_log_impl(&dword_1BD918000, v24, OS_LOG_TYPE_INFO, "User-specific server record changed with no server record in the error in account ID %@: %@: %@", (uint8_t *)&v33, 0x20u);

        }
      }
      v12 = 1;
LABEL_30:

      goto LABEL_4;
    }
LABEL_15:
    v23 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ic_loggingDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412802;
      v34 = v9;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = v10;
      _os_log_error_impl(&dword_1BD918000, v23, OS_LOG_TYPE_ERROR, "Error pushing user-specific record in account ID %@: %@: %@", (uint8_t *)&v33, 0x20u);

    }
  }
LABEL_3:
  v12 = 1;
LABEL_4:

  return v12;
}

- (void)didDeleteUserSpecificRecordID:(id)a3
{
  -[ICCloudSyncingObject setUserSpecificServerRecord:](self, "setUserSpecificServerRecord:", 0);
}

+ (id)temporaryAssets
{
  if (temporaryAssets_onceToken != -1)
    dispatch_once(&temporaryAssets_onceToken, &__block_literal_global_158);
  return (id)temporaryAssets_temporaryAssets;
}

void __39__ICCloudSyncingObject_temporaryAssets__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)temporaryAssets_temporaryAssets;
  temporaryAssets_temporaryAssets = v0;

}

+ (id)assetForData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "temporaryAssetDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v14 = 0;
      v9 = objc_msgSend(v4, "writeToURL:options:error:", v8, 0, &v14);
      v10 = v14;
      if (v9)
      {
        objc_msgSend(a1, "assetForTemporaryURL:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v10 = 0;
    }
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ICCloudSyncingObject assetForData:].cold.1();

    v11 = 0;
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)assetForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "temporaryAssetDirectoryURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v13 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v4, v11, &v19);
        v14 = v19;

        if (v13)
        {
          v15 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            +[ICCloudSyncingObject assetForURL:].cold.1();

          objc_msgSend(a1, "assetForTemporaryURL:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v14 = 0;
      }
      v17 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v21 = v4;
        v22 = 2112;
        v23 = v11;
        v24 = 2112;
        v25 = v14;
        _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "Error cloning file (%@) for creating temporary asset (%@) {error: %@}", buf, 0x20u);
      }

      v16 = 0;
      goto LABEL_13;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

+ (id)assetForTemporaryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "temporaryAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", v4);
    objc_msgSend(a1, "temporaryAssets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[ICCloudSyncingObject assetForTemporaryURL:].cold.1();

    objc_sync_exit(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)dataForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v3 = a3;
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v3, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v6, 0, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (v8)
    {
      v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ICCloudSyncingObject dataForAsset:].cold.2();

    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ICCloudSyncingObject dataForAsset:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
    v7 = 0;
  }

  return v7;
}

+ (id)temporaryAssetDirectoryURL
{
  if (temporaryAssetDirectoryURL_onceToken != -1)
    dispatch_once(&temporaryAssetDirectoryURL_onceToken, &__block_literal_global_161);
  return (id)temporaryAssetDirectoryURL_url;
}

void __50__ICCloudSyncingObject_temporaryAssetDirectoryURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@-%@"), v2, CFSTR("TemporaryAssetFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v3, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)temporaryAssetDirectoryURL_url;
  temporaryAssetDirectoryURL_url = v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", temporaryAssetDirectoryURL_url, 1, 0, &v13);
  v11 = v13;

  if ((v10 & 1) == 0)
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __50__ICCloudSyncingObject_temporaryAssetDirectoryURL__block_invoke_cold_1();

  }
}

+ (void)deleteTemporaryAssetFilesForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  if (deleteTemporaryAssetFilesForOperation__onceToken != -1)
    dispatch_once(&deleteTemporaryAssetFilesForOperation__onceToken, &__block_literal_global_168);
  objc_msgSend(a1, "temporaryAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(a1, "temporaryAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_sync_exit(v5);
  if (v7)
  {
    objc_initWeak(&location, a1);
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_2;
    aBlock[3] = &unk_1E76CAC70;
    objc_copyWeak(&v19, &location);
    v9 = v4;
    v18 = v9;
    v10 = _Block_copy(aBlock);
    v11 = deleteTemporaryAssetFilesForOperation__deleteTemporaryAssetFilesQueue;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_171;
    v13[3] = &unk_1E76CAC98;
    v16 = a1;
    v14 = v9;
    v15 = v10;
    v12 = v10;
    dispatch_async(v11, v13);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.notes.cloud.deleteTemporaryAssetFiles", attr);
  v2 = (void *)deleteTemporaryAssetFilesForOperation__deleteTemporaryAssetFilesQueue;
  deleteTemporaryAssetFilesForOperation__deleteTemporaryAssetFilesQueue = (uint64_t)v1;

}

void __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "temporaryAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v5);

    if (v9)
    {
      v10 = v5;
      v11 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "fileURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v12;
        v17 = 2112;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Deleting temporary files for asset (%@) record (%@) operation (%@)", (uint8_t *)&v15, 0x20u);

      }
      objc_msgSend(WeakRetained, "deleteTemporaryFilesForAsset:", v10);

    }
  }

}

void __62__ICCloudSyncingObject_deleteTemporaryAssetFilesForOperation___block_invoke_171(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id obj;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "temporaryAssets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "recordsToSave");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v3)
  {
    v15 = *(_QWORD *)v29;
    v17 = v2;
    do
    {
      v16 = 0;
      v18 = v3;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v2);
        v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v4, "allKeys", obj);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v6)
        {
          v7 = *(_QWORD *)v25;
          do
          {
            v19 = v6;
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v25 != v7)
                objc_enumerationMutation(v5);
              objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = 0u;
                v23 = 0u;
                v20 = 0u;
                v21 = 0u;
                v10 = v9;
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
                if (v11)
                {
                  v12 = *(_QWORD *)v21;
                  do
                  {
                    for (j = 0; j != v11; ++j)
                    {
                      if (*(_QWORD *)v21 != v12)
                        objc_enumerationMutation(v10);
                      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
                    }
                    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
                  }
                  while (v11);
                }

                v2 = v17;
                v3 = v18;
              }
              else
              {
                (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
              }

            }
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          }
          while (v6);
        }

        ++v16;
      }
      while (v16 != v3);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v3);
  }

  objc_sync_exit(obj);
}

+ (void)deleteTemporaryFilesForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;

  v4 = a3;
  objc_msgSend(a1, "temporaryAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(a1, "temporaryAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
  {
    v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICCloudSyncingObject deleteTemporaryFilesForAsset:].cold.1();

  }
  objc_sync_exit(v5);

}

+ (void)deleteAllTemporaryAssetFilesForAllObjects
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "temporaryAssetDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 0, &__block_literal_global_173);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138412290;
    v17 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v18);
        v15 = v18;

        if ((v14 & 1) == 0)
        {
          v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v24 = v15;
            _os_log_error_impl(&dword_1BD918000, v16, OS_LOG_TYPE_ERROR, "Error deleting temporary asset file: %@", buf, 0xCu);
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

}

uint64_t __65__ICCloudSyncingObject_deleteAllTemporaryAssetFilesForAllObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__ICCloudSyncingObject_deleteAllTemporaryAssetFilesForAllObjects__block_invoke_cold_1();

  return 1;
}

- (BOOL)isDeletable
{
  return 1;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  NSObject *v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[ICCloudSyncingObject isDeletable](self, "isDeletable"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase].cold.5(self);
LABEL_10:

LABEL_11:
    v4 = 0;
    goto LABEL_12;
  }
  if ((-[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion") & 1) == 0)
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase].cold.4(self);
    goto LABEL_10;
  }
  if (-[ICCloudSyncingObject wasRecentlyDeletedByThisDevice](self, "wasRecentlyDeletedByThisDevice"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase].cold.1(self);
    goto LABEL_10;
  }
  if (-[ICCloudSyncingObject isInICloudAccount](self, "isInICloudAccount")
    && -[ICCloudSyncingObject isInCloud](self, "isInCloud")
    && !-[ICCloudSyncingObject hasSuccessfullyPushedLatestVersionToCloud](self, "hasSuccessfullyPushedLatestVersionToCloud"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase].cold.3(self);
    goto LABEL_10;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICCloudSyncingObject objectsToBeDeletedBeforeThisObject](self, "objectsToBeDeletedBeforeThisObject", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "shouldBeDeletedFromLocalDatabase") & 1) == 0)
        {
          v11 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[ICCloudSyncingObject shouldBeDeletedFromLocalDatabase].cold.2();

          if (objc_msgSend(v10, "needsInitialFetchFromCloud"))
            objc_msgSend(v10, "setNeedsToBeFetchedFromCloud:", 1);
          goto LABEL_11;
        }
      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = 1;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v4 = 1;
  }
LABEL_12:

  return v4;
}

- (void)deleteFromLocalDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Trying to delete an object of unknown type from the local database: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (id)objectsToBeDeletedBeforeThisObject
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)keyPathsForValuesAffectingNeedsToBeDeletedFromCloud
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("markedForDeletion"), 0);
}

- (void)markForDeletion
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Marking %@ for deletion", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unmarkForDeletion
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Unmarking %@ for deletion", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;

  v3 = a3;
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObject setMarkedForDeletion:].cold.1(v3, self);

  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("markedForDeletion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("markedForDeletion"));

  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("markedForDeletion"));
}

- (BOOL)supportsDeletionByTTL
{
  return 0;
}

- (NSDate)creationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  NSStringFromSelector(sel_creationDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject willAccessValueForKey:](self, "willAccessValueForKey:", v3);

  objc_opt_class();
  NSStringFromSelector(sel_creationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject primitiveValueForKey:](self, "primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_creationDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject didAccessValueForKey:](self, "didAccessValueForKey:", v7);

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "creationDate");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v8;
}

- (NSDate)modificationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  NSStringFromSelector(sel_modificationDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject willAccessValueForKey:](self, "willAccessValueForKey:", v3);

  objc_opt_class();
  NSStringFromSelector(sel_modificationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject primitiveValueForKey:](self, "primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_modificationDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject didAccessValueForKey:](self, "didAccessValueForKey:", v7);

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modificationDate");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v8;
}

- (NSArray)ancestorCloudObjects
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      objc_msgSend(v5, "parentCloudObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v7;
}

- (id)parentCloudObjectModificationDate
{
  return 0;
}

- (void)updateParentReferenceIfNecessary
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t v13[14];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serverRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_loggingDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ic_loggingDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  v14 = v10;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, a3, v12, "Server record for %@ parent %@ is different from expected parent %@. Re-saving record.", v13);

}

- (void)updateChangeCountsForUnsavedParentReferences
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[ICCloudSyncingObject childCloudObjects](self, "childCloudObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "serverRecord");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "parent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          objc_msgSend(v7, "updateChangeCountWithReason:", CFSTR("Updated parent reference"));
        objc_msgSend(v7, "updateChangeCountsForUnsavedParentReferences");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (BOOL)needsToDeleteShare
{
  void *v3;
  BOOL v4;

  if (!-[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"))
    return 0;
  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[ICCloudSyncingObject shareMatchesRecord](self, "shareMatchesRecord");
  else
    v4 = 0;

  return v4;
}

- (BOOL)canCurrentUserShare
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUserParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "role") == 1)
  {
    v6 = 1;
  }
  else
  {
    -[ICCloudSyncingObject serverShare](self, "serverShare");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUserParticipant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "role") == 2;

  }
  return v6;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isSharedViaICloud"), CFSTR("cloudAccount.accountType"), CFSTR("isPasswordProtected"), CFSTR("isUnsupported"), 0);
}

- (BOOL)isSharedThroughParent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ICCloudSyncingObject shareMatchesRecord](self, "shareMatchesRecord"))
  {
    v4 = 0;
  }
  else
  {
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "share");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v4 = 0;
    }
    else
    {
      -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isSharedViaICloud");

    }
  }

  return v4;
}

- (BOOL)canBeRootShareObject
{
  return 0;
}

- (BOOL)isOwnedByCurrentUser
{
  void *v2;
  char v3;

  -[ICCloudSyncingObject recordID](self, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_isOwnedByCurrentUser");

  return v3;
}

- (BOOL)wasCreatedByCurrentUser
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject serverRecord](self, "serverRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICCloudSyncingObject isInICloudAccount](self, "isInICloudAccount"))
  {
    v5 = 1;
    if (-[ICCloudSyncingObject isInCloud](self, "isInCloud") && v4 && v3)
    {
      objc_msgSend(v4, "creatorUserRecordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userRecordName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
      {
        objc_msgSend(v4, "creatorUserRecordID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C94730]);

      }
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)sharedRootObject
{
  ICCloudSyncingObject *v3;
  void *v4;

  if (-[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject"))
  {
    v3 = self;
  }
  else
  {
    -[ICCloudSyncingObject parentCloudObject](self, "parentCloudObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedRootObject");
    v3 = (ICCloudSyncingObject *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)keyPathsForValuesAffectingIsSharedReadOnly
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("serverShareCheckingParent"));
}

- (id)associatedNoteParticipants
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)ownerRecordName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[ICCloudSyncingObject isInICloudAccount](self, "isInICloudAccount"))
  {
    if (-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
    {
      -[ICCloudSyncingObject zoneOwnerName](self, "zoneOwnerName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (!v3 || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C94730]))
      {
        -[ICCloudSyncingObject cloudAccount](self, "cloudAccount");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "userRecordName");
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
    }
    else if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
    {
      -[ICCloudSyncingObject sharedOwnerRecordName](self, "sharedOwnerRecordName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    v7 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)sharedOwnerRecordName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud")
    && !-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ICCloudSyncingObject serverShare](self, "serverShare", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v8, "role") == 1)
          {
            objc_msgSend(v8, "userIdentity");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "userRecordID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "recordName");
            v3 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
        }
        v3 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v3 = 0;
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (id)sharedOwnerName
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud")
    || -[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
  {
    return 0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICCloudSyncingObject serverShare](self, "serverShare", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "role") == 1)
        {
          objc_msgSend(v9, "ic_participantName");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

+ (id)keyPathsForValuesAffectingServerShareCheckingParent
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("serverShare"));
}

- (void)markShareDirtyIfNeededWithReason:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (-[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject")
    && (-[ICCloudSyncingObject isShareDirty](self, "isShareDirty") & 1) == 0
    && !-[ICCloudSyncingObject isSharedReadOnly](self, "isSharedReadOnly"))
  {
    -[ICCloudSyncingObject setIsShareDirty:](self, "setIsShareDirty:", 1);
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject markShareDirtyIfNeededWithReason:].cold.1();

  }
}

- (void)didAcceptShare:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ic_loggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "No server share for %@, setting to %@", (uint8_t *)&v11, 0x16u);

    }
    -[ICCloudSyncingObject setServerShare:](self, "setServerShare:", v4);
  }
  if (-[ICCloudSyncingObject markedForDeletion](self, "markedForDeletion"))
  {
    v9 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Undeleting shared %@", (uint8_t *)&v11, 0xCu);

    }
    -[ICCloudSyncingObject unmarkForDeletion](self, "unmarkForDeletion");
  }

}

- (id)shareDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCloudSyncingObject shareDescriptionForShareParticipants:](self, "shareDescriptionForShareParticipants:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)shareDescriptionForShareParticipants:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  uint64_t v19;

  v4 = a3;
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    if (-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
    {
      objc_msgSend(MEMORY[0x1E0C95130], "ic_displayableNames:maximumNamesCount:", v4, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count") == 2 && objc_msgSend(v5, "count") == 1)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = (void *)MEMORY[0x1E0D64218];
        v8 = CFSTR("Shared with %@");
LABEL_12:
        objc_msgSend(v7, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
LABEL_19:
        objc_msgSend(v6, "localizedStringWithFormat:", v10, v18, v19);
        goto LABEL_20;
      }
      if (objc_msgSend(v4, "count") == 3 && objc_msgSend(v5, "count") == 1)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = (void *)MEMORY[0x1E0D64218];
        v8 = CFSTR("Shared with %@ and 1 other");
        goto LABEL_12;
      }
      if (objc_msgSend(v4, "count") == 3 && objc_msgSend(v5, "count") == 2)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared with %@ and %@"), CFSTR("Shared with %@ and %@"), 0, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v10, v12, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      if ((unint64_t)objc_msgSend(v4, "count") >= 4 && objc_msgSend(v5, "count"))
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared with %@ and %lu others"), CFSTR("Shared with %@ and %lu others"), 0, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
        v19 = objc_msgSend(v4, "count") - 2;
        goto LABEL_19;
      }
      if ((unint64_t)objc_msgSend(v4, "count") < 2)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared by me"), CFSTR("Shared by me"), 0, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared with %lu others"), CFSTR("Shared with %lu others"), 0, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithFormat:", v10, objc_msgSend(v4, "count") - 1);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "ic_objectPassingTest:", &__block_literal_global_222);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ic_participantName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared by %@"), CFSTR("Shared by %@"), 0, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringWithFormat:", v12, v10, v19);
LABEL_20:
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared to you"), CFSTR("Shared to you"), 0, 1);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v15;
    goto LABEL_26;
  }
  v9 = 0;
LABEL_28:

  return v9;
}

BOOL __61__ICCloudSyncingObject_shareDescriptionForShareParticipants___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "role") == 1;
}

- (id)participantForUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C94730]) & 1) != 0
      || (-[ICCloudSyncingObject cloudAccount](self, "cloudAccount"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "userRecordName"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v4, "isEqualToString:", v6),
          v6,
          v5,
          v7))
    {
      -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentUserParticipant");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ic_participantWithUserRecordName:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)participantHandlesToParticipants
{
  NSMutableDictionary *participantHandlesToParticipants;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  participantHandlesToParticipants = self->_participantHandlesToParticipants;
  if (participantHandlesToParticipants)
  {
    v4 = participantHandlesToParticipants;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v5 = self->_participantHandlesToParticipants;
  self->_participantHandlesToParticipants = v4;

  return self->_participantHandlesToParticipants;
}

- (id)participantForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    -[ICCloudSyncingObject participantHandlesToParticipants](self, "participantHandlesToParticipants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ic_participantWithHandle:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject participantHandlesToParticipants](self, "participantHandlesToParticipants");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v4);

    }
    -[ICCloudSyncingObject participantHandlesToParticipants](self, "participantHandlesToParticipants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)hasAnySharedObjectInContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0C97B48];
  v4 = a3;
  objc_msgSend(v3, "fetchRequestWithEntityName:", CFSTR("ICCloudSyncingObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("serverShareData != nil"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v10 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (BOOL)shareMatchesRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[ICCloudSyncingObject serverShare](self, "serverShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICCloudSyncingObject serverShare](self, "serverShare");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject recordID](self, "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)unitTest_injectCryptoStrategy:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICCloudSyncingObject_unitTest_injectCryptoStrategy___block_invoke;
  v7[3] = &unk_1E76C73B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __54__ICCloudSyncingObject_unitTest_injectCryptoStrategy___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (id)validatedCreateCryptoStrategy
{
  void *v3;
  void *v4;

  -[ICCloudSyncingObject cryptoStrategyProtocol](self, "cryptoStrategyProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCryptoStrategyFactory makeCryptoStrategyForObject:andValidateProtocolConformance:](ICCryptoStrategyFactory, "makeCryptoStrategyForObject:andValidateProtocolConformance:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)cryptoStrategyIsTransient
{
  BOOL v3;
  void *v4;

  if ((-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
    return 1;
  -[ICCloudSyncingObject primaryEncryptedData](self, "primaryEncryptedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (Protocol)cryptoStrategyProtocol
{
  return (Protocol *)&unk_1EF522D18;
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "encryptFileFromURL:toURL:", v7, v6);

  return v9;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_2;
  -[ICCloudSyncingObject primaryEncryptedDataFromRecord:](self, "primaryEncryptedDataFromRecord:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[ICCloudSyncingObject cryptoStrategyProtocol](self, "cryptoStrategyProtocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCryptoStrategyFactory makeCryptoStrategyForObject:withCipherMatchingEncryptedData:andValidateProtocolConformance:](ICCryptoStrategyFactory, "makeCryptoStrategyForObject:withCipherMatchingEncryptedData:andValidateProtocolConformance:", self, v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_2:
      -[ICCloudSyncingObject setCryptoStrategyForMergingEncryptedData:](self, "setCryptoStrategyForMergingEncryptedData:", v5);
      v6 = objc_msgSend(v5, "mergeEncryptedDataFromRecord:", v4);
      -[ICCloudSyncingObject setCryptoStrategyForMergingEncryptedData:](self, "setCryptoStrategyForMergingEncryptedData:", 0);

      goto LABEL_10;
    }
  }
  else
  {

  }
  v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Object cannot have crypto strategy, but is asked to decrypt and merge data from record {object: %@}", (uint8_t *)&v12, 0xCu);

  }
  -[ICCloudSyncingObject setUnappliedEncryptedRecord:](self, "setUnappliedEncryptedRecord:", v4);
  v6 = 0;
LABEL_10:

  return v6;
}

- (BOOL)hasPassphraseSet
{
  void *v2;
  char v3;

  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPassphraseSet");

  return v3;
}

- (NSString)passwordHint
{
  void *v2;
  void *v3;

  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passphraseHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPassphraseCorrect:", v4);

  return v6;
}

- (NSData)primaryEncryptedData
{
  void *v3;

  if (-[ICCloudSyncingObject supportsEncryptedValuesDictionary](self, "supportsEncryptedValuesDictionary"))
  {
    -[ICCloudSyncingObject encryptedValuesJSON](self, "encryptedValuesJSON");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSData *)v3;
}

- (void)setPrimaryEncryptedData:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ICCloudSyncingObject supportsEncryptedValuesDictionary](self, "supportsEncryptedValuesDictionary"))
    -[ICCloudSyncingObject setEncryptedValuesJSON:](self, "setEncryptedValuesJSON:", v4);

}

- (id)primaryEncryptedDataFromRecord:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[ICCloudSyncingObject supportsEncryptedValuesDictionary](self, "supportsEncryptedValuesDictionary"))
  {
    objc_msgSend(v4, "ic_inlineableDataAssetForKeyPrefix:", CFSTR("EncryptedValues"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setCryptoTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  _BYTE v24[20];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t vars0;
  uint64_t vars8;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject cryptoTag](self, "cryptoTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cryptoTag"));
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("cryptoTag"));
  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cryptoTag"));
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject setCryptoTag:].cold.1((uint64_t)self, (uint64_t)v4, (uint64_t)v14, v15, v16, v17, v18, v19, v23, *(uint64_t *)&v24[4], *(uint64_t *)&v24[12], v25, v26, v27, v28, v29, v30, v31, v32,
        v33,
        vars0,
        vars8);
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

  }
  else
  {
    v13 = objc_msgSend((id)v8, "isEqual:", v10);

    if (v13)
      goto LABEL_15;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_opt_class();
    v21 = v20;
    -[ICCloudSyncingObject identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    *(_QWORD *)v24 = v20;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v22;
    *(_WORD *)&v24[18] = 2048;
    v25 = objc_msgSend(v4, "hash");
    _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoTag.hash = %lu", (uint8_t *)&v23, 0x20u);

  }
LABEL_19:

}

- (void)setCryptoInitializationVector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  _BYTE v24[20];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t vars0;
  uint64_t vars8;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject cryptoInitializationVector](self, "cryptoInitializationVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cryptoInitializationVector"));
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("cryptoInitializationVector"));
  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cryptoInitializationVector"));
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject setCryptoInitializationVector:].cold.1((uint64_t)self, (uint64_t)v4, (uint64_t)v14, v15, v16, v17, v18, v19, v23, *(uint64_t *)&v24[4], *(uint64_t *)&v24[12], v25, v26, v27, v28, v29, v30, v31, v32,
        v33,
        vars0,
        vars8);
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

  }
  else
  {
    v13 = objc_msgSend((id)v8, "isEqual:", v10);

    if (v13)
      goto LABEL_15;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_opt_class();
    v21 = v20;
    -[ICCloudSyncingObject identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    *(_QWORD *)v24 = v20;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v22;
    *(_WORD *)&v24[18] = 2048;
    v25 = objc_msgSend(v4, "hash");
    _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoInitializationVector.hash = %lu", (uint8_t *)&v23, 0x20u);

  }
LABEL_19:

}

- (void)setCryptoSalt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  _BYTE v24[20];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t vars0;
  uint64_t vars8;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject cryptoSalt](self, "cryptoSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cryptoSalt"));
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("cryptoSalt"));
  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cryptoSalt"));
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject setCryptoSalt:].cold.1((uint64_t)self, (uint64_t)v4, (uint64_t)v14, v15, v16, v17, v18, v19, v23, *(uint64_t *)&v24[4], *(uint64_t *)&v24[12], v25, v26, v27, v28, v29, v30, v31, v32,
        v33,
        vars0,
        vars8);
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

  }
  else
  {
    v13 = objc_msgSend((id)v8, "isEqual:", v10);

    if (v13)
      goto LABEL_15;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_opt_class();
    v21 = v20;
    -[ICCloudSyncingObject identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    *(_QWORD *)v24 = v20;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v22;
    *(_WORD *)&v24[18] = 2048;
    v25 = objc_msgSend(v4, "hash");
    _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoSalt.hash = %lu", (uint8_t *)&v23, 0x20u);

  }
LABEL_19:

}

- (void)setCryptoIterationCount:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _BYTE v17[22];
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t vars0;
  uint64_t vars8;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[ICCloudSyncingObject cryptoIterationCount](self, "cryptoIterationCount");
  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cryptoIterationCount"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("cryptoIterationCount"));

  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cryptoIterationCount"));
  v7 = os_log_create("com.apple.notes", "Crypto");
  v8 = v7;
  if (v5 == a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject setCryptoIterationCount:].cold.1((uint64_t)self, a3, (uint64_t)v8, v9, v10, v11, v12, v13, *(__int128 *)v17, *(int *)&v17[16], *(__int16 *)&v17[20], v18, v19, v20, v21, v22, v23, v24, v25,
        v26,
        v27,
        vars0,
        vars8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    -[ICCloudSyncingObject identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v17 = 138412802;
    *(_QWORD *)&v17[4] = v14;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = v16;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoIterationCount = %lld", v17, 0x20u);

  }
}

- (void)setCryptoWrappedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  _BYTE v24[20];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t vars0;
  uint64_t vars8;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject cryptoWrappedKey](self, "cryptoWrappedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cryptoWrappedKey"));
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("cryptoWrappedKey"));
  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cryptoWrappedKey"));
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject setCryptoWrappedKey:].cold.1((uint64_t)self, (uint64_t)v4, (uint64_t)v14, v15, v16, v17, v18, v19, v23, *(uint64_t *)&v24[4], *(uint64_t *)&v24[12], v25, v26, v27, v28, v29, v30, v31, v32,
        v33,
        vars0,
        vars8);
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

  }
  else
  {
    v13 = objc_msgSend((id)v8, "isEqual:", v10);

    if (v13)
      goto LABEL_15;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_opt_class();
    v21 = v20;
    -[ICCloudSyncingObject identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    *(_QWORD *)v24 = v20;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v22;
    *(_WORD *)&v24[18] = 2048;
    v25 = objc_msgSend(v4, "hash");
    _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoWrappedKey.hash = %lu", (uint8_t *)&v23, 0x20u);

  }
LABEL_19:

}

- (void)setEncryptedValuesJSON:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[ICCloudSyncingObject encryptedValuesJSON](self, "encryptedValuesJSON");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("encryptedValuesJSON"));
  -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("encryptedValuesJSON"));
  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("encryptedValuesJSON"));
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICCloudSyncingObject setEncryptedValuesJSON:].cold.1();

  }
}

- (void)persistPendingChangesRecursively
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ICCloudSyncingObject persistPendingChanges](self, "persistPendingChanges");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[ICCloudSyncingObject allChildCloudObjects](self, "allChildCloudObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "persistPendingChangesRecursively");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)clearDecryptedData
{
  void *v3;

  -[ICCloudSyncingObject mutableDecryptedValues](self, "mutableDecryptedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[ICCloudSyncingObject setNeedsToLoadDecryptedValues:](self, "setNeedsToLoadDecryptedValues:", 1);
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 0;
}

- (NSDictionary)decryptedValues
{
  NSDictionary *decryptedValues;
  NSDictionary *v4;
  NSDictionary *v5;

  decryptedValues = self->_decryptedValues;
  if (decryptedValues)
  {
    v4 = decryptedValues;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v5 = self->_decryptedValues;
  self->_decryptedValues = v4;

  return self->_decryptedValues;
}

- (NSMutableDictionary)mutableDecryptedValues
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICCloudSyncingObject decryptedValues](self, "decryptedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableDictionary *)v4;
}

- (id)serializedValuesToEncrypt
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  _QWORD v12[5];
  id v13;

  -[ICCloudSyncingObject decryptedValues](self, "decryptedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke;
    v12[3] = &unk_1E76CAD20;
    v12[4] = self;
    v5 = v4;
    v13 = v5;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v7;
    if (!v6 || v7)
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObject serializedValuesToEncrypt].cold.1();

      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject serializedValuesToEncrypt]", 1, 1, CFSTR("Error converting decrypted values to JSON"));
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isEncryptableKeyBinaryData:", v5) & 1) == 0)
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke_cold_1();

    }
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5);

  }
}

- (void)deserializeAndMergeValues:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  if (a3)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    v6 = v5;
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 0;
    if (v7)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__ICCloudSyncingObject_deserializeAndMergeValues___block_invoke;
      v9[3] = &unk_1E76CAD48;
      v9[4] = self;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
    }
    else
    {
      v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObject deserializeAndMergeValues:].cold.1();

      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject deserializeAndMergeValues:]", 1, 1, CFSTR("Error parsing decrypted JSON"));
    }

  }
}

void __50__ICCloudSyncingObject_deserializeAndMergeValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (objc_msgSend(*(id *)(a1 + 32), "isEncryptableKeyBinaryData:", v5))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "decryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mergeDecryptedValue:withOldValue:forKey:", v7, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableDecryptedValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v5);

  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("mergeableData")))
  {
    objc_opt_class();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend(v12, "length");
        objc_msgSend(*(id *)(a1 + 32), "className");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218498;
        v20 = v14;
        v21 = 2112;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Decrypted mergeableData size is %lu for %@ (%@)", (uint8_t *)&v19, 0x20u);

      }
    }
    else
    {
      if (!v7)
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "className");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = (uint64_t)v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Decrypted mergeableData is not NSData for %@ (%@)", (uint8_t *)&v19, 0x16u);

      }
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)initializeCryptoProperties
{
  void *v3;
  id v4;

  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject parentEncryptableObject](self, "parentEncryptableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initializeCryptoPropertiesFromObject:", v3);

}

- (id)mergeDecryptedValue:(id)a3 withOldValue:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  ICTTMergeableWallClockValue *v13;
  ICTTMergeableWallClockValue *v14;
  NSObject *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "mergeableWallClockValueKeyPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v10);

  if (v12 && v9)
  {
    v13 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v9);
    v14 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v8);
    if (!-[ICTTMergeableWallClockValue merge:](v13, "merge:", v14))
    {
      v15 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObject mergeDecryptedValue:withOldValue:forKey:].cold.1((uint64_t)v10, self);

    }
    -[ICTTMergeableWallClockValue serialize](v13, "serialize");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v8;
  }

  return v16;
}

- (id)decryptedValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
  {
    -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadDecryptedValuesIfNecessary");

  }
  -[ICCloudSyncingObject decryptedValues](self, "decryptedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDecryptedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  if (-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
  {
    -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadDecryptedValuesIfNecessary");

    -[ICCloudSyncingObject mutableDecryptedValues](self, "mutableDecryptedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

    -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveEncryptedJSON");
  }
  else
  {
    -[ICCloudSyncingObject mutableDecryptedValues](self, "mutableDecryptedValues");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (void)setValue:(id)a3 forEncryptableKey:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  -[ICCloudSyncingObject setPrimitiveValue:forEncryptableKey:](self, "setPrimitiveValue:forEncryptableKey:", v6, v7);

  -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", v7);
}

- (void)setPrimitiveValue:(id)a3 forEncryptableKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  if (-[ICCloudSyncingObject isPasswordProtected](self, "isPasswordProtected"))
    -[ICCloudSyncingObject setDecryptedValue:forKey:](self, "setDecryptedValue:forKey:", v7, v6);
  else
    -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

}

- (BOOL)isEncryptableKeyBinaryData:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("sidecarMainKey")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("activityEventsData")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "mergeableWallClockValueKeyPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v3);

  }
  return v4;
}

+ (NSSet)mergeableWallClockValueKeyPaths
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)parentEncryptableObject
{
  return 0;
}

- (void)applyRandomCryptoGooIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  -[ICCloudSyncingObject cryptoTag](self, "cryptoTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoTag:](self, "setCryptoTag:", v5);

  }
  -[ICCloudSyncingObject cryptoInitializationVector](self, "cryptoInitializationVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoInitializationVector:](self, "setCryptoInitializationVector:", v8);

  }
  -[ICCloudSyncingObject cryptoWrappedKey](self, "cryptoWrappedKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoWrappedKey:](self, "setCryptoWrappedKey:", v11);

  }
  -[ICCloudSyncingObject cryptoSalt](self, "cryptoSalt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setCryptoSalt:](self, "setCryptoSalt:", v14);

  }
}

- (void)setHasMissingKeychainItem:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[ICCloudSyncingObject hasMissingKeychainItem](self, "hasMissingKeychainItem") != a3)
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Setting object has missing Keychain item… {object: %@, hasMissingKeychainItem: %@}", (uint8_t *)&v12, 0x16u);

    }
    NSStringFromSelector(sel_hasMissingKeychainItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_hasMissingKeychainItem);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v10);

    NSStringFromSelector(sel_hasMissingKeychainItem);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", v11);

  }
}

- (void)authenticationStateWillDeauthenticate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  id v11;

  v11 = a3;
  if ((-[ICCloudSyncingObject ic_isTransitioning](self, "ic_isTransitioning") & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend(v11, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICAuthenticationStateKeyObjectID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6
      || (-[ICCloudSyncingObject objectID](self, "objectID"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v6, "isEqual:", v7),
          v7,
          v8))
    {
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "concurrencyType") == 2)
        {
          v10 = -[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated");

          if (v10)
            -[ICCloudSyncingObject persistPendingChanges](self, "persistPendingChanges");
        }
        else
        {

        }
      }
    }

  }
}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  if ((-[ICCloudSyncingObject ic_isTransitioning](self, "ic_isTransitioning") & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ICAuthenticationStateKeyObjectID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7
      || (-[ICCloudSyncingObject objectID](self, "objectID"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v9))
    {
      -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__ICCloudSyncingObject_authenticationStateDidDeauthenticate___block_invoke;
      v11[3] = &unk_1E76C73F8;
      v11[4] = self;
      objc_msgSend(v10, "performBlock:", v11);

    }
  }

}

uint64_t __61__ICCloudSyncingObject_authenticationStateDidDeauthenticate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ic_isTransitioning");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "clearDecryptedData");
  }
  return result;
}

+ (id)versionsByOperationQueue
{
  if (versionsByOperationQueue_onceToken != -1)
    dispatch_once(&versionsByOperationQueue_onceToken, &__block_literal_global_387);
  return (id)versionsByOperationQueue_sVersionsByOperationQueue;
}

void __48__ICCloudSyncingObject_versionsByOperationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.cloud.versions-by-operation", v2);
  v1 = (void *)versionsByOperationQueue_sVersionsByOperationQueue;
  versionsByOperationQueue_sVersionsByOperationQueue = (uint64_t)v0;

}

+ (id)versionsByRecordIDByOperation
{
  if (versionsByRecordIDByOperation_onceToken != -1)
    dispatch_once(&versionsByRecordIDByOperation_onceToken, &__block_literal_global_389);
  return (id)versionsByRecordIDByOperation_sVersionsByRecordIDByOperation;
}

void __53__ICCloudSyncingObject_versionsByRecordIDByOperation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)versionsByRecordIDByOperation_sVersionsByRecordIDByOperation;
  versionsByRecordIDByOperation_sVersionsByRecordIDByOperation = v0;

}

- (int64_t)versionForOperation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend((id)objc_opt_class(), "versionsByOperationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ICCloudSyncingObject_versionForOperation___block_invoke;
  block[3] = &unk_1E76C95A8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__ICCloudSyncingObject_versionForOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "versionsByRecordIDByOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "longLongValue");

  }
}

- (void)setVersion:(int64_t)a3 forOperation:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "versionsByOperationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICCloudSyncingObject_setVersion_forOperation___block_invoke;
  block[3] = &unk_1E76C78F8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __48__ICCloudSyncingObject_setVersion_forOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "versionsByRecordIDByOperation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v3);

  }
}

- (int64_t)isPushingSameOrLaterThanVersion:(int64_t)a3
{
  NSObject *v5;
  int64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "versionsByOperationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICCloudSyncingObject_isPushingSameOrLaterThanVersion___block_invoke;
  block[3] = &unk_1E76C9E70;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __56__ICCloudSyncingObject_isPushingSameOrLaterThanVersion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend((id)objc_opt_class(), "versionsByRecordIDByOperation", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "objectForKeyedSubscript:", v2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9 && objc_msgSend(v9, "longLongValue") >= *(_QWORD *)(a1 + 48))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

            goto LABEL_13;
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

+ (id)deletedByThisDeviceOperationQueue
{
  if (deletedByThisDeviceOperationQueue_onceToken != -1)
    dispatch_once(&deletedByThisDeviceOperationQueue_onceToken, &__block_literal_global_391);
  return (id)deletedByThisDeviceOperationQueue_sDeletedByThisDeviceOperationQueue;
}

void __57__ICCloudSyncingObject_deletedByThisDeviceOperationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.cloud.deleted-by-this-device", v2);
  v1 = (void *)deletedByThisDeviceOperationQueue_sDeletedByThisDeviceOperationQueue;
  deletedByThisDeviceOperationQueue_sDeletedByThisDeviceOperationQueue = (uint64_t)v0;

}

+ (id)deletedByThisDeviceSet
{
  if (deletedByThisDeviceSet_onceToken != -1)
    dispatch_once(&deletedByThisDeviceSet_onceToken, &__block_literal_global_393);
  return (id)deletedByThisDeviceSet_sDeletedByThisDeviceMutableSet;
}

void __46__ICCloudSyncingObject_deletedByThisDeviceSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deletedByThisDeviceSet_sDeletedByThisDeviceMutableSet;
  deletedByThisDeviceSet_sDeletedByThisDeviceMutableSet = v0;

}

- (void)setWasRecentlyDeletedByThisDevice:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[ICCloudSyncingObject ic_obtainPermanentObjectIDIfNecessary](self, "ic_obtainPermanentObjectIDIfNecessary");
  objc_msgSend((id)objc_opt_class(), "deletedByThisDeviceOperationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__ICCloudSyncingObject_setWasRecentlyDeletedByThisDevice___block_invoke;
  v6[3] = &unk_1E76CAE10;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);

}

void __58__ICCloudSyncingObject_setWasRecentlyDeletedByThisDevice___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend((id)objc_opt_class(), "deletedByThisDeviceSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v4, "addObject:", v3);
  else
    objc_msgSend(v4, "removeObject:", v3);

}

- (BOOL)wasRecentlyDeletedByThisDevice
{
  ICCloudSyncingObject *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  -[ICCloudSyncingObject ic_obtainPermanentObjectIDIfNecessary](self, "ic_obtainPermanentObjectIDIfNecessary");
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend((id)objc_opt_class(), "deletedByThisDeviceOperationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ICCloudSyncingObject_wasRecentlyDeletedByThisDevice__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __54__ICCloudSyncingObject_wasRecentlyDeletedByThisDevice__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "deletedByThisDeviceSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "containsObject:", v2);

}

+ (void)resetAllDeletedByThisDeviceProperties
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "deletedByThisDeviceOperationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICCloudSyncingObject_resetAllDeletedByThisDeviceProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync(v3, block);

}

void __61__ICCloudSyncingObject_resetAllDeletedByThisDeviceProperties__block_invoke()
{
  id v0;

  objc_msgSend((id)objc_opt_class(), "deletedByThisDeviceSet");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

}

- (void)setInCloud:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInCloud:", v3);

}

- (BOOL)isInCloud
{
  void *v2;
  char v3;

  -[ICCloudSyncingObject cloudState](self, "cloudState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInCloud");

  return v3;
}

- (BOOL)needsInitialFetchFromCloudCheckingParent
{
  void *v4;
  char v5;

  if ((-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
    return 1;
  -[ICCloudSyncingObject parentCloudObjectForMinimumSupportedVersionPropagation](self, "parentCloudObjectForMinimumSupportedVersionPropagation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needsInitialFetchFromCloudCheckingParent");

  return v5;
}

+ (id)recordSystemFieldsTransformer
{
  if (recordSystemFieldsTransformer_onceToken != -1)
    dispatch_once(&recordSystemFieldsTransformer_onceToken, &__block_literal_global_395);
  return (id)recordSystemFieldsTransformer_recordSystemFieldsTransformer;
}

void __53__ICCloudSyncingObject_recordSystemFieldsTransformer__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C95048], "ic_systemFieldsValueTransformer");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)recordSystemFieldsTransformer_recordSystemFieldsTransformer;
  recordSystemFieldsTransformer_recordSystemFieldsTransformer = v0;

}

+ (id)shareSystemFieldsTransformer
{
  if (shareSystemFieldsTransformer_onceToken != -1)
    dispatch_once(&shareSystemFieldsTransformer_onceToken, &__block_literal_global_396);
  return (id)shareSystemFieldsTransformer_shareSystemFieldsTransformer;
}

void __52__ICCloudSyncingObject_shareSystemFieldsTransformer__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C95110], "ic_systemFieldsValueTransformer");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shareSystemFieldsTransformer_shareSystemFieldsTransformer;
  shareSystemFieldsTransformer_shareSystemFieldsTransformer = v0;

}

- (void)setServerRecord:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ICCloudSyncingObject recordName](self, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8 && (objc_msgSend(v8, "ic_isCaseInsensitiveEqualToString:", v6) & 1) == 0)
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObject setServerRecord:].cold.1();

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject setServerRecord:]", 1, 1, CFSTR("Setting server record with mismatched record name"));
  }
  else if ((-[CKRecord isEqual:](self->_serverRecord, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverRecord, a3);
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "recordSystemFieldsTransformer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transformedValue:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject setServerRecordData:](self, "setServerRecordData:", v10);

      objc_msgSend(v5, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "zoneID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ownerName");
      v13 = (os_log_t)objc_claimAutoreleasedReturnValue();

      if ((-[NSObject isEqualToString:](v13, "isEqualToString:", *MEMORY[0x1E0C94730]) & 1) == 0)
        -[ICCloudSyncingObject setZoneOwnerName:](self, "setZoneOwnerName:", v13);
    }
    else
    {
      -[ICCloudSyncingObject setServerRecordData:](self, "setServerRecordData:", 0);
      v13 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Clearing serverRecord for: %@", (uint8_t *)&v16, 0xCu);

      }
    }

  }
}

- (void)setServerShare:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[CKShare isEqual:](self->_serverShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverShare, a3);
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "shareSystemFieldsTransformer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transformedValue:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject setServerShareData:](self, "setServerShareData:", v6);

    }
    else
    {
      -[ICCloudSyncingObject setServerShareData:](self, "setServerShareData:", 0);
    }
    -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  }

}

- (void)setUserSpecificServerRecord:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  ICUserSpecificRecordIDParser *v8;
  void *v9;
  void *v10;
  ICUserSpecificRecordIDParser *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v5 = a3;
  -[ICCloudSyncingObject recordName](self, "recordName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || !v6)
  {
LABEL_6:
    if ((-[CKRecord isEqual:](self->_userSpecificServerRecord, "isEqual:", v5) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_userSpecificServerRecord, a3);
      if (v5)
      {
        objc_msgSend((id)objc_opt_class(), "recordSystemFieldsTransformer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "transformedValue:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCloudSyncingObject setUserSpecificServerRecordData:](self, "setUserSpecificServerRecordData:", v15);

      }
      else
      {
        -[ICCloudSyncingObject setUserSpecificServerRecordData:](self, "setUserSpecificServerRecordData:", 0);
      }
    }
    goto LABEL_13;
  }
  v8 = [ICUserSpecificRecordIDParser alloc];
  objc_msgSend(v5, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICUserSpecificRecordIDParser initWithRecordName:](v8, "initWithRecordName:", v10);
  -[ICUserSpecificRecordIDParser sharedRecordID](v11, "sharedRecordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || (objc_msgSend(v13, "ic_isCaseInsensitiveEqualToString:", v7) & 1) != 0)
  {

    goto LABEL_6;
  }
  v16 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ICCloudSyncingObject setUserSpecificServerRecord:].cold.1();

  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObject setUserSpecificServerRecord:]", 1, 1, CFSTR("Setting user-specific server record with mismatched shared record name"));
LABEL_13:

}

- (CKRecord)userSpecificServerRecord
{
  CKRecord *userSpecificServerRecord;
  void *v4;
  void *v5;
  CKRecord *v6;
  CKRecord *v7;

  userSpecificServerRecord = self->_userSpecificServerRecord;
  if (!userSpecificServerRecord)
  {
    -[ICCloudSyncingObject userSpecificServerRecordData](self, "userSpecificServerRecordData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "recordSystemFieldsTransformer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reverseTransformedValue:", v4);
      v6 = (CKRecord *)objc_claimAutoreleasedReturnValue();
      v7 = self->_userSpecificServerRecord;
      self->_userSpecificServerRecord = v6;

    }
    userSpecificServerRecord = self->_userSpecificServerRecord;
  }
  return userSpecificServerRecord;
}

- (void)setNeedsInitialFetchFromCloud:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[ICCloudSyncingObject needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") != a3)
  {
    -[ICCloudSyncingObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("needsInitialFetchFromCloud"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("needsInitialFetchFromCloud"));

    -[ICCloudSyncingObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("needsInitialFetchFromCloud"));
    if (v3)
      -[ICCloudSyncingObject clearChangeCountWithReason:](self, "clearChangeCountWithReason:", CFSTR("Set as needing initial fetch"));
  }
}

- (BOOL)hasAllMandatoryFields
{
  void *v2;
  BOOL v3;

  -[ICCloudSyncingObject identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSString)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICCloudSyncingObject;
  -[ICCloudSyncingObject description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICCloudSyncingObject *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__ICCloudSyncingObject_ic_loggingValues__block_invoke;
  v8[3] = &unk_1E76C73B0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v5;
  return v6;
}

void __40__ICCloudSyncingObject_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "inCloud"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("inCloud"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "cloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "latestVersionSyncedToCloud"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("latestVersionSyncedToCloud"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "cloudState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "currentLocalVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("currentLocalVersion"));

  objc_msgSend(*(id *)(a1 + 40), "cloudState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localVersionDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("localVersionDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "hasAllMandatoryFields"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, CFSTR("hasAllMandatoryFields"));

  if (objc_msgSend(*(id *)(a1 + 40), "wantsUserSpecificRecord"))
  {
    objc_msgSend(*(id *)(a1 + 40), "userSpecificRecordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordName");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = CFSTR("nil");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, CFSTR("userSpecificRecordID"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isPasswordProtected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isPasswordProtected"));
    objc_msgSend(*(id *)(a1 + 40), "cryptoInitializationVector");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = CFSTR("nil");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v22, CFSTR("cryptoInitializationVector"));

    objc_msgSend(*(id *)(a1 + 40), "cryptoTag");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = CFSTR("nil");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v25, CFSTR("cryptoTag"));

    objc_msgSend(*(id *)(a1 + 40), "cryptoWrappedKey");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (const __CFString *)v26;
    else
      v28 = CFSTR("nil");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v28, CFSTR("cryptoWrappedKey"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "markedForDeletion"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("markedForDeletion"));
  if (objc_msgSend(*(id *)(a1 + 40), "needsToBePushedToCloud"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("needsToBePushedToCloud"));
  if (objc_msgSend(*(id *)(a1 + 40), "needsToBeFetchedFromCloud"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("needsToBeFetchedFromCloud"));
  if (objc_msgSend(*(id *)(a1 + 40), "needsInitialFetchFromCloud"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("needsInitialFetchFromCloud"));
  if (objc_msgSend(*(id *)(a1 + 40), "needsToBeDeletedFromCloud"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("needsToBeDeletedFromCloud"));
  if (objc_msgSend(*(id *)(a1 + 40), "failedToSyncCount") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "failedToSyncCount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v29, CFSTR("failedToSyncCount"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "numberOfPushAttemptsToWaitCount") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberOfPushAttemptsToWaitCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v30, CFSTR("numberOfPushAttemptsToWaitCount"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "minimumSupportedNotesVersion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v31, CFSTR("minimumSupportedNotesVersion"));

  objc_msgSend(*(id *)(a1 + 40), "serverShare");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(*(id *)(a1 + 40), "serverShare");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "ic_loggingDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v34, CFSTR("serverShare"));

  }
  objc_msgSend(*(id *)(a1 + 40), "serverRecord");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(*(id *)(a1 + 40), "serverRecord");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "ic_loggingDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v36, CFSTR("serverRecord"));

  }
}

+ (id)allPasswordProtectedObjectsInContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("isPasswordProtected==YES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject ic_objectsMatchingPredicate:context:](ICCloudSyncingObject, "ic_objectsMatchingPredicate:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForPasswordProtectedObjects
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPasswordProtected == YES"));
}

+ (id)predicateForInCloudObjects
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudState.inCloud == YES"));
}

+ (id)predicateForObjectsWithIdentifiers:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier IN %@"), a3);
}

- (BOOL)trustsTimestampsFromReplicaID:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[ICCloudSyncingObject notesVersionForReplicaID:](self, "notesVersionForReplicaID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue") > 5;
  else
    v5 = 0;

  return v5;
}

- (void)redactAuthorAttributionsToCurrentUser
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ICCloudSyncingObject childCloudObjects](self, "childCloudObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "redactAuthorAttributionsToCurrentUser");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)cloudContext
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICCloudSyncingObject appContext](self, "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[ICCloudContext sharedContext](ICCloudContext, "sharedContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)viewContext
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICCloudSyncingObject appContext](self, "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)workerManagedObjectContext
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICCloudSyncingObject appContext](self, "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeBackgroundContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workerManagedObjectContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)hasContextOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;

  -[ICCloudSyncingObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[ICCloudSyncingObject appContext](self, "appContext");
  else
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasContextOptions:", a3);

  return v7;
}

- (id)deviceManagementRestrictionsManager
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICCloudSyncingObject appContext](self, "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceManagementRestrictionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[ICDeviceManagementRestrictionsManager sharedManager](ICDeviceManagementRestrictionsManager, "sharedManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)needsToLoadDecryptedValues
{
  return self->_needsToLoadDecryptedValues;
}

- (BOOL)isMergingRecord
{
  return self->mergingRecord;
}

- (void)setMergingRecord:(BOOL)a3
{
  self->mergingRecord = a3;
}

- (void)setMergingUnappliedEncryptedRecord:(BOOL)a3
{
  self->mergingUnappliedEncryptedRecord = a3;
}

- (void)setCryptoStrategyForMergingEncryptedData:(id)a3
{
  objc_storeStrong((id *)&self->_cryptoStrategyForMergingEncryptedData, a3);
}

- (ICAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (NSString)lastUpdateChangeCountReason
{
  return self->_lastUpdateChangeCountReason;
}

- (void)setLastUpdateChangeCountReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)persistedActivityEventsStorage
{
  return self->_persistedActivityEventsStorage;
}

- (void)setPersistedActivityEventsStorage:(id)a3
{
  objc_storeStrong(&self->_persistedActivityEventsStorage, a3);
}

- (id)checklistItemToActivityEventsStorage
{
  return self->_checklistItemToActivityEventsStorage;
}

- (void)setChecklistItemToActivityEventsStorage:(id)a3
{
  objc_storeStrong(&self->_checklistItemToActivityEventsStorage, a3);
}

- (void)addEmailAddressesAndPhoneNumbersToAttributeSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isCurrentUser") & 1) == 0)
        {
          objc_msgSend(v12, "userIdentity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lookupInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "emailAddress");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "ic_addNonNilObject:", v15);

          objc_msgSend(v12, "userIdentity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lookupInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "phoneNumber");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ic_addNonNilObject:", v18);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v4, "count"))
  {
    v19 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v21, "setEmailAddresses:", v19);

  }
  if (objc_msgSend(v5, "count"))
  {
    v20 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v21, "setPhoneNumbers:", v20);

  }
}

- (NSDate)objc_shareTimestamp
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  ICCloudSyncingObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED239CD8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  ICCloudSyncingObject.shareTimestamp.getter(v5);

  v7 = sub_1BDBFCAC8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1BDBFCA74();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (id)objc_timestampForChecklistItemWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ICCloudSyncingObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED239CD8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BDBFD6F8();
  v9 = v8;
  v10 = self;
  ICCloudSyncingObject.timestampForChecklistItem(identifier:)(v7, v9, (uint64_t)v6);

  swift_bridgeObjectRelease();
  v11 = sub_1BDBFCAC8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    v13 = (void *)sub_1BDBFCA74();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return v13;
}

- (id)objc_userIDForChecklistItemWithIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  ICCloudSyncingObject *v7;
  Swift::String v8;
  void *object;
  void *v10;

  v4 = sub_1BDBFD6F8();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = ICCloudSyncingObject.userIdForChecklistItem(identifier:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)sub_1BDBFD6C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)persistCreateActivityEventForObject:(id)a3 inParentObject:(id)a4
{
  return sub_1BDBCA1A4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, void *))ICCloudSyncingObject.persistCreateActivityEvent(forObject:inParentObject:));
}

- (id)persistMoveActivityEventForObject:(id)a3 fromParentObject:(id)a4 toParentObject:(id)a5
{
  ICCloudSyncingObject *v8;
  id v9;
  id v10;
  ICCloudSyncingObject *v11;
  void *v12;

  v8 = (ICCloudSyncingObject *)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)ICCloudSyncingObject.persistMoveActivityEvent(forObject:fromParentObject:toParentObject:)(v8, (ICCloudSyncingObject_optional *)a4, (ICCloudSyncingObject_optional *)a5);

  return v12;
}

- (id)persistCopyActivityEventForObject:(id)a3 originalObject:(id)a4 fromParentObject:(id)a5 toParentObject:(id)a6
{
  ICCloudSyncingObject *v10;
  ICCloudSyncingObject *v11;
  id v12;
  id v13;
  ICCloudSyncingObject *v14;
  void *v15;

  v10 = (ICCloudSyncingObject *)a3;
  v11 = (ICCloudSyncingObject *)a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  v15 = (void *)ICCloudSyncingObject.persistCopyActivityEvent(forObject:originalObject:fromParentObject:toParentObject:)(v10, v11, (ICCloudSyncingObject_optional *)a5, (ICCloudSyncingObject_optional *)a6);

  return v15;
}

- (id)persistRenameActivityEventForObject:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  ICCloudSyncingObject *v13;
  objc_class *v14;
  uint64_t v16;

  v5 = sub_1BDBFCAC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PersistedActivityEvent.Activities();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  v12 = a3;
  v13 = self;
  sub_1BDBFCABC();
  v14 = ICCloudSyncingObject.persist(activity:for:timestamp:)((uint64_t)v11, (ICCloudSyncingObject *)a3, (uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1BDAE1658((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for PersistedActivityEvent.Activities);

  return v14;
}

- (id)persistDeleteActivityEventForObject:(id)a3 fromParentObject:(id)a4
{
  return sub_1BDBCA1A4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, void *))ICCloudSyncingObject.persistDeleteActivityEvent(forObject:fromParentObject:));
}

- (id)persistAddParticipantActivityEventForObject:(id)a3 participant:(id)a4
{
  ICCloudSyncingObject *v6;
  id v7;
  ICCloudSyncingObject *v8;
  void *v9;

  v6 = (ICCloudSyncingObject *)a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)ICCloudSyncingObject.persistAddParticipantActivityEvent(forObject:participant:)(v6, (CKShareParticipant)v7);

  return v9;
}

- (id)persistRemoveParticipantActivityEventForObject:(id)a3 participant:(id)a4
{
  ICCloudSyncingObject *v6;
  id v7;
  ICCloudSyncingObject *v8;
  void *v9;

  v6 = (ICCloudSyncingObject *)a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)ICCloudSyncingObject.persistRemoveParticipantActivityEvent(forObject:participant:)(v6, (CKShareParticipant)v7);

  return v9;
}

- (id)persistToggleChecklistItemActivityEventForObject:(id)a3 todo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  ICCloudSyncingObject *v15;
  id v16;
  ICCloudSyncingObject *v17;
  id v18;
  objc_class *v19;
  uint64_t v21;

  v7 = sub_1BDBFCAC8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PersistedActivityEvent.Activities();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF50FFC0) + 48);
  v15 = (ICCloudSyncingObject *)a3;
  v16 = a4;
  v17 = self;
  v18 = objc_msgSend(v16, sel_uuid);
  sub_1BDBFCB10();

  v13[v14] = objc_msgSend(v16, sel_done);
  swift_storeEnumTagMultiPayload();
  sub_1BDBFCABC();
  v19 = ICCloudSyncingObject.persist(activity:for:timestamp:)((uint64_t)v13, v15, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_1BDAE1658((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for PersistedActivityEvent.Activities);

  return v19;
}

- (id)persistMentionActivityEventForObject:(id)a3 mentionAttachments:(id)a4
{
  uint64_t v6;
  ICCloudSyncingObject *v7;
  ICCloudSyncingObject *v8;
  void *v9;

  sub_1BD942914(0, &qword_1EF510018);
  v6 = sub_1BDBFD9E0();
  v7 = (ICCloudSyncingObject *)a3;
  v8 = self;
  v9 = (void *)ICCloudSyncingObject.persistMentionActivityEvent(forObject:mentionAttachments:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)objc_removeAllCloudSyncingObjectActivityEvents
{
  ICCloudSyncingObject *v2;

  v2 = self;
  ICCloudSyncingObject.removeAllCloudSyncingObjectActivityEvents()();

}

+ (void)objc_removeAllCloudSyncingObjectActivityEventsForUnsharedObjectsInContext:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a3;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1BDBD459C;
  *(_QWORD *)(v5 + 24) = v4;
  v8[4] = sub_1BDB35FFC;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1BDBC55F0;
  v8[3] = &block_descriptor_31;
  v6 = _Block_copy(v8);
  v7 = a3;
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_performBlockAndWait_, v6);
  _Block_release(v6);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  swift_release();
  if ((v6 & 1) != 0)
    __break(1u);
}

- (void)assignToPersistentStore:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Trying to assign cloud object %@ to nil persistent store", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)updateChangeCountWithReason:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_34(&dword_1BD918000, v2, v3, "Refusing to update change count for a placeholder object {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)updateChangeCountWithReason:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_34(&dword_1BD918000, v2, v3, "Refusing to update change count during record merge {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)updateChangeCountWithReason:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Refusing to update change count for object with missing cloud state {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)unsafelyUpdateChangeCountWithReason:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, __int128 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_27();
  a20 = v24;
  a21 = v25;
  OUTLINED_FUNCTION_29();
  a13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v26, "shortLoggingDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v23, "cloudState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithLongLong:", objc_msgSend(v29, "currentLocalVersion"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  *(_QWORD *)((char *)&a10 + 6) = v22;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v21, v31, "Updated change count {object: %@, reason: %@, count: %@}", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)unsafelyUpdateChangeCountWithReason:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Setting change count to zero to prevent integer overflow {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)clearChangeCountWithReason:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Refusing to clear change count for object with missing cloud state {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)unsafelyClearChangeCountWithReason:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Cleared change count {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)updateUserSpecificChangeCountWithReason:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Marked user-specific record as needing sync {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)updateUserSpecificChangeCountWithReason:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Refusing to mark user-specific record as needing sync because object that doesn't want user-specific records {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)updateUserSpecificChangeCountWithReason:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Refusing to mark user-specific record as needing sync because object that doesn't support user-specific records {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)recordID
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Cannot create record ID for object without record zone name {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)newObjectWithIdentifier:(NSObject *)a3 context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a3, (uint64_t)a3, "Creating %@", (uint8_t *)a2);

}

+ (void)newObjectWithIdentifier:context:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_9(&dword_1BD918000, v1, (uint64_t)v1, "Entity from context %p does not equal entity from class %p", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)cloudObjectWithIdentifier:(uint64_t)a3 context:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Trying to fetch cloud syncing object without an identifier", a5, a6, a7, a8, 0);
}

- (void)makeCloudKitRecordForApproach:(void *)a1 mergeableFieldState:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Encrypted values being ignored for sync because the object (%@) says it doesn't support it.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)makeCloudKitRecordForApproach:(void *)a1 mergeableFieldState:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Trying to create record without record ID for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)makeCloudKitRecordForApproach:mergeableFieldState:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "recordName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Object has server record with mismatched record name {objectRecordName: %@, serverRecordName: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)mergeCloudKitRecord:(void *)a1 accountID:approach:mergeableFieldState:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot merge encrypted data from record {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeCloudKitRecord:(void *)a1 accountID:approach:mergeableFieldState:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_35(&dword_1BD918000, v1, v2, "Setting marked for deletion to %d when merging data from record: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)mergeCloudKitRecord:accountID:approach:mergeableFieldState:.cold.3()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v3 = v2;
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "Merging incoming record (identifier=%@, approach=%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)mergeCloudKitRecord:accountID:approach:mergeableFieldState:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "recordID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Incoming record (%@) does not match local record (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)unappliedEncryptedRecord
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v5 = 2080;
  v6 = "-[ICCloudSyncingObject unappliedEncryptedRecord]";
  v7 = 1024;
  v8 = 971;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Unarchiving unapplied encrypted record… {object: %@}%s:%d", v4, 0x1Cu);

}

- (void)setUnappliedEncryptedRecord:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error archiving unapplied encrypted record {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)setUnappliedEncryptedRecord:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot set unapplied encrypted record for an object that is not password-protected {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setUnappliedEncryptedRecord:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  OUTLINED_FUNCTION_17();
  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1 != 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138413058;
  v6 = v3;
  v7 = 2112;
  v9 = 2080;
  v8 = v4;
  v10 = "-[ICCloudSyncingObject setUnappliedEncryptedRecord:]";
  v11 = 1024;
  v12 = 988;
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "Setting unapplied encrypted record… {object: %@, hasRecord: %@}%s:%d", (uint8_t *)&v5, 0x26u);

  OUTLINED_FUNCTION_7();
}

- (void)mergeCryptoFieldsFromRecord:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Merging crypto info for object (%@): %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)needsToBePushedToCloud
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not pushing because we already have an operation pushing this version %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)objectWasFetchedFromCloudWithRecord:(void *)a1 accountID:force:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "serverShare");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v3, v4, "Object fetched does not have a share removing our severShare: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)objectWasFetchedFromCloudWithRecord:(void *)a1 accountID:force:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Object fetched is older or equal to then our current record: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)objectWasFetchedFromCloudWithRecord:(void *)a1 accountID:force:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not merging fetched record with same change tag %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)activityEventsDocument
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Trying to access activity events document on an object that doesn't support it — returning nil {objectID: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_0();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "minimumSupportedNotesVersion");
  OUTLINED_FUNCTION_5_2();
  objc_msgSend((id)objc_opt_class(), "currentNotesVersion");
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_40();
  v6 = v1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v0, v4, "minimumSupportedVersion: Not evaluating because (%lld) is unsupported (%lld): %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "minimumSupportedVersion: Not evaluating because object is a placeholder: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)requireMinimumSupportedVersionAndPropagateToChildObjects:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_3_2();
  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(v3, "minimumSupportedNotesVersion");
  objc_msgSend(v2, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v4;
  v9 = 2048;
  v10 = v1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v0, v6, "Upgrading minimumSupportedNotesVersion from %lld to %lld for object: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

- (void)replicaIDToNotesVersion
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1BD918000, a2, OS_LOG_TYPE_FAULT, "Trying to access Notes version tracking on an object that doesn't support it — returning nil {objectID: %@}", v4, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not authenticated for object — not updating replica ID to Notes version {objectID: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)userSpecificRecordID
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Cannot create user-specific record ID for object without user record name {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)makeUserSpecificCloudKitRecordForApproach:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Object has user-specific server record with mismatched record name {objectRecordName: %@, serverRecordName: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)didFetchUserSpecificRecord:(uint64_t)a1 accountID:(void *)a2 force:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Fetched user-specific record that was older than our current one for account ID %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)didFetchUserSpecificRecord:(uint64_t)a1 accountID:(void *)a2 force:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Not merging user-specific record with same change tag for account ID %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)didFailToSaveUserSpecificRecordWithID:accountID:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "User-specific record (%@) synced down but local user-specific record ID is nil when merging oplock result: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)assetForData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error writing temporary asset file {error: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)assetForURL:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9(&dword_1BD918000, v0, (uint64_t)v0, "Cloned source file (%@) to temporary asset file (%@)", v1);
  OUTLINED_FUNCTION_1_0();
}

+ (void)assetForTemporaryURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Created temporary asset for file URL: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)dataForAsset:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Error reading data for CKAsset with nil fileURL.", a5, a6, a7, a8, 0);
}

+ (void)dataForAsset:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error reading temporary asset file {error: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

void __50__ICCloudSyncingObject_temporaryAssetDirectoryURL__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error creating temporary assets directory: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)deleteTemporaryFilesForAsset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error deleting file for temporary asset: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __65__ICCloudSyncingObject_deleteAllTemporaryAssetFilesForAllObjects__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error while enumerating all temporary asset files: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)shouldBeDeletedFromLocalDatabase
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Attempted to purge an object (%@) that isn't deletable", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setMarkedForDeletion:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "shortLoggingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_35(&dword_1BD918000, v2, v3, "Setting markedForDeletion %d on %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)setServerShareIfNewer:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "No server share for %@, setting to %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_29();
  a14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v27, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_38(), "serverShare");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "ic_loggingDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v23, v30, "Existing server share for %@ %@ has the same change tag as %@", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_29();
  a14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v27, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_38(), "serverShare");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "ic_loggingDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v23, v30, "Existing server share for %@ %@ is newer than %@", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_29();
  a14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v27, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_38(), "serverShare");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "ic_loggingDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v23, v30, "Replacing old server share for %@ %@ with %@", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setServerShareIfNewer:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_29();
  a14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v27, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_38(), "serverShare");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "ic_loggingDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v23, v30, "Replacing server share without metadata for %@ %@ with %@", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)markShareDirtyIfNeededWithReason:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Marked share as needing sync {object: %@, reason: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)cryptoStrategy
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v0, "cryptoStrategyForMergingEncryptedData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Using overridden crypto strategy (%@) for merging object: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)setCryptoTag:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_3_2();
  v27 = (void *)OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31(v27);
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "identifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v22, v28, "Updated crypto goo to the same value for %@ (%@): cryptoTag.hash = %lu", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setCryptoInitializationVector:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_3_2();
  v27 = (void *)OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31(v27);
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "identifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v22, v28, "Updated crypto goo to the same value for %@ (%@): cryptoInitializationVector.hash = %lu", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setCryptoSalt:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_3_2();
  v27 = (void *)OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31(v27);
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "identifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v22, v28, "Updated crypto goo to the same value for %@ (%@): cryptoSalt.hash = %lu", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setCryptoIterationCount:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_27();
  a22 = v27;
  a23 = v28;
  OUTLINED_FUNCTION_3_2();
  v29 = (void *)OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31(v29);
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138412802;
  *(_QWORD *)((char *)&a9 + 4) = v25;
  OUTLINED_FUNCTION_13();
  a12 = 2048;
  a13 = v24;
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v23, v31, "Updated crypto goo to the same value for %@ (%@): cryptoIterationCount = %lld", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setCryptoWrappedKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  OUTLINED_FUNCTION_27();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_3_2();
  v27 = (void *)OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_31(v27);
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "identifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_15_0(&dword_1BD918000, v22, v28, "Updated crypto goo to the same value for %@ (%@): cryptoWrappedKey.hash = %lu", &a9);

  OUTLINED_FUNCTION_1_1();
}

- (void)setEncryptedValuesJSON:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "encryptedValuesJSON changed for object (%@): encryptedValuesJSON.hash = %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)serializedValuesToEncrypt
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v1, "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Error converting decrypted values to JSON for %@ (%@): %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __49__ICCloudSyncingObject_serializedValuesToEncrypt__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Converting %@ to base 64 for JSON, but it's not marked as data", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)deserializeAndMergeValues:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v1, "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Error parsing decrypted JSON for %@ (%@): %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)mergeUnappliedEncryptedRecord
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Error merging unapplied encrypted record {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergeDecryptedValue:(uint64_t)a1 withOldValue:(void *)a2 forKey:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Failed to merge decrypted value for key (%@): %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)setServerRecord:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Setting server record with mismatched record name {objectRecordName: %@, serverRecordName: %@}", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)setUserSpecificServerRecord:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Setting user-specific server record with mismatched shared record name {serverRecordName: %@, objectRecordName: %@}", v1);
  OUTLINED_FUNCTION_1_0();
}

@end
