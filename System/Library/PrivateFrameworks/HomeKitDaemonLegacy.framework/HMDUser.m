@implementation HMDUser

- (BOOL)isOwner
{
  return -[HMDUser privilege](self, "privilege") == 3;
}

- (unint64_t)privilege
{
  os_unfair_lock_s *p_lock;
  unint64_t privilege;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  privilege = self->_privilege;
  os_unfair_lock_unlock(p_lock);
  return privilege;
}

- (BOOL)isRemoteAccessAllowed
{
  BOOL remoteAccessAllowed;
  os_unfair_lock_s *p_lock;

  if (-[HMDUser isOwner](self, "isOwner"))
    return 1;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  remoteAccessAllowed = self->_remoteAccessAllowed;
  os_unfair_lock_unlock(p_lock);
  return remoteAccessAllowed;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)hmmtrUserPrivilegeFromHMDUserPrivilege:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return qword_1CDB8EEF8[a3];
}

+ (unint64_t)hmdUserPrivilegeFromHMMTRUserPrivilege:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 2;
  else
    return qword_1CDB8EF20[a3 - 1];
}

- (AVOutputDeviceAuthorizedPeer)av_authorizedPeer
{
  void *v3;
  void *v4;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HMDUser av_authorizedPeerForPairingIdentity:isOwner:](HMDUser, "av_authorizedPeerForPairingIdentity:isOwner:", v3, -[HMDUser privilege](self, "privilege") == 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (AVOutputDeviceAuthorizedPeer *)v4;
}

+ (id)av_authorizedPeerForPairingIdentity:(id)a3 isOwner:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0C8B2C0];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithID:publicKey:hasAdministratorPrivileges:", v8, v10, v4);

  return v11;
}

- (BOOL)hasCameraClipsAccess
{
  int v3;

  v3 = -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  if (v3)
  {
    -[HMDUser camerasAccessLevel](self, "camerasAccessLevel");
    LOBYTE(v3) = HMUserIsRecordingAllowedWithCameraAccessLevel();
  }
  return v3;
}

- (NSData)nfcIssuerKeyIdentifier
{
  void *v2;
  void *v3;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHome nfcIssuerKeyIdentifierWithPairingIdentity:](HMDHome, "nfcIssuerKeyIdentifierWithPairingIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)_setUuidUnsafely:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (id)sharedSettingValuesByKeyPath
{
  void *v2;
  void *v3;

  -[HMDUser userDataController](self, "userDataController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedSettingValuesByKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)privateSettingValuesByKeyPath
{
  void *v2;
  void *v3;

  -[HMDUser userDataController](self, "userDataController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateSettingValuesByKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDUser)initWithModelObject:(id)a3
{
  id v4;
  HMDUser *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDUser *v13;
  uint64_t v14;
  NSUUID *uuid;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMUserPresenceAuthorization *presenceAuthStatus;
  uint64_t v21;
  HMDAccountIdentifier *accountIdentifier;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSNumber *matterCASEAuthenticatedTagID;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (HMDUser *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "accountHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "userID");
      v5 = (HMDUser *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_15;
      +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountHandleFromString:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = (void *)MEMORY[0x1E0D165A8];
    objc_msgSend(v4, "pairingIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmd_pairingIdentityWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "privilege");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDUser initWithAccountHandle:homeUUID:pairingIdentity:privilege:](self, "initWithAccountHandle:homeUUID:pairingIdentity:privilege:", v6, 0, v11, objc_msgSend(v12, "integerValue"));

    if (v13)
    {
      objc_msgSend(v4, "uuid");
      v14 = objc_claimAutoreleasedReturnValue();
      uuid = v13->_uuid;
      v13->_uuid = (NSUUID *)v14;

      objc_msgSend(v4, "remoteAccessAllowed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_remoteAccessAllowed = objc_msgSend(v16, "BOOLValue");

      v17 = (void *)MEMORY[0x1E0CBA950];
      objc_msgSend(v4, "presenceAuthorizationStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "authWithNumber:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      presenceAuthStatus = v13->_presenceAuthStatus;
      v13->_presenceAuthStatus = (HMUserPresenceAuthorization *)v19;

      objc_msgSend(v4, "accountIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      accountIdentifier = v13->_accountIdentifier;
      v13->_accountIdentifier = (HMDAccountIdentifier *)v21;

      objc_msgSend(v4, "camerasAccessLevel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v4, "camerasAccessLevel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v13->_camerasAccessLevel = objc_msgSend(v24, "integerValue");

      }
      v25 = v4;
      if (objc_msgSend(v25, "propertyWasSet:", CFSTR("announceAccessLevel")))
      {
        objc_msgSend(v25, "announceAccessLevel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (uint64_t)v13;
        v28 = 0;
        v29 = v26;
      }
      else
      {
        objc_msgSend(v25, "announceAccessAllowed");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (uint64_t)v13;
        v28 = v26;
        v29 = 0;
      }
      v30 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:](v27, v28, v29);

      v13->_announceAccessLevel = v30;
      objc_msgSend(v25, "matterCASEAuthenticatedTagID");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        objc_msgSend(v25, "matterCASEAuthenticatedTagID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "integerValue");

        if (v34)
        {
          objc_msgSend(v25, "matterCASEAuthenticatedTagID");
          v35 = objc_claimAutoreleasedReturnValue();
          matterCASEAuthenticatedTagID = v13->_matterCASEAuthenticatedTagID;
          v13->_matterCASEAuthenticatedTagID = (NSNumber *)v35;

        }
      }
    }
    self = v13;

    v5 = self;
  }
LABEL_15:

  return v5;
}

- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  HMDUserDataSource *v13;
  HMDUser *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(HMDUserDataSource);
  v14 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:dataSource:](self, "initWithAccountHandle:home:pairingIdentity:privilege:dataSource:", v12, v11, v10, a6, v13);

  return v14;
}

- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 dataSource:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HMDUser *v18;

  v12 = a4;
  v13 = a7;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v12, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDUser initWithAccountHandle:homeUUID:pairingIdentity:privilege:keyStore:dataSource:](self, "initWithAccountHandle:homeUUID:pairingIdentity:privilege:keyStore:dataSource:", v15, v16, v14, a6, v17, v13);

  if (v18)
    objc_storeWeak((id *)&v18->_home, v12);

  return v18;
}

- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  HMDUserDataSource *v13;
  void *v14;
  HMDUser *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(HMDUserDataSource);
  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDUser initWithAccountHandle:homeUUID:pairingIdentity:privilege:keyStore:dataSource:](self, "initWithAccountHandle:homeUUID:pairingIdentity:privilege:keyStore:dataSource:", v12, v11, v10, a6, v14, v13);

  return v15;
}

- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 keyStore:(id)a7 dataSource:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDUser *v19;
  HMDUser *v20;
  uint64_t v21;
  HAPPairingIdentity *pairingIdentity;
  void *v23;
  uint64_t v24;
  NSUUID *uuid;
  id v26;
  const char *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *queue;
  uint64_t v31;
  HMDAccountHandle *accountHandle;
  NAFuture *v33;
  NAFuture *cloudShareIDFuture;
  objc_super v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v36.receiver = self;
  v36.super_class = (Class)HMDUser;
  v19 = -[HMDUser init](&v36, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dataSource, a8);
    objc_storeStrong((id *)&v20->_keyStore, a7);
    _userPairingIdentity(v16, a6);
    v21 = objc_claimAutoreleasedReturnValue();
    pairingIdentity = v20->_pairingIdentity;
    v20->_pairingIdentity = (HAPPairingIdentity *)v21;

    objc_msgSend(v14, "remoteDestinationString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUser UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:](HMDUser, "UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:", v23, v15, 0, v20->_pairingIdentity);
    v24 = objc_claimAutoreleasedReturnValue();
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v24;

    HMDispatchQueueNameString();
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = (const char *)objc_msgSend(v26, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create(v27, v28);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v29;

    v31 = objc_msgSend(v14, "copy");
    accountHandle = v20->_accountHandle;
    v20->_accountHandle = (HMDAccountHandle *)v31;

    v20->_privilege = a6;
    v20->_remoteAccessAllowed = 1;
    v33 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    cloudShareIDFuture = v20->_cloudShareIDFuture;
    v20->_cloudShareIDFuture = v33;

    v20->_camerasAccessLevel = HMUserDefaultCamerasAccessLevel();
    v20->_announceAccessLevel = 0;
    v20->_announceNotificationModeForCurrentDevice = 0;
    v20->_needsiTunesMultiUserRepair = 0;
    v20->_userCloudShareWithOwnerMessagingState = 0;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_pairingIdentity)
  {
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deregisterIdentity:object:", self->_pairingIdentity, self);

  }
  v4.receiver = self;
  v4.super_class = (Class)HMDUser;
  -[HMDUser dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDUser *v4;
  HMDUser *v5;
  HMDUser *v6;
  HMDUser *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDUser *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      -[HMDUser pairingIdentity](v6, "pairingIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser pairingIdentity](self, "pairingIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (BOOL)isAccountEqualWithUser:(id)a3
{
  HMDUser *v4;
  HMDUser *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  HMDUser *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  HMDUser *v18;
  __int16 v19;
  HMDUser *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (HMDUser *)a3;
  v5 = v4;
  if (v4 == self
    || (-[HMDUser pairingIdentity](v4, "pairingIdentity"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMDUser pairingIdentity](self, "pairingIdentity"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Pairing Identity do not match : [otherUser : %@] [self : %@]", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[16];

  v52[14] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser uuid](self, "uuid");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "UUIDString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"));
  v52[0] = v49;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser account](self, "account");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "senderCorrelationIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("MID"));
  v52[1] = v46;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v5, "initWithName:value:options:formatter:", CFSTR("PAID"));
  v52[2] = v44;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser accountHandle](self, "accountHandle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("HNDL"));
  v52[3] = v42;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser displayName](self, "displayName");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v8;
  v39 = (void *)objc_msgSend(v7, "initWithName:value:options:formatter:", CFSTR("DN"), v8, 0);
  v52[4] = v39;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  v10 = -[HMDUser privilege](self, "privilege");
  if (v10 > 4)
    v11 = CFSTR("None");
  else
    v11 = off_1E89BB648[v10];
  v38 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("PV"), v11);
  v52[5] = v38;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  HMFBooleanToString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("RA"), v37);
  v52[6] = v36;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("PA"), v35);
  v52[7] = v34;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser home](self, "home");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("HM"), v33);
  v52[8] = v32;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser camerasAccessLevel](self, "camerasAccessLevel");
  HMUserCameraAccessLevelAsString();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("CA"), v31);
  v52[9] = v16;
  v17 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  HMFBooleanToString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("AA"), v18);
  v52[10] = v19;
  v20 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("AL"), v21);
  v52[11] = v22;
  v23 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithName:value:", CFSTR("AAN"), v24);
  v52[12] = v25;
  v26 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("CATID"), v27);
  v52[13] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
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
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
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
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[15];

  v49[13] = *MEMORY[0x1E0C80C00];
  -[HMDUser home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUser uuid](self, "uuid");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("UUID: %@"), v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v44;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "isAccessToHomeAllowed");
  HMFBooleanToString();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Is Access Allowed: %@"), v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v42;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUser isCurrentUser](self, "isCurrentUser");
  HMFBooleanToString();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Is Current User: %@"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v40;
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUser isAdministrator](self, "isAdministrator");
  HMFBooleanToString();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Is Admin: %@"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v38;
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  HMFBooleanToString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Is Remote Access Allowed: %@"), v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v36;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("User Privilege: %lu"), -[HMDUser privilege](self, "privilege"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v35;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v34 = shouldLogPrivateInformation();
  if (v34)
  {
    -[HMDUser displayName](self, "displayName");
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("...");
  }
  v29 = (__CFString *)v10;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Display Name: %@"), v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v33;
  v11 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUser camerasAccessLevel](self, "camerasAccessLevel");
  HMUserCameraAccessLevelAsString();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Cameras Access Level: %@"), v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v31;
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Is Announce Access Allowed: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v14;
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Announce Access Level: %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v17;
  v46 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Home: %@"), v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v18;
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("AudioDropIn: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v21;
  v22 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("CATID: %@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  v47[0] = *MEMORY[0x1E0D27F80];
  objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = CFSTR("Photos Person Manager Settings");
  v48[0] = v25;
  -[HMDUser photosPersonManagerSettings](self, "photosPersonManagerSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)hasDeviceWithHomeKitVersionGreaterThanVersion:(id)a3
{
  id v4;
  HMDHomeKitVersion *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v4);
  -[HMDUser account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "version", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isGreaterThanVersion:", v5);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDUser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDUser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDUser *v20;
  HMDUser *v21;
  NSObject *queue;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v26[24];
  void *v27;
  id v28[4];

  v28[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "msgDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser setMessageDispatcher:](self, "setMessageDispatcher:", v5);

  -[HMDUser setHome:](self, "setHome:", v4);
  if (!-[HMDUser isRemoteGateway](self, "isRemoteGateway") && !isWatch())
  {
    -[HMDUser configureCloudShareTrustManager](self, "configureCloudShareTrustManager");
    -[HMDUser initializeUserSettingsWithHome:](self, "initializeUserSettingsWithHome:", v4);
  }
  -[HMDUser assistantAccessControl](self, "assistantAccessControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "configure");
  v8 = (void *)MEMORY[0x1D17BA0A0](-[HMDUser registerForMessages](self, "registerForMessages"));
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser userID](v9, "userID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser account](v9, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser isCurrentUser](v9, "isCurrentUser");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138544130;
    *(_QWORD *)&v26[4] = v11;
    *(_WORD *)&v26[12] = 2112;
    *(_QWORD *)&v26[14] = v12;
    *(_WORD *)&v26[22] = 2112;
    v27 = v13;
    LOWORD(v28[0]) = 2112;
    *(id *)((char *)v28 + 2) = v14;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring [%@] with account: %@, isCurrentUser: %@", v26, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!-[HMDUser isCurrentUser](v9, "isCurrentUser"))
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser userID](v16, "userID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543618;
      *(_QWORD *)&v26[4] = v18;
      *(_WORD *)&v26[12] = 2112;
      *(_QWORD *)&v26[14] = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Registering for account notifications & Auditing the account as [%@] is not current user.", v26, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    __registerForAccountNotifications(v16);
    v20 = v16;
    v21 = v20;
    if (v20)
    {
      queue = v20->_queue;
      *(_QWORD *)v26 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v26[8] = 3221225472;
      *(_QWORD *)&v26[16] = ____auditAccount_block_invoke;
      v27 = &unk_1E89C2730;
      v28[0] = v20;
      dispatch_async(queue, v26);

    }
  }
  -[HMDUser registerIdentity](v9, "registerIdentity");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel_handleRemovedAccessory_, CFSTR("HMDHomeAccessoryRemovedNotification"), v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser userDataController](v9, "userDataController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", v9, sel_handleUserDataControllerInitialized_, CFSTR("HMDUserDataControllerInitializedNotificationKey"), v25);

}

- (void)handleUserDataControllerInitialized:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HMDUser_handleUserDataControllerInitialized___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)privateZoneName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[HMDUser uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateZoneNameForUserUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sharedZoneName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[HMDUser uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedZoneNameForUserUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)initializeUserSettingsWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDUser *v6;
  NSObject *v7;
  void *v8;
  int *v9;
  HMDSettingsMessageHandler *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDSettingsControllerDependency *v16;
  void *v17;
  HMDSettingsControllerDependency *v18;
  HMDSettingsController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCloudShareMessenger *v26;
  void *v27;
  HMDCloudShareMessenger *v28;
  void *v29;
  OS_dispatch_queue *queue;
  void *v31;
  void *v32;
  int v33;
  HMDSettingsControllerDependency *v34;
  void *v35;
  OS_dispatch_queue *v36;
  uint64_t v37;
  void *v38;
  HMDSettingsControllerDependency *v39;
  HMDSettingsController *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v8;
    v54 = 2112;
    v55 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Initializing user settings with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
  if (-[HMDUser isCurrentUser](v6, "isCurrentUser"))
  {
    v10 = -[HMDSettingsMessageHandler initWithQueue:]([HMDSettingsMessageHandler alloc], "initWithQueue:", v6->_queue);
    -[HMDUser uuid](v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("user-data-private-"), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDUser dataSource](v6, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userDataBackingStoreControllerWithDelegate:queue:zoneName:shareMessenger:", v6, v6->_queue, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setPrivateBackingStoreController:](v6, "setPrivateBackingStoreController:", v15);

    v16 = [HMDSettingsControllerDependency alloc];
    -[HMDUser uuid](v6, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDSettingsControllerDependency initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:](v16, "initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:", v17, CFSTR("private"), v6->_queue, CFSTR("UserPrivateSettings.plist"), *MEMORY[0x1E0CB9FD0], v10, 0);

    -[HMDUser setPrivateSettingsControllerDependency:](v6, "setPrivateSettingsControllerDependency:", v18);
    v19 = -[HMDSettingsController initWithDependency:delegate:]([HMDSettingsController alloc], "initWithDependency:delegate:", v18, v6);
    -[HMDUser privateSettingsControllerDependency](v6, "privateSettingsControllerDependency");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser messageDispatcher](v6, "messageDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser privateBackingStoreController](v6, "privateBackingStoreController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configureWithHome:messageDispatcher:backingStoreController:", v4, v21, v22);

    -[HMDSettingsMessageHandler setPrivateMessageController:](v10, "setPrivateMessageController:", v19);
  }
  else
  {
    v10 = 0;
    v19 = 0;
  }
  if (-[HMDUser isRunningOnHomeOwnersDevice](v6, "isRunningOnHomeOwnersDevice")
    || -[HMDUser isCurrentUser](v6, "isCurrentUser"))
  {
    -[HMDUser uuid](v6, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("user-data-shared-"), "stringByAppendingString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = [HMDCloudShareMessenger alloc];
    -[HMDUser uuid](v6, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HMDCloudShareMessenger initWithMessageTargetUUID:workQueue:home:](v26, "initWithMessageTargetUUID:workQueue:home:", v27, v6->_queue, v4);
    -[HMDUser setShareMessenger:](v6, "setShareMessenger:", v28);

    -[HMDUser dataSource](v6, "dataSource");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    -[HMDUser shareMessenger](v6, "shareMessenger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "userDataBackingStoreControllerWithDelegate:queue:zoneName:shareMessenger:", v6, queue, v25, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setSharedBackingStoreController:](v6, "setSharedBackingStoreController:", v32);

    v33 = _os_feature_enabled_impl();
    v34 = [HMDSettingsControllerDependency alloc];
    -[HMDUser uuid](v6, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v6->_queue;
    v37 = *MEMORY[0x1E0CBA050];
    if (v33)
    {
      v51 = CFSTR("root.music.playbackInfluencesForYou");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[HMDSettingsControllerDependency initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:keyPathsToPrune:](v34, "initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:keyPathsToPrune:", v35, CFSTR("shared"), v36, CFSTR("UserSharedSettings.plist"), v37, v10, v6, v38);

    }
    else
    {
      v39 = -[HMDSettingsControllerDependency initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:keyPathsToPrune:](v34, "initWithParentUUID:logName:queue:metadataFileName:codingKey:messageHandler:migrationProvider:keyPathsToPrune:", v35, CFSTR("shared"), v36, CFSTR("UserSharedSettings.plist"), v37, v10, v6, MEMORY[0x1E0C9AA60]);
    }

    -[HMDUser setSharedSettingsControllerDependency:](v6, "setSharedSettingsControllerDependency:", v39);
    v40 = -[HMDSettingsController initWithDependency:delegate:]([HMDSettingsController alloc], "initWithDependency:delegate:", v39, v6);
    -[HMDUser sharedSettingsControllerDependency](v6, "sharedSettingsControllerDependency");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser messageDispatcher](v6, "messageDispatcher");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser sharedBackingStoreController](v6, "sharedBackingStoreController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "configureWithHome:messageDispatcher:backingStoreController:", v4, v42, v43);

    -[HMDSettingsMessageHandler setSharedMessageController:](v10, "setSharedMessageController:", v40);
    v9 = &OBJC_IVAR___HMDUnpairedHAPAccessoryPairingInformation__setupCodeProviderCompletionHandler;
  }
  else
  {
    v40 = 0;
  }
  if ((unint64_t)v40 | (unint64_t)v19)
  {
    -[HMDUser dataSource](v6, "dataSource");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *(uint64_t *)((char *)&v6->super.super.isa + v9[637]);
    -[HMDUser uuid](v6, "uuid");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v50) = -[HMDUser isCurrentUser](v6, "isCurrentUser");
    objc_msgSend(v44, "userDataControllerWithDelegate:dataSource:queue:userID:homeID:sharedSettingsController:privateSettingsController:isCurrentUser:", v6, v6, v45, v46, v47, v40, v19, v50);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setUserDataController:](v6, "setUserDataController:", v48);

    -[HMDUser userDataController](v6, "userDataController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "configure");

  }
}

- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState
{
  void *v2;
  int64_t v3;

  -[HMDUser userDataController](self, "userDataController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharedUserSettingsLogEventBackingStoreControllerRunState");

  return v3;
}

- (int64_t)userCloudShareWithOwnerMessagingState
{
  os_unfair_lock_s *p_lock;
  int64_t userCloudShareWithOwnerMessagingState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  userCloudShareWithOwnerMessagingState = self->_userCloudShareWithOwnerMessagingState;
  os_unfair_lock_unlock(p_lock);
  return userCloudShareWithOwnerMessagingState;
}

- (void)setUserCloudShareWithOwnerMessagingState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_userCloudShareWithOwnerMessagingState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleCloudShareWithOwnerMessageError
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_userCloudShareWithOwnerMessagingState)
    self->_userCloudShareWithOwnerMessagingState = 2;
  os_unfair_lock_unlock(p_lock);
}

- (void)recoverUserCloudDataDueToUUIDChangeFromOldUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDUser_recoverUserCloudDataDueToUUIDChangeFromOldUUID___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_recoverUserSettingsDueToUUIDChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDUser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDUser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUser *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDUser home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser privateBackingStoreController](self, "privateBackingStoreController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_11;
  }
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Clearing participants from old user settings backingstores", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDUser sharedBackingStoreController](v7, "sharedBackingStoreController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearParticipants");

  }
  -[HMDUser setUserDataController:](self, "setUserDataController:", 0);
  -[HMDUser setSharedBackingStoreController:](self, "setSharedBackingStoreController:", 0);
  v11 = (void *)MEMORY[0x1D17BA0A0](-[HMDUser setPrivateBackingStoreController:](self, "setPrivateBackingStoreController:", 0));
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Initializing new user settings backingstores", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDUser initializeUserSettingsWithHome:](v12, "initializeUserSettingsWithHome:", v3);
LABEL_11:
  if (!-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    objc_msgSend(v3, "currentUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v19;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating participants in current users shared settings backingstore: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v15, "updateSharedBackingStoreControllerParticipants");

  }
}

- (void)updateSharedBackingStoreControllerParticipants
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HMDUser_updateSharedBackingStoreControllerParticipants__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_recoverTrustManagerDueToUUIDChange
{
  void *v3;
  void *v4;
  HMDUser *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDUser cloudShareTrustManager](self, "cloudShareTrustManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0](-[HMDUser setCloudShareTrustManager:](self, "setCloudShareTrustManager:", 0));
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Configure new trust manager", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDUser configureCloudShareTrustManager](v5, "configureCloudShareTrustManager");
  }
}

- (void)unconfigure
{
  void *v3;
  id v4;

  -[HMDUser deregisterForMessages](self, "deregisterForMessages");
  -[HMDUser shareMessenger](self, "shareMessenger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unconfigure");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)registerForMessages
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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[HMDUser messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB9FB0];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v6, sel__handlePairingIdentityRequest_);

  v7 = *MEMORY[0x1E0CB9F40];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v7, self, v9, sel__handleLegacyPairingIdentityRequest_);

  v10 = *MEMORY[0x1E0CBA020];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v10, self, v12, sel__handleShareLookupInfoRequest_);

  v13 = *MEMORY[0x1E0CB9FF0];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v13, self, v15, sel__handleMultiUserSharePayloadRequest_);

  v16 = *MEMORY[0x1E0CBA030];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v16, self, v18, sel__handleShareClientRepairRequest_);

  v19 = *MEMORY[0x1E0CB9F98];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v19, self, v21, sel__handleNeedsiTunesMultiUserRepair_);

  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    v22 = *MEMORY[0x1E0CB9EB0];
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v22, self, v24, sel__handleAnnounceSettingsUpdate_);

  }
}

- (void)deregisterForMessages
{
  void *v3;
  HMDUser *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deregistering user", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDUser messageDispatcher](v4, "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deregisterReceiver:", v4);

}

- (unint64_t)allowedRemoteEventAccessUserTypes
{
  unint64_t v2;

  v2 = -[HMDUser privilege](self, "privilege");
  if (v2 > 4)
    return 0;
  else
    return qword_1CDB8F8C0[v2];
}

- (HMDHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMDHome *)WeakRetained;
}

- (void)setHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)_compatiblePrivilege
{
  unint64_t v3;

  v3 = -[HMDUser privilege](self, "privilege");
  if (v3 >= 5)
    return -[HMDUser privilege](self, "privilege");
  else
    return qword_1CDB8F8E8[v3];
}

- (BOOL)isAdministrator
{
  return -[HMDUser privilege](self, "privilege") == 3 || -[HMDUser privilege](self, "privilege") == 4;
}

- (BOOL)isPending
{
  return -[HMDUser privilege](self, "privilege") == 2;
}

- (void)setPrivilege:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t privilege;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  privilege = self->_privilege;
  if (privilege == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_privilege = a3;
    os_unfair_lock_unlock(p_lock);
    v10[0] = CFSTR("kUserUUIDKey");
    -[HMDUser uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("HMDUserPreviousPrivilegeKey");
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", privilege);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    logAndPostNotification(CFSTR("HMDUserPrivilegeDidChangeNotification"), self, v9);
  }
}

- (BOOL)updateAdministrator:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (-[HMDUser privilege](self, "privilege") && -[HMDUser privilege](self, "privilege") != 4)
    return 0;
  if (v3)
    v5 = 4;
  else
    v5 = 0;
  -[HMDUser setPrivilege:](self, "setPrivilege:", v5);
  return 1;
}

- (BOOL)isCurrentUser
{
  HMDUser *v2;
  void *v3;

  v2 = self;
  -[HMDUser dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isCurrentUser:", v2);

  return (char)v2;
}

- (id)accountHandle
{
  os_unfair_lock_s *p_lock;
  HMDAccountHandle *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accountHandle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccountHandle:(id)a3
{
  id v4;
  HMDAccountHandle *v5;
  HMDAccountHandle *accountHandle;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = (HMDAccountHandle *)objc_msgSend(v4, "copy");
    accountHandle = self->_accountHandle;
    self->_accountHandle = v5;

    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__HMDUser_setAccountHandle___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (HMDAccountIdentifier)accountIdentifier
{
  os_unfair_lock_s *p_lock;
  HMDAccountIdentifier *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accountIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4;
  HMDAccountIdentifier *v5;
  HMDAccountIdentifier *accountIdentifier;
  NSObject *queue;
  _QWORD v8[4];
  id v9;
  HMDUser *v10;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = (HMDAccountIdentifier *)objc_msgSend(v4, "copy");
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v5;

    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__HMDUser_setAccountIdentifier___block_invoke;
    v8[3] = &unk_1E89C2328;
    v9 = v4;
    v10 = self;
    dispatch_async(queue, v8);

  }
}

- (id)spiClientIdentifier
{
  return spiClientIdentifierForUUID(self->_uuid);
}

- (HAPPairingIdentity)pairingIdentity
{
  os_unfair_lock_s *p_lock;
  HAPPairingIdentity *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_pairingIdentity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPairingIdentity:(id)a3
{
  HAPPairingIdentity *v4;
  HAPPairingIdentity *pairingIdentity;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  _userPairingIdentity(v6, self->_privilege);
  v4 = (HAPPairingIdentity *)objc_claimAutoreleasedReturnValue();
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)registerIdentity
{
  void *v3;
  void *v4;
  id v5;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDUser account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v3)
  {
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerIdentity:account:object:", v5, v3, self);

  }
}

- (void)deregisterIdentity
{
  void *v3;
  id v4;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deregisterIdentity:object:", v4, self);

  }
}

- (BOOL)matchingPairingIdentityIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (void)_handlePairingIdentityRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDUser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kUserUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) != 0)
  {
    -[HMDUser fetchPairingIdentityForClientWithMessage:](self, "fetchPairingIdentityForClientWithMessage:", v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);

  }
}

- (void)fetchPairingIdentityForClientWithMessage:(id)a3
{
  id v4;
  void *v5;
  HMDUser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDUser *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  HMDUser *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDUser *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDUser *v37;
  NSObject *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve pairing identity for user", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUser pairingIdentity](v6, "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_msgSend(v4, "entitlements") & 0x10) != 0 && -[HMDUser isCurrentUser](v6, "isCurrentUser"))
    {
      -[HMDUser keyStore](v6, "keyStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v10, "getLocalPairingIdentity:", &v40);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v40;

      if (!v11)
      {
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = v6;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v39;
          v45 = 2112;
          v46 = v12;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to lookup our local pairing identity with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Local pairing identity was not found"), 0, 0, v12);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v24);
        goto LABEL_25;
      }
      objc_msgSend(v11, "privateKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0D28650]);
      objc_msgSend(v9, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "publicKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "initWithIdentifier:publicKey:privateKey:", v15, v16, v13);

      v12 = (id)v17;
    }
    else
    {
      objc_msgSend(v9, "publicPairingIdentity");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v21)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v22;
        v45 = 2112;
        v46 = v12;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Found pairing identity for user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      encodeRootObject();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
      {
        v41 = *MEMORY[0x1E0CB9FA8];
        v42 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithPayload:", v25);
      }
      else
      {
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        v33 = v19;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v35;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identity.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v25);
      }

LABEL_25:
      goto LABEL_26;
    }
    if (v21)
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v31;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Unable to retrieve pairing identity for user.", buf, 0xCu);

    }
    v30 = v18;
  }
  else
  {
    v26 = MEMORY[0x1D17BA0A0]();
    v27 = v6;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find the pairing identity for the user", buf, 0xCu);

    }
    v30 = (void *)v26;
  }
  objc_autoreleasePoolPop(v30);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v12);
LABEL_26:

}

- (void)_handleLegacyPairingIdentityRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  HMDUser *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HMDUser *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDUser *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kUserUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v28;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v8 = -[HMDUser isCurrentUser](self, "isCurrentUser");
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v30;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity for not current user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2014);
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v15 = (void *)v29;
    objc_msgSend(v4, "respondWithError:", v29);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve all pairing identities for the current user", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDUser keyStore](v10, "keyStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allAccessoryPairingKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v4, "entitlements");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __47__HMDUser__handleLegacyPairingIdentityRequest___block_invoke;
  v32[3] = &__block_descriptor_40_e28__16__0__HAPPairingIdentity_8l;
  v32[4] = v16;
  objc_msgSend(v15, "na_map:", v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = v10;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v23;
      v37 = 2112;
      v38 = v17;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Sending legacy identities : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v33 = *MEMORY[0x1E0CB9FA8];
    v34 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v24);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v31;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identities.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v24);
  }

LABEL_20:
}

- (void)_handleShareLookupInfoRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  HMDUser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  HMDUser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDUser *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kUserUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) != 0)
  {
    -[HMDUser accountHandle](self, "accountHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDUser accountHandle](self, "accountHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudKitLookupInfo");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(v4, "responseHandler");
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v4, "responseHandler");
          v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Can't create lookup info"), CFSTR("Unable to convert account handle to lookup info"), 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v31, 0);

          v10 = 0;
        }
        goto LABEL_19;
      }
      encodeRootObject();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *MEMORY[0x1E0CBA018];
      v33 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v16;
        v36 = 2112;
        v37 = v10;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Obtained share lookup: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v4, "responseHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v4, "responseHandler");
        v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v18)[2](v18, 0, v12);

      }
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v28;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Do not have account handle: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(v4, "responseHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "responseHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("No account handle"), CFSTR("User has no account handle"), 0);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v4, "responseHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "responseHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v11 = (void *)v24;
      v10[2](v10, v24, 0);
      goto LABEL_18;
    }
  }
LABEL_20:

}

- (void)_handleMultiUserSharePayloadRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUser *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  HMDUser *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  HMDUser *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDUser *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMDUser *v47;
  NSObject *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  void *v51;
  HMDUser *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  const __CFString *v58;
  void *v59;
  HMDUser *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  HMDUser *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  HMDUser *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[4];
  id v79;
  HMDUser *v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CBA038]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) != 0)
  {
    if (-[HMDUser isOwner](self, "isOwner"))
    {
      objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CBA000]);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = self;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v82 = v45;
          v83 = 2112;
          v84 = v4;
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user in message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v42);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Unable to find from user in message payload"), CFSTR("Need valid from user in message payload"), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v10);
        v9 = 0;
        goto LABEL_43;
      }
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
      -[HMDUser home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "users");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_firstObjectWithUUID:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v46 = (void *)MEMORY[0x1D17BA0A0]();
        v47 = self;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v82 = v49;
          v83 = 2112;
          v84 = v9;
          v85 = 2112;
          v86 = v10;
          v87 = 2112;
          v88 = v11;
          _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user with uuid: %@ home: %@ users: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v46);
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = CFSTR("Unable to find from user in home");
        v27 = CFSTR("Need valid from user");
        v28 = 2;
LABEL_29:
        objc_msgSend(v25, "hmErrorWithCode:description:reason:suggestion:", v28, v26, v27, 0);
        v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v50);
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      objc_msgSend(v10, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CBA008]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v4, "dataForKey:", *MEMORY[0x1E0CBA048]);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v4, "dataForKey:", *MEMORY[0x1E0CBA040]);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB9FF8]);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              if ((objc_msgSend(v12, "isCurrentUser") & 1) != 0)
              {
                if (-[HMDUser userCloudShareWithOwnerMessagingState](self, "userCloudShareWithOwnerMessagingState") != 2)
                {
                  objc_msgSend(v4, "messagePayload");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v78[0] = MEMORY[0x1E0C809B0];
                  v78[1] = 3221225472;
                  v78[2] = __47__HMDUser__handleMultiUserSharePayloadRequest___block_invoke;
                  v78[3] = &unk_1E89BB370;
                  v79 = v4;
                  v80 = self;
                  -[HMDUser _sendSecureShareClientPayloadToMostEligibleDevice:completion:](self, "_sendSecureShareClientPayloadToMostEligibleDevice:completion:", v71, v78);

                  v72 = (void *)MEMORY[0x1D17BA0A0]();
                  v73 = self;
                  HMFGetOSLogHandle();
                  v74 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDUser accountHandle](v73, "accountHandle");
                    v77 = v72;
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v82 = v75;
                    v83 = 2112;
                    v84 = v76;
                    _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_INFO, "%{public}@Received request to send client payload to user : %@", buf, 0x16u);

                    v72 = v77;
                  }

                  objc_autoreleasePoolPop(v72);
                  goto LABEL_42;
                }
                v21 = (void *)MEMORY[0x1D17BA0A0]();
                v22 = self;
                HMFGetOSLogHandle();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v82 = v24;
                  _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending cloud share with owner message was blocked.", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v21);
                v25 = (void *)MEMORY[0x1E0CB35C8];
                v26 = CFSTR("Unable to send the message");
                v27 = CFSTR("Sending cloud share with owner message was blocked.");
                v28 = 52;
                goto LABEL_29;
              }
              v66 = (void *)MEMORY[0x1D17BA0A0]();
              v67 = self;
              HMFGetOSLogHandle();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v82 = v69;
                v83 = 2112;
                v84 = v12;
                v85 = 2112;
                v86 = v4;
                _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_ERROR, "%{public}@From user %@ is not current user for message: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v66);
              objc_msgSend(v4, "responseHandler");
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v70)
                goto LABEL_42;
              objc_msgSend(v4, "responseHandler");
              v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
              v64 = objc_claimAutoreleasedReturnValue();
LABEL_40:
              v65 = (void *)v64;
              v50[2](v50, v64, 0);

              goto LABEL_41;
            }
          }
          else
          {

          }
        }
        v59 = (void *)MEMORY[0x1D17BA0A0]();
        v60 = self;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v82 = v62;
          _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_ERROR, "%{public}@Payload did not have required fields.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v59);
        objc_msgSend(v4, "responseHandler");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v63)
          goto LABEL_42;
        objc_msgSend(v4, "responseHandler");
        v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0CB35C8];
        v57 = CFSTR("Unable to determine required arguments");
        v58 = CFSTR("Missing either URL, token or container ID");
      }
      else
      {
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v52 = self;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v82 = v54;
          _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v51);
        objc_msgSend(v4, "responseHandler");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
          goto LABEL_42;
        objc_msgSend(v4, "responseHandler");
        v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0CB35C8];
        v57 = CFSTR("Home not valid");
        v58 = CFSTR("Missing home or invalid home");
      }
      objc_msgSend(v56, "hmErrorWithCode:description:reason:suggestion:", 3, v57, v58, 0);
      v64 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    v37 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v40;
      v83 = 2112;
      v84 = v4;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to owner: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(v4, "responseHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v4, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = CFSTR("To user is not owner");
      v36 = CFSTR("Can currently only share to owner");
      goto LABEL_22;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v32;
      v83 = 2112;
      v84 = v4;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(v4, "responseHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v4, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = CFSTR("Unable to find to user in payload");
      v36 = CFSTR("Need validated to user in payload");
LABEL_22:
      objc_msgSend(v34, "hmErrorWithCode:description:reason:suggestion:", 3, v35, v36, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v10, 0);
LABEL_43:

    }
  }

}

- (void)_sendSecureShareClientPayloadToMostEligibleDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDHomeKitVersion *v8;
  uint64_t v9;
  void *v10;
  char v11;
  __CFString **v12;
  void *v13;
  int v14;
  HMDHomeKitVersion *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUser *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("6.2"));
  v9 = *MEMORY[0x1E0CB9FF8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB9FF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.applemediaservices.multiuser"));

  if ((v11 & 1) != 0)
  {
    v12 = HMDHomeKitVersion6_1String;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mediaservicesbroker.container"));

    if (!v14)
      goto LABEL_6;
    v12 = HMDHomeKitVersion7_0String;
  }
  v15 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", *v12);

  v8 = v15;
LABEL_6:
  v35 = CFSTR("kRequiredCapabilitiesKey");
  v33[0] = CFSTR("kHomedSupportedFeaturesKey");
  v33[1] = CFSTR("kHomedVersionKey");
  v34[0] = &unk_1E8B32238;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHomeKitVersion versionString](v8, "versionString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v24;
    v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending user share message with device capabilites %@.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  objc_initWeak((id *)buf, v22);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __72__HMDUser__sendSecureShareClientPayloadToMostEligibleDevice_completion___block_invoke;
  v26[3] = &unk_1E89C1B70;
  objc_copyWeak(&v28, (id *)buf);
  v25 = v7;
  v27 = v25;
  -[HMDUser _sendAccountMessage:payload:deviceCapabilities:multicast:preferPrimary:completion:](v22, "_sendAccountMessage:payload:deviceCapabilities:multicast:preferPrimary:completion:", CFSTR("HMDUCM.rsr"), v6, v20, 0, 0, v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

- (void)_sendAccountMessage:(id)a3 payload:(id)a4 deviceCapabilities:(id)a5 multicast:(BOOL)a6 preferPrimary:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  void (**v15)(id, void *, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDRemoteDeviceMessageDestination *v21;
  HMDRemoteMessage *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDUser *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v9 = a7;
  v10 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v31 = a4;
  v30 = a5;
  v15 = (void (**)(id, void *, _QWORD))a8;
  -[HMDUser home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser accountHandle](self, "accountHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryResident");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageTargetUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v19)
  {
    v21 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:]([HMDRemoteDeviceMessageDestination alloc], "initWithTarget:device:", v20, v19);
    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v14, 17, v21, v31);
    v22 = (HMDRemoteMessage *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v23 = v22;

    objc_msgSend(v23, "setResponseHandler:", v15);
    -[HMDUser messageDispatcher](self, "messageDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendMessage:", v23);

    goto LABEL_7;
  }
  if (v17)
  {
    v21 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:deviceCapabilities:]([HMDRemoteAccountMessageDestination alloc], "initWithTarget:handle:multicast:deviceCapabilities:", v20, v17, v10, v30);
    v22 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", v14, 17, v21, v31, 0, 1, 180.0);
    goto LABEL_6;
  }
  v25 = (void *)MEMORY[0x1D17BA0A0]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = v25;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v28;
    v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot send account message named %@ because account handle is nil and either preferring primary is NO or no primary resident exists", buf, 0x16u);

    v25 = v29;
  }

  objc_autoreleasePoolPop(v25);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, v23, 0);
LABEL_7:

}

- (void)_handleShareClientRepairRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDUser *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDUser *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDUser *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDUser *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDUser *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HMDUser *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  HMDHomeKitVersion *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _QWORD v60[2];
  _QWORD v61[2];
  const __CFString *v62;
  void *v63;
  _QWORD v64[3];
  _QWORD v65[3];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CBA038]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) != 0)
  {
    -[HMDUser home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isOwner");

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v8, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0CBA008];
      objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CBA008]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
        v15 = *MEMORY[0x1E0CBA028];
        objc_msgSend(v4, "dataForKey:", *MEMORY[0x1E0CBA028]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)MEMORY[0x1E0CB3710];
          v18 = objc_opt_class();
          objc_msgSend(v4, "dataForKey:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0;
          objc_msgSend(v17, "unarchivedObjectOfClass:fromData:error:", v18, v19, &v59);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v59;

          if (v55)
          {
            v64[0] = v15;
            encodeRootObject();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v65[0] = v21;
            v64[1] = *MEMORY[0x1E0CB9FF8];
            objc_msgSend(v4, "stringForKey:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v65[1] = v22;
            v64[2] = v12;
            objc_msgSend(v4, "stringForKey:", v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v65[2] = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            v54 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("7.0"));
            v62 = CFSTR("kRequiredCapabilitiesKey");
            v60[0] = CFSTR("kHomedSupportedFeaturesKey");
            v60[1] = CFSTR("kHomedVersionKey");
            v61[0] = &unk_1E8B32250;
            v24 = (void *)MEMORY[0x1E0CB37E8];
            -[HMDHomeKitVersion versionString](v54, "versionString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            objc_msgSend(v24, "numberWithDouble:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v61[1] = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v27;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = (void *)MEMORY[0x1D17BA0A0]();
            v30 = self;
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v67 = v32;
              v68 = 2112;
              v69 = v28;
              _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Sending user share repair message with device capabilites %@.", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v29);
            objc_initWeak((id *)buf, v30);
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __43__HMDUser__handleShareClientRepairRequest___block_invoke;
            v56[3] = &unk_1E89BF4F0;
            objc_copyWeak(&v58, (id *)buf);
            v57 = v4;
            -[HMDUser _sendAccountMessage:payload:deviceCapabilities:multicast:preferPrimary:completion:](v30, "_sendAccountMessage:payload:deviceCapabilities:multicast:preferPrimary:completion:", CFSTR("HMDUCM.rRepr"), v53, v28, 1, 0, v56);

            objc_destroyWeak(&v58);
            objc_destroyWeak((id *)buf);

          }
          else
          {
            if (!v20)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to decode repair info"), CFSTR("Corrupted repair payload"), 0);
              v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v49 = (void *)MEMORY[0x1D17BA0A0]();
            v50 = self;
            HMFGetOSLogHandle();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v67 = v52;
              v68 = 2112;
              v69 = v20;
              _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unable to decoderepairInfo. %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v49);
            objc_msgSend(v4, "respondWithError:", v20);
          }

        }
        else
        {
          v45 = (void *)MEMORY[0x1D17BA0A0]();
          v46 = self;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v67 = v48;
            _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@Payload does not have repair info.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v45);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to determine required arguments"), CFSTR("Missing repair payload"), 0);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v20);
        }
      }
      else
      {
        v41 = (void *)MEMORY[0x1D17BA0A0]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v67 = v44;
          _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v41);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Home not valid"), CFSTR("Missing home or invalid home"), 0);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v20);
      }
    }
    else
    {
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v40;
        v68 = 2112;
        v69 = v4;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message from owner: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("From user is not owner"), CFSTR("Can currently only repair from home owner"), 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v20);
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v36;
      v68 = 2112;
      v69 = v4;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send repair request to mismatched user from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to find to user in payload"), CFSTR("Need validated to user in payload"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
  }

}

- (void)_handleNeedsiTunesMultiUserRepair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMDUser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDUser *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9F90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "BOOLValue");
      if ((_DWORD)v7 != -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"))
      {
        -[HMDUser home](self, "home");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v12;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting needs iTunes multi-user repair %@.", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        -[HMDUser setNeedsiTunesMultiUserRepair:](v10, "setNeedsiTunesMultiUserRepair:", v7);
        objc_msgSend(v8, "saveToCurrentAccountWithReason:", CFSTR("Needs iTunes Multi-User Repair Updated"));
        objc_msgSend(v8, "homeManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser uuid](v10, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Needs iTunes Multi-User Repair Updated"), v15, 1);

      }
      objc_msgSend(v4, "respondWithSuccess");
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing value to set iTunes Multi User Repair: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Need a value"), CFSTR("Need a value"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v24);

      v6 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to current user: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("User is not current user"), CFSTR("Can only set on current user"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (id)account
{
  void *v3;
  void *v4;
  void *v5;

  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser accountHandle](self, "accountHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "accountForHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresMakoSupport
{
  void *v2;
  BOOL v3;

  -[HMDUser accountHandle](self, "accountHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 2;

  return v3;
}

- (void)__handleAddedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  HMDUser *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDUser *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser accountHandle](self, "accountHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v9, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v5);

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v15;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was added: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      __registerForAccountNotifications(v13);
      __updateWithAccount(v13, v9);
      __handleUpdatedAccount(v13);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Account handle does not exist", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)__handleRemovedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  HMDUser *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser accountHandle](self, "accountHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v9, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v5);

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v15;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was removed: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      __registerForAccountNotifications(v13);
      __handleUpdatedAccount(v13);
    }

  }
}

- (void)setPresenceAuthStatus:(id)a3
{
  HMUserPresenceAuthorization *v4;
  HMUserPresenceAuthorization *presenceAuthStatus;

  v4 = (HMUserPresenceAuthorization *)a3;
  os_unfair_lock_lock_with_options();
  presenceAuthStatus = self->_presenceAuthStatus;
  self->_presenceAuthStatus = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  os_unfair_lock_s *p_lock;
  HMUserPresenceAuthorization *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_presenceAuthStatus;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)displayName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;
  NSString *v5;
  NSString *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_displayName;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[HMDUser userID](self, "userID");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setDisplayName:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSString **p_displayName;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_displayName = &self->_displayName;
  if ((HMFEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_displayName, a3);
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)refreshDisplayName
{
  void *v3;
  void *v4;
  char v5;

  -[HMDUser displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __displayNameForUser(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMFEqualObjects();
  if ((v5 & 1) == 0)
    -[HMDUser setDisplayName:](self, "setDisplayName:", v4);

  return v5 ^ 1;
}

- (void)setRemoteAccessAllowed:(BOOL)a3
{
  if (-[HMDUser _setRemoteAccessAllowed:](self, "_setRemoteAccessAllowed:", a3))
    logAndPostNotification(CFSTR("HMDUserRemoteAccessDidChangeNotification"), self, 0);
}

- (BOOL)_setRemoteAccessAllowed:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int remoteAccessAllowed;
  BOOL v7;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  remoteAccessAllowed = self->_remoteAccessAllowed;
  if (remoteAccessAllowed != v3)
    self->_remoteAccessAllowed = v3;
  v7 = remoteAccessAllowed != v3;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (unint64_t)camerasAccessLevel
{
  os_unfair_lock_s *p_lock;
  unint64_t camerasAccessLevel;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  camerasAccessLevel = self->_camerasAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return camerasAccessLevel;
}

- (void)setCamerasAccessLevel:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_camerasAccessLevel == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_camerasAccessLevel = a3;
    os_unfair_lock_unlock(p_lock);
    logAndPostNotification(CFSTR("HMDUserCamerasAccessLevelDidChangeNotification"), self, 0);
  }
}

- (BOOL)isAnnounceAccessAllowed
{
  unint64_t v3;

  v3 = -[HMDUser announceAccessLevel](self, "announceAccessLevel");
  if (!v3)
    v3 = -[HMDUser defaultAnnounceUserAccessLevel](self, "defaultAnnounceUserAccessLevel");
  return v3 == 2;
}

- (unint64_t)defaultAnnounceUserAccessLevel
{
  if (-[HMDUser isOwner](self, "isOwner"))
    return 2;
  else
    return 1;
}

- (void)setAnnounceAccessLevel:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_announceAccessLevel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)announceAccessLevel
{
  os_unfair_lock_s *p_lock;
  unint64_t announceAccessLevel;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  announceAccessLevel = self->_announceAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return announceAccessLevel;
}

- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_audioAnalysisUserDropInAccessLevel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)audioAnalysisUserDropInAccessLevel
{
  os_unfair_lock_s *p_lock;
  unint64_t audioAnalysisUserDropInAccessLevel;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  audioAnalysisUserDropInAccessLevel = self->_audioAnalysisUserDropInAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return audioAnalysisUserDropInAccessLevel;
}

- (BOOL)isRemoteGateway
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSUUID)assistantAccessControlModelUUID
{
  void *v2;
  void *v3;

  -[HMDUser assistantAccessControl](self, "assistantAccessControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (HMDAssistantAccessControl)assistantAccessControl
{
  os_unfair_lock_s *p_lock;
  HMDAssistantAccessControl *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_assistantAccessControl;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssistantAccessControl:(id)a3
{
  HMDAssistantAccessControl *v4;
  HMDAssistantAccessControl *assistantAccessControl;

  v4 = (HMDAssistantAccessControl *)a3;
  os_unfair_lock_lock_with_options();
  assistantAccessControl = self->_assistantAccessControl;
  self->_assistantAccessControl = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isCurrentUserAndOwner
{
  void *v4;
  HMDUser *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  HMDUser *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    if (-[HMDUser isOwner](self, "isOwner"))
      return 1;
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      v8 = "%{public}@Only owners may modify assistant access controls";
      goto LABEL_8;
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      v8 = "%{public}@Can only update current user's assistant access controls";
LABEL_8:
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v4);
  return 0;
}

- (void)handleAssistantAccessControlUpdate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HMDUser_handleAssistantAccessControlUpdate___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_handleAssistantAccessControlUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDUser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDUser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDUser *v28;
  NSObject *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  HMDUser *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  HMDUser *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void (**v56)(_QWORD, _QWORD, _QWORD);
  void *v57;
  HMDUser *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  HMDUser *v62;
  NSObject *v63;
  void *v64;
  HMDAssistantAccessControl *v65;
  uint64_t v66;
  void *v67;
  HMDUser *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  HMDUser *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void (**v76)(_QWORD, _QWORD, _QWORD);
  void *v77;
  void *v78;
  void *v79;
  HMDUser *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void (**v84)(_QWORD, _QWORD, _QWORD);
  void *v85;
  char v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  _QWORD aBlock[4];
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  id v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if ((v9 & 1) != 0)
    {
      -[HMDUser assistantAccessControl](self, "assistantAccessControl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      v98 = 0;
      +[HMDAssistantAccessControl accessControlWithMessage:user:currentAccessories:error:](HMDAssistantAccessControl, "accessControlWithMessage:user:currentAccessories:error:", v4, self, v12, &v98);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v98;

      if (!v13)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v101 = v26;
          v102 = 2112;
          v103 = v4;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to create access control from message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(v4, "respondWithError:", v14);
        v13 = 0;
        goto LABEL_60;
      }
      if (!-[HMDUser isCurrentUser](self, "isCurrentUser"))
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v101 = v30;
          v102 = 2112;
          v103 = v4;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Can only modify own access control: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v31);
        goto LABEL_59;
      }
      if (!-[HMDUser isOwner](self, "isOwner"))
      {
        v87 = v10;
        v90 = v14;
        v32 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v13, "accessories");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        objc_msgSend(v13, "accessories");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v95;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v95 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "uuid");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v40);

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
          }
          while (v37);
        }

        v41 = (void *)MEMORY[0x1D17BA0A0]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v101 = v44;
          v102 = 2112;
          v103 = v13;
          _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Updating shared user assistant access control to: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v41);
        v45 = objc_msgSend(v13, "areActivityNotificationsEnabledForPersonalRequests");
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke;
        aBlock[3] = &unk_1E89C2350;
        v46 = v4;
        v93 = v46;
        v47 = _Block_copy(aBlock);
        -[HMDUser userDataController](v42, "userDataController");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v87;
        if (v48)
        {
          v49 = (objc_msgSend(v13, "options") & 1) == 0;
          -[HMDUser userDataController](v42, "userDataController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "handleAssistantAccessControlAccessoryUUIDsUpdated:requireAuthenticationForSecureRequests:activityNotificationsEnabledForPersonalRequests:completion:", v34, v49, v45, v47);
        }
        else
        {
          v57 = (void *)MEMORY[0x1D17BA0A0]();
          v58 = v42;
          HMFGetOSLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v85 = v57;
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v101 = v60;
            _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

            v57 = v85;
          }

          objc_autoreleasePoolPop(v57);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:description:underlyingError:", 9005, CFSTR("User data controller not found. No settings for this user."), 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "respondWithError:", v50);
        }

        v14 = v90;
        goto LABEL_60;
      }
      if (!v10)
      {
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v52 = self;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v54;
          _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_INFO, "%{public}@Cannot update without an existing access control", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v51);
        objc_msgSend(v4, "responseHandler");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
          goto LABEL_60;
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 9004);
        v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v56 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v56[2](v56, v31, 0);
        goto LABEL_58;
      }
      objc_msgSend(v13, "setOptions:", objc_msgSend(v10, "options") | objc_msgSend(v13, "options") | 1);
      if (isInternalBuild())
      {
        objc_msgSend(v13, "accessories");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          -[HMDUser assistantAccessControl](self, "assistantAccessControl");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accessories");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "count"))
          {
            v89 = v14;
            -[HMDUser assistantAccessControl](self, "assistantAccessControl");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v18, "isEnabled");

            if ((v86 & 1) != 0)
            {
              v14 = v89;
              goto LABEL_45;
            }
            objc_msgSend(v13, "user");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = (void *)MEMORY[0x1D17BA0A0]();
            v62 = self;
            HMFGetOSLogHandle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v88 = v61;
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v101 = v64;
              v102 = 2112;
              v103 = v15;
              _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_INFO, "%{public}@Enabling assistant access controls for internal user: %@", buf, 0x16u);

              v61 = v88;
            }

            objc_autoreleasePoolPop(v61);
            v65 = [HMDAssistantAccessControl alloc];
            objc_msgSend(v13, "accessories");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = -[HMDAssistantAccessControl initWithUser:appleAccessories:enabled:](v65, "initWithUser:appleAccessories:enabled:", v15, v16, 1);
            v17 = v13;
            v13 = (void *)v66;
            v14 = v89;
          }

        }
      }
LABEL_45:
      v67 = (void *)MEMORY[0x1D17BA0A0]();
      v68 = self;
      HMFGetOSLogHandle();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v70;
        v102 = 2112;
        v103 = v13;
        _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@Updating owner user assistant access control to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v67);
      if (HMFEqualObjects())
      {
        v71 = (void *)MEMORY[0x1D17BA0A0]();
        v72 = v68;
        HMFGetOSLogHandle();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v74;
          _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@Updated access control resulted in no change", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v71);
        objc_msgSend(v4, "responseHandler");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v75)
          goto LABEL_60;
        objc_msgSend(v4, "responseHandler");
        v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v31[2](v31, 0, 0);
LABEL_59:

LABEL_60:
        goto LABEL_61;
      }
      objc_msgSend(v13, "model");
      v76 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v31 = v76;
      if (v76)
      {
        objc_msgSend(v76, "setObjectChangeType:", 2);
        objc_msgSend(v6, "backingStore");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "transaction:options:", CFSTR("Update Assistant Access Control"), v78);
        v56 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "add:withMessage:", v31, v4);
        objc_msgSend(v56, "run");
      }
      else
      {
        v79 = (void *)MEMORY[0x1D17BA0A0]();
        v80 = v68;
        HMFGetOSLogHandle();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v91 = v79;
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v82;
          _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_ERROR, "%{public}@Failed to create transaction", buf, 0xCu);

          v79 = v91;
        }

        objc_autoreleasePoolPop(v79);
        objc_msgSend(v4, "responseHandler");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v83)
          goto LABEL_59;
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v56 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v84 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v84[2](v84, v56, 0);

      }
LABEL_58:

      goto LABEL_59;
    }
  }
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v101 = v22;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Not processing assistant access control update message as not part of homeManager homes.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
LABEL_61:

}

- (void)handleMediaContentProfileAccessControlUpdate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDUser_handleMediaContentProfileAccessControlUpdate___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_handleMediaContentProfileAccessControlUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDUser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDUser *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDUser *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  HMDUser *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  _QWORD aBlock[4];
  void (**v44)(_QWORD, _QWORD, _QWORD);
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if ((v9 & 1) != 0)
    {
      if (!-[HMDUser isCurrentUser](self, "isCurrentUser"))
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v30;
          v52 = 2112;
          v53 = v4;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Can only modify own Media Profile Content control: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v11);
        goto LABEL_30;
      }
      objc_msgSend(v4, "arrayForKey:", *MEMORY[0x1E0CB9F80]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v42 = v11;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v46 != v16)
                objc_enumerationMutation(v13);
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
              objc_msgSend(v12, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__HMDUser__handleMediaContentProfileAccessControlUpdate___block_invoke;
        aBlock[3] = &unk_1E89C2350;
        v19 = v4;
        v44 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
        v20 = _Block_copy(aBlock);
        -[HMDUser userDataController](self, "userDataController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[HMDUser userDataController](self, "userDataController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:completion:", v12, v20);
        }
        else
        {
          v38 = (void *)MEMORY[0x1D17BA0A0]();
          v39 = self;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v51 = v41;
            _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v38);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("User data controller not found"), CFSTR("No settings for this user"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "respondWithError:", v22);
        }

        v37 = v44;
        v11 = v42;
      }
      else
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v34;
          v52 = 2112;
          v53 = v35;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Missing access control accessories in message payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Missing access control accessories"), CFSTR("Need access control accessories in message"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v36)
          goto LABEL_29;
        objc_msgSend(v4, "responseHandler");
        v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v37)[2](v37, v12, 0);
      }

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
  }
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v26;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Not processing media content profile update message as not part of homeManager homes.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
LABEL_31:

}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HMDUser_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDUser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMDUser *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDUser *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  void *v40;
  HMDUser *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _QWORD aBlock[4];
  void (**v46)(_QWORD, _QWORD, _QWORD);
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "homeManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "homes"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v6),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
    {
      objc_msgSend(v4, "arrayForKey:", *MEMORY[0x1E0CB9F68]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v44 = v4;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v48 != v16)
                objc_enumerationMutation(v13);
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
              objc_msgSend(v12, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __73__HMDUser__handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
        aBlock[3] = &unk_1E89C2350;
        v4 = v44;
        v19 = v44;
        v46 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
        v20 = _Block_copy(aBlock);
        -[HMDUser userDataController](self, "userDataController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[HMDUser userDataController](self, "userDataController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:completion:", v12, v20);
        }
        else
        {
          v40 = (void *)MEMORY[0x1D17BA0A0]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v53 = v43;
            _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v40);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("User data controller not found"), CFSTR("No settings for this user"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "respondWithError:", v22);
        }

        v39 = v46;
      }
      else
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v36;
          v54 = 2112;
          v55 = v37;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Missing user update listening history control accessories in message payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Missing access control accessories"), CFSTR("Need access control accessories in message"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
          goto LABEL_31;
        objc_msgSend(v4, "responseHandler");
        v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v39)[2](v39, v12, 0);
      }

LABEL_31:
      goto LABEL_18;
    }
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v32;
      v54 = 2112;
      v55 = v4;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Can only modify own ULH control: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = 2028;
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Not processing user listening history update since the homes mismatch.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = 2018;
  }
  objc_msgSend(v27, "hmPrivateErrorWithCode:", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v11);
LABEL_18:

}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeAccessoriesFromAssistantAccessControlList:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HMDUser isCurrentUserAndOwner](self, "isCurrentUserAndOwner"))
  {
    -[HMDUser assistantAccessControl](self, "assistantAccessControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAccessoriesAddedByOldController:", v5);

  }
}

- (void)handleRemovedAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v9 = v6;

  if (v9)
  {
    -[HMDUser userDataController](self, "userDataController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleRemovedAccessory:", v8);

  }
}

- (void)_handleAnnounceSettingsUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HMDUser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDUser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    v6 = *MEMORY[0x1E0CB9EA8];
    v20 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDUser _updateAnnounceNotificationMode:](self, "_updateAnnounceNotificationMode:", objc_msgSend(v8, "deviceNotificationMode"));
      objc_msgSend(v4, "respondWithSuccess");
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing announce user settings in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Missing announce settings"), CFSTR("Need announce settings in message"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);

      v8 = 0;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("This can only be set for the user's devices."), CFSTR("Announce notifications are only delivered on devices the user owns."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
  }

}

- (void)updateAnnounceNotificationMode:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HMDUser_updateAnnounceNotificationMode___block_invoke;
  v6[3] = &unk_1E89C0B98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_updateAnnounceNotificationMode:(unint64_t)a3
{
  NSObject *v5;
  BOOL v6;
  void *v7;
  HMDUser *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HMDUser isCurrentUser](self, "isCurrentUser");
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](v8, "announceNotificationModeForCurrentDevice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Announce Setting from %@ to %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    if (-[HMDUser announceNotificationModeForCurrentDevice](v8, "announceNotificationModeForCurrentDevice") != a3)
    {
      -[HMDUser setAnnounceNotificationModeForCurrentDevice:](v8, "setAnnounceNotificationModeForCurrentDevice:", a3);
      -[HMDUser home](v8, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0CB9EB0];
      objc_msgSend(v14, "saveToCurrentAccountWithReason:", *MEMORY[0x1E0CB9EB0]);
      objc_msgSend(v14, "homeManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser uuid](v8, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v15, v17, 1);

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (void)saveAnnounceNotificationModeForCurrentUserToLocalDisk
{
  BOOL v3;
  void *v4;
  void *v5;
  HMDUser *v6;
  void *v7;
  HMDUser *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDUser *v14;
  void *v15;
  HMDUser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDUser *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  HMDUser *v26;
  __int16 v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = -[HMDUser isCurrentUser](self, "isCurrentUser");
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  if (v3)
  {
    v29 = CFSTR("HMD.announce.notification.mode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v6 = (HMDUser *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v10;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Storing announce notification mode for user:[%@]", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    -[NSObject encodeObject:forKey:](v11, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB2CD0]);
    -[NSObject finishEncoding](v11, "finishEncoding");
    -[NSObject encodedData](v11, "encodedData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDUser announceNotificationFileName](v8, "announceNotificationFileName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDPersistentStore writeData:toStorePath:dataLabel:](HMDPersistentStore, "writeData:toStorePath:dataLabel:", v12, v13, CFSTR("AnnounceNotificationModeSettings"));
      v14 = (HMDUser *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v8;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v18;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Stored [%@] bytes to [%@]", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v15);

    }
    else
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = v8;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v22;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nothing to store as there is no data after archiving %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
    goto LABEL_13;
  }
  v6 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Not a current user. Not storing announce notification mode to local disk", (uint8_t *)&v23, 0xCu);
LABEL_13:

  }
  objc_autoreleasePoolPop(v4);
}

- (void)savePersonClassificationSettingsForCurrentUserToLocalDisk
{
  void *v3;
  void *v4;
  void *v5;
  HMDUser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDUser *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    -[HMDUser personSettingsManager](self, "personSettingsManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "savePersonManagerSettingsToLocalDiskForMigration");
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@No person settings manager. Not storing person classification settings to local disk", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Not a current user. Not storing person classification settings to local disk", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (id)announceNotificationFileNameForUserUUID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/HMDUser-Announce-Notification-Mode-%@.plist"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)announceNotificationFileName
{
  void *v3;
  void *v4;

  -[HMDUser uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser announceNotificationFileNameForUserUUID:](self, "announceNotificationFileNameForUserUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)syncDataFileNameWithHomeUUID:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  -[HMDUser uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/HMDUser-Sync-Data-%@-%@.plist"), v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)saveSyncDataToLocalDisk:(id)a3
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
  HMDUser *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDUser *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDUser *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[4];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDUser userID](self, "userID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v35[0] = CFSTR("HMD.sync.data.homeUUID");
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v9;
      v36[1] = self;
      v35[1] = CFSTR("HMD.sync.data.user");
      v35[2] = CFSTR("HMD.sync.data.timestamp");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = CFSTR("HMD.sync.data.data");
      v36[2] = v10;
      v36[3] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v15;
        v31 = 2112;
        v32 = v11;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Storing sync data for for user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      encodeRootObject();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v5, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser syncDataFileNameWithHomeUUID:](v13, "syncDataFileNameWithHomeUUID:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        +[HMDPersistentStore writeData:toStorePath:dataLabel:](HMDPersistentStore, "writeData:toStorePath:dataLabel:", v16, v18, CFSTR("SyncData"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = v13;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = v7;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v23;
          v31 = 2112;
          v32 = v19;
          v33 = 2112;
          v34 = v18;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Stored [%@] bytes to [%@]", buf, 0x20u);

          v7 = v28;
        }

        objc_autoreleasePoolPop(v20);
      }
      else
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = v13;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v27;
          v31 = 2112;
          v32 = v11;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nothing to store as there is no data after archiving %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
      }

      objc_autoreleasePoolPop(v7);
    }
  }

}

- (HMPhotosPersonManagerSettings)photosPersonManagerSettings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMDUser photosPersonDataManager](self, "photosPersonDataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[HMDUserPhotosPersonDataManager defaultSettings](HMDUserPhotosPersonDataManager, "defaultSettings");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (HMPhotosPersonManagerSettings *)v6;
}

- (HMDPhotosPersonManager)photosPersonManager
{
  void *v2;
  void *v3;

  -[HMDUser photosPersonDataManager](self, "photosPersonDataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDPhotosPersonManager *)v3;
}

- (void)configurePhotosPersonDataManager
{
  HMDUserPhotosPersonDataManager *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDUserPhotosPersonDataManager *v7;
  void *v8;
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDUser home](self, "home");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9
    && (-[HMDUser isRunningOnHomeOwnersDevice](self, "isRunningOnHomeOwnersDevice")
     || -[HMDUser isCurrentUser](self, "isCurrentUser")))
  {
    v3 = [HMDUserPhotosPersonDataManager alloc];
    -[HMDUser messageDispatcher](self, "messageDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDUserPhotosPersonDataManager initWithUser:messageDispatcher:localZone:workQueue:](v3, "initWithUser:messageDispatcher:localZone:workQueue:", self, v4, v6, self->_queue);
    -[HMDUser setPhotosPersonDataManager:](self, "setPhotosPersonDataManager:", v7);

    -[HMDUser photosPersonDataManager](self, "photosPersonDataManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configure");

  }
}

- (void)configurePersonSettingsManager
{
  void *v3;
  void *v4;
  HMDUser *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  HMDPersonSettingsManager *v9;
  void *v10;
  void *v11;
  HMDPersonSettingsManager *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    -[HMDUser home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v8;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating the person settings manager", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      v9 = [HMDPersonSettingsManager alloc];
      -[HMDUser privateBackingStoreController](v5, "privateBackingStoreController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDPersonSettingsManager initWithHome:localZone:workQueue:](v9, "initWithHome:localZone:workQueue:", v3, v11, v5->_queue);
      -[HMDUser setPersonSettingsManager:](v5, "setPersonSettingsManager:", v12);

      -[HMDUser personSettingsManager](v5, "personSettingsManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configure");

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Not creating person settings manager because home reference is nil", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
    }

  }
}

- (NSNumber)notificationContextHAPIdentifier
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  -[HMDUser uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUUIDBytes:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v4[0]));
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)notificationContextNFCIdentifier
{
  void *v3;
  void *v4;
  unsigned int *v5;
  void *v6;
  void *v7;
  HMDUser *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDUser nfcIssuerKeyIdentifier](self, "nfcIssuerKeyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@NFC issuer key identifier for user is nil", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)uniqueIDForAccessories
{
  return 0;
}

- (NSString)userID
{
  void *v2;
  void *v3;

  -[HMDUser accountHandle](self, "accountHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUser userIDForAccountHandle:](HMDUser, "userIDForAccountHandle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setUserID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountHandleFromString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[HMDUser setAccountHandle:](self, "setAccountHandle:", v5);

  }
  else
  {
    -[HMDUser setAccountHandle:](self, "setAccountHandle:", 0);
  }

}

- (NSString)pairingUsername
{
  void *v2;
  void *v3;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)publicKey
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDUser uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDUser messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (HMDUser)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDUser *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = (HMDUser *)-[HMDUser _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  HMDResidentUser *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDUser *v19;
  uint64_t v20;
  HMBShareUserID *cloudShareID;
  void *v22;
  id *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSUUID *uuid;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *displayName;
  void *v35;
  NSString *v36;
  uint64_t v37;
  NSString *v38;
  uint64_t v39;
  HMDAccountIdentifier *accountIdentifier;
  char v41;
  uint64_t v42;
  HMUserPresenceAuthorization *presenceAuthStatus;
  void *v44;
  void *v45;
  uint64_t v46;
  HMDAssistantAccessControl *assistantAccessControl;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSString *accessCode;
  uint64_t v62;
  NSUUID *accessCodeChangedByUserUUID;
  uint64_t v64;
  NSNumber *matterCASEAuthenticatedTagID;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class() || !objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userIsRemoteGateway")))
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.handle")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.handle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.userAdministratorType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v9;
    if (v9)
    {
      v10 = objc_msgSend(v9, "integerValue");
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userPrivilege"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");
      if (v12 == 1)
        v10 = 3;
      else
        v10 = v12;

    }
    v13 = *MEMORY[0x1E0CB9FA8];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CB9FA8]))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingUsername"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userPublicKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v16);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D165A8]), "initWithIdentifier:publicKey:privateKey:permissions:", v15, v17, 0, (v10 & 0xFFFFFFFFFFFFFFFDLL) == 1);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:](self, "initWithAccountHandle:home:pairingIdentity:privilege:", v7, v18, v14, 2);
    if (!v19)
    {
LABEL_55:
      self = v19;

      v6 = (HMDResidentUser *)self;
      goto LABEL_56;
    }
    v68 = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserCloudShareIDCodingKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    cloudShareID = v19->_cloudShareID;
    v19->_cloudShareID = (HMBShareUserID *)v20;

    v69 = v7;
    if (v19->_cloudShareID)
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v19;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v72 = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@User has decoded their cloud share id and is cloud share ready", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(v23[20], "finishWithResult:", v19->_cloudShareID);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userUUID"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v67);
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.userAdministratorType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v19->_privilege = objc_msgSend(v28, "integerValue");
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userPrivilege"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "integerValue");
      v32 = 3;
      if (v31 != 1)
        v32 = v31;
      v19->_privilege = v32;

    }
    v19->_privilege = v10;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("userDisplayName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDisplayName"));
      v33 = objc_claimAutoreleasedReturnValue();
      displayName = v19->_displayName;
      v19->_displayName = (NSString *)v33;

    }
    -[HMDUser userID](v19, "userID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "isEqual:", v19->_displayName) & 1) != 0)
    {

    }
    else
    {
      v36 = v19->_displayName;

      if (v36)
      {
LABEL_35:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accountId"));
        v39 = objc_claimAutoreleasedReturnValue();
        accountIdentifier = v19->_accountIdentifier;
        v19->_accountIdentifier = (HMDAccountIdentifier *)v39;

        if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.isUserAllowedRemoteAccess")))
          v41 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.isUserAllowedRemoteAccess"));
        else
          v41 = 1;
        v19->_remoteAccessAllowed = v41;
        objc_msgSend(MEMORY[0x1E0CBA950], "authWithCoder:", v4);
        v42 = objc_claimAutoreleasedReturnValue();
        presenceAuthStatus = v19->_presenceAuthStatus;
        v19->_presenceAuthStatus = (HMUserPresenceAuthorization *)v42;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB9EE0]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v44)
          v19->_camerasAccessLevel = objc_msgSend(v44, "integerValue");
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB9EC0]);
        v46 = objc_claimAutoreleasedReturnValue();
        assistantAccessControl = v19->_assistantAccessControl;
        v19->_assistantAccessControl = (HMDAssistantAccessControl *)v46;

        v48 = *MEMORY[0x1E0CB9EA0];
        v49 = v4;
        v50 = objc_msgSend(v49, "decodeBoolForKey:", v48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserAnnounceAccessLevelCodingKey"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v19, v51, v52);
        v19->_announceAccessLevel = v53;
        objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB8B90]);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v55 = v54;
        else
          v55 = 0;
        v56 = v55;

        v57 = objc_msgSend(v56, "integerValue");
        v19->_audioAnalysisUserDropInAccessLevel = v57;
        if (-[HMDUser isCurrentUser](v19, "isCurrentUser")
          && ((objc_msgSend(v49, "hmd_isForLocalStore") & 1) != 0
           || isWatch() && objc_msgSend(v49, "hmd_isForRemoteTransportOnSameAccount")))
        {
          objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB9EA8]);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v19->_announceNotificationModeForCurrentDevice = objc_msgSend(v58, "deviceNotificationMode");

        }
        objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB9F90]);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v19->_needsiTunesMultiUserRepair = objc_msgSend(v59, "BOOLValue");

        v14 = v68;
        if (objc_msgSend(v49, "containsValueForKey:", CFSTR("HMDUserAccessCodeCodingKey")))
        {
          objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserAccessCodeCodingKey"));
          v60 = objc_claimAutoreleasedReturnValue();
          accessCode = v19->_accessCode;
          v19->_accessCode = (NSString *)v60;

        }
        if (objc_msgSend(v49, "containsValueForKey:", CFSTR("HMDUserAccessCodeChangedByUserUUIDCodingKey")))
        {
          objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserAccessCodeChangedByUserUUIDCodingKey"));
          v62 = objc_claimAutoreleasedReturnValue();
          accessCodeChangedByUserUUID = v19->_accessCodeChangedByUserUUID;
          v19->_accessCodeChangedByUserUUID = (NSUUID *)v62;

        }
        if (objc_msgSend(v49, "containsValueForKey:", CFSTR("HMDUserMatterCATIDCodingKey")))
        {
          objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserMatterCATIDCodingKey"));
          v64 = objc_claimAutoreleasedReturnValue();
          matterCASEAuthenticatedTagID = v19->_matterCASEAuthenticatedTagID;
          v19->_matterCASEAuthenticatedTagID = (NSNumber *)v64;

        }
        v7 = v69;
        goto LABEL_55;
      }
    }
    __displayNameForUser(v19);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v19->_displayName;
    v19->_displayName = (NSString *)v37;

    goto LABEL_35;
  }
  v6 = -[HMDResidentUser initWithCoder:]([HMDResidentUser alloc], "initWithCoder:", v4);
LABEL_56:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  -[HMDUser _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  HMDUser *v11;
  NSObject *v12;
  void *v13;
  HMDAssertionLogEvent *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
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
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  _BOOL8 v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDAssistantAccessControl *v66;
  void *v67;
  HMDAssistantAccessControl *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  uint8_t buf[4];
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userUUID"));

  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("home"));
  -[HMDUser userDataController](self, "userDataController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeWithCoder:", v4);

  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    if (-[HMDUser isCurrentUser](self, "isCurrentUser")
      && !objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      v9 = 0;
    }
    else
    {
      -[HMDUser displayName](self, "displayName");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v87 = v13;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Display name was nil for non-current user", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        v14 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Display name was nil for non-current user"));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "submitLogEvent:", v14);

        v9 = &stru_1E89C3E38;
      }
    }
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("userDisplayName"));
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isCurrentUser](self, "isCurrentUser"), CFSTR("HM.isCurrentUser"));
    if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      -[HMDUser pairingIdentity](self, "pairingIdentity");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (v85)
      {
        v35 = objc_alloc(MEMORY[0x1E0D28650]);
        objc_msgSend(v85, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "publicKey");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v35, "initWithIdentifier:publicKey:privateKey:", v36, v37, 0);

        objc_msgSend(v4, "encodeObject:forKey:", v38, *MEMORY[0x1E0CB9FA8]);
      }
      -[HMDUser userDataController](self, "userDataController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "mediaContentProfileAccessControlAccessoriesToEncode");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      __accessoriesFromAccessoryUUIDs(v40, v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        -[HMDUser userDataController](self, "userDataController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isInitialized");

        if (v43)
        {
          v44 = (void *)objc_msgSend(v41, "copy");
          objc_msgSend(v4, "encodeObject:forKey:", v44, *MEMORY[0x1E0CB9F78]);

        }
      }

      -[HMDUser userDataController](self, "userDataController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "userListeningHistoryUpdateControlModelAccessoriesToEncode");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        -[HMDUser userDataController](self, "userDataController");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isInitialized");

        if (v48)
          objc_msgSend(v4, "encodeObject:forKey:", v46, *MEMORY[0x1E0CB9F60]);
      }

      -[HMDUser userID](self, "userID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v49, CFSTR("userID"));

      objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isAdministrator](self, "isAdministrator"), CFSTR("isAdminUser"));
      objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isOwner](self, "isOwner"), CFSTR("HM.isOwnerUser"));
      objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), CFSTR("HM.isUserAllowedRemoteAccess"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v50, *MEMORY[0x1E0CB9EE0]);

      v51 = -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
      objc_msgSend(v4, "encodeBool:forKey:", v51, *MEMORY[0x1E0CB9EA0]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v52, *MEMORY[0x1E0CB8B90]);

      v53 = objc_msgSend(v5, "isAccessToHomeAllowed");
      objc_msgSend(v4, "encodeBool:forKey:", v53, *MEMORY[0x1E0CB8DF8]);
      if ((v53 & 1) == 0)
      {
        v54 = objc_msgSend(v5, "accessNotAllowedReasonCode");
        objc_msgSend(v4, "encodeInteger:forKey:", v54, *MEMORY[0x1E0CB8CB0]);
      }
      objc_msgSend(v5, "overriddenHomeAccessControl");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v55)
      {
        v57 = objc_msgSend(v55, "unsignedIntegerValue");
        objc_msgSend(v4, "encodeInteger:forKey:", v57, *MEMORY[0x1E0CB8CA8]);
      }
      -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addToCoder:", v4);

      if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
      {
        objc_msgSend(v5, "presenceComputeStatus");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addToCoder:", v4);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v60, *MEMORY[0x1E0CB9F90]);

      }
      if (-[HMDUser isOwner](self, "isOwner"))
      {
        -[HMDUser assistantAccessControl](self, "assistantAccessControl");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v61, *MEMORY[0x1E0CB9EC0]);
      }
      else
      {
        -[HMDUser userDataController](self, "userDataController");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "assistantAccessControlAccessoriesToEncode");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
        {
          __accessoriesFromAccessoryUUIDs(v61, v5);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v63, "count") != 0;
          objc_msgSend(v63, "na_map:", &__block_literal_global_468);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "na_map:", &__block_literal_global_471);
          v84 = v56;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = [HMDAssistantAccessControl alloc];
          -[HMDUser userDataController](self, "userDataController");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = -[HMDAssistantAccessControl initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:](v66, "initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:", self, v64, v65, v83, objc_msgSend(v67, "assistantAccessControlActivityNotificationsEnabledForPersonalRequests"));

          -[HMDUser userDataController](self, "userDataController");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAssistantAccessControl setOptions:](v68, "setOptions:", objc_msgSend(v69, "assistantAccessControlRequiresAuthenticationForSecureRequests") ^ 1);

          objc_msgSend(v4, "encodeObject:forKey:", v68, *MEMORY[0x1E0CB9EC0]);
          v56 = v84;

        }
      }

      -[HMDUser userDataController](self, "userDataController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "supportsHH2MigrationByOwnerManual");

      objc_msgSend(v4, "encodeBool:forKey:", v71, *MEMORY[0x1E0CBA058]);
      if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
      {
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA350]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
        objc_msgSend(v4, "encodeObject:forKey:", v72, *MEMORY[0x1E0CB9EA8]);

      }
      -[HMDUser photosPersonDataManager](self, "photosPersonDataManager");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "settings");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v74, *MEMORY[0x1E0CB9FB8]);

    }
    -[HMDUser account](self, "account");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "senderCorrelationIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76 && (objc_msgSend(v4, "hmd_entitlements") & 0x1000) != 0)
      objc_msgSend(v4, "encodeObject:forKey:", v76, *MEMORY[0x1E0CB9FE0]);

    goto LABEL_51;
  }
  -[HMDUser accountHandle](self, "accountHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("HM.handle"));

  -[HMDUser userID](self, "userID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("userID"));

  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    -[HMDUser accountIdentifier](self, "accountIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("HM.accountId"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser _compatiblePrivilege](self, "_compatiblePrivilege"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("userPrivilege"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("HM.userAdministratorType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), CFSTR("HM.isUserAllowedRemoteAccess"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, *MEMORY[0x1E0CB9EE0]);

  v22 = -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  objc_msgSend(v4, "encodeBool:forKey:", v22, *MEMORY[0x1E0CB9EA0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("HMDUserAnnounceAccessLevelCodingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, *MEMORY[0x1E0CB8B90]);

  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteUserAdministrator"))
  {
    -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addToCoder:", v4);

  }
  -[HMDUser encodingRemoteDisplayName](self, "encodingRemoteDisplayName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("userDisplayName"));

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("pairingUsername"));

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "publicKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "data");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("userPublicKey"));

  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, *MEMORY[0x1E0CB9FA8]);

  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    -[HMDUser assistantAccessControl](self, "assistantAccessControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v33, *MEMORY[0x1E0CB9EC0]);

  }
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) != 0)
  {
LABEL_50:
    -[HMDUser accessCode](self, "accessCode");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v78, CFSTR("HMDUserAccessCodeCodingKey"));

    -[HMDUser accessCodeChangedByUserUUID](self, "accessCodeChangedByUserUUID");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMDUserAccessCodeChangedByUserUUIDCodingKey"));
LABEL_51:

    goto LABEL_52;
  }
  objc_msgSend(v4, "hmd_user");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDUser isEqual:](self, "isEqual:", v34))
  {

    goto LABEL_50;
  }
  v77 = objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount");

  if (v77)
    goto LABEL_50;
LABEL_52:
  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v79, CFSTR("HMDUserMatterCATIDCodingKey"));

  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    -[HMDUser cloudShareID](self, "cloudShareID");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v80, CFSTR("HMDUserCloudShareIDCodingKey"));

    if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v81, *MEMORY[0x1E0CB9F90]);

    }
  }
  if (-[HMDUser isCurrentUser](self, "isCurrentUser")
    && ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
     || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") && isiOSDevice()))
  {
    v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA350]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
    objc_msgSend(v4, "encodeObject:forKey:", v82, *MEMORY[0x1E0CB9EA8]);

  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  HMDAssistantAccessControl *v22;
  BOOL v23;
  void *v24;
  HMDUser *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDUser *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  if (!v12)
  {
    v16 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v15 = v17;

    if (v15)
    {
      -[HMDUser assistantAccessControl](self, "assistantAccessControl");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[HMDUser assistantAccessControl](self, "assistantAccessControl");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "transactionObjectUpdated:newValues:message:", v8, v16, v10);

        goto LABEL_44;
      }
      v22 = -[HMDAssistantAccessControl initWithUser:model:]([HMDAssistantAccessControl alloc], "initWithUser:model:", self, v15);
      if (v22)
        -[HMDUser setAssistantAccessControl:](self, "setAssistantAccessControl:", v22);
LABEL_43:

      goto LABEL_44;
    }
    v20 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (!v22)
    {
      -[HMDUser home](self, "home");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v32;
      else
        v33 = 0;
      v34 = v33;

      v35 = v31;
      if (v34)
      {
        objc_msgSend(v31, "accessCodeManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dataManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v37, "handleUpdatedUserAccessCodeModel:forUser:message:", v34, self, v10);
        }
        else
        {
          v41 = (void *)MEMORY[0x1D17BA0A0]();
          v46 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v45 = v41;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v49 = v43;
            _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", buf, 0xCu);

            v41 = v45;
          }

          objc_autoreleasePoolPop(v41);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "respondWithError:", v44);

        }
        v35 = v31;

      }
      v22 = 0;
      goto LABEL_43;
    }
    if (isWatch())
    {
      v23 = -[HMDUser isCurrentUser](self, "isCurrentUser");
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v27)
        {
          HMFGetLogIdentifier();
          v47 = v24;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAssistantAccessControl announceNotificationModeForCurrentDevice](v22, "announceNotificationModeForCurrentDevice");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v28;
          v50 = 2112;
          v51 = v29;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Updated announce notification settings for watch to %@", buf, 0x16u);

          v24 = v47;
        }

        objc_autoreleasePoolPop(v24);
        -[HMDAssistantAccessControl announceNotificationModeForCurrentDevice](v22, "announceNotificationModeForCurrentDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser setAnnounceNotificationModeForCurrentDevice:](v25, "setAnnounceNotificationModeForCurrentDevice:", objc_msgSend(v30, "unsignedIntegerValue"));

        objc_msgSend(v10, "respondWithSuccess");
        goto LABEL_43;
      }
      if (!v27)
        goto LABEL_37;
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v38;
      v39 = "%{public}@Ignoring announce settings update as it is not for the current user";
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
LABEL_37:

        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "respondWithError:", v40);

        goto LABEL_43;
      }
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v38;
      v39 = "%{public}@Ignoring announce settings update as it is not on a watch";
    }
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, v39, buf, 0xCu);

    goto LABEL_37;
  }
  v13 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  -[HMDUser _transactionUserUpdated:newValues:message:](self, "_transactionUserUpdated:newValues:message:", v15, v12, v10);
LABEL_44:

}

- (void)_transactionUserUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDUser *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  HMDUser *v32;
  NSObject *v33;
  void *v34;
  HMDUser *v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  HMDUser *v40;
  NSObject *v41;
  void *v42;
  HMDUser *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  HMDUser *v53;
  NSObject *v54;
  void *v55;
  unint64_t v56;
  const __CFString *v57;
  void *v58;
  unsigned int v59;
  const __CFString *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  HMDUser *v74;
  NSObject *v75;
  void *v76;
  HMDUser *v77;
  __CFString *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  int v88;
  int v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  HMDUser *v99;
  NSObject *v100;
  void *v101;
  HMDUser *v102;
  __CFString *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  void *v110;
  HMDUser *v111;
  NSObject *v112;
  void *v113;
  uint64_t v114;
  __CFString *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  char v126;
  void *v127;
  HMDUser *v128;
  NSObject *v129;
  void *v130;
  id v131;
  __CFString *v132;
  void *v133;
  HMDUser *v134;
  NSObject *v135;
  void *v136;
  id v137;
  HMDUser *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  char v145;
  NSObject *v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  NSObject *group;
  void *v152;
  HMDUser *v153;
  id v154;
  _QWORD block[4];
  id v156;
  id v157;
  uint8_t buf[4];
  void *v159;
  __int16 v160;
  HMDUser *v161;
  __int16 v162;
  const __CFString *v163;
  __int16 v164;
  uint64_t v165;
  __int16 v166;
  void *v167;
  __int16 v168;
  HMDUser *v169;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v154 = a5;
  group = dispatch_group_create();
  objc_msgSend(v9, "accountHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "accountHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_8:
      v153 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v9, "userID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_8;
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountHandleFromString:", v14);
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_8;
  }
  -[HMDUser accountHandle](self, "accountHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HMFEqualObjects();

  v153 = (HMDUser *)v11;
  if ((v16 & 1) == 0)
    -[HMDUser setAccountHandle:](self, "setAccountHandle:", v11);
LABEL_9:
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser userID](v18, "userID");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HMDUser account](v18, "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser isCurrentUser](v18, "isCurrentUser");
    HMFBooleanToString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v159 = v20;
    v160 = 2112;
    v161 = v153;
    v162 = 2117;
    v163 = v21;
    v164 = 2112;
    v165 = (uint64_t)v22;
    v166 = 2112;
    v167 = v23;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated account handle [%@] for %{sensitive}@, account: %@, isCurrentUser: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v17);
  if (objc_msgSend(v9, "propertyWasSet:", CFSTR("accountIdentifier")))
  {
    objc_msgSend(v9, "accountIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser accountIdentifier](v18, "accountIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = HMFEqualObjects();

    if ((v26 & 1) == 0)
    {
      objc_msgSend(v9, "accountIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setAccountIdentifier:](v18, "setAccountIdentifier:", v27);

    }
  }
  -[HMDUser home](v18, "home");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](v18, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if ((v30 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = v18;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v35 = (HMDUser *)objc_claimAutoreleasedReturnValue();
      -[HMDUser uuid](v32, "uuid");
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v159 = v34;
      v160 = 2112;
      v161 = v35;
      v162 = 2112;
      v163 = v36;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating uuid: %@ from %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    -[HMDUser deregisterForMessages](v32, "deregisterForMessages");
    objc_msgSend(v154, "transactionResult");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "source");

    if (v38 != 1)
    {
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = v32;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "name");
        v43 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v159 = v42;
        v160 = 2112;
        v161 = v43;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Home %@ needs to run migration because user UUID was changed", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      -[HMDUser uuid](v40, "uuid");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "dropAllChangesWithObjectID:", v44);

      objc_msgSend(v152, "setMigrationNeeded:", 1);
    }
    -[HMDUser uuid](v32, "uuid");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setUUID:](v32, "setUUID:", v46);

    -[HMDUser registerForMessages](v32, "registerForMessages");
    -[HMDUser recoverUserCloudDataDueToUUIDChangeFromOldUUID:](v32, "recoverUserCloudDataDueToUUIDChangeFromOldUUID:", v45);

  }
  objc_msgSend(v9, "privilege");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    v49 = -[HMDUser privilege](v18, "privilege");
    objc_msgSend(v9, "privilege");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "integerValue");

    if (v49 != v51)
    {
      v52 = (void *)MEMORY[0x1D17BA0A0]();
      v53 = v18;
      HMFGetOSLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = -[HMDUser privilege](v53, "privilege");
        if (v56 > 4)
          v57 = CFSTR("None");
        else
          v57 = off_1E89BB648[v56];
        objc_msgSend(v9, "privilege");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "intValue");
        if (v59 > 4)
          v60 = CFSTR("None");
        else
          v60 = off_1E89BB648[v59];
        *(_DWORD *)buf = 138543874;
        v159 = v55;
        v160 = 2112;
        v161 = (HMDUser *)v57;
        v162 = 2112;
        v163 = v60;
        _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@User Privilege got updated from : %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v52);
      objc_msgSend(v9, "privilege");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setPrivilege:](v53, "setPrivilege:", objc_msgSend(v61, "integerValue"));

    }
  }
  objc_msgSend(v9, "remoteAccessAllowed");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    objc_msgSend(v9, "remoteAccessAllowed");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "BOOLValue");
    v66 = -[HMDUser isRemoteAccessAllowed](v18, "isRemoteAccessAllowed");

    if (v65 != v66)
    {
      objc_msgSend(v9, "remoteAccessAllowed");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setRemoteAccessAllowed:](v18, "setRemoteAccessAllowed:", objc_msgSend(v67, "BOOLValue"));

    }
  }
  objc_msgSend(v9, "camerasAccessLevel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "integerValue");

  objc_msgSend(v9, "camerasAccessLevel");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = (void *)v70;
    v72 = -[HMDUser camerasAccessLevel](v18, "camerasAccessLevel");

    if (v69 != v72)
    {
      v73 = (void *)MEMORY[0x1D17BA0A0]();
      v74 = v18;
      HMFGetOSLogHandle();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser camerasAccessLevel](v74, "camerasAccessLevel");
        HMUserCameraAccessLevelAsString();
        v77 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        HMUserCameraAccessLevelAsString();
        v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v159 = v76;
        v160 = 2112;
        v161 = v77;
        v162 = 2112;
        v163 = v78;
        _os_log_impl(&dword_1CD062000, v75, OS_LOG_TYPE_INFO, "%{public}@Updating cameras access value from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v73);
      -[HMDUser setCamerasAccessLevel:](v74, "setCamerasAccessLevel:", v69);
    }
  }
  objc_msgSend(v9, "announceAccessLevel");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    objc_msgSend(v9, "announceAccessLevel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "unsignedIntegerValue");
    v83 = -[HMDUser announceAccessLevel](v18, "announceAccessLevel");

    if (v82 != v83)
    {
      objc_msgSend(v9, "announceAccessLevel");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v18, 0, v84);
LABEL_52:
      -[HMDUser setAnnounceAccessLevel:](v18, "setAnnounceAccessLevel:", v92);
      goto LABEL_53;
    }
  }
  objc_msgSend(v9, "announceAccessLevel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {
LABEL_53:

    goto LABEL_54;
  }
  objc_msgSend(v9, "announceAccessAllowed");
  v85 = objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)v85;
    objc_msgSend(v9, "announceAccessAllowed");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "BOOLValue");
    v89 = -[HMDUser isAnnounceAccessAllowed](v18, "isAnnounceAccessAllowed");

    if (v88 != v89)
    {
      objc_msgSend(v9, "announceAccessAllowed");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v84, "BOOLValue");
      v91 = 1;
      if (v90)
        v91 = 2;
      if (v18)
        v92 = v91;
      else
        v92 = 0;
      goto LABEL_52;
    }
  }
LABEL_54:
  objc_msgSend(v9, "audioAnalysisUserDropInAccessLevel");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "integerValue");

  objc_msgSend(v9, "audioAnalysisUserDropInAccessLevel");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    v97 = -[HMDUser audioAnalysisUserDropInAccessLevel](v18, "audioAnalysisUserDropInAccessLevel");

    if (v94 != v97)
    {
      v98 = (void *)MEMORY[0x1D17BA0A0]();
      v99 = v18;
      HMFGetOSLogHandle();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](v99, "audioAnalysisUserDropInAccessLevel"));
        v102 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v94);
        v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v159 = v101;
        v160 = 2112;
        v161 = v102;
        v162 = 2112;
        v163 = v103;
        _os_log_impl(&dword_1CD062000, v100, OS_LOG_TYPE_INFO, "%{public}@Updating audio analysis user Dropin value from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v98);
      -[HMDUser setAudioAnalysisUserDropInAccessLevel:](v99, "setAudioAnalysisUserDropInAccessLevel:", v94);
    }
  }
  objc_msgSend(v9, "matterCASEAuthenticatedTagID");
  v104 = objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    v105 = (void *)v104;
    objc_msgSend(v9, "matterCASEAuthenticatedTagID");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "integerValue"))
    {
      objc_msgSend(v9, "matterCASEAuthenticatedTagID");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser matterCASEAuthenticatedTagID](v18, "matterCASEAuthenticatedTagID");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v107, "isEqual:", v108);

      if ((v109 & 1) == 0)
      {
        v110 = (void *)MEMORY[0x1D17BA0A0]();
        v111 = v18;
        HMFGetOSLogHandle();
        v112 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUser matterCASEAuthenticatedTagID](v111, "matterCASEAuthenticatedTagID");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v148, "integerValue");
          -[HMDUser matterCASEAuthenticatedTagID](v111, "matterCASEAuthenticatedTagID");
          v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "matterCASEAuthenticatedTagID");
          v150 = v8;
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v116, "integerValue");
          objc_msgSend(v9, "matterCASEAuthenticatedTagID");
          v149 = v110;
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v159 = v113;
          v160 = 2048;
          v161 = (HMDUser *)v114;
          v162 = 2112;
          v163 = v115;
          v164 = 2048;
          v165 = v117;
          v166 = 2112;
          v167 = v118;
          v168 = 2112;
          v169 = v111;
          _os_log_impl(&dword_1CD062000, v112, OS_LOG_TYPE_INFO, "%{public}@Updating CATID from 0x%lX (%@) to 0x%lX (%@) for user %@", buf, 0x3Eu);

          v110 = v149;
          v8 = v150;

        }
        objc_autoreleasePoolPop(v110);
        objc_msgSend(v9, "matterCASEAuthenticatedTagID");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser setMatterCASEAuthenticatedTagID:](v111, "setMatterCASEAuthenticatedTagID:", v119);

        -[HMDUser handleUpdatedCATForUser](v111, "handleUpdatedCATForUser");
      }
    }
    else
    {

    }
  }
  objc_msgSend(v9, "setProperties");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "containsObject:", CFSTR("presenceAuthorizationStatus"));

  if (v121)
  {
    v122 = (void *)MEMORY[0x1E0CBA950];
    objc_msgSend(v9, "presenceAuthorizationStatus");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "authWithNumber:", v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    if (isPresenceAuthorizationValid())
    {
      -[HMDUser presenceAuthStatus](v18, "presenceAuthStatus");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = HMFEqualObjects();

      if ((v126 & 1) == 0)
      {
        v127 = (void *)MEMORY[0x1D17BA0A0]();
        v128 = v18;
        HMFGetOSLogHandle();
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUser presenceAuthStatus](v128, "presenceAuthStatus");
          v131 = v8;
          v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v159 = v130;
          v160 = 2112;
          v161 = v128;
          v162 = 2112;
          v163 = v132;
          v164 = 2112;
          v165 = (uint64_t)v124;
          _os_log_impl(&dword_1CD062000, v129, OS_LOG_TYPE_INFO, "%{public}@Updating the presence auth status for user %@ from %@ to %@", buf, 0x2Au);

          v8 = v131;
        }

        objc_autoreleasePoolPop(v127);
        -[HMDUser setPresenceAuthStatus:](v128, "setPresenceAuthStatus:", v124);
      }
    }
    else
    {
      v133 = (void *)MEMORY[0x1D17BA0A0]();
      v134 = v18;
      HMFGetOSLogHandle();
      v135 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "presenceAuthorizationStatus");
        v137 = v8;
        v138 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v159 = v136;
        v160 = 2112;
        v161 = v138;
        _os_log_impl(&dword_1CD062000, v135, OS_LOG_TYPE_INFO, "%{public}@Ignoring the value for presence auth in user model: %@", buf, 0x16u);

        v8 = v137;
      }

      objc_autoreleasePoolPop(v133);
    }

  }
  objc_msgSend(v154, "transactionResult");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingIdentity");
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (v140)
  {
    v141 = (void *)MEMORY[0x1E0D165A8];
    objc_msgSend(v9, "pairingIdentity");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "hmd_pairingIdentityWithDictionary:", v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDUser pairingIdentity](v18, "pairingIdentity");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = HMFEqualObjects();

    if ((v145 & 1) == 0)
      -[HMDUser setPairingIdentity:](v18, "setPairingIdentity:", v143);

  }
  objc_msgSend(v139, "markChanged");
  objc_msgSend(v152, "workQueue");
  v146 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMDUser__transactionUserUpdated_newValues_message___block_invoke;
  block[3] = &unk_1E89C2328;
  v156 = v154;
  v157 = 0;
  v147 = v154;
  dispatch_group_notify(group, v146, block);

}

- (void)handleUpdatedCATForUser
{
  id v2;

  -[HMDUser home](self, "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleCATUpdate");

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMDUser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDUser *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDUser *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
  {
    -[HMDUser setAssistantAccessControl:](self, "setAssistantAccessControl:", 0);
    objc_msgSend(v7, "respondWithSuccess");
  }
  else
  {
    v10 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      if (isWatch() && -[HMDUser isCurrentUser](self, "isCurrentUser"))
      {
        v13 = (void *)MEMORY[0x1D17BA0A0]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v16;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Removed announce user settings from user", (uint8_t *)&v32, 0xCu);

        }
        objc_autoreleasePoolPop(v13);
        -[HMDUser setAnnounceNotificationModeForCurrentDevice:](v14, "setAnnounceNotificationModeForCurrentDevice:", 0);
        objc_msgSend(v7, "respondWithSuccess");
      }
      else
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v20;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Ignorning removed announce user settings from user, not watch or not current user", (uint8_t *)&v32, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
      }
    }
    else
    {
      v21 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      if (v23)
      {
        -[HMDUser home](self, "home");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "accessCodeManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dataManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v26, "handleRemovedUserAccessCodeModel:forUser:message:", v23, self, v7);
        }
        else
        {
          v27 = (void *)MEMORY[0x1D17BA0A0]();
          v28 = self;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 138543362;
            v33 = v30;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Not handling removed HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", (uint8_t *)&v32, 0xCu);

          }
          objc_autoreleasePoolPop(v27);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "respondWithError:", v31);

        }
      }

    }
  }

}

- (void)migrateCloudZone:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  id *v27;
  id *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD aBlock[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v32 = v11;
  v33 = v10;
  v31 = v12;
  if (-[HMDUser isOwner](self, "isOwner"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke;
    aBlock[3] = &unk_1E89BB468;
    v34 = &v58;
    objc_copyWeak(&v58, location);
    v29 = v9;
    v14 = v9;
    v52 = v14;
    v15 = v10;
    v57 = v15;
    v16 = v11;
    v53 = v16;
    v17 = v12;
    v54 = v17;
    v30 = v8;
    v18 = v8;
    v55 = v18;
    v19 = v13;
    v56 = v19;
    v20 = _Block_copy(aBlock);
    objc_msgSend(v19, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_488;
    v43[3] = &unk_1E89BB4B8;
    objc_copyWeak(&v50, location);
    v48 = v15;
    v44 = v14;
    v45 = v16;
    v46 = v17;
    v22 = v20;
    v49 = v22;
    v47 = v19;
    objc_msgSend(v18, "cloudRecordsForParentID:completionHandler:", v21, v43);
    v23 = &v52;
    v24 = &v57;
    v25 = &v53;
    v26 = &v54;
    v27 = &v55;
    v28 = &v56;

    objc_destroyWeak(&v50);
    v9 = v29;
    v8 = v30;
  }
  else
  {
    objc_msgSend(v13, "uuid");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v35[1] = 3221225472;
    v35[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_493;
    v35[3] = &unk_1E89BB508;
    v34 = &v42;
    v35[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v42, location);
    v41 = v10;
    v36 = v9;
    v37 = v11;
    v38 = v12;
    v39 = v13;
    v40 = v8;
    objc_msgSend(v40, "cloudRecordsForParentID:completionHandler:", v22, v35);
    v23 = &v41;
    v24 = &v36;
    v25 = &v37;
    v26 = &v38;
    v27 = &v39;
    v28 = &v40;
  }

  objc_destroyWeak(v34);
  objc_destroyWeak(location);

}

- (id)announceUserSettingsModelWithChangeType:(unint64_t)a3
{
  HMDAnnounceUserSettingsModel *v5;
  void *v6;
  HMDAnnounceUserSettingsModel *v7;
  void *v8;

  v5 = [HMDAnnounceUserSettingsModel alloc];
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAnnounceUserSettingsModel initWithUserUUID:](v5, "initWithUserUUID:", v6);

  -[HMDBackingStoreModelObject setObjectChangeType:](v7, "setObjectChangeType:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnnounceUserSettingsModel setAnnounceNotificationModeForCurrentDevice:](v7, "setAnnounceNotificationModeForCurrentDevice:", v8);

  return v7;
}

- (id)backingStoreObjects:(int64_t)a3
{
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  if (a3 >= 4)
  {
    -[HMDUser assistantAccessControl](self, "assistantAccessControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "setObjectChangeType:", 1);
        objc_msgSend(v5, "addObject:", v10);
      }

    }
    -[HMDUser announceUserSettingsModelWithChangeType:](self, "announceUserSettingsModelWithChangeType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    -[HMDUser accessCode](self, "accessCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      -[HMDUser accessCodeChangedByUserUUID](self, "accessCodeChangedByUserUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    -[HMDUser accessCode](self, "accessCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser uuid](self, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser accessCodeChangedByUserUUID](self, "accessCodeChangedByUserUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccessCodeDataManager createUserAccessCodeModelFromAccessCode:forUserUUID:changedByUserUUID:](HMDAccessCodeDataManager, "createUserAccessCodeModelFromAccessCode:forUserUUID:changedByUserUUID:", v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v17);
    goto LABEL_10;
  }
LABEL_11:
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return -[HMDUser modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", a3, 4);
}

- (id)newModelWithChangeType:(unint64_t)a3
{
  void *v5;
  HMDUserModel *v6;
  void *v7;
  void *v8;
  HMDUserModel *v9;

  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HMDUserModel alloc];
  -[HMDUser uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v8);

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v7;
  HMDResidentUserModel *v8;
  void *v9;
  void *v10;
  HMDResidentUserModel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
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

  -[HMDUser home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDUser isRemoteGateway](self, "isRemoteGateway"))
  {
    v8 = [HMDResidentUserModel alloc];
    -[HMDUser uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v8, "initWithObjectChangeType:uuid:parentUUID:", a3, v9, v10);

  }
  else
  {
    v11 = -[HMDUser newModelWithChangeType:](self, "newModelWithChangeType:", a3);
  }
  -[HMDUser accountHandle](self, "accountHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setAccountHandle:](v11, "setAccountHandle:", v12);

  -[HMDUser accountIdentifier](self, "accountIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDUser accountIdentifier](self, "accountIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentUserModel setAccountIdentifier:](v11, "setAccountIdentifier:", v14);

  }
  if (a4 < 3)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setPrivilege:](v11, "setPrivilege:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setRemoteAccessAllowed:](v11, "setRemoteAccessAllowed:", v16);

  if (a4 == 3)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "number");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentUserModel setPresenceAuthorizationStatus:](v11, "setPresenceAuthorizationStatus:", v20);

    }
    v17 = 1;
  }
  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hmd_dictionaryEncoding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setPairingIdentity:](v11, "setPairingIdentity:", v22);

  -[HMDUser userID](self, "userID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setUserID:](v11, "setUserID:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setCamerasAccessLevel:](v11, "setCamerasAccessLevel:", v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserModel setAudioAnalysisUserDropInAccessLevel:](v11, "setAudioAnalysisUserDropInAccessLevel:", v25);

  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setMatterCASEAuthenticatedTagID:](v11, "setMatterCASEAuthenticatedTagID:", v26);

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentUserModel setAnnounceAccessAllowed:](v11, "setAnnounceAccessAllowed:", v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentUserModel setAnnounceAccessLevel:](v11, "setAnnounceAccessLevel:", v28);

  }
  return v11;
}

- (void)removeCloudData
{
  void *v3;
  HMDUser *v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing user cloud data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  queue = v4->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__HMDUser_removeCloudData__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v4;
  dispatch_async(queue, block);
}

- (id)dictionaryEncoding
{
  void *v3;
  unint64_t v4;
  _BOOL8 v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[HMDUser userID](self, "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDUser privilege](self, "privilege");
  v5 = -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  v6 = -[HMDUser camerasAccessLevel](self, "camerasAccessLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUser userDictionaryWithUserID:privilege:remoteAccessAllowed:cameraAccessLevel:announceAccessAllowed:announceAccessLevel:audioAnalysisUserDropInAccessLevel:](HMDUser, "userDictionaryWithUserID:privilege:remoteAccessAllowed:cameraAccessLevel:announceAccessAllowed:announceAccessLevel:audioAnalysisUserDropInAccessLevel:", v3, v4, v5, v6, v7, -[HMDUser announceAccessLevel](self, "announceAccessLevel"), -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)settingsController:(id)a3 didUpdateWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[HMDUser postUserSettingsUpdatedNotificationWithReason:](self, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("User Settings Updated"));
  v5[2](v5, 0);

}

- (id)settingsController:(id)a3 willUpdateSettingAtKeyPath:(id)a4 withValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  HMDSettingAttachedSettingUpdate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  HMDSettingOnChangeAttachedUpdatesResult *v19;
  HMDSettingOnChangeAttachedUpdatesResult *v20;
  void *v22;
  void *v23;
  void *v24;
  HMDUser *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDSettingAttachedSettingUpdate *v29;
  HMDSettingOnChangeAttachedUpdatesResult *v30;
  void *v31;
  _QWORD aBlock[5];
  HMDSettingAttachedSettingUpdate *v33;
  HMDSettingAttachedSettingUpdate *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("root.siri.identifyVoice"))
    && objc_msgSend(v10, "type") == 2)
  {
    objc_msgSend(v10, "numberValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToNumber:", &unk_1E8B34ED8);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (HMDSettingAttachedSettingUpdate *)objc_claimAutoreleasedReturnValue();
      -[HMDUser userDataController](self, "userDataController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateListeningHistoryModelToReset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDSettingAttachedSettingUpdate addObject:](v13, "addObject:", v15);
      if (-[HMDUser isOwner](self, "isOwner"))
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke;
        aBlock[3] = &unk_1E89C2730;
        aBlock[4] = self;
        v16 = _Block_copy(aBlock);
      }
      else
      {
        -[HMDUser userDataController](self, "userDataController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "assistantAccessControlModelToReset");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[HMDSettingAttachedSettingUpdate addObject:](v13, "addObject:", v23);
        }
        else
        {
          v24 = (void *)MEMORY[0x1D17BA0A0]();
          v25 = self;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v36 = v27;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not get access control model to turn off voice ID!", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v24);
        }

        v16 = 0;
      }
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA820]), "initNumberSettingWithValue:", &unk_1E8B34ED8);
      v29 = -[HMDSettingAttachedSettingUpdate initWithKeyPath:settingValue:]([HMDSettingAttachedSettingUpdate alloc], "initWithKeyPath:settingValue:", CFSTR("root.music.playbackInfluencesForYou"), v28);
      v30 = [HMDSettingOnChangeAttachedUpdatesResult alloc];
      v34 = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDSettingOnChangeAttachedUpdatesResult initWithSettingsToUpdate:models:onCommitCompletion:](v30, "initWithSettingsToUpdate:models:onCommitCompletion:", v31, v13, v16);

      goto LABEL_17;
    }
    objc_msgSend(v10, "numberValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToNumber:", &unk_1E8B34EF0);

    if (v18)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA820]), "initNumberSettingWithValue:", &unk_1E8B34EF0);
      v13 = -[HMDSettingAttachedSettingUpdate initWithKeyPath:settingValue:]([HMDSettingAttachedSettingUpdate alloc], "initWithKeyPath:settingValue:", CFSTR("root.music.allowiTunesAccount"), v16);
      v19 = [HMDSettingOnChangeAttachedUpdatesResult alloc];
      v33 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDSettingOnChangeAttachedUpdatesResult initWithSettingsToUpdate:models:onCommitCompletion:](v19, "initWithSettingsToUpdate:models:onCommitCompletion:", v15, MEMORY[0x1E0C9AA60], 0);
LABEL_17:

      goto LABEL_9;
    }
  }
  v20 = 0;
LABEL_9:

  return v20;
}

- (id)settingsControllerFollowerKeyPaths:(id)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("root.music.allowiTunesAccount");
  v5[0] = CFSTR("root.siri.identifyVoice");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isRunningOnHomeOwnersDevice
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HMDUser home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)didStartBackingStoreController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDUser userDataController](self, "userDataController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleStartForZoneController:", v4);

}

- (void)didStartLocalZoneForBackingStoreController:(id)a3
{
  id v4;
  void *v5;
  HMDUser *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Did start local zone for backing store controller: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUser privateBackingStoreController](v6, "privateBackingStoreController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    -[HMDUser configurePersonSettingsManager](v6, "configurePersonSettingsManager");
  }
  else
  {
    -[HMDUser sharedBackingStoreController](v6, "sharedBackingStoreController");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v4)
      -[HMDUser configurePhotosPersonDataManager](v6, "configurePhotosPersonDataManager");
  }

}

- (void)didStopBackingStoreController:(id)a3
{
  id v4;
  void *v5;
  HMDUser *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  HMDUser *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Did stop backing store controller: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUser postUserSettingsUpdatedNotificationWithReason:](v6, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("User Settings Removed"));
  -[HMDUser privateBackingStoreController](v6, "privateBackingStoreController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Nil-ing out the person settings manager", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDUser setPersonSettingsManager:](v11, "setPersonSettingsManager:", 0);
  }

}

- (id)backingStoreController:(id)a3 createParticipantManagerForCloudZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  HMDCloudShareParticipantsManager *v10;
  OS_dispatch_queue *queue;
  void *v12;
  HMDCloudShareParticipantsManager *v13;

  v6 = a4;
  v7 = a3;
  -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = [HMDCloudShareParticipantsManager alloc];
    queue = self->_queue;
    -[HMDUser home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDCloudShareParticipantsManager initWithQueue:cloudZone:home:](v10, "initWithQueue:cloudZone:home:", queue, v6, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)backingStoreController:(id)a3 didUpdatePhotosPersonManagerSettingsModel:(id)a4 previousPhotosPersonManagerSettingsModel:(id)a5
{
  NSObject *queue;
  id v7;
  id v8;

  queue = self->_queue;
  v7 = a4;
  dispatch_assert_queue_V2(queue);
  -[HMDUser photosPersonDataManager](self, "photosPersonDataManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleUpdatedSettingsModel:", v7);

}

- (BOOL)userDataController:(id)a3 isPersonalRequestCapableAccessoryID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  HMDUser *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  HMDUser *v20;
  void *v21;
  HMDUser *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v18;
      v30 = 2112;
      v31 = v7;
      v19 = "%{public}@Don't have home to find accessory %@.";
LABEL_9:
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v15);
    goto LABEL_11;
  }
  if (!v9)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v18;
      v30 = 2112;
      v31 = v7;
      v19 = "%{public}@Did not find accessory %@.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v11 = objc_msgSend(v9, "supportsPersonalRequests");
  if ((v11 & 1) != 0)
  {
    v14 = 1;
    goto LABEL_14;
  }
LABEL_11:
  v21 = (void *)MEMORY[0x1D17BA0A0](v11, v12, v13);
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "category");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v10, "supportsPersonalRequests");
    v28 = 138544386;
    v29 = v24;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v25;
    v36 = 1024;
    v37 = v26;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);

  }
  objc_autoreleasePoolPop(v21);
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)userDataController:(id)a3 isMediaContentProfileCapableAccessoryID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  HMDUser *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  HMDUser *v20;
  void *v21;
  HMDUser *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v18;
      v30 = 2112;
      v31 = v7;
      v19 = "%{public}@Don't have home to find accessory %@.";
LABEL_9:
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v15);
    goto LABEL_11;
  }
  if (!v9)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v18;
      v30 = 2112;
      v31 = v7;
      v19 = "%{public}@Did not find accessory %@.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v11 = objc_msgSend(v9, "supportsMediaContentProfile");
  if ((v11 & 1) != 0)
  {
    v14 = 1;
    goto LABEL_14;
  }
LABEL_11:
  v21 = (void *)MEMORY[0x1D17BA0A0](v11, v12, v13);
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "category");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v10, "supportsMediaContentProfile");
    v28 = 138544386;
    v29 = v24;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v25;
    v36 = 1024;
    v37 = v26;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);

  }
  objc_autoreleasePoolPop(v21);
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)userDataController:(id)a3 isAccessoryUserListeningHistoryUpdateCapable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  HMDUser *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v7;
      v21 = "%{public}@Don't have home to find accessory %@.";
LABEL_15:
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v23, 0x16u);

    }
LABEL_16:

    objc_autoreleasePoolPop(v18);
    LOBYTE(v17) = 0;
    goto LABEL_19;
  }
  if (!v9)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v7;
      v21 = "%{public}@Did not find accessory %@.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  v13 = v10;
  objc_opt_class();
  v14 = objc_opt_isKindOfClass() & 1;
  if (v14)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  if (v14)
    LOBYTE(v17) = 1;
  else
    LODWORD(v17) = objc_msgSend(v12, "supportsSiriEndpoint");

LABEL_19:
  return (char)v17;
}

- (void)userDataControllerDidUpdateAssistantAccessControl:(id)a3
{
  -[HMDUser postUserSettingsUpdatedNotificationWithReason:](self, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("Assistant Access Control Updated"));
}

- (void)userDataControllerDidUpdateMediaContentProfile:(id)a3
{
  -[HMDUser postUserSettingsUpdatedNotificationWithReason:](self, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("Media Content Profile Access Control Updated"));
}

- (void)postUserSettingsUpdatedNotificationWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDUser home](self, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyClientsOfUserSettingsChangeWithReason:sourceUUID:", v4, v6);

}

- (BOOL)userDataController:(id)a3 isAppleMediaAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDUser *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  HMDUser *v16;
  id v17;
  char isKindOfClass;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v7;
      v15 = "%{public}@Don't have home to find accessory %@.";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v11);
    goto LABEL_9;
  }
  if (!v9)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v7;
      v15 = "%{public}@Did not find accessory %@.";
LABEL_7:
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  v17 = v10;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & (v17 != 0);
}

- (BOOL)userDataController:(id)a3 isHAPAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDUser *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  HMDUser *v16;
  id v17;
  char isKindOfClass;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v7;
      v15 = "%{public}@Don't have home to find accessory %@.";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v11);
    goto LABEL_9;
  }
  if (!v9)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v7;
      v15 = "%{public}@Did not find accessory %@.";
LABEL_7:
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  v17 = v10;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & (v17 != 0);
}

- (void)userDataControllerDidUpdateUserListeningHistoryUpdateControl:(id)a3
{
  -[HMDUser postUserSettingsUpdatedNotificationWithReason:](self, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("User Listening History Update Control Updated"));
}

- (void)updateSupportsHH2MigrationByOwnerManual:(BOOL)a3 supportsHH2MigrationByOwnerAuto:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  v4 = a4;
  v5 = a3;
  -[HMDUser userDataController](self, "userDataController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__HMDUser_updateSupportsHH2MigrationByOwnerManual_supportsHH2MigrationByOwnerAuto___block_invoke;
  v8[3] = &unk_1E89BB530;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v7, "updateSupportsHH2MigrationByOwnerManual:supportsHH2MigrationByOwnerAuto:completion:", v5, v4, v8);

}

- (void)userDataControllerDidUpdateSupportsAutomaticHH2Migration:(id)a3
{
  -[HMDUser postUserSettingsUpdatedNotificationWithReason:](self, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("User Automatic HH2 Migration Updated"));
}

- (void)removeCloudShareID
{
  void *v3;
  void *v4;
  HMDUser *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDUser cloudShareID](self, "cloudShareID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing cloud share id", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDUser setCloudShareID:](v5, "setCloudShareID:", 0);
    -[HMDUser home](v5, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveToCurrentAccountWithReason:", CFSTR("HMDUserCloudShareIDCodingKey"));

  }
}

- (void)updateCloudShareID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDUser *v9;
  NSObject *v10;
  void *v11;
  HMDAssertionLogEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDUser *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser cloudShareID](self, "cloudShareID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDUser setCloudShareID:](self, "setCloudShareID:", v4);
    -[HMDUser home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "saveToCurrentAccountWithReason:", CFSTR("HMDUserCloudShareIDCodingKey"));

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@User has updated their cloud share id and is cloud share ready", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDUser cloudShareIDFuture](v16, "cloudShareIDFuture");
    v12 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
    -[HMDUser cloudShareID](v16, "cloudShareID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssertionLogEvent finishWithResult:](v12, "finishWithResult:", v13);
    goto LABEL_9;
  }
  -[HMDUser cloudShareID](self, "cloudShareID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cloud Share ID has unexpectedly changed", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Cloud Share ID has unexpectedly changed"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitLogEvent:", v12);
LABEL_9:

  }
}

- (id)trustTargetUUID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (trustTargetUUID_onceToken != -1)
    dispatch_once(&trustTargetUUID_onceToken, &__block_literal_global_528);
  v3 = (void *)MEMORY[0x1E0CB3A28];
  v4 = trustTargetUUID_namespace;
  -[HMDUser uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_UUIDWithNamespace:data:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)configureCloudShareTrustManager
{
  void *v3;
  HMDCloudShareMessenger *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCloudShareTrustManager *v8;
  void *v9;
  _BOOL8 v10;
  OS_dispatch_queue *queue;
  void *v12;
  void *v13;
  void *v14;
  HMDCloudShareTrustManager *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  HMDCloudShareMessenger *v19;
  _QWORD block[5];

  if (-[HMDUser isOwner](self, "isOwner"))
  {
    -[HMDUser home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = [HMDCloudShareMessenger alloc];
      -[HMDUser trustTargetUUID](self, "trustTargetUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMDCloudShareMessenger initWithMessageTargetUUID:workQueue:home:](v4, "initWithMessageTargetUUID:workQueue:home:", v5, self->_queue, v3);

      objc_msgSend(v3, "homeManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metricsManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = [HMDCloudShareTrustManager alloc];
      +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMDUser isCurrentUser](self, "isCurrentUser");
      queue = self->_queue;
      -[HMDUser cloudShareID](self, "cloudShareID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logEventSubmitter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dailyScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMDCloudShareTrustManager initWithDatabase:isOwnedTrust:queue:shareMessenger:ownerCloudShareID:logEventSubmitter:dailyScheduler:](v8, "initWithDatabase:isOwnedTrust:queue:shareMessenger:ownerCloudShareID:logEventSubmitter:dailyScheduler:", v9, v10, queue, v19, v12, v13, v14);
      -[HMDUser setCloudShareTrustManager:](self, "setCloudShareTrustManager:", v15);

      -[HMDUser cloudShareTrustManager](self, "cloudShareTrustManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDataSource:", self);

      -[HMDUser cloudShareTrustManager](self, "cloudShareTrustManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDelegate:", self);

      v18 = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__HMDUser_configureCloudShareTrustManager__block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = self;
      dispatch_async(v18, block);

    }
  }
}

- (BOOL)cloudShareTrustManager:(id)a3 shouldShareTrustWithUser:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v10;
  HMDUser *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[HMDUser isOwner](self, "isOwner")
    && -[HMDUser isCurrentUser](self, "isCurrentUser")
    && (objc_msgSend(v7, "isOwner") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Will share cloud share trust with user: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)zoneNameForCloudShareTrustManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDUser uuid](self, "uuid", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("trust-"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isOwnerCapableForTrustManager:(id)a3
{
  void *v3;
  char v4;

  -[HMDUser home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOwnerTrustZoneCapable");

  return v4;
}

- (void)cloudShareTrustManager:(id)a3 didFetchOwnerCloudShareID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDUser *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust manager did fetch owner cloud share id: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDUser updateCloudShareID:](v9, "updateCloudShareID:", v7);
  -[HMDUser setUserCloudShareWithOwnerMessagingState:](v9, "setUserCloudShareWithOwnerMessagingState:", 1);

}

- (void)didFinishConfiguringForCloudShareTrustManager:(id)a3
{
  id v4;
  void *v5;
  HMDUser *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Trust has been configured", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)didRemoveTrustZoneInCloudShareTrustManager:(id)a3
{
  id v4;
  void *v5;
  HMDUser *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed cloud share trust", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUser setUserCloudShareWithOwnerMessagingState:](v6, "setUserCloudShareWithOwnerMessagingState:", 0);

}

- (void)cloudShareTrustManager:(id)a3 didRemoveUserWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDUser *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v9;
      v15 = "%{public}@Trust manager removed user: %@";
      v16 = v12;
      v17 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, v17);

    }
  }
  else if (v13)
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v14;
    v15 = "%{public}@Trust manager removed unknown user";
    v16 = v12;
    v17 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v10);
}

- (void)registerIDSActivityObserver:(id)a3 subActivity:(id)a4 subjectDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "registerObserverDeviceIdentifier:observerPushToken:subActivity:subjectDeviceIdentifier:", v11, v12, v9, v13);
}

- (void)updateIDSActivityObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updateObserverDeviceIdentifier:observerPushToken:", v5, v6);
}

- (void)deregisterIDSActivityObserver:(id)a3 subActivity:(id)a4 subjectDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "deregisterObserverDeviceIdentifier:observerPushToken:subActivity:subjectDeviceIdentifier:", v11, v12, v9, v13);
}

- (void)deregisterIDSActivityObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterObserverDeviceIdentifier:", v4);

}

- (id)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HMDUser sharedBackingStoreController](self, "sharedBackingStoreController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "queryPushTokensForDevicesObservingSubjectDevice:subActivity:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)applyConditionalValueUpdateToModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDUser *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMDUser *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_530);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Aggregating settings to migrate user settings for Accessories = %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_531;
  v13[3] = &unk_1E89BB598;
  v14 = v7;
  v15 = v9;
  v12 = v7;
  objc_msgSend(v4, "na_each:", v13);

}

- (BOOL)_isExplicitContentValueEnabledForAppleMediaAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "settingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke;
  v8[3] = &unk_1E89BB5E8;
  v8[4] = self;
  LOBYTE(self) = objc_msgSend(v6, "na_any:", v8);

  return (char)self;
}

- (id)allAccessoryUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDUser home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_589);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)matterCASEAuthenticatedTagID
{
  return self->_matterCASEAuthenticatedTagID;
}

- (void)setMatterCASEAuthenticatedTagID:(id)a3
{
  objc_storeStrong((id *)&self->_matterCASEAuthenticatedTagID, a3);
}

- (HMBShareUserID)cloudShareID
{
  return (HMBShareUserID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCloudShareID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NAFuture)cloudShareIDFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 160, 1);
}

- (HMDUserPhotosPersonDataManager)photosPersonDataManager
{
  return (HMDUserPhotosPersonDataManager *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPhotosPersonDataManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (HMDPersonSettingsManager)personSettingsManager
{
  return (HMDPersonSettingsManager *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPersonSettingsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)accessCode
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAccessCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSUUID)accessCodeChangedByUserUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAccessCodeChangedByUserUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (HMDUserDataController)userDataController
{
  return (HMDUserDataController *)objc_getProperty(self, a2, 200, 1);
}

- (void)setUserDataController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (unint64_t)userAccessPolicy
{
  return self->_userAccessPolicy;
}

- (HMDSettingsControllerDependency)sharedSettingsControllerDependency
{
  return (HMDSettingsControllerDependency *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSharedSettingsControllerDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (HMDSettingsControllerDependency)privateSettingsControllerDependency
{
  return (HMDSettingsControllerDependency *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPrivateSettingsControllerDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 232, 1);
}

- (void)setShareMessenger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (HMDUserSettingsBackingStoreController)privateBackingStoreController
{
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPrivateBackingStoreController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)needsiTunesMultiUserRepair
{
  return self->_needsiTunesMultiUserRepair;
}

- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3
{
  self->_needsiTunesMultiUserRepair = a3;
}

- (HMDUserDataSource)dataSource
{
  return (HMDUserDataSource *)objc_getProperty(self, a2, 248, 1);
}

- (HMDSiriMultiUserNewLanguageNotificationManager)siriMultiUserNewLanguageNotificationManager
{
  return (HMDSiriMultiUserNewLanguageNotificationManager *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSiriMultiUserNewLanguageNotificationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 272, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (unint64_t)announceNotificationModeForCurrentDevice
{
  return self->_announceNotificationModeForCurrentDevice;
}

- (void)setAnnounceNotificationModeForCurrentDevice:(unint64_t)a3
{
  self->_announceNotificationModeForCurrentDevice = a3;
}

- (HMDCloudShareTrustManager)cloudShareTrustManager
{
  return (HMDCloudShareTrustManager *)objc_getProperty(self, a2, 288, 1);
}

- (void)setCloudShareTrustManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (HMDUserSettingsBackingStoreController)sharedBackingStoreController
{
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSharedBackingStoreController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_getProperty(self, a2, 304, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_sharedBackingStoreController, 0);
  objc_storeStrong((id *)&self->_cloudShareTrustManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_siriMultiUserNewLanguageNotificationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_privateBackingStoreController, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_privateSettingsControllerDependency, 0);
  objc_storeStrong((id *)&self->_sharedSettingsControllerDependency, 0);
  objc_storeStrong((id *)&self->_userDataController, 0);
  objc_storeStrong((id *)&self->_accessCodeChangedByUserUUID, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_personSettingsManager, 0);
  objc_storeStrong((id *)&self->_photosPersonDataManager, 0);
  objc_storeStrong((id *)&self->_cloudShareIDFuture, 0);
  objc_storeStrong((id *)&self->_cloudShareID, 0);
  objc_storeStrong((id *)&self->_matterCASEAuthenticatedTagID, 0);
  objc_storeStrong((id *)&self->_assistantAccessControl, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

uint64_t __27__HMDUser_allAccessoryUUID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke_2;
  v6[3] = &unk_1E89BB5C0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("root.music.allowExplicitContent"));

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@setting found = %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_531(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EFAADEE0))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(v5, "nameForKeyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("allowExplicitContent"));

      if (v7)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_2;
        v16[3] = &unk_1E89BEAD8;
        v8 = *(void **)(a1 + 32);
        v16[4] = *(_QWORD *)(a1 + 40);
        v9 = objc_msgSend(v8, "na_any:", v16);
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v13;
          v19 = 2112;
          v20 = v14;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Aggregated value = %@ for allowExplicitContent", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setNumberValue:", v15);

      }
    }
  }

}

uint64_t __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@checking allowExplicitContent setting for accessory %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = objc_msgSend(*(id *)(a1 + 32), "_isExplicitContentValueEnabledForAppleMediaAccessory:", v3);

  return v8;
}

id __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __42__HMDUser_configureCloudShareTrustManager__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cloudShareTrustManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configure");

}

void __26__HMDUser_trustTargetUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("79E0D39A-83CC-42C1-99FC-5B4E0745E284"));
  v1 = (void *)trustTargetUUID_namespace;
  trustTargetUUID_namespace = v0;

}

void __83__HMDUser_updateSupportsHH2MigrationByOwnerManual_supportsHH2MigrationByOwnerAuto___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to completed updating supports automatic HH2 migration by owner manual to %@, by owner auto to %@ with error %@", (uint8_t *)&v12, 0x2Au);

    }
  }
  else if (v7)
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed updating supports automatic HH2 migration by owner", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  HMDAssistantAccessControl *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  HMDAssistantAccessControl *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Identify voice was turned off for owner.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = [HMDAssistantAccessControl alloc];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "assistantAccessControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");
  objc_msgSend(*(id *)(a1 + 32), "assistantAccessControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "areActivityNotificationsEnabledForPersonalRequests");
  v12 = -[HMDAssistantAccessControl initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:](v6, "initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:", v7, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v9, v11);

  objc_msgSend(*(id *)(a1 + 32), "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transaction:options:", CFSTR("userAssistantAccessControlUpdated"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAssistantAccessControl model](v12, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "add:withMessage:", v17, 0);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke_510;
  v18[3] = &unk_1E89C2350;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v16, "run:", v18);

}

void __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke_510(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Set assistant access control off on turning off voice identification %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __26__HMDUser_removeCloudData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isOwner"))
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudShareTrustManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeTrust");

  }
  objc_msgSend(*(id *)(a1 + 32), "sharedBackingStoreController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destroyZone");

  objc_msgSend(*(id *)(a1 + 32), "privateBackingStoreController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destroyZone");

  objc_msgSend(*(id *)(a1 + 32), "photosPersonDataManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCloudDataDueToUserRemoval");

}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAssistantAccessControl *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;

  v4 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "assistantAccessControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "assistantAccessControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = -[HMDAssistantAccessControl initWithUser:]([HMDAssistantAccessControl alloc], "initWithUser:", v6);
      -[HMDAssistantAccessControl modelID](v10, "modelID");
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    v12 = *(void **)(a1 + 56);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3;
    v15[3] = &unk_1E89BB440;
    objc_copyWeak(&v22, v4);
    v16 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 64);
    v23 = a2;
    v13 = v8;
    v20 = v13;
    objc_msgSend(v12, "cloudRecordWithObjectID:completionHandler:", v13, v15);

    objc_destroyWeak(&v22);
  }
  else
  {
    v14 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2;
    block[3] = &unk_1E89C1B48;
    v27 = *(id *)(a1 + 72);
    v25 = *(id *)(a1 + 40);
    v26 = *(id *)(a1 + 48);
    dispatch_async(v14, block);

    v13 = v27;
  }

}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_488(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  char v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  char v65;
  uint64_t v66;
  void *v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id *from;
  id v84;
  id v85;
  id v86;
  id *v87;
  uint64_t v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  id v107;
  id v108;
  _QWORD block[4];
  id v110;
  id v111;
  id v112;
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;
  __int16 v119;
  void *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v85 = a2;
  v84 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    from = (id *)(a1 + 80);
    v86 = WeakRetained;
    v87 = (id *)a1;
    objc_msgSend(WeakRetained, "pairingUsername");
    v88 = objc_claimAutoreleasedReturnValue();
    if (!v88)
    {
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v86;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v116 = v36;
        v117 = 2112;
        v118 = v34;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@User %@ does not have a pairing identity, cannot migrate", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      v32 = *(void **)(a1 + 64);
      if (!v32)
        goto LABEL_72;
      v37 = *(NSObject **)(a1 + 32);
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_490;
      v105[3] = &unk_1E89C1B48;
      v108 = v32;
      v106 = *(id *)(a1 + 40);
      v107 = *(id *)(a1 + 48);
      dispatch_async(v37, v105);

      v6 = v108;
      goto LABEL_71;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v7 = v85;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v102 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "extractObjectChange");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            v13 = (isKindOfClass & 1) != 0 ? v11 : 0;
            v14 = v13;
            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v11, "pairingIdentity");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HAP.identifier"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v16, "isEqualToString:", v88))
                objc_msgSend(v6, "addObject:", v11);

            }
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if ((v20 & 1) == 0)
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = v86;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v116 = v24;
          v117 = 2112;
          v118 = v25;
          v119 = 2112;
          v120 = v26;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing up user.uuid from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        v27 = v87[7];
        objc_msgSend(v22, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dropAllChangesWithObjectID:", v28);

        objc_msgSend(v17, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setUUID:", v29);

        objc_msgSend(v22, "configureWithHome:", v87[7]);
      }
      (*((void (**)(void))v87[9] + 2))();

LABEL_71:
      v32 = (void *)v88;
      goto LABEL_72;
    }
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v53 = (void *)MEMORY[0x1D17BA0A0]();
      v54 = v86;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "uuid");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v116 = v56;
        v117 = 2112;
        v118 = v57;
        _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find record for user %@, looking into transactions to determine new transaction is needed", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v53);
      objc_msgSend(v54, "home");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "uuid");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_491;
      v89[3] = &unk_1E89BB490;
      objc_copyWeak(&v92, from);
      v90 = v87[5];
      v91 = v87[9];
      objc_msgSend(v58, "cleanChangesIfNoAddChangeObjectID:completion:", v59, v89);

      objc_destroyWeak(&v92);
      goto LABEL_71;
    }
    objc_msgSend(v87[7], "uuid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "pairingIdentity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUser UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:](HMDUser, "UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:", 0, v38, 0, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v98 = 0u;
    v97 = 0u;
    v42 = v6;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
    if (v43)
    {
      v44 = 0;
      v45 = *(_QWORD *)v98;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v98 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
          objc_msgSend(v47, "uuid");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v40, "isEqual:", v48);

          if (v49)
          {
            v50 = v47;

            v44 = v50;
          }
          objc_msgSend(v47, "uuid");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v51);

        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
      }
      while (v43);

      if (v44)
      {
        objc_msgSend(v42, "removeObject:", v44);
        v52 = 0;
LABEL_47:
        if ((objc_msgSend(v41, "containsObject:", v40) & 1) == 0)
          objc_msgSend(v41, "addObject:", v40);
        objc_msgSend(v87[7], "dropAllChangesWithArrayOfObjectIDs:", v41);
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v6 = v42;
        v60 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
        if (v60)
        {
          v61 = *(_QWORD *)v94;
          do
          {
            for (k = 0; k != v60; ++k)
            {
              if (*(_QWORD *)v94 != v61)
                objc_enumerationMutation(v6);
              v63 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * k);
              objc_msgSend(v63, "setObjectChangeType:", 3);
              objc_msgSend(v87[5], "addObject:", v63);
            }
            v60 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
          }
          while (v60);
        }

        objc_msgSend(v86, "uuid");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "isEqual:", v40);

        if ((v65 & 1) == 0)
        {
          v67 = (void *)MEMORY[0x1D17BA0A0]();
          v68 = v86;
          HMFGetOSLogHandle();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "uuid");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v116 = v70;
            v117 = 2112;
            v118 = v71;
            v119 = 2112;
            v120 = v40;
            _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing up user.uuid from %@ to calculated %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v67);
          objc_msgSend(v68, "setUUID:", v40);
          v66 = objc_msgSend(v68, "configureWithHome:", v87[7]);
        }
        if ((v52 & 1) != 0)
        {
          v72 = (void *)MEMORY[0x1D17BA0A0](v66);
          v73 = v86;
          HMFGetOSLogHandle();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v116 = v75;
            _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@Missing cloud record for owner user, creating", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v72);
          v76 = v87[5];
          objc_msgSend(v73, "modelObjectWithChangeType:", 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "addObject:", v77);

          (*((void (**)(void))v87[9] + 2))();
        }
        else
        {
          objc_msgSend(v87[7], "dropAllChangesWithObjectID:", v40);
          objc_msgSend(v86, "modelObjectWithChangeType:", 2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v79 = v78;
          else
            v79 = 0;
          v80 = v79;

          if (v80)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "UUIDString");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setChangeTag:", v82);

            objc_msgSend(v87[5], "addObject:", v80);
          }
          (*((void (**)(void))v87[9] + 2))();

        }
        goto LABEL_71;
      }
    }
    else
    {

      v44 = 0;
    }
    v52 = 1;
    goto LABEL_47;
  }
  v30 = *(void **)(a1 + 64);
  if (v30)
  {
    v86 = 0;
    v31 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3_489;
    block[3] = &unk_1E89C1B48;
    v112 = v30;
    v110 = *(id *)(a1 + 40);
    v111 = *(id *)(a1 + 48);
    dispatch_async(v31, block);

    v32 = v112;
LABEL_72:

    WeakRetained = v86;
  }

}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_493(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char isKindOfClass;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  HMDUserModel *v29;
  void *v30;
  HMDUserModel *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMDObsoleteUserModel *v48;
  void *v49;
  void *v50;
  HMDObsoleteUserModel *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  HMDUserModel *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  id obj;
  _QWORD block[4];
  id v80;
  id v81;
  id v82;
  _QWORD v83[5];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  id v98;
  id v99;
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pairingUsername");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v75 = a1;
      v77 = (void *)v9;
      v71 = v8;
      v69 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v70 = v5;
      obj = v5;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v89 != v13)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "extractObjectChange");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v17 = (isKindOfClass & 1) != 0 ? v15 : 0;
              v18 = v17;
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v15, "pairingIdentity");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("HAP.identifier"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v20, "isEqualToString:", v77))
                  objc_msgSend(v72, "addObject:", v15);

              }
            }

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
        }
        while (v12);
      }

      if ((unint64_t)objc_msgSend(v72, "count") >= 2)
      {
        objc_msgSend(*(id *)(a1 + 56), "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pairingIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDUser UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:](HMDUser, "UUIDWithUserID:forHomeIdentifier:uuid:pairingIdentity:", 0, v21, 0, v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = v8;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v103 = v27;
          v104 = 2112;
          v105 = v23;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Duplicate users: forcing add/update for user uuid %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        v73 = v25;
        objc_msgSend(v25, "modelObjectWithChangeType:", 1);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = [HMDUserModel alloc];
        objc_msgSend(*(id *)(a1 + 56), "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v29, "initWithObjectChangeType:uuid:parentUUID:", 1, v23, v30);

        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserModel setChangeTag:](v31, "setChangeTag:", v33);

        v68 = (void *)v28;
        v34 = -[HMDBackingStoreModelObject merge:](v31, "merge:", v28);
        v67 = v31;
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v31);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v23);
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v76 = v72;
        v35 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
        v36 = (void *)v23;
        if (v35)
        {
          v37 = v35;
          v38 = *(_QWORD *)v85;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v85 != v38)
                objc_enumerationMutation(v76);
              v40 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
              objc_msgSend(v40, "uuid");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v36, "isEqual:", v41);

              if ((v42 & 1) == 0)
              {
                v43 = (void *)MEMORY[0x1D17BA0A0]();
                v44 = v73;
                HMFGetOSLogHandle();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "uuid");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v103 = v46;
                  v104 = 2112;
                  v105 = (uint64_t)v47;
                  _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Duplicate user: obsoleting user uuid %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v43);
                v48 = [HMDObsoleteUserModel alloc];
                objc_msgSend(v40, "uuid");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                a1 = v75;
                objc_msgSend(*(id *)(v75 + 56), "uuid");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v48, "initWithObjectChangeType:uuid:parentUUID:", 1, v49, v50);

                v83[0] = MEMORY[0x1E0C809B0];
                v83[1] = 3221225472;
                v83[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_497;
                v83[3] = &unk_1E89BB4E0;
                v83[4] = v40;
                objc_msgSend(obj, "hmf_objectPassingTest:", v83);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v52;
                if (v52 && objc_msgSend(v52, "encodeObjectChange:", v51))
                  objc_msgSend(*(id *)(v75 + 64), "updateCloudRecord:completionHandler:", v53, 0);
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "UUIDString");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDObsoleteUserModel setChangeTag:](v51, "setChangeTag:", v55);

                objc_msgSend(*(id *)(v75 + 40), "addObject:", v51);
                objc_msgSend(v40, "uuid");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "addObject:", v56);

              }
            }
            v37 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
          }
          while (v37);
        }

        objc_msgSend(*(id *)(a1 + 56), "dropAllChangesWithArrayOfObjectIDs:", v74);
      }
      v57 = *(void **)(v75 + 72);
      if (v57)
      {
        v58 = *(NSObject **)(v75 + 32);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_499;
        block[3] = &unk_1E89C1B48;
        v82 = v57;
        v80 = *(id *)(v75 + 40);
        v81 = *(id *)(v75 + 48);
        dispatch_async(v58, block);

      }
      v6 = v69;
      v5 = v70;
      v8 = v71;
      v10 = v77;
    }
    else
    {
      v61 = (void *)MEMORY[0x1D17BA0A0]();
      v62 = v8;
      HMFGetOSLogHandle();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v103 = v64;
        v104 = 2112;
        v105 = (uint64_t)v62;
        _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_ERROR, "%{public}@User %@ does not have a pairing identity, cannot migrate", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v61);
      v65 = *(void **)(a1 + 72);
      if (!v65)
      {
        v10 = 0;
        goto LABEL_46;
      }
      v66 = *(NSObject **)(a1 + 32);
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_495;
      v92[3] = &unk_1E89C1B48;
      v95 = v65;
      v93 = *(id *)(a1 + 40);
      v94 = *(id *)(a1 + 48);
      dispatch_async(v66, v92);

      v72 = v95;
    }

LABEL_46:
    goto LABEL_47;
  }
  v59 = *(void **)(a1 + 72);
  if (v59)
  {
    v60 = *(NSObject **)(a1 + 32);
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_494;
    v96[3] = &unk_1E89C1B48;
    v99 = v59;
    v97 = *(id *)(a1 + 40);
    v98 = *(id *)(a1 + 48);
    dispatch_async(v60, v96);

    v10 = v99;
    goto LABEL_46;
  }
LABEL_47:

}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_494(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_495(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_497(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_499(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3_489(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_490(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_491(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (a2 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Missing cloud record for owner user, creating", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v8, "modelObjectWithChangeType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "assistantAccessControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!v5)
      {
        v25 = *(void **)(a1 + 56);
        objc_msgSend(v8, "assistantAccessControl");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "modelID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_5;
        v40[3] = &unk_1E89BB418;
        objc_copyWeak(&v45, (id *)(a1 + 80));
        v41 = *(id *)(a1 + 40);
        v44 = *(id *)(a1 + 72);
        v42 = *(id *)(a1 + 32);
        v43 = *(id *)(a1 + 48);
        objc_msgSend(v25, "cleanChangesIfNoAddChangeObjectID:completion:", v27, v40);

        objc_destroyWeak(&v45);
        goto LABEL_22;
      }
      if (*(_BYTE *)(a1 + 88))
      {
        objc_msgSend(v8, "assistantAccessControl");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "model");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setObjectChangeType:", 1);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setChangeTag:", v13);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      }
    }
    else
    {
      if (!v5)
      {
        objc_msgSend(v8, "home");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 64);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_483;
        v34[3] = &unk_1E89BB418;
        objc_copyWeak(&v39, (id *)(a1 + 80));
        v35 = *(id *)(a1 + 48);
        v38 = *(id *)(a1 + 72);
        v36 = *(id *)(a1 + 32);
        v37 = *(id *)(a1 + 40);
        objc_msgSend(v28, "cleanChangesIfNoAddChangeObjectID:completion:", v29, v34);

        objc_destroyWeak(&v39);
        goto LABEL_22;
      }
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v8;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Assistant access control does not exist but cloud record does, re-running it to add access control", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v5, "extractObjectChange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v21 = v19;
        else
          v21 = 0;
        v22 = v21;
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);

      }
    }
    v23 = *(void **)(a1 + 72);
    if (v23)
    {
      v24 = *(NSObject **)(a1 + 32);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_485;
      v30[3] = &unk_1E89C1B48;
      v33 = v23;
      v31 = *(id *)(a1 + 40);
      v32 = *(id *)(a1 + 48);
      dispatch_async(v24, v30);

    }
  }
  else
  {
    v14 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_4;
    block[3] = &unk_1E89C1B48;
    v49 = *(id *)(a1 + 72);
    v47 = *(id *)(a1 + 40);
    v48 = *(id *)(a1 + 48);
    dispatch_async(v14, block);

  }
LABEL_22:

}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && (a2 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Missing cloud record for Assistant access control but object exists, creating add transaction to push to cloud", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "assistantAccessControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setObjectChangeType:", 1);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

  }
  v13 = *(void **)(a1 + 56);
  if (v13)
  {
    v14 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_481;
    block[3] = &unk_1E89C1B48;
    v18 = v13;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    dispatch_async(v14, block);

  }
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_483(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  HMDAssistantAccessControl *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && (a2 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Assistant access control does not exist and cloud record does not exist, creating default Assistant access control", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = -[HMDAssistantAccessControl initWithUser:]([HMDAssistantAccessControl alloc], "initWithUser:", v8);
    -[HMDAssistantAccessControl model](v11, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setObjectChangeType:", 1);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
    }

  }
  v14 = *(void **)(a1 + 56);
  if (v14)
  {
    v15 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_484;
    block[3] = &unk_1E89C1B48;
    v19 = v14;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    dispatch_async(v15, block);

  }
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_485(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_484(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_481(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (uint64_t)announceUserAccessLevelFromAnnounceAccessAllowed:(void *)a3 announceAccessLevel:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "unsignedIntegerValue");
      v9 = 1;
      if (v8 == 2)
        v9 = 2;
      if (v8)
        a1 = v9;
      else
        a1 = 0;
    }
    else if (objc_msgSend(v5, "BOOLValue"))
    {
      a1 = 2;
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

void __53__HMDUser__transactionUserUpdated_newValues_message___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), 0);

  }
}

id __28__HMDUser__encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __28__HMDUser__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __42__HMDUser_updateAnnounceNotificationMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnnounceNotificationMode:", *(_QWORD *)(a1 + 40));
}

void __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userDataController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "userDataController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enableUserListeningHistoryForAccessory:", *(_QWORD *)(a1 + 40));

  }
}

void __73__HMDUser__handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);

  }
}

uint64_t __72__HMDUser_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:", *(_QWORD *)(a1 + 40));
}

void __57__HMDUser__handleMediaContentProfileAccessControlUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);

  }
}

uint64_t __56__HMDUser_handleMediaContentProfileAccessControlUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMediaContentProfileAccessControlUpdate:", *(_QWORD *)(a1 + 40));
}

void __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);

  }
}

uint64_t __46__HMDUser_handleAssistantAccessControlUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAssistantAccessControlUpdate:", *(_QWORD *)(a1 + 40));
}

void __43__HMDUser__handleShareClientRepairRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send remote share client repair message: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
  }

}

void __72__HMDUser__sendSecureShareClientPayloadToMostEligibleDevice_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x1E0CB9FE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v12;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received user share message response. nonce:%@ Error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __47__HMDUser__handleMultiUserSharePayloadRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send cloud share with owner message. Error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 40), "_handleCloudShareWithOwnerMessageError");
    }
    if (v5)
    {
      v14 = *MEMORY[0x1E0CB9FE8];
      v15 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v13)[2](v13, v6, v12);

  }
}

id __47__HMDUser__handleLegacyPairingIdentityRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  if ((*(_BYTE *)(a1 + 32) & 0x10) != 0)
  {
    v4 = (objc_class *)MEMORY[0x1E0D28650];
    v5 = a2;
    v6 = [v4 alloc];
    objc_msgSend(v5, "identifier");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privateKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)objc_msgSend(v6, "initWithIdentifier:publicKey:privateKey:", v2, v7, v8);
  }
  else
  {
    v2 = a2;
    objc_msgSend(v2, "publicPairingIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

void __32__HMDUser_setAccountIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
    __handleUpdatedAccount(*(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveToCurrentAccountWithReason:", CFSTR("userUserIDUpdated"));

}

void __28__HMDUser_setAccountHandle___block_invoke(uint64_t a1)
{
  __handleUpdatedAccount(*(void **)(a1 + 32));
}

void __57__HMDUser_updateSharedBackingStoreControllerParticipants__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sharedBackingStoreController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateParticipants");

}

void __58__HMDUser_recoverUserCloudDataDueToUUIDChangeFromOldUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_recoverUserSettingsDueToUUIDChange");
  objc_msgSend(*(id *)(a1 + 32), "_recoverTrustManagerDueToUUIDChange");
  objc_msgSend(*(id *)(a1 + 32), "photosPersonDataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recoverDueToUUIDChangeFromOldUUID:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "walletKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recoverDueToUUIDChangeOfUser:fromOldUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __47__HMDUser_handleUserDataControllerInitialized___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v4;
  HMDSiriMultiUserNewLanguageNotificationManager *v5;
  void *v6;
  void *v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentUser"))
  {
    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "productClass");

    if (v3 == 1)
    {
      v4 = -[HMDSiriMultiUserNewLanguageNotificationManagerContext initWithUser:workQueue:]([HMDSiriMultiUserNewLanguageNotificationManagerContext alloc], "initWithUser:workQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
      -[HMDSiriMultiUserNewLanguageNotificationManagerContext configure](v4, "configure");
      v5 = -[HMDSiriMultiUserNewLanguageNotificationManager initWithContext:]([HMDSiriMultiUserNewLanguageNotificationManager alloc], "initWithContext:", v4);
      objc_msgSend(*(id *)(a1 + 32), "setSiriMultiUserNewLanguageNotificationManager:", v5);

      objc_msgSend(*(id *)(a1 + 32), "siriMultiUserNewLanguageNotificationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "checkAllMediaAccessoriesAndPostNotificationIfNecessary");

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentUser"))
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCurrentUserEligibleForOwnerToAutoMigration");

  }
}

+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4 forceHH1Key:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  getCurrentPairingIdentityWithPrivilege(a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccountHandle:home:pairingIdentity:privilege:", v10, v7, v12, a3);
    objc_msgSend(v13, "refreshDisplayName");
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = 0;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4
{
  return (id)objc_msgSend(a1, "currentUserWithPrivilege:forHome:forceHH1Key:", a3, a4, 0);
}

+ (id)ownerWithUserID:(id)a3 home:(id)a4 pairingIdentity:(id)a5 homeManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMDAssistantAccessControl *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29 = 0;
  objc_msgSend(v13, "getOrCreateLocalPairingIdentity:", &v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v29;
  if (v14)
  {
    if (v10 && v12 && !objc_msgSend(v14, "isEqual:", v12))
    {
      +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "accountHandleFromString:", v10);
      v28 = objc_claimAutoreleasedReturnValue();

      v23 = objc_alloc(MEMORY[0x1E0D165A8]);
      objc_msgSend(v12, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "publicKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v23, "initWithIdentifier:publicKey:privateKey:permissions:", v24, v25, 0, 1);

      v17 = (HMDAssistantAccessControl *)v28;
      v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccountHandle:home:pairingIdentity:privilege:", v28, v11, v26, 3);

    }
    else
    {
      objc_msgSend(a1, "currentUserWithPrivilege:forHome:", 3, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMDAssistantAccessControl initWithUser:]([HMDAssistantAccessControl alloc], "initWithUser:", v16);
      objc_msgSend(v16, "setAssistantAccessControl:", v17);
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v16 = 0;
  }

  return v16;
}

+ (id)userIDForAccountHandle:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unprefixedURI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)UUIDWithUserID:(id)a3 forHomeIdentifier:(id)a4 uuid:(id)a5 pairingIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v12)
  {
    v15 = objc_msgSend(v12, "copy");
LABEL_3:
    v16 = (void *)v15;
    goto LABEL_11;
  }
  objc_msgSend(v13, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3A28];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("05A41D49-2A4D-4D9E-8A3E-43A779B973BA"));
    objc_msgSend(v11, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v20;
    objc_msgSend(v14, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB3A28];
    if (!v10 || !v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("05A41D49-2A4D-4D9E-8A3E-43A779B973BA"));
    objc_msgSend(v11, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    v41[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = a1;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544642;
    v30 = v27;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v12;
    v39 = 2112;
    v40 = v14;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Created user UUID: %@ from userID: %@ homeUUID: %@ uuid: %@ pairingIdentity: %@", (uint8_t *)&v29, 0x3Eu);

  }
  objc_autoreleasePoolPop(v24);

  return v16;
}

+ (id)privateZoneNameForUserUUID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("user-data-private-"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedZoneNameForUserUUID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("user-data-shared-"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t133 != -1)
    dispatch_once(&logCategory__hmf_once_t133, &__block_literal_global_448);
  return (id)logCategory__hmf_once_v134;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)privilegeFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "hmf_numberForKey:", CFSTR("HM.userAdministratorType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

+ (HMDUser)userWithDictionary:(id)a3
{
  return (HMDUser *)objc_msgSend(a1, "userWithDictionary:home:", a3, 0);
}

+ (HMDUser)userWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDUser *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("userID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(a1, "privilegeFromDictionary:", v6);
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HM.isUserAllowedRemoteAccess"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountHandleFromString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:]([HMDUser alloc], "initWithAccountHandle:home:pairingIdentity:privilege:", v12, v7, 0, v9);
    __displayNameForUser(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setDisplayName:](v13, "setDisplayName:", v14);

    v28 = v10;
    -[HMDUser setRemoteAccessAllowed:](v13, "setRemoteAccessAllowed:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x1E0CB9EE0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      -[HMDUser setCamerasAccessLevel:](v13, "setCamerasAccessLevel:", objc_msgSend(v15, "integerValue"));
    v17 = v7;
    if (v13)
    {
      v18 = *MEMORY[0x1E0CB9EA0];
      v19 = v6;
      objc_msgSend(v19, "hmf_numberForKey:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hmf_numberForKey:", CFSTR("HMDUserAnnounceAccessLevelCodingKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v13, v20, v21);
    }
    else
    {
      v22 = 0;
    }
    -[HMDUser setAnnounceAccessLevel:](v13, "setAnnounceAccessLevel:", v22);

    v7 = v17;
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user from dictionary because userID is not given", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v13 = 0;
  }

  return v13;
}

+ (id)userDictionaryWithUserID:(id)a3 privilege:(unint64_t)a4 remoteAccessAllowed:(BOOL)a5 cameraAccessLevel:(unint64_t)a6 announceAccessAllowed:(id)a7 announceAccessLevel:(unint64_t)a8 audioAnalysisUserDropInAccessLevel:(unint64_t)a9
{
  _BOOL8 v11;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v11 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0C99E08];
  v16 = a3;
  objc_msgSend(v15, "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("userID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("HM.userAdministratorType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("HM.isUserAllowedRemoteAccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CB9EE0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("HMDUserAnnounceAccessLevelCodingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CB8B90]);

  if (v14)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB9EA0]);
  v23 = (void *)objc_msgSend(v17, "copy");

  return v23;
}

void __22__HMDUser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v134;
  logCategory__hmf_once_v134 = v0;

}

@end
