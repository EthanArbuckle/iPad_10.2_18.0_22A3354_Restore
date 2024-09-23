@implementation HMDUser

- (BOOL)isAccessPolicySet
{
  return -[HMDUser userAccessPolicy](self, sel_userAccessPolicy) & 1;
}

- (BOOL)isAllowedToAddOrRemoveHAPPairingsOnAccessory
{
  HMDUser *v2;
  char v3;

  v2 = self;
  v3 = sub_22199BF30();

  return v3 & 1;
}

- (BOOL)isAllowedToSharePhotosPersonManagerData
{
  HMDUser *v2;
  unint64_t v3;
  _BOOL8 v4;
  id v5;

  v2 = self;
  if (-[HMDUser isAccessPolicySet](v2, sel_isAccessPolicySet))
  {
    v3 = -[HMDUser userAccessPolicy](v2, sel_userAccessPolicy);

    return (v3 >> 2) & 1;
  }
  else
  {
    v5 = -[HMDUser privilege](v2, sel_privilege);

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isAllowedToAccessActivityHistory
{
  HMDUser *v2;
  unint64_t v3;
  _BOOL8 v4;
  id v5;

  v2 = self;
  if (-[HMDUser isAccessPolicySet](v2, sel_isAccessPolicySet))
  {
    v3 = -[HMDUser userAccessPolicy](v2, sel_userAccessPolicy);

    return (v3 >> 3) & 1;
  }
  else
  {
    v5 = -[HMDUser privilege](v2, sel_privilege);

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isAllowedToHaveCATId
{
  HMDUser *v2;
  unint64_t v3;
  _BOOL8 v4;
  id v5;

  v2 = self;
  if (-[HMDUser isAccessPolicySet](v2, sel_isAccessPolicySet))
  {
    v3 = -[HMDUser userAccessPolicy](v2, sel_userAccessPolicy);

    return (v3 >> 4) & 1;
  }
  else
  {
    v5 = -[HMDUser privilege](v2, sel_privilege);

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isLocalAccessoryCommunicationAllowed
{
  HMDUser *v2;
  unint64_t v3;
  _BOOL8 v4;
  id v5;

  v2 = self;
  if (-[HMDUser isAccessPolicySet](v2, sel_isAccessPolicySet))
  {
    v3 = -[HMDUser userAccessPolicy](v2, sel_userAccessPolicy);

    return (v3 >> 5) & 1;
  }
  else
  {
    v5 = -[HMDUser privilege](v2, sel_privilege);

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isAllowedToContributeActivityStates
{
  return !-[HMDUser isPending](self, sel_isPending);
}

+ (BOOL)isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:(id)a3
{
  unsigned __int8 v4;

  swift_unknownObjectRetain();
  v4 = sub_22199C1EC(a3);
  swift_unknownObjectRelease();
  return v4 & 1;
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
  v5 = (objc_class *)MEMORY[0x24BDB25E8];
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

+ (unint64_t)hmmtrUserPrivilegeFromHMDUserPrivilege:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return qword_2226A0F80[a3];
}

+ (unint64_t)hmdUserPrivilegeFromHMMTRUserPrivilege:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 2;
  else
    return qword_2226A0FA8[a3 - 1];
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
  void *v13;
  void *v14;
  HMDUser *v15;
  uint64_t v16;
  NSUUID *uuid;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMUserPresenceAuthorization *presenceAuthStatus;
  uint64_t v23;
  HMDAccountIdentifier *accountIdentifier;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSNumber *matterCASEAuthenticatedTagID;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  HMDRestrictedGuestHomeAccessSettings *v46;
  HMDRestrictedGuestHomeAccessSettings *restrictedGuestAccessSettings;
  uint64_t v48;
  NSData *acwgIssuerPublicKeyExternalRepresentation;

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
        goto LABEL_28;
      +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountHandleFromString:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "idsMergeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x24BE1BBB0];
      objc_msgSend(v4, "pairingIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmd_pairingIdentityWithDictionary:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(v4, "privilege");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDUser initWithAccountHandle:homeUUID:pairingIdentity:privilege:](self, "initWithAccountHandle:homeUUID:pairingIdentity:privilege:", v6, 0, v13, objc_msgSend(v14, "integerValue"));

    if (v15)
    {
      objc_msgSend(v4, "uuid");
      v16 = objc_claimAutoreleasedReturnValue();
      uuid = v15->_uuid;
      v15->_uuid = (NSUUID *)v16;

      objc_msgSend(v4, "remoteAccessAllowed");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_remoteAccessAllowed = objc_msgSend(v18, "BOOLValue");

      v19 = (void *)MEMORY[0x24BDD7A90];
      objc_msgSend(v4, "presenceAuthorizationStatus");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "authWithNumber:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      presenceAuthStatus = v15->_presenceAuthStatus;
      v15->_presenceAuthStatus = (HMUserPresenceAuthorization *)v21;

      objc_msgSend(v4, "accountIdentifier");
      v23 = objc_claimAutoreleasedReturnValue();
      accountIdentifier = v15->_accountIdentifier;
      v15->_accountIdentifier = (HMDAccountIdentifier *)v23;

      objc_storeStrong((id *)&v15->_mergeIdentifier, v9);
      objc_msgSend(v4, "camerasAccessLevel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v4, "camerasAccessLevel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v15->_camerasAccessLevel = objc_msgSend(v26, "integerValue");

      }
      v27 = v4;
      if (objc_msgSend(v27, "propertyWasSet:", CFSTR("announceAccessLevel")))
      {
        objc_msgSend(v27, "announceAccessLevel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (uint64_t)v15;
        v30 = 0;
        v31 = v28;
      }
      else
      {
        objc_msgSend(v27, "announceAccessAllowed");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (uint64_t)v15;
        v30 = v28;
        v31 = 0;
      }
      v32 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:](v29, v30, v31);

      v15->_announceAccessLevel = v32;
      objc_msgSend(v27, "matterCASEAuthenticatedTagID");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        objc_msgSend(v27, "matterCASEAuthenticatedTagID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "integerValue");

        if (v36)
        {
          objc_msgSend(v27, "matterCASEAuthenticatedTagID");
          v37 = objc_claimAutoreleasedReturnValue();
          matterCASEAuthenticatedTagID = v15->_matterCASEAuthenticatedTagID;
          v15->_matterCASEAuthenticatedTagID = (NSNumber *)v37;

        }
      }
      if (-[HMDUser isRestrictedGuest](v15, "isRestrictedGuest"))
      {
        v39 = v27;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v40 = v39;
        else
          v40 = 0;
        v41 = v40;

        if (v41)
        {
          objc_msgSend(v41, "allowedAccessoryUUIDs");
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)v42;
          v44 = (void *)MEMORY[0x24BDBD1A8];
          if (v42)
            v44 = (void *)v42;
          v45 = v44;

          v46 = -[HMDRestrictedGuestHomeAccessSettings initWithAllowedAccessories:schedule:]([HMDRestrictedGuestHomeAccessSettings alloc], "initWithAllowedAccessories:schedule:", v45, 0);
          restrictedGuestAccessSettings = v15->_restrictedGuestAccessSettings;
          v15->_restrictedGuestAccessSettings = v46;

        }
      }
      objc_msgSend(v27, "matCredIPKExternalRepresentation");
      v48 = objc_claimAutoreleasedReturnValue();
      acwgIssuerPublicKeyExternalRepresentation = v15->_acwgIssuerPublicKeyExternalRepresentation;
      v15->_acwgIssuerPublicKeyExternalRepresentation = (NSData *)v48;

    }
    self = v15;

    v5 = self;
  }
LABEL_28:

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
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
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
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
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
  HMDRestrictedGuestHomeAccessSettings *v35;
  uint64_t v36;
  HMDRestrictedGuestHomeAccessSettings *restrictedGuestAccessSettings;
  objc_super v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v39.receiver = self;
  v39.super_class = (Class)HMDUser;
  v19 = -[HMDUser init](&v39, sel_init);
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
    v33 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    cloudShareIDFuture = v20->_cloudShareIDFuture;
    v20->_cloudShareIDFuture = v33;

    v20->_camerasAccessLevel = HMUserDefaultCamerasAccessLevel();
    v20->_announceAccessLevel = 0;
    v20->_announceNotificationModeForCurrentDevice = 0;
    v20->_needsiTunesMultiUserRepair = 0;
    v20->_userCloudShareWithOwnerMessagingState = 0;
    if (-[HMDUser isRestrictedGuest](v20, "isRestrictedGuest"))
    {
      v35 = [HMDRestrictedGuestHomeAccessSettings alloc];
      v36 = -[HMDRestrictedGuestHomeAccessSettings initWithAllowedAccessories:schedule:](v35, "initWithAllowedAccessories:schedule:", MEMORY[0x24BDBD1A8], 0);
      restrictedGuestAccessSettings = v20->_restrictedGuestAccessSettings;
      v20->_restrictedGuestAccessSettings = (HMDRestrictedGuestHomeAccessSettings *)v36;

    }
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
  HMDUser *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  HMDUser *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  HMDUser *v23;
  int v25;
  void *v26;
  __int16 v27;
  HMDUser *v28;
  __int16 v29;
  HMDUser *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (HMDUser *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (!v8)
      goto LABEL_16;
    -[HMDUser home](v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqual:", v12);

    if ((v13 & 1) != 0)
    {
      -[HMDUser account](v8, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser account](self, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
      {
        v17 = 1;
LABEL_17:

        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v23;
      v22 = "%{public}@Accounts do not match : [otherUser : %@] [self : %@]";
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        objc_autoreleasePoolPop(v18);
LABEL_16:
        v17 = 0;
        goto LABEL_17;
      }
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v19;
      v22 = "%{public}@Homes do not match: [otherUser: %@] [self : %@]";
    }
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v25, 0x20u);

    goto LABEL_15;
  }
  v17 = 1;
LABEL_18:

  return v17;
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

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (HMDUser *)a3;
  v5 = v4;
  if (v4 == self
    || (-[HMDUser account](v4, "account"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMDUser account](self, "account"),
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
    v10 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Accounts do not match : [otherUser : %@] [self : %@]", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
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
  id v16;
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
  id v29;
  void *v30;
  void *v31;
  id v33;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[18];

  v57[16] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser uuid](self, "uuid");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "UUIDString");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"));
  v57[0] = v54;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser mergeIdentifier](self, "mergeIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("MID"));
  v57[1] = v52;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v5, "initWithName:value:options:formatter:", CFSTR("PAID"));
  v57[2] = v50;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser accountHandle](self, "accountHandle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("HNDL"));
  v57[3] = v48;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser displayName](self, "displayName");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v8;
  v45 = (void *)objc_msgSend(v7, "initWithName:value:options:formatter:", CFSTR("DN"), v8, 0);
  v57[4] = v45;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  v10 = -[HMDUser privilege](self, "privilege");
  if (v10 > 5)
    v11 = CFSTR("None");
  else
    v11 = off_24E793D90[v10];
  v44 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("PV"), v11);
  v57[5] = v44;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  HMFBooleanToString();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("RA"), v43);
  v57[6] = v42;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("PA"), v41);
  v57[7] = v40;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser home](self, "home");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("HM"), v39);
  v57[8] = v38;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser camerasAccessLevel](self, "camerasAccessLevel");
  HMUserCameraAccessLevelAsString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("CA"), v37);
  v57[9] = v36;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  HMFBooleanToString();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("AA"), v35);
  v57[10] = v34;
  v17 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("AL"), v18);
  v57[11] = v19;
  v20 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("AAN"), v21);
  v57[12] = v22;
  v23 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser isPending](self, "isPending");
  HMFBooleanToString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithName:value:", CFSTR("PU"), v24);
  v57[13] = v25;
  v26 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("CATID"), v27);
  v57[14] = v28;
  v29 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithName:value:", CFSTR("RGS"), v30);
  v57[15] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 16);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  return v33;
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
  void *v10;
  void *v11;
  const __CFString *v12;
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
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[18];

  v60[16] = *MEMORY[0x24BDAC8D0];
  -[HMDUser home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser uuid](self, "uuid");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("UUID: %@"), v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v55;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "isAccessToHomeAllowed");
  HMFBooleanToString();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Is Access Allowed: %@"), v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v53;
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser isCurrentUser](self, "isCurrentUser");
  HMFBooleanToString();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Is Current User: %@"), v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v51;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser isAdministrator](self, "isAdministrator");
  HMFBooleanToString();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Is Admin: %@"), v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v49;
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  HMFBooleanToString();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Is Remote Access Allowed: %@"), v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v47;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("User Privilege: %lu"), -[HMDUser privilege](self, "privilege"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v46;
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "uuidsOfAllowedAccessories");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("allowedAccessories: %@"), v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v43;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "schedule");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("schedule : %@"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v40;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v39 = shouldLogPrivateInformation();
  if (v39)
  {
    -[HMDUser displayName](self, "displayName");
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("...");
  }
  v32 = (__CFString *)v12;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Display Name: %@"), v12);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[8] = v38;
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser camerasAccessLevel](self, "camerasAccessLevel");
  HMUserCameraAccessLevelAsString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Cameras Access Level: %@"), v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60[9] = v35;
  v14 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  HMFBooleanToString();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Is Announce Access Allowed: %@"), v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v60[10] = v33;
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Announce Access Level: %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60[11] = v17;
  v57 = v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Home: %@"), v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60[12] = v18;
  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("AudioDropIn: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60[13] = v21;
  v22 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser isPending](self, "isPending");
  HMFBooleanToString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("Is Pending User: %@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v60[14] = v24;
  v25 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("CATID: %@"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60[15] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  v58[0] = *MEMORY[0x24BE3EB68];
  objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", "));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = CFSTR("Photos Person Manager Settings");
  v59[0] = v28;
  -[HMDUser photosPersonManagerSettings](self, "photosPersonManagerSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
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

  v19 = *MEMORY[0x24BDAC8D0];
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
  HMDAssistantAccessControl *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDUser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDUser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDUser *v22;
  HMDUser *v23;
  NSObject *queue;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _QWORD block[5];
  _BYTE buf[24];
  void *v33;
  id v34[4];

  v34[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "msgDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser setMessageDispatcher:](self, "setMessageDispatcher:", v5);

  -[HMDUser setHome:](self, "setHome:", v4);
  if (!-[HMDUser isRemoteGateway](self, "isRemoteGateway"))
  {
    isWatch();
    -[HMDUser configureCloudShareTrustManager](self, "configureCloudShareTrustManager");
    -[HMDUser initializeUserSettingsWithHome:](self, "initializeUserSettingsWithHome:", v4);
  }
  -[HMDUser assistantAccessControl](self, "assistantAccessControl");
  v6 = (HMDAssistantAccessControl *)objc_claimAutoreleasedReturnValue();
  -[HMDUser _readAnnounceNotificationModeFromLocalStore](self, "_readAnnounceNotificationModeFromLocalStore");
  if (v6
    || (objc_msgSend(v4, "owner"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqual:", self),
        v8,
        v9)
    && (v6 = -[HMDAssistantAccessControl initWithUser:]([HMDAssistantAccessControl alloc], "initWithUser:", self), -[HMDUser setAssistantAccessControl:](self, "setAssistantAccessControl:", v6), v6))
  {
    -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControl configureWithSettingsController:](v6, "configureWithSettingsController:", v7);

  }
  v10 = (void *)MEMORY[0x227676638](-[HMDUser registerForMessages](self, "registerForMessages"));
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser userID](v11, "userID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser account](v11, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser isCurrentUser](v11, "isCurrentUser");
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v33 = v15;
    LOWORD(v34[0]) = 2112;
    *(id *)((char *)v34 + 2) = v16;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring [%@] with account: %@, isCurrentUser: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  if (!-[HMDUser isCurrentUser](v11, "isCurrentUser"))
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v11;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser userID](v18, "userID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Registering for account notifications & Auditing the account as [%@] is not current user.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    __registerForAccountNotifications(v18);
    v22 = v18;
    v23 = v22;
    if (v22)
    {
      queue = v22->_queue;
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____auditAccount_block_invoke;
      v33 = &unk_24E79C240;
      v34[0] = v22;
      dispatch_async(queue, buf);

    }
  }
  -[HMDUser registerIdentity](v11, "registerIdentity");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", v11, sel_handleRemovedAccessory_, CFSTR("HMDHomeAccessoryRemovedNotification"), v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser userDataController](v11, "userDataController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v11, sel_handleUserDataControllerInitialized_, CFSTR("HMDUserDataControllerInitializedNotificationKey"), v27);

  if (-[HMDUser isRestrictedGuest](v11, "isRestrictedGuest"))
  {
    -[HMDUser cancelRestrictedGuestScheduledTimers](v11, "cancelRestrictedGuestScheduledTimers");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "residentDeviceManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v11, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v29);

  }
  if (-[HMDUser isOwner](v11, "isOwner"))
  {
    -[HMDUser queue](v11, "queue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__HMDUser_configureWithHome___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v11;
    dispatch_async(v30, block);

  }
}

- (void)handleUserDataControllerInitialized:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDUser_handleUserDataControllerInitialized___block_invoke;
  block[3] = &unk_24E79C240;
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
  void *v9;
  void *v10;
  HMDUserAccessorySettingsDataController *v11;
  void *v12;
  HMDUserAccessorySettingsDataController *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  HMDSharedUserAccessorySettingsDataController *v18;
  void *v19;
  void *v20;
  HMDSharedUserAccessorySettingsDataController *v21;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Initializing user settings with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v4, "isOwnerUser"))
  {
    if (!-[HMDUser isRestrictedGuest](v6, "isRestrictedGuest")
      || (objc_msgSend(v4, "isRestrictedGuestEnabled") & 1) == 0)
    {
      objc_msgSend(v4, "backingStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = [HMDUserAccessorySettingsDataController alloc];
      -[HMDUser userUUID](v6, "userUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDUserAccessorySettingsDataController initWithUserModelID:managedObjectContext:](v11, "initWithUserModelID:managedObjectContext:", v12, v10);
      -[HMDUser setAccessorySettingsDataController:](v6, "setAccessorySettingsDataController:", v13);
LABEL_9:

    }
  }
  else if (-[HMDUser isCurrentUser](v6, "isCurrentUser"))
  {
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v14, "newManagedObjectContext");

    objc_msgSend(v4, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMDWorkingContextNameForHomeUUID(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v16);

    v17 = CFSTR("HMD.1P");
    objc_msgSend(v10, "setTransactionAuthor:", CFSTR("HMD.1P"));

    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [HMDSharedUserAccessorySettingsDataController alloc];
    -[HMDUser userUUID](v6, "userUUID");
    v13 = (HMDUserAccessorySettingsDataController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudPrivateStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HMDSharedUserAccessorySettingsDataController initWithUserModelID:homeModelID:privateStore:managedObjectContext:](v18, "initWithUserModelID:homeModelID:privateStore:managedObjectContext:", v13, v19, v20, v10);
    -[HMDUser setAccessorySettingsDataController:](v6, "setAccessorySettingsDataController:", v21);

    goto LABEL_9;
  }
  queue = v6->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HMDUser_initializeUserSettingsWithHome___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(queue, block);

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HMDUser_recoverUserCloudDataDueToUUIDChangeFromOldUUID___block_invoke;
  v7[3] = &unk_24E79C268;
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

  v24 = *MEMORY[0x24BDAC8D0];
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
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Clearing participants from old user settings backingstores", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDUser sharedBackingStoreController](v7, "sharedBackingStoreController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearParticipants");

  }
  -[HMDUser setUserDataController:](self, "setUserDataController:", 0);
  -[HMDUser setSharedBackingStoreController:](self, "setSharedBackingStoreController:", 0);
  v11 = (void *)MEMORY[0x227676638](-[HMDUser setPrivateBackingStoreController:](self, "setPrivateBackingStoreController:", 0));
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Initializing new user settings backingstores", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDUser initializeUserSettingsWithHome:](v12, "initializeUserSettingsWithHome:", v3);
LABEL_11:
  if (!-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    objc_msgSend(v3, "currentUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating participants in current users shared settings backingstore: %@", (uint8_t *)&v20, 0x16u);

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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMDUser_updateSharedBackingStoreControllerParticipants__block_invoke;
  block[3] = &unk_24E79C240;
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

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDUser cloudShareTrustManager](self, "cloudShareTrustManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638](-[HMDUser setCloudShareTrustManager:](self, "setCloudShareTrustManager:", 0));
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Configure new trust manager", (uint8_t *)&v8, 0xCu);

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

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
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

  v31[1] = *MEMORY[0x24BDAC8D0];
  -[HMDUser messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD7130];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v6, sel__handlePairingIdentityRequest_);

  v7 = *MEMORY[0x24BDD70A8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v7, self, v9, sel__handleLegacyPairingIdentityRequest_);

  v10 = *MEMORY[0x24BDD71A8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v10, self, v12, sel__handleShareLookupInfoRequest_);

  v13 = *MEMORY[0x24BDD7178];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v13, self, v15, sel__handleMultiUserSharePayloadRequest_);

  v16 = *MEMORY[0x24BDD71B8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v16, self, v18, sel__handleShareClientRepairRequest_);

  v19 = *MEMORY[0x24BDD7118];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v19, self, v21, sel__handleNeedsiTunesMultiUserRepair_);

  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    v22 = *MEMORY[0x24BDD7018];
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
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

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deregistering user", (uint8_t *)&v8, 0xCu);

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
  if (v2 > 5)
    return 0;
  else
    return qword_2226A10E8[v2];
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
    return qword_2226A1118[v3];
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

- (BOOL)isAdministrator
{
  return -[HMDUser privilege](self, "privilege") == 3 || -[HMDUser privilege](self, "privilege") == 4;
}

- (BOOL)isOwner
{
  return -[HMDUser privilege](self, "privilege") == 3;
}

- (BOOL)isPending
{
  return -[HMDUser privilege](self, "privilege") == 2;
}

- (BOOL)isRestrictedGuest
{
  return -[HMDUser privilege](self, "privilege") == 5;
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

  v11[2] = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", privilege);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
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
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__HMDUser_setAccountHandle___block_invoke;
    block[3] = &unk_24E79C240;
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
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__HMDUser_setAccountIdentifier___block_invoke;
    v8[3] = &unk_24E79C268;
    v9 = v4;
    v10 = self;
    dispatch_async(queue, v8);

  }
}

- (NSString)mergeIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mergeIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMergeIdentifier:(id)a3
{
  NSString *v4;
  NSString *mergeIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  mergeIdentifier = self->_mergeIdentifier;
  self->_mergeIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)spiClientIdentifierForUUID(self->_uuid);
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

  v17 = *MEMORY[0x24BDAC8D0];
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
    v8 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMDUser *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  HMDUser *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDUser *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDUser *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDUser *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve pairing identity for user", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUser pairingIdentity](v6, "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v29 = MEMORY[0x227676638]();
    v30 = v6;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find the pairing identity for the user", buf, 0xCu);

    }
    v33 = (void *)v29;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "entitlements") & 0x10) != 0 && -[HMDUser isCurrentUser](v6, "isCurrentUser"))
  {
    -[HMDUser keyStore](v6, "keyStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getHH2ControllerKeyWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "privateKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "publicKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "publicKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
      {
        v17 = objc_alloc(MEMORY[0x24BE3F228]);
        objc_msgSend(v9, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "publicKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v17, "initWithIdentifier:publicKey:privateKey:", v18, v19, v13);

        v12 = (void *)v20;
        goto LABEL_10;
      }
      v43 = (void *)MEMORY[0x227676638]();
      v44 = v6;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v46;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to get matching public key for this user", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v43);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", -1, CFSTR("Local pairing identity does not match user pairing identity"), 0, 0, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v47);

    }
    else
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v6;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v42;
        v52 = 2112;
        v53 = 0;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to lookup our local pairing identity with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Local pairing identity was not found"), 0, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v13);
    }

    goto LABEL_33;
  }
  objc_msgSend(v9, "publicPairingIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v21 = (void *)MEMORY[0x227676638]();
  v22 = v6;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (!v12)
  {
    if (v24)
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v34;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Unable to retrieve pairing identity for user.", buf, 0xCu);

    }
    v33 = v21;
LABEL_21:
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
    goto LABEL_33;
  }
  if (v24)
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v25;
    v52 = 2112;
    v53 = v12;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Found pairing identity for user: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  encodeRootObject();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
  {
    v48 = *MEMORY[0x24BDD7128];
    v49 = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v28);
  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v22;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v38;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identity.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v28);
  }

LABEL_33:
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

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kUserUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    v25 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v8 = -[HMDUser isCurrentUser](self, "isCurrentUser");
  v9 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity for not current user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2014);
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
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve all pairing identities for the current user", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDUser keyStore](v10, "keyStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allAccessoryPairingKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v4, "entitlements");
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __47__HMDUser__handleLegacyPairingIdentityRequest___block_invoke;
  v32[3] = &__block_descriptor_40_e28__16__0__HAPPairingIdentity_8l;
  v32[4] = v16;
  objc_msgSend(v15, "na_map:", v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Sending legacy identities : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v33 = *MEMORY[0x24BDD7128];
    v34 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
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
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identities.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
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

  v38 = *MEMORY[0x24BDAC8D0];
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
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Can't create lookup info"), CFSTR("Unable to convert account handle to lookup info"), 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v31, 0);

          v10 = 0;
        }
        goto LABEL_19;
      }
      encodeRootObject();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *MEMORY[0x24BDD71A0];
      v33 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Obtained share lookup: %@", buf, 0x16u);

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
    v25 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Do not have account handle: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(v4, "responseHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "responseHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("No account handle"), CFSTR("User has no account handle"), 0);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v4, "responseHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "responseHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
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

  v89 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD71C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) != 0)
  {
    if (-[HMDUser isOwner](self, "isOwner"))
    {
      objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD7188]);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v42 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user in message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v42);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Unable to find from user in message payload"), CFSTR("Need valid from user in message payload"), 0);
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
        v46 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user with uuid: %@ home: %@ users: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v46);
        v25 = (void *)MEMORY[0x24BDD1540];
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
      objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD7190]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD71D0]);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD71C8]);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7180]);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              if ((objc_msgSend(v12, "isCurrentUser") & 1) != 0)
              {
                if (-[HMDUser userCloudShareWithOwnerMessagingState](self, "userCloudShareWithOwnerMessagingState") != 2)
                {
                  objc_msgSend(v4, "messagePayload");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v78[0] = MEMORY[0x24BDAC760];
                  v78[1] = 3221225472;
                  v78[2] = __47__HMDUser__handleMultiUserSharePayloadRequest___block_invoke;
                  v78[3] = &unk_24E793AC0;
                  v79 = v4;
                  v80 = self;
                  -[HMDUser _sendSecureShareClientPayloadToMostEligibleDevice:completion:](self, "_sendSecureShareClientPayloadToMostEligibleDevice:completion:", v71, v78);

                  v72 = (void *)MEMORY[0x227676638]();
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
                    _os_log_impl(&dword_2218F0000, v74, OS_LOG_TYPE_INFO, "%{public}@Received request to send client payload to user : %@", buf, 0x16u);

                    v72 = v77;
                  }

                  objc_autoreleasePoolPop(v72);
                  goto LABEL_42;
                }
                v21 = (void *)MEMORY[0x227676638]();
                v22 = self;
                HMFGetOSLogHandle();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v82 = v24;
                  _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending cloud share with owner message was blocked.", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v21);
                v25 = (void *)MEMORY[0x24BDD1540];
                v26 = CFSTR("Unable to send the message");
                v27 = CFSTR("Sending cloud share with owner message was blocked.");
                v28 = 52;
                goto LABEL_29;
              }
              v66 = (void *)MEMORY[0x227676638]();
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
                _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@From user %@ is not current user for message: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v66);
              objc_msgSend(v4, "responseHandler");
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v70)
                goto LABEL_42;
              objc_msgSend(v4, "responseHandler");
              v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
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
        v59 = (void *)MEMORY[0x227676638]();
        v60 = self;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v82 = v62;
          _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Payload did not have required fields.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v59);
        objc_msgSend(v4, "responseHandler");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v63)
          goto LABEL_42;
        objc_msgSend(v4, "responseHandler");
        v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x24BDD1540];
        v57 = CFSTR("Unable to determine required arguments");
        v58 = CFSTR("Missing either URL, token or container ID");
      }
      else
      {
        v51 = (void *)MEMORY[0x227676638]();
        v52 = self;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v82 = v54;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v51);
        objc_msgSend(v4, "responseHandler");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
          goto LABEL_42;
        objc_msgSend(v4, "responseHandler");
        v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x24BDD1540];
        v57 = CFSTR("Home not valid");
        v58 = CFSTR("Missing home or invalid home");
      }
      objc_msgSend(v56, "hmErrorWithCode:description:reason:suggestion:", 3, v57, v58, 0);
      v64 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    v37 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to owner: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(v4, "responseHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v4, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x24BDD1540];
      v35 = CFSTR("To user is not owner");
      v36 = CFSTR("Can currently only share to owner");
      goto LABEL_22;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(v4, "responseHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v4, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x24BDD1540];
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

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("6.2"));
  v9 = *MEMORY[0x24BDD7180];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD7180]);
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
  v34[0] = &unk_24E971210;
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[HMDHomeKitVersion versionString](v8, "versionString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending user share message with device capabilites %@.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  objc_initWeak((id *)buf, v22);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __72__HMDUser__sendSecureShareClientPayloadToMostEligibleDevice_completion___block_invoke;
  v26[3] = &unk_24E79AFA0;
  objc_copyWeak(&v28, (id *)buf);
  v25 = v7;
  v27 = v25;
  -[HMDUser _sendAccountMessage:payload:deviceCapabilities:multicast:preferPrimary:completion:](v22, "_sendAccountMessage:payload:deviceCapabilities:multicast:preferPrimary:completion:", CFSTR("HMDUCM.rsr"), v6, v20, 0, 1, v26);

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
  v36 = *MEMORY[0x24BDAC8D0];
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
  v25 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot send account message named %@ because account handle is nil and either preferring primary is NO or no primary resident exists", buf, 0x16u);

    v25 = v29;
  }

  objc_autoreleasePoolPop(v25);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
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

  v70 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD71C0]);
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
      v12 = *MEMORY[0x24BDD7190];
      objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD7190]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
        v15 = *MEMORY[0x24BDD71B0];
        objc_msgSend(v4, "dataForKey:", *MEMORY[0x24BDD71B0]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)MEMORY[0x24BDD1620];
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
            v64[1] = *MEMORY[0x24BDD7180];
            objc_msgSend(v4, "stringForKey:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v65[1] = v22;
            v64[2] = v12;
            objc_msgSend(v4, "stringForKey:", v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v65[2] = v23;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            v54 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("7.0"));
            v62 = CFSTR("kRequiredCapabilitiesKey");
            v60[0] = CFSTR("kHomedSupportedFeaturesKey");
            v60[1] = CFSTR("kHomedVersionKey");
            v61[0] = &unk_24E971228;
            v24 = (void *)MEMORY[0x24BDD16E0];
            -[HMDHomeKitVersion versionString](v54, "versionString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            objc_msgSend(v24, "numberWithDouble:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v61[1] = v26;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v27;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = (void *)MEMORY[0x227676638]();
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
              _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Sending user share repair message with device capabilites %@.", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v29);
            objc_initWeak((id *)buf, v30);
            v56[0] = MEMORY[0x24BDAC760];
            v56[1] = 3221225472;
            v56[2] = __43__HMDUser__handleShareClientRepairRequest___block_invoke;
            v56[3] = &unk_24E798D90;
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
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to decode repair info"), CFSTR("Corrupted repair payload"), 0);
              v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v49 = (void *)MEMORY[0x227676638]();
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
              _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unable to decoderepairInfo. %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v49);
            objc_msgSend(v4, "respondWithError:", v20);
          }

        }
        else
        {
          v45 = (void *)MEMORY[0x227676638]();
          v46 = self;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v67 = v48;
            _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Payload does not have repair info.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v45);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to determine required arguments"), CFSTR("Missing repair payload"), 0);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v20);
        }
      }
      else
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v67 = v44;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v41);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Home not valid"), CFSTR("Missing home or invalid home"), 0);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v20);
      }
    }
    else
    {
      v37 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message from owner: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("From user is not owner"), CFSTR("Can currently only repair from home owner"), 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v20);
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send repair request to mismatched user from message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to find to user in payload"), CFSTR("Need validated to user in payload"), 0);
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

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD7110]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "BOOLValue");
      if ((_DWORD)v7 != -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"))
      {
        -[HMDUser home](self, "home");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v12;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting needs iTunes multi-user repair %@.", (uint8_t *)&v25, 0x16u);

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
      v20 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing value to set iTunes Multi User Repair: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Need a value"), CFSTR("Need a value"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v24);

      v6 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to current user: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("User is not current user"), CFSTR("Can only set on current user"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (id)account
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser accountHandle](self, "accountHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v3, "accountExistsForHandle:", v4))
  {
    objc_msgSend(v3, "accountForHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDUser mergeIdentifier](self, "mergeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      && (-[HMDUser accountIdentifier](self, "accountIdentifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "senderCorrelationIdentifier"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v6)
      || (objc_msgSend(v3, "existingAccountWithMergeIdentifier:", v6),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v4)
      {
        objc_msgSend(v3, "accountForHandle:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }

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

  v24 = *MEMORY[0x24BDAC8D0];
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
      v12 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was added: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      __registerForAccountNotifications(v13);
      __updateWithAccount(v13, v9);
      __handleUpdatedAccount(v13);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Account handle does not exist", (uint8_t *)&v20, 0xCu);

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

  v20 = *MEMORY[0x24BDAC8D0];
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
      v12 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was removed: %@", (uint8_t *)&v16, 0x16u);

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

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    if (-[HMDUser isOwner](self, "isOwner"))
      return 1;
    v4 = (void *)MEMORY[0x227676638]();
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
    v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 0xCu);

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDUser_handleAssistantAccessControlUpdate___block_invoke;
  v7[3] = &unk_24E79C268;
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
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  HMDUser *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDUser *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  void (**v51)(_QWORD, _QWORD, _QWORD);
  void *v52;
  HMDUser *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  HMDUser *v57;
  NSObject *v58;
  void *v59;
  HMDAssistantAccessControl *v60;
  uint64_t v61;
  void *v62;
  HMDUser *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  HMDUser *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  HMDUser *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  _QWORD aBlock[4];
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  id v95;
  uint8_t v96[128];
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
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
      v95 = 0;
      +[HMDAssistantAccessControl accessControlWithMessage:user:currentAccessories:error:](HMDAssistantAccessControl, "accessControlWithMessage:user:currentAccessories:error:", v4, self, v12, &v95);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v95;

      if (!v13)
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v98 = v26;
          v99 = 2112;
          v100 = v4;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to create access control from message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(v4, "respondWithError:", v14);
        v13 = 0;
        goto LABEL_53;
      }
      if (!-[HMDUser isCurrentUser](self, "isCurrentUser"))
        _HMFPreconditionFailure();
      if (!-[HMDUser isOwner](self, "isOwner"))
      {
        v83 = v10;
        v86 = v14;
        v27 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(v13, "accessories");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "arrayWithCapacity:", objc_msgSend(v28, "count"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        objc_msgSend(v13, "accessories");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v90 != v33)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "uuid");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v35);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
          }
          while (v32);
        }

        v36 = (void *)MEMORY[0x227676638]();
        v37 = self;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v98 = v39;
          v99 = 2112;
          v100 = v13;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Updating shared user assistant access control to: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        v40 = objc_msgSend(v13, "areActivityNotificationsEnabledForPersonalRequests");
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_434;
        aBlock[3] = &unk_24E79BD80;
        v41 = v4;
        v88 = v41;
        v42 = _Block_copy(aBlock);
        -[HMDUser accessorySettingsDataController](v37, "accessorySettingsDataController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v83;
        if (v43)
        {
          -[HMDUser accessorySettingsDataController](v37, "accessorySettingsDataController");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleAssistantAccessControlAccessoryUUIDsUpdated:activityNotificationsEnabledForPersonalRequests:completion:", v29, v40, v42);
        }
        else
        {
          v52 = (void *)MEMORY[0x227676638]();
          v53 = v37;
          HMFGetOSLogHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v81 = v52;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v98 = v55;
            _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

            v52 = v81;
          }

          objc_autoreleasePoolPop(v52);
          objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:description:underlyingError:", 9005, CFSTR("User data controller not found. No settings for this user."), 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "respondWithError:", v44);
        }

        v14 = v86;
        goto LABEL_53;
      }
      if (!v10)
      {
        v45 = (void *)MEMORY[0x227676638]();
        v46 = self;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v98 = v48;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Cannot update without an existing access control", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v45);
        objc_msgSend(v4, "responseHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v49)
          goto LABEL_53;
        objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 9004);
        v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v51 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v51[2](v51, v50, 0);

        goto LABEL_49;
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
            v85 = v14;
            -[HMDUser assistantAccessControl](self, "assistantAccessControl");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v18, "isEnabled");

            if ((v82 & 1) != 0)
            {
              v14 = v85;
              goto LABEL_42;
            }
            objc_msgSend(v13, "user");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)MEMORY[0x227676638]();
            v57 = self;
            HMFGetOSLogHandle();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v84 = v56;
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v98 = v59;
              v99 = 2112;
              v100 = v15;
              _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@Enabling assistant access controls for internal user: %@", buf, 0x16u);

              v56 = v84;
            }

            objc_autoreleasePoolPop(v56);
            v60 = [HMDAssistantAccessControl alloc];
            objc_msgSend(v13, "accessories");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = -[HMDAssistantAccessControl initWithUser:appleAccessories:enabled:](v60, "initWithUser:appleAccessories:enabled:", v15, v16, 1);
            v17 = v13;
            v13 = (void *)v61;
            v14 = v85;
          }

        }
      }
LABEL_42:
      v62 = (void *)MEMORY[0x227676638]();
      v63 = self;
      HMFGetOSLogHandle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v98 = v65;
        v99 = 2112;
        v100 = v13;
        _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@Updating owner user assistant access control to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v62);
      if (!HMFEqualObjects())
      {
        v71 = v14;
        objc_msgSend(v13, "accessories");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "na_map:", &__block_literal_global_430);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = (void *)MEMORY[0x227676638]();
        v75 = v63;
        HMFGetOSLogHandle();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v98 = v77;
          v99 = 2112;
          v100 = v13;
          _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Updating owner user assistant access control to: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v74);
        v78 = objc_msgSend(v13, "areActivityNotificationsEnabledForPersonalRequests");
        v93[0] = MEMORY[0x24BDAC760];
        v93[1] = 3221225472;
        v93[2] = __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_431;
        v93[3] = &unk_24E79BD80;
        v94 = v4;
        v79 = _Block_copy(v93);
        -[HMDUser accessorySettingsDataController](v75, "accessorySettingsDataController");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleAssistantAccessControlAccessoryUUIDsUpdated:activityNotificationsEnabledForPersonalRequests:completion:", v73, v78, v79);

        v14 = v71;
        goto LABEL_53;
      }
      v66 = (void *)MEMORY[0x227676638]();
      v67 = v63;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v98 = v69;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Updated access control resulted in no change", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v66);
      objc_msgSend(v4, "responseHandler");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v70)
      {
LABEL_53:

        goto LABEL_54;
      }
      objc_msgSend(v4, "responseHandler");
      v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50[2](v50, 0, 0);
LABEL_49:

      goto LABEL_53;
    }
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v98 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Not processing assistant access control update message as not part of homeManager homes.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
LABEL_54:

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDUser_handleMediaContentProfileAccessControlUpdate___block_invoke;
  v7[3] = &unk_24E79C268;
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

  v54 = *MEMORY[0x24BDAC8D0];
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
        v27 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Can only modify own Media Profile Content control: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v11);
        goto LABEL_30;
      }
      objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD7100]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
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
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
              objc_msgSend(v12, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__HMDUser__handleMediaContentProfileAccessControlUpdate___block_invoke;
        aBlock[3] = &unk_24E79BD80;
        v19 = v4;
        v44 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
        v20 = _Block_copy(aBlock);
        -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:completion:", v12, v20);
        }
        else
        {
          v38 = (void *)MEMORY[0x227676638]();
          v39 = self;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v51 = v41;
            _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v38);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("User data controller not found"), CFSTR("No settings for this user"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "respondWithError:", v22);
        }

        v37 = v44;
        v11 = v42;
      }
      else
      {
        v31 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Missing access control accessories in message payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Missing access control accessories"), CFSTR("Need access control accessories in message"), 0);
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
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Not processing media content profile update message as not part of homeManager homes.", buf, 0xCu);

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HMDUser_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
  v7[3] = &unk_24E79C268;
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

  v56 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD70E8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v44 = v4;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
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
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
              objc_msgSend(v12, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __73__HMDUser__handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
        aBlock[3] = &unk_24E79BD80;
        v4 = v44;
        v19 = v44;
        v46 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
        v20 = _Block_copy(aBlock);
        -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:completion:", v12, v20);
        }
        else
        {
          v40 = (void *)MEMORY[0x227676638]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v53 = v43;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v40);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("User data controller not found"), CFSTR("No settings for this user"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "respondWithError:", v22);
        }

        v39 = v46;
      }
      else
      {
        v33 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Missing user update listening history control accessories in message payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Missing access control accessories"), CFSTR("Need access control accessories in message"), 0);
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
    v29 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Can only modify own ULH control: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = 2028;
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Not processing user listening history update since the homes mismatch.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = (void *)MEMORY[0x24BDD1540];
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
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
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v11 = v6;

  if (v11)
  {
    -[HMDUser userDataController](self, "userDataController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleRemovedAccessory:", v8);

    -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleRemovedAccessoryWithModelID:", v10);

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

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    v6 = *MEMORY[0x24BDD7010];
    v20 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
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
      v14 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing announce user settings in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Missing announce settings"), CFSTR("Need announce settings in message"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);

      v8 = 0;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("This can only be set for the user's devices."), CFSTR("Announce notifications are only delivered on devices the user owns."), 0);
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
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__HMDUser_updateAnnounceNotificationMode___block_invoke;
  v6[3] = &unk_24E797C10;
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
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HMDUser isCurrentUser](self, "isCurrentUser");
  v7 = (void *)MEMORY[0x227676638]();
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
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](v8, "announceNotificationModeForCurrentDevice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Announce Setting from %@ to %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    if (-[HMDUser announceNotificationModeForCurrentDevice](v8, "announceNotificationModeForCurrentDevice") != a3)
    {
      -[HMDUser setAnnounceNotificationModeForCurrentDevice:](v8, "setAnnounceNotificationModeForCurrentDevice:", a3);
      -[HMDUser _saveAnnounceSettingsToLocalStore:](v8, "_saveAnnounceSettingsToLocalStore:", -[HMDUser announceNotificationModeForCurrentDevice](v8, "announceNotificationModeForCurrentDevice"));
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (void)_saveAnnounceSettingsToLocalStore:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__HMDUser__saveAnnounceSettingsToLocalStore___block_invoke;
  v10[3] = &unk_24E796490;
  v11 = v8;
  v12 = a3;
  v10[4] = self;
  v9 = v8;
  objc_msgSend(v9, "performBlock:", v10);

}

- (void)_updateAnnounceNotificationModeToLocalStore:(unint64_t)a3 managedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDUser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  MKFLocalBulletinAnnounceUserSettingRegistration *v14;
  id v15;
  void *v16;
  HMDUser *v17;
  NSObject *v18;
  id v19;
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
  void *v34;
  void *v35;
  void *v36;
  HMDUser *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unint64_t v43;
  id v44;
  const __CFString *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "hmd_assertIsExecuting");
  -[HMDUser home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v12;
    v48 = 2112;
    v49 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Going to store announce notification mode (%@) to local store", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  +[MKFLocalBulletinAnnounceUserSettingRegistration fetchAnnounceRegistrationWithHomeUUID:managedObjectContext:](MKFLocalBulletinAnnounceUserSettingRegistration, "fetchAnnounceRegistrationWithHomeUUID:managedObjectContext:", v8, v6);
  v14 = (MKFLocalBulletinAnnounceUserSettingRegistration *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    v14 = -[MKFLocalBulletinAnnounceUserSettingRegistration initWithContext:]([MKFLocalBulletinAnnounceUserSettingRegistration alloc], "initWithContext:", v6);
  -[MKFLocalBulletinAnnounceUserSettingRegistration setEnabled:](v14, "setEnabled:", 1);
  -[MKFLocalBulletinAnnounceUserSettingRegistration setHomeUUID:](v14, "setHomeUUID:", v8);
  v43 = a3;
  -[MKFLocalBulletinAnnounceUserSettingRegistration setAnnounceNotificationMode:](v14, "setAnnounceNotificationMode:", a3);
  v44 = 0;
  objc_msgSend(v6, "save:", &v44);
  v15 = v44;
  v16 = (void *)MEMORY[0x227676638]();
  v17 = v10;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v41 = v6;
    v19 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v21 = v8;
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v47 = v20;
    v48 = 2112;
    v49 = v23;
    v50 = 2112;
    v51 = v19;
    v52 = 2112;
    v53 = v24;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Storing announce notification mode (%@) saved to local store with error : %@, Success : %@", buf, 0x2Au);

    v7 = v22;
    v8 = v21;

    v15 = v19;
    v6 = v41;
  }

  objc_autoreleasePoolPop(v16);
  if (!v15)
  {
    v42 = v7;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryForKey:", CFSTR("deviceAnnounceMode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setValue:forKey:", v28, v29);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v27, CFSTR("deviceAnnounceMode"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "synchronize");

    v32 = (void *)objc_opt_new();
    v33 = (void *)MEMORY[0x24BDBCF20];
    v45 = CFSTR("deviceAnnounceMode");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.homed"), v35);

    v36 = (void *)MEMORY[0x227676638]();
    v37 = v17;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v39;
      v48 = 2112;
      v49 = v40;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Setting announce notification mode (%@) to defaults for NPSManager", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);

    v15 = 0;
    v7 = v42;
  }

}

- (void)_readAnnounceNotificationModeFromLocalStore
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  HMDUser *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HMDUser *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDUser isCurrentUser](self, "isCurrentUser");
  v4 = (void *)MEMORY[0x227676638]();
  if (v3)
  {
    -[HMDUser _migrateAnnounceNotificationModeIfNeeded](self, "_migrateAnnounceNotificationModeIfNeeded");
    objc_autoreleasePoolPop(v4);
    -[HMDUser home](self, "home");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__HMDUser__readAnnounceNotificationModeFromLocalStore__block_invoke;
    v15[3] = &unk_24E79BBD0;
    v16 = v5;
    v17 = v8;
    v18 = self;
    v9 = v8;
    v10 = v5;
    objc_msgSend(v9, "performBlockAndWait:", v15);

  }
  else
  {
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not reading announce setting from local store as this user is not the current user", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (id)userIDsToMigrateAnnounceSettingsFrom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (-[HMDUser isOwner](self, "isOwner"))
  {
    -[HMDUser uuid](self, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDUser home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hh1UserIDsForCurrentUserForHomeUUID:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_migrateAnnounceNotificationModeIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDUser *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  HMDUser *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
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
  void *v46;
  HMDUser *v47;
  NSObject *v48;
  void *v49;
  BOOL v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id obj;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  -[HMDUser home](self, "home");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser userIDsToMigrateAnnounceSettingsFrom](self, "userIDsToMigrateAnnounceSettingsFrom");
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0x24BDD1000uLL;
    v6 = *(_QWORD *)v73;
    v59 = *(_QWORD *)v73;
    do
    {
      v7 = 0;
      v60 = v4;
      do
      {
        if (*(_QWORD *)v73 != v6)
          objc_enumerationMutation(obj);
        -[HMDUser announceNotificationFileNameForUserUUID:](self, "announceNotificationFileNameForUserUUID:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1408), "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

        v11 = (void *)MEMORY[0x227676638]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if ((v10 & 1) != 0)
        {
          if (v14)
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v15;
            v79 = 2112;
            v80 = v8;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to read HH1 announce setting file : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v11);
          v71 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v8, 2, &v71);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v71;
          if (v16)
          {
            v18 = (void *)MEMORY[0x24BDD1620];
            objc_msgSend((id)objc_opt_class(), "allowedClassesForAnnounceNotificationMode");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v17;
            objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v19, v16, &v70);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v70;

            v62 = v21;
            if (v20)
            {
              v22 = v20;
              objc_opt_class();
              v23 = objc_opt_isKindOfClass() & 1;
              if (v23)
                v24 = v22;
              else
                v24 = 0;
              v58 = v24;

              v25 = (void *)MEMORY[0x227676638]();
              v26 = v12;
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v23)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v78 = v29;
                  v79 = 2112;
                  v80 = v22;
                  _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Found HH1 announce notification mode for current user : %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v25);
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HMD.announce.notification.mode"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                {
                  objc_msgSend(v57, "backingStore");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "context");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v32, "managedObjectContext");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v67[0] = MEMORY[0x24BDAC760];
                  v67[1] = 3221225472;
                  v67[2] = __51__HMDUser__migrateAnnounceNotificationModeIfNeeded__block_invoke;
                  v67[3] = &unk_24E79BBD0;
                  v67[4] = v26;
                  v68 = v30;
                  v69 = v33;
                  v34 = v33;
                  objc_msgSend(v34, "performBlockAndWait:", v67);

                  v35 = 2;
                }
                else
                {
                  v46 = (void *)MEMORY[0x227676638]();
                  v47 = v26;
                  HMFGetOSLogHandle();
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v56 = v46;
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v78 = v49;
                    v79 = 2112;
                    v80 = v22;
                    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@That's weird. Announce notification dictionary contain nil value for notification mode : %@", buf, 0x16u);

                    v46 = v56;
                  }

                  objc_autoreleasePoolPop(v46);
                  v35 = 3;
                }

              }
              else
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v78 = v45;
                  v79 = 2112;
                  v80 = v22;
                  _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v25);
                v35 = 3;
              }
              v5 = 0x24BDD1000;

            }
            else
            {
              v41 = (void *)MEMORY[0x227676638]();
              v42 = v12;
              HMFGetOSLogHandle();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v78 = v44;
                v79 = 2112;
                v80 = v21;
                _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v41);
              v35 = 3;
              v5 = 0x24BDD1000;
            }

            v17 = v62;
          }
          else
          {
            v37 = (void *)MEMORY[0x227676638]();
            v38 = v12;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v78 = v40;
              v79 = 2112;
              v80 = v8;
              v81 = 2112;
              v82 = v17;
              _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from file : %@ / %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v37);
            v35 = 3;
            v5 = 0x24BDD1000;
          }

          v50 = v35 == 3;
          v6 = v59;
          v4 = v60;
          if (!v50)
            goto LABEL_41;
        }
        else
        {
          if (v14)
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v36;
            v79 = 2112;
            v80 = v8;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@HH1 announce setting file do not exist : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v11);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    }
    while (v4);
  }
LABEL_41:

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v51 = obj;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v64 != v54)
          objc_enumerationMutation(v51);
        -[HMDUser _removeAnnounceNotificationModeFileFromDiskForUserUUID:](self, "_removeAnnounceNotificationModeFileFromDiskForUserUUID:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    }
    while (v53);
  }

}

- (void)_removeAnnounceNotificationModeFileFromDiskForUserUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDUser *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF48]);
  -[HMDUser announceNotificationFileNameForUserUUID:](self, "announceNotificationFileNameForUserUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initFileURLWithPath:", v6);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "removeItemAtURL:error:", v7, &v14);
  v9 = v14;

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing announce notification settings file from disk : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (id)announceNotificationFileNameForUserUUID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
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
    if (-[HMDUser isAllowedToSharePhotosPersonManagerData](self, "isAllowedToSharePhotosPersonManagerData"))
    {
      v3 = [HMDUserPhotosPersonDataManager alloc];
      -[HMDUser messageDispatcher](self, "messageDispatcher");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backingStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HMDUserPhotosPersonDataManager initWithUser:messageDispatcher:backingStoreContext:workQueue:](v3, "initWithUser:messageDispatcher:backingStoreContext:workQueue:", self, v4, v6, self->_queue);
      -[HMDUser setPhotosPersonDataManager:](self, "setPhotosPersonDataManager:", v7);

      -[HMDUser photosPersonDataManager](self, "photosPersonDataManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "configure");

    }
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
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
  {
    -[HMDUser home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x227676638]();
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
        v12 = 138543362;
        v13 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating the person settings manager", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      v9 = -[HMDPersonSettingsManager initWithHome:workQueue:]([HMDPersonSettingsManager alloc], "initWithHome:workQueue:", v3, v5->_queue);
      -[HMDUser setPersonSettingsManager:](v5, "setPersonSettingsManager:", v9);

      -[HMDUser personSettingsManager](v5, "personSettingsManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configure");

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Not creating person settings manager because home reference is nil", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
    }

  }
}

- (NSNumber)notificationContextHAPIdentifier
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v4[1] = 0;
  -[HMDUser uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUUIDBytes:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", LODWORD(v4[0]));
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

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDUser nfcIssuerKeyIdentifier](self, "nfcIssuerKeyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@NFC issuer key identifier for user is nil", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (id)restrictedGuestScheduleStartTimerID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("RGScheduleStart.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)restrictedGuestScheduleEndTimerID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUser uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("RGScheduleEnd.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMDRestrictedGuestHomeAccessSettings)restrictedGuestAccessSettings
{
  os_unfair_lock_s *p_lock;
  HMDRestrictedGuestHomeAccessSettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_restrictedGuestAccessSettings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRestrictedGuestAccessSettings:(id)a3
{
  HMDRestrictedGuestHomeAccessSettings *v4;
  HMDRestrictedGuestHomeAccessSettings *restrictedGuestAccessSettings;

  v4 = (HMDRestrictedGuestHomeAccessSettings *)a3;
  os_unfair_lock_lock_with_options();
  restrictedGuestAccessSettings = self->_restrictedGuestAccessSettings;
  self->_restrictedGuestAccessSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateRestrictedGuestSettingsFromWorkingStoreIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  if (-[HMDUser isRestrictedGuest](self, "isRestrictedGuest"))
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isRestrictedGuestEnabled");

    if (v4)
    {
      -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "updateRestrictedGuestSettingsFromWorkingStore:", self);

      if (v6)
      {
        logAndPostNotification(CFSTR("HMDUserScheduleDidChangeNotification"), self, 0);
        -[HMDUser scheduleRestrictedGuestAccessTimersWithReason:](self, "scheduleRestrictedGuestAccessTimersWithReason:", CFSTR("Updated schedule from DB"));
      }
    }
  }
}

- (void)scheduleRestrictedGuestAccessTimersWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDUser_scheduleRestrictedGuestAccessTimersWithReason___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelRestrictedGuestScheduledTimers
{
  void *v3;
  void *v4;
  id v5;

  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDUser restrictedGuestScheduleStartTimerID](self, "restrictedGuestScheduleStartTimerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelTaskWithIdentifier:onObserver:", v3, self);

  -[HMDUser restrictedGuestScheduleEndTimerID](self, "restrictedGuestScheduleEndTimerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelTaskWithIdentifier:onObserver:", v4, self);

}

- (void)_handleRestrictedGuestNewSchedule:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDUser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  HMDUser *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Calculated new interval : [%@, %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "containsDate:", v13);

  if (v14)
  {
    -[HMDUser restrictedGuestScheduleEndTimerID](v7, "restrictedGuestScheduleEndTimerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
  }
  else
  {
    -[HMDUser restrictedGuestScheduleStartTimerID](v7, "restrictedGuestScheduleStartTimerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v17 = objc_msgSend(v12, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v15, v16, v7, sel_handleRestrictedGuestScheduleTimer_, &v28);
  v18 = v28;
  v19 = (void *)MEMORY[0x227676638]();
  v20 = v7;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if ((v17 & 1) != 0)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v23;
      v31 = 2112;
      v32 = v15;
      v33 = 2112;
      v34 = v16;
      v24 = "%{public}@Scheduled new timer for RG : %@ / %@";
      v25 = v22;
      v26 = OS_LOG_TYPE_INFO;
      v27 = 32;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v25, v26, v24, buf, v27);

    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v23;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v18;
    v24 = "%{public}@Failed to schedule RG schedule timer: %@ / %@ / %@";
    v25 = v22;
    v26 = OS_LOG_TYPE_ERROR;
    v27 = 42;
    goto LABEL_11;
  }

  objc_autoreleasePoolPop(v19);
}

- (void)handleRestrictedGuestScheduleTimer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUser *v9;

  v4 = a3;
  -[HMDUser queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDUser_handleRestrictedGuestScheduleTimer___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_notifyEveryOneAboutRestrictedGuestScheduleNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDUser *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = CFSTR("kUserUUIDKey");
  -[HMDUser uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  logAndPostNotification(v4, self, v6);
  if ((HMFEqualObjects() & 1) != 0)
  {
    v7 = (id *)MEMORY[0x24BDD7160];
LABEL_5:
    v8 = *v7;
    -[HMDUser messageDispatcher](self, "messageDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F1B0], "entitledMessageWithName:messagePayload:", v8, MEMORY[0x24BDBD1B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendMessage:target:", v10, v11);

    goto LABEL_9;
  }
  if ((HMFEqualObjects() & 1) != 0)
  {
    v7 = (id *)MEMORY[0x24BDD7158];
    goto LABEL_5;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Nothing to notify to clients", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
LABEL_9:

}

- (BOOL)isAccessCurrentlyAllowedBySchedule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[HMDUser home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRestrictedGuestEnabled")
    && -[HMDUser isRestrictedGuest](self, "isRestrictedGuest"))
  {
    -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "schedule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD7938];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isDate:withinAllowedTimeForSchedule:forHomeInTimeZone:", v7, v5, v8);

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)areAccessoriesInAllowedList:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[5];

  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRestrictedGuestEnabled")
    && -[HMDUser isRestrictedGuest](self, "isRestrictedGuest")
    && objc_msgSend(v4, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__HMDUser_areAccessoriesInAllowedList___block_invoke;
    v8[3] = &unk_24E79BCA0;
    v8[4] = self;
    v6 = objc_msgSend(v4, "na_all:", v8);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[HMDUser isRestrictedGuest](self, "isRestrictedGuest"))
  {
    -[HMDUser queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__HMDUser_handlePrimaryResidentUpdateNotification___block_invoke;
    v6[3] = &unk_24E79C268;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (BOOL)shouldWeOverrideRemoteAccessAllowedDespiteNoRemoteAccessAllowed
{
  BOOL v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDUser *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  HMDUser *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  void *v31;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (!-[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"))
  {
    -[HMDUser home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isRestrictedGuestEnabled"))
    {
LABEL_16:
      v3 = 0;
LABEL_23:

      return v3;
    }
    v5 = -[HMDUser isRestrictedGuest](self, "isRestrictedGuest");
    objc_msgSend(v4, "presenceMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v8 = objc_msgSend(v6, "isUserAtHome:", v7);

      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v12)
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUser userID](v10, "userID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543618;
          v34 = v13;
          v35 = 2112;
          v36 = v14;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[RG] : Allowing remote access for [%@] even though remote access is not allowed", (uint8_t *)&v33, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        v3 = 1;
        goto LABEL_23;
      }
      if (v12)
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser userID](v10, "userID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v30;
        v35 = 2112;
        v36 = v31;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[RG] : Not allowing remote access for [%@] as the user is not at Home", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      goto LABEL_16;
    }
    objc_msgSend(v6, "getLastLocalActivityTimeStampForUserUUID:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v3 = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v15, "timeIntervalSinceNow");
    v17 = fabs(v16);
    v18 = -[HMDUser configuredProofOfLocalityTimeout](self, "configuredProofOfLocalityTimeout");
    v20 = v19;
    v21 = (void *)MEMORY[0x227676638](v18);
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    v3 = v17 <= v20;
    if (v17 > v20)
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v25;
        v35 = 2112;
        v36 = v26;
        v37 = 2112;
        v38 = v15;
        v27 = "%{public}@User was last local %@ seconds ago at %@";
        v28 = v23;
        v29 = 32;
        goto LABEL_20;
      }
    }
    else if (v24)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser userID](v22, "userID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v25;
      v35 = 2112;
      v36 = v26;
      v27 = "%{public}@Allowing remote access for [%@] even though remote access is not allowed";
      v28 = v23;
      v29 = 22;
LABEL_20:
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v33, v29);

    }
    objc_autoreleasePoolPop(v21);
    goto LABEL_22;
  }
  return 1;
}

- (double)configuredProofOfLocalityTimeout
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDPreferenceAllowedToAcceptRemoteMessagesIntervalInHoursKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5 * 3600.0;

  return v6;
}

- (NSNumber)uniqueIDForAccessories
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__215181;
  v16 = __Block_byref_object_dispose__215182;
  v17 = 0;
  -[HMDUser home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__HMDUser_uniqueIDForAccessories__block_invoke;
  v9[3] = &unk_24E79C0A8;
  v9[4] = self;
  v6 = v5;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v6, "unsafeSynchronousBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (NSNumber *)v7;
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

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
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
  v5 = (void *)MEMORY[0x227676638]();
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
  uint64_t v58;
  HMDRestrictedGuestHomeAccessSettings *restrictedGuestAccessSettings;
  void *v60;
  void *v61;
  uint64_t v62;
  NSString *accessCode;
  uint64_t v64;
  NSUUID *accessCodeChangedByUserUUID;
  uint64_t v66;
  NSNumber *matterCASEAuthenticatedTagID;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
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
    v72 = v9;
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
    v13 = *MEMORY[0x24BDD7128];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x24BDD7128]))
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
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v16);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BBB0]), "initWithIdentifier:publicKey:privateKey:permissions:", v15, v17, 0, (v10 & 0xFFFFFFFFFFFFFFFDLL) == 1);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:](self, "initWithAccountHandle:home:pairingIdentity:privilege:", v7, v18, v14, 2);
    if (!v19)
    {
LABEL_54:
      self = v19;

      v6 = (HMDResidentUser *)self;
      goto LABEL_55;
    }
    v70 = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserCloudShareIDCodingKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    cloudShareID = v19->_cloudShareID;
    v19->_cloudShareID = (HMBShareUserID *)v20;

    v71 = v7;
    if (v19->_cloudShareID)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v19;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = v25;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@User has decoded their cloud share id and is cloud share ready", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(v23[25], "finishWithResult:", v19->_cloudShareID);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userUUID"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v69);
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
        objc_msgSend(MEMORY[0x24BDD7A90], "authWithCoder:", v4);
        v42 = objc_claimAutoreleasedReturnValue();
        presenceAuthStatus = v19->_presenceAuthStatus;
        v19->_presenceAuthStatus = (HMUserPresenceAuthorization *)v42;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7048]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v44)
          v19->_camerasAccessLevel = objc_msgSend(v44, "integerValue");
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7028]);
        v46 = objc_claimAutoreleasedReturnValue();
        assistantAccessControl = v19->_assistantAccessControl;
        v19->_assistantAccessControl = (HMDAssistantAccessControl *)v46;

        v48 = *MEMORY[0x24BDD7008];
        v49 = v4;
        v50 = objc_msgSend(v49, "decodeBoolForKey:", v48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserAnnounceAccessLevelCodingKey"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v19, v51, v52);
        v19->_announceAccessLevel = v53;
        objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD5AF0]);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v55 = v54;
        else
          v55 = 0;
        v56 = v55;

        v57 = objc_msgSend(v56, "integerValue");
        v19->_audioAnalysisUserDropInAccessLevel = v57;
        objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6AB8]);
        v58 = objc_claimAutoreleasedReturnValue();
        restrictedGuestAccessSettings = v19->_restrictedGuestAccessSettings;
        v19->_restrictedGuestAccessSettings = (HMDRestrictedGuestHomeAccessSettings *)v58;

        if (-[HMDUser isCurrentUser](v19, "isCurrentUser"))
        {
          if ((objc_msgSend(v49, "hmd_isForLocalStore") & 1) != 0)
          {
            objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7010]);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v19->_announceNotificationModeForCurrentDevice = objc_msgSend(v60, "deviceNotificationMode");

          }
          else
          {
            isWatch();
          }
        }
        objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7110]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v19->_needsiTunesMultiUserRepair = objc_msgSend(v61, "BOOLValue");

        if (objc_msgSend(v49, "containsValueForKey:", CFSTR("HMDUserAccessCodeCodingKey")))
        {
          objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserAccessCodeCodingKey"));
          v62 = objc_claimAutoreleasedReturnValue();
          accessCode = v19->_accessCode;
          v19->_accessCode = (NSString *)v62;

        }
        if (objc_msgSend(v49, "containsValueForKey:", CFSTR("HMDUserAccessCodeChangedByUserUUIDCodingKey")))
        {
          objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserAccessCodeChangedByUserUUIDCodingKey"));
          v64 = objc_claimAutoreleasedReturnValue();
          accessCodeChangedByUserUUID = v19->_accessCodeChangedByUserUUID;
          v19->_accessCodeChangedByUserUUID = (NSUUID *)v64;

        }
        v14 = v70;
        if (objc_msgSend(v49, "containsValueForKey:", CFSTR("HMDUserMatterCATIDCodingKey")))
        {
          objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserMatterCATIDCodingKey"));
          v66 = objc_claimAutoreleasedReturnValue();
          matterCASEAuthenticatedTagID = v19->_matterCASEAuthenticatedTagID;
          v19->_matterCASEAuthenticatedTagID = (NSNumber *)v66;

        }
        v7 = v71;
        goto LABEL_54;
      }
    }
    __displayNameForUser(v19);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v19->_displayName;
    v19->_displayName = (NSString *)v37;

    goto LABEL_35;
  }
  v6 = -[HMDResidentUser initWithCoder:]([HMDResidentUser alloc], "initWithCoder:", v4);
LABEL_55:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x227676638]();
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
  void *v35;
  id v36;
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
  _BOOL8 v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL8 v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  HMDAssistantAccessControl *v73;
  void *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  HMDAssistantAccessControl *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  uint8_t buf[4];
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
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
        v10 = (void *)MEMORY[0x227676638]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v95 = v13;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Display name was nil for non-current user", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        v14 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Display name was nil for non-current user"));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "submitLogEvent:", v14);

        v9 = &stru_24E79DB48;
      }
    }
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("userDisplayName"));
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isCurrentUser](self, "isCurrentUser"), CFSTR("HM.isCurrentUser"));
    if (!objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
      goto LABEL_52;
    -[HMDUser pairingIdentity](self, "pairingIdentity");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = objc_alloc(MEMORY[0x24BE3F228]);
      objc_msgSend(v35, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "publicKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v36, "initWithIdentifier:publicKey:privateKey:", v37, v38, 0);

      objc_msgSend(v4, "encodeObject:forKey:", v39, *MEMORY[0x24BDD7128]);
    }
    -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "mediaContentProfileAccessControlAccessoriesToEncode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    __accessoriesFromAccessoryUUIDs(v41, v5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      v44 = (void *)objc_msgSend(v42, "copy");
      objc_msgSend(v4, "encodeObject:forKey:", v44, *MEMORY[0x24BDD70F8]);

    }
    -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "userListeningHistoryUpdateControlModelAccessoriesToEncode");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
      objc_msgSend(v4, "encodeObject:forKey:", v46, *MEMORY[0x24BDD70E0]);

    -[HMDUser userID](self, "userID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v47, CFSTR("userID"));

    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isAdministrator](self, "isAdministrator"), CFSTR("isAdminUser"));
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isOwner](self, "isOwner"), CFSTR("HM.isOwnerUser"));
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), CFSTR("HM.isUserAllowedRemoteAccess"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v48, *MEMORY[0x24BDD7048]);

    v49 = -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
    objc_msgSend(v4, "encodeBool:forKey:", v49, *MEMORY[0x24BDD7008]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v50, *MEMORY[0x24BDD5AF0]);

    if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
    {
      if (!-[HMDUser isOwner](self, "isOwner"))
      {
        objc_msgSend(v5, "uuid");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "homeManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "sharedUserPrivateSettingsManager");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "settingsForHome:ofType:", v52, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v57, *MEMORY[0x24BDD70B0]);
        objc_msgSend(v56, "settingsForHome:ofType:", v52, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v58, *MEMORY[0x24BDD70B8]);

        goto LABEL_37;
      }
      -[HMDUser ownerPrivateSettingsAsDictionary](self, "ownerPrivateSettingsAsDictionary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v51, *MEMORY[0x24BDD70B0]);

    }
    -[HMDUser sharedSettingsAsDictionary](self, "sharedSettingsAsDictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v52, *MEMORY[0x24BDD70B8]);
LABEL_37:

    v59 = -[HMDUser isRestrictedGuest](self, "isRestrictedGuest");
    objc_msgSend(v4, "encodeBool:forKey:", v59, *MEMORY[0x24BDD70C8]);
    -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v61, *MEMORY[0x24BDD6AB8]);

    }
    v62 = objc_msgSend(v5, "isAccessToHomeAllowed");
    objc_msgSend(v4, "encodeBool:forKey:", v62, *MEMORY[0x24BDD5DF0]);
    if ((v62 & 1) == 0)
    {
      v63 = objc_msgSend(v5, "accessNotAllowedReasonCode");
      objc_msgSend(v4, "encodeInteger:forKey:", v63, *MEMORY[0x24BDD5C18]);
    }
    objc_msgSend(v5, "overriddenHomeAccessControl");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (v64)
    {
      v66 = objc_msgSend(v64, "unsignedIntegerValue");
      objc_msgSend(v4, "encodeInteger:forKey:", v66, *MEMORY[0x24BDD5C10]);
    }
    -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addToCoder:", v4);

    if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
    {
      objc_msgSend(v5, "presenceComputeStatus");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addToCoder:", v4);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v69, *MEMORY[0x24BDD7110]);

    }
    if (-[HMDUser isOwner](self, "isOwner"))
    {
      -[HMDUser assistantAccessControl](self, "assistantAccessControl");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v70, *MEMORY[0x24BDD7028]);
    }
    else
    {
      -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "assistantAccessControlAccessoriesToEncode");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
      {
        __accessoriesFromAccessoryUUIDs(v70, v5);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v93, "count") != 0;
        objc_msgSend(v93, "na_map:", &__block_literal_global_508);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "na_map:", &__block_literal_global_510);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = [HMDAssistantAccessControl alloc];
        -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
        v92 = v65;
        v74 = v5;
        v75 = v9;
        v76 = v35;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = -[HMDAssistantAccessControl initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:](v73, "initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:", self, v91, v72, v90, objc_msgSend(v77, "assistantAccessControlActivityNotificationsEnabledForPersonalRequests"));

        v35 = v76;
        v9 = v75;
        v5 = v74;
        v65 = v92;
        -[HMDUser userDataController](self, "userDataController");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantAccessControl setOptions:](v78, "setOptions:", objc_msgSend(v79, "assistantAccessControlRequiresAuthenticationForSecureRequests") ^ 1);

        -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantAccessControl configureWithSettingsController:](v78, "configureWithSettingsController:", v80);

        objc_msgSend(v4, "encodeObject:forKey:", v78, *MEMORY[0x24BDD7028]);
      }
    }

    if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
    {
      v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7488]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
      objc_msgSend(v4, "encodeObject:forKey:", v81, *MEMORY[0x24BDD7010]);

    }
    -[HMDUser photosPersonDataManager](self, "photosPersonDataManager");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "settings");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v83, *MEMORY[0x24BDD7138]);

LABEL_52:
    -[HMDUser account](self, "account");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "senderCorrelationIdentifier");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85 && (objc_msgSend(v4, "hmd_entitlements") & 0x1000) != 0)
      objc_msgSend(v4, "encodeObject:forKey:", v85, *MEMORY[0x24BDD7168]);

    goto LABEL_56;
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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser _compatiblePrivilege](self, "_compatiblePrivilege"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("userPrivilege"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("HM.userAdministratorType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), CFSTR("HM.isUserAllowedRemoteAccess"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, *MEMORY[0x24BDD7048]);

  v22 = -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  objc_msgSend(v4, "encodeBool:forKey:", v22, *MEMORY[0x24BDD7008]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("HMDUserAnnounceAccessLevelCodingKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, *MEMORY[0x24BDD5AF0]);

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
  objc_msgSend(v4, "encodeObject:forKey:", v32, *MEMORY[0x24BDD7128]);

  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    -[HMDUser assistantAccessControl](self, "assistantAccessControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v33, *MEMORY[0x24BDD7028]);

  }
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) != 0)
  {
LABEL_35:
    -[HMDUser accessCode](self, "accessCode");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v54, CFSTR("HMDUserAccessCodeCodingKey"));

    -[HMDUser accessCodeChangedByUserUUID](self, "accessCodeChangedByUserUUID");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMDUserAccessCodeChangedByUserUUIDCodingKey"));
LABEL_56:

    goto LABEL_57;
  }
  objc_msgSend(v4, "hmd_user");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDUser isEqual:](self, "isEqual:", v34))
  {

    goto LABEL_35;
  }
  v53 = objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount");

  if (v53)
    goto LABEL_35;
LABEL_57:
  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v86, CFSTR("HMDUserMatterCATIDCodingKey"));

  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    -[HMDUser cloudShareID](self, "cloudShareID");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v87, CFSTR("HMDUserCloudShareIDCodingKey"));

    if (-[HMDUser isCurrentUser](self, "isCurrentUser"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v88, *MEMORY[0x24BDD7110]);

    }
  }
  if (-[HMDUser isCurrentUser](self, "isCurrentUser")
    && ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
     || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") && isiOSDevice()))
  {
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7488]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
    objc_msgSend(v4, "encodeObject:forKey:", v89, *MEMORY[0x24BDD7010]);

  }
}

- (id)ownerPrivateSettingsAsDictionary
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
  _QWORD v24[19];
  _QWORD v25[21];

  v25[19] = *MEMORY[0x24BDAC8D0];
  v24[0] = CFSTR("root.home.addSceneButtonPresentedCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser ownerAddSceneButtonPresentedCount](self, "ownerAddSceneButtonPresentedCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v24[1] = CFSTR("root.home.completedSwitchingHomesOnboardingUI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerCompletedSwitchingHomesOnboardingUI](self, "ownerCompletedSwitchingHomesOnboardingUI"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v22;
  v24[2] = CFSTR("root.home.dismissed2024EnergyOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissed2024EnergyOnboarding](self, "ownerDismissed2024EnergyOnboarding"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  v24[3] = CFSTR("root.home.dismissedAccessCodeOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedAccessCodeOnboarding](self, "ownerDismissedAccessCodeOnboarding"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v20;
  v24[4] = CFSTR("root.home.dismissedAccessoryFirmwareUpdateOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedAccessoryFirmwareUpdateOnboarding](self, "ownerDismissedAccessoryFirmwareUpdateOnboarding"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v19;
  v24[5] = CFSTR("root.home.dismissedAnnounceOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedAnnounceOnboarding](self, "ownerDismissedAnnounceOnboarding"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v18;
  v24[6] = CFSTR("root.home.dismissedCameraRecordingOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedCameraRecordingOnboarding](self, "ownerDismissedCameraRecordingOnboarding"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v17;
  v24[7] = CFSTR("root.home.dismissedCameraRecordingSetupBanner");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedCameraRecordingSetupBanner](self, "ownerDismissedCameraRecordingSetupBanner"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v16;
  v24[8] = CFSTR("root.home.dismissedCameraUpgradeOfferBanner");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedCameraUpgradeOfferBanner](self, "ownerDismissedCameraUpgradeOfferBanner"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v15;
  v24[9] = CFSTR("root.home.dismissedHomeTheaterOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedHomeTheaterOnboarding](self, "ownerDismissedHomeTheaterOnboarding"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v14;
  v24[10] = CFSTR("root.home.dismissedIdentifyVoiceOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedIdentifyVoiceOnboarding](self, "ownerDismissedIdentifyVoiceOnboarding"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v3;
  v24[11] = CFSTR("root.home.dismissedIdentifyVoiceSetupBanner");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedIdentifyVoiceSetupBanner](self, "ownerDismissedIdentifyVoiceSetupBanner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[11] = v4;
  v24[12] = CFSTR("root.home.dismissedNaturalLightingOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedNaturalLightingOnboarding](self, "ownerDismissedNaturalLightingOnboarding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[12] = v5;
  v24[13] = CFSTR("root.home.dismissedTVViewingProfileOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedTVViewingProfileOnboarding](self, "ownerDismissedTVViewingProfileOnboarding"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[13] = v6;
  v24[14] = CFSTR("root.home.dismissedTVViewingProfileSetupBanner");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedTVViewingProfileSetupBanner](self, "ownerDismissedTVViewingProfileSetupBanner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[14] = v7;
  v24[15] = CFSTR("root.home.dismissedUserSplitMediaAccountWarning");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedUserSplitMediaAccountWarning](self, "ownerDismissedUserSplitMediaAccountWarning"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[15] = v8;
  v24[16] = CFSTR("root.home.dismissedWalletKeyExpressModeOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedWalletKeyExpressModeOnboarding](self, "ownerDismissedWalletKeyExpressModeOnboarding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[16] = v9;
  v24[17] = CFSTR("root.home.dismissedWelcomeUI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerDismissedWelcomeUI](self, "ownerDismissedWelcomeUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[17] = v10;
  v24[18] = CFSTR("root.home.hasUserSeenRMVNewLanguageNotification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser ownerHasUserSeenRMVNewLanguageNotification](self, "ownerHasUserSeenRMVNewLanguageNotification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[18] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)sharedSettingsAsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("root.music.allowExplicitContent");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser allowExplicitContent](self, "allowExplicitContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("root.music.allowiTunesAccount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser allowiTunesAccount](self, "allowiTunesAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("root.music.dolbyAtmos");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser dolbyAtmosEnabled](self, "dolbyAtmosEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("root.music.lossless");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser losslessMusicEnabled](self, "losslessMusicEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("root.music.playbackInfluencesForYou");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser playbackInfluencesEnabled](self, "playbackInfluencesEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("root.siri.identifyVoice");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser siriIdentifyVoiceEnabled](self, "siriIdentifyVoiceEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  HMDAssistantAccessControl *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  HMDUser *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *context;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
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

        goto LABEL_29;
      }
      v20 = -[HMDAssistantAccessControl initWithUser:model:]([HMDAssistantAccessControl alloc], "initWithUser:model:", self, v15);
      if (v20)
      {
        -[HMDUser accessorySettingsDataController](self, "accessorySettingsDataController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantAccessControl configureWithSettingsController:](v20, "configureWithSettingsController:", v26);

        -[HMDUser setAssistantAccessControl:](self, "setAssistantAccessControl:", v20);
      }
    }
    else
    {
      -[HMDUser home](self, "home");
      v20 = (HMDAssistantAccessControl *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      if (v23)
      {
        -[HMDAssistantAccessControl accessCodeManager](v20, "accessCodeManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dataManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v25, "handleUpdatedUserAccessCodeModel:forUser:message:", v23, self, v10);
        }
        else
        {
          context = (void *)MEMORY[0x227676638]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v33 = v30;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(context);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "respondWithError:", v29);

        }
      }

    }
    goto LABEL_29;
  }
  v13 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  -[HMDUser _transactionUserUpdated:newValues:message:](self, "_transactionUserUpdated:newValues:message:", v15, v12, v10);
LABEL_29:

}

- (void)_transactionUserUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMDUser *v17;
  NSObject *v18;
  id v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  HMDUser *v37;
  NSObject *v38;
  void *v39;
  HMDUser *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  HMDUser *v50;
  NSObject *v51;
  id v52;
  unint64_t v53;
  const __CFString *v54;
  void *v55;
  unsigned int v56;
  const __CFString *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  HMDUser *v71;
  NSObject *v72;
  void *v73;
  HMDUser *v74;
  __CFString *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  int v85;
  int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  HMDUser *v96;
  NSObject *v97;
  void *v98;
  HMDUser *v99;
  __CFString *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  HMDUser *v108;
  NSObject *v109;
  void *v110;
  uint64_t v111;
  __CFString *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  char v123;
  void *v124;
  HMDUser *v125;
  NSObject *v126;
  void *v127;
  __CFString *v128;
  void *v129;
  HMDUser *v130;
  NSObject *v131;
  void *v132;
  HMDUser *v133;
  void *v134;
  void *v135;
  void *v136;
  char v137;
  void *v138;
  HMDUser *v139;
  NSObject *v140;
  void *v141;
  HMDUser *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  char v149;
  __CFString *v150;
  void *v151;
  char v152;
  void *v153;
  HMDUser *v154;
  NSObject *v155;
  void *v156;
  HMDUser *v157;
  NSObject *v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  NSObject *group;
  id v164;
  HMDUser *v165;
  id v166;
  _QWORD block[4];
  id v168;
  id v169;
  uint8_t buf[4];
  id v171;
  __int16 v172;
  HMDUser *v173;
  __int16 v174;
  const __CFString *v175;
  __int16 v176;
  uint64_t v177;
  __int16 v178;
  id v179;
  __int16 v180;
  HMDUser *v181;
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
  v164 = a3;
  v8 = a4;
  v166 = a5;
  group = dispatch_group_create();
  objc_msgSend(v8, "accountHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "accountHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v8, "userID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v10 = 0;
      goto LABEL_9;
    }
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountHandleFromString:", v13);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_9;
  }
  -[HMDUser accountHandle](self, "accountHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
    -[HMDUser setAccountHandle:](self, "setAccountHandle:", v10);
LABEL_9:
  v165 = (HMDUser *)v10;
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDUser userID](v17, "userID");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HMDUser account](v17, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser isCurrentUser](v17, "isCurrentUser");
    HMFBooleanToString();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v171 = v19;
    v172 = 2112;
    v173 = v165;
    v174 = 2117;
    v175 = v20;
    v176 = 2112;
    v177 = (uint64_t)v21;
    v178 = 2112;
    v179 = v22;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Updated account handle [%@] for %{sensitive}@, account: %@, isCurrentUser: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v16);
  if (objc_msgSend(v8, "propertyWasSet:", CFSTR("accountIdentifier")))
  {
    objc_msgSend(v8, "accountIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser accountIdentifier](v17, "accountIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = HMFEqualObjects();

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v8, "accountIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setAccountIdentifier:](v17, "setAccountIdentifier:", v26);

    }
  }
  objc_msgSend(v8, "idsMergeIdentifier");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    objc_msgSend(v8, "idsMergeIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser mergeIdentifier](v17, "mergeIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = HMFEqualObjects();

    if ((v31 & 1) == 0)
    {
      objc_msgSend(v8, "idsMergeIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setMergeIdentifier:](v17, "setMergeIdentifier:", v32);

    }
  }
  -[HMDUser home](v17, "home");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUser uuid](v17, "uuid");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqual:", v34);

  if ((v35 & 1) == 0)
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v17;
    HMFGetOSLogHandle();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v40 = (HMDUser *)objc_claimAutoreleasedReturnValue();
      -[HMDUser uuid](v37, "uuid");
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v171 = v39;
      v172 = 2112;
      v173 = v40;
      v174 = 2112;
      v175 = v41;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Updating uuid: %@ from %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v36);
    -[HMDUser deregisterForMessages](v37, "deregisterForMessages");
    -[HMDUser uuid](v37, "uuid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setUUID:](v37, "setUUID:", v43);

    -[HMDUser registerForMessages](v37, "registerForMessages");
    -[HMDUser recoverUserCloudDataDueToUUIDChangeFromOldUUID:](v37, "recoverUserCloudDataDueToUUIDChangeFromOldUUID:", v42);

  }
  objc_msgSend(v8, "privilege");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    v46 = -[HMDUser privilege](v17, "privilege");
    objc_msgSend(v8, "privilege");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "integerValue");

    if (v46 != v48)
    {
      v49 = (void *)MEMORY[0x227676638]();
      v50 = v17;
      HMFGetOSLogHandle();
      v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (id)objc_claimAutoreleasedReturnValue();
        v53 = -[HMDUser privilege](v50, "privilege");
        if (v53 > 5)
          v54 = CFSTR("None");
        else
          v54 = off_24E793D90[v53];
        objc_msgSend(v8, "privilege");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "intValue");
        if (v56 > 5)
          v57 = CFSTR("None");
        else
          v57 = off_24E793D90[v56];
        *(_DWORD *)buf = 138543874;
        v171 = v52;
        v172 = 2112;
        v173 = (HMDUser *)v54;
        v174 = 2112;
        v175 = v57;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@User Privilege got updated from : %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v49);
      objc_msgSend(v8, "privilege");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setPrivilege:](v50, "setPrivilege:", objc_msgSend(v58, "integerValue"));

    }
  }
  objc_msgSend(v8, "remoteAccessAllowed");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    objc_msgSend(v8, "remoteAccessAllowed");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLValue");
    v63 = -[HMDUser isRemoteAccessAllowed](v17, "isRemoteAccessAllowed");

    if (v62 != v63)
    {
      objc_msgSend(v8, "remoteAccessAllowed");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setRemoteAccessAllowed:](v17, "setRemoteAccessAllowed:", objc_msgSend(v64, "BOOLValue"));

    }
  }
  objc_msgSend(v8, "camerasAccessLevel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "integerValue");

  objc_msgSend(v8, "camerasAccessLevel");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    v69 = -[HMDUser camerasAccessLevel](v17, "camerasAccessLevel");

    if (v66 != v69)
    {
      v70 = (void *)MEMORY[0x227676638]();
      v71 = v17;
      HMFGetOSLogHandle();
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser camerasAccessLevel](v71, "camerasAccessLevel");
        HMUserCameraAccessLevelAsString();
        v74 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        HMUserCameraAccessLevelAsString();
        v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v171 = v73;
        v172 = 2112;
        v173 = v74;
        v174 = 2112;
        v175 = v75;
        _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, "%{public}@Updating cameras access value from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v70);
      -[HMDUser setCamerasAccessLevel:](v71, "setCamerasAccessLevel:", v66);
    }
  }
  objc_msgSend(v8, "announceAccessLevel");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
    objc_msgSend(v8, "announceAccessLevel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "unsignedIntegerValue");
    v80 = -[HMDUser announceAccessLevel](v17, "announceAccessLevel");

    if (v79 != v80)
    {
      objc_msgSend(v8, "announceAccessLevel");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v17, 0, v81);
LABEL_51:
      -[HMDUser setAnnounceAccessLevel:](v17, "setAnnounceAccessLevel:", v89);
      goto LABEL_52;
    }
  }
  objc_msgSend(v8, "announceAccessLevel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
LABEL_52:

    goto LABEL_53;
  }
  objc_msgSend(v8, "announceAccessAllowed");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    objc_msgSend(v8, "announceAccessAllowed");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "BOOLValue");
    v86 = -[HMDUser isAnnounceAccessAllowed](v17, "isAnnounceAccessAllowed");

    if (v85 != v86)
    {
      objc_msgSend(v8, "announceAccessAllowed");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v81, "BOOLValue");
      v88 = 1;
      if (v87)
        v88 = 2;
      if (v17)
        v89 = v88;
      else
        v89 = 0;
      goto LABEL_51;
    }
  }
LABEL_53:
  objc_msgSend(v8, "audioAnalysisUserDropInAccessLevel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "integerValue");

  objc_msgSend(v8, "audioAnalysisUserDropInAccessLevel");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    v94 = -[HMDUser audioAnalysisUserDropInAccessLevel](v17, "audioAnalysisUserDropInAccessLevel");

    if (v91 != v94)
    {
      v95 = (void *)MEMORY[0x227676638]();
      v96 = v17;
      HMFGetOSLogHandle();
      v97 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](v96, "audioAnalysisUserDropInAccessLevel"));
        v99 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v91);
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v171 = v98;
        v172 = 2112;
        v173 = v99;
        v174 = 2112;
        v175 = v100;
        _os_log_impl(&dword_2218F0000, v97, OS_LOG_TYPE_INFO, "%{public}@Updating audio analysis user Dropin value from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v95);
      -[HMDUser setAudioAnalysisUserDropInAccessLevel:](v96, "setAudioAnalysisUserDropInAccessLevel:", v91);
    }
  }
  objc_msgSend(v8, "matterCASEAuthenticatedTagID");
  v101 = objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    v102 = (void *)v101;
    objc_msgSend(v8, "matterCASEAuthenticatedTagID");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v103, "integerValue"))
    {
      objc_msgSend(v8, "matterCASEAuthenticatedTagID");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser matterCASEAuthenticatedTagID](v17, "matterCASEAuthenticatedTagID");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v104, "isEqual:", v105);

      if ((v106 & 1) == 0)
      {
        v107 = (void *)MEMORY[0x227676638]();
        v108 = v17;
        HMFGetOSLogHandle();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUser matterCASEAuthenticatedTagID](v108, "matterCASEAuthenticatedTagID");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v160, "integerValue");
          -[HMDUser matterCASEAuthenticatedTagID](v108, "matterCASEAuthenticatedTagID");
          v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "matterCASEAuthenticatedTagID");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v113, "integerValue");
          objc_msgSend(v8, "matterCASEAuthenticatedTagID");
          v161 = v107;
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v171 = v110;
          v172 = 2048;
          v173 = (HMDUser *)v111;
          v174 = 2112;
          v175 = v112;
          v176 = 2048;
          v177 = v114;
          v178 = 2112;
          v179 = v115;
          v180 = 2112;
          v181 = v108;
          _os_log_impl(&dword_2218F0000, v109, OS_LOG_TYPE_INFO, "%{public}@Updating CATID from 0x%lX (%@) to 0x%lX (%@) for user %@", buf, 0x3Eu);

          v107 = v161;
        }

        objc_autoreleasePoolPop(v107);
        objc_msgSend(v8, "matterCASEAuthenticatedTagID");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser setMatterCASEAuthenticatedTagID:](v108, "setMatterCASEAuthenticatedTagID:", v116);

        -[HMDUser handleUpdatedCATForUser](v108, "handleUpdatedCATForUser");
      }
    }
    else
    {

    }
  }
  objc_msgSend(v8, "setProperties");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v117, "containsObject:", CFSTR("presenceAuthorizationStatus"));

  if (v118)
  {
    v119 = (void *)MEMORY[0x24BDD7A90];
    objc_msgSend(v8, "presenceAuthorizationStatus");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "authWithNumber:", v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    if (isPresenceAuthorizationValid())
    {
      -[HMDUser presenceAuthStatus](v17, "presenceAuthStatus");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = HMFEqualObjects();

      if ((v123 & 1) == 0)
      {
        v124 = (void *)MEMORY[0x227676638]();
        v125 = v17;
        HMFGetOSLogHandle();
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUser presenceAuthStatus](v125, "presenceAuthStatus");
          v128 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v171 = v127;
          v172 = 2112;
          v173 = v125;
          v174 = 2112;
          v175 = v128;
          v176 = 2112;
          v177 = (uint64_t)v121;
          _os_log_impl(&dword_2218F0000, v126, OS_LOG_TYPE_INFO, "%{public}@Updating the presence auth status for user %@ from %@ to %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v124);
        -[HMDUser setPresenceAuthStatus:](v125, "setPresenceAuthStatus:", v121);
      }
    }
    else
    {
      v129 = (void *)MEMORY[0x227676638]();
      v130 = v17;
      HMFGetOSLogHandle();
      v131 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "presenceAuthorizationStatus");
        v133 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v171 = v132;
        v172 = 2112;
        v173 = v133;
        _os_log_impl(&dword_2218F0000, v131, OS_LOG_TYPE_INFO, "%{public}@Ignoring the value for presence auth in user model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v129);
    }

  }
  -[HMDUser updateRestrictedGuestSettingsFromWorkingStoreIfNeeded](v17, "updateRestrictedGuestSettingsFromWorkingStoreIfNeeded");
  objc_msgSend(v8, "setProperties");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v134, "containsObject:", CFSTR("matCredIPKExternalRepresentation")))
  {
    -[HMDUser acwgIssuerPublicKeyExternalRepresentation](v17, "acwgIssuerPublicKeyExternalRepresentation");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "matCredIPKExternalRepresentation");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = HMFEqualObjects();

    if ((v137 & 1) != 0)
      goto LABEL_81;
    v138 = (void *)MEMORY[0x227676638]();
    v139 = v17;
    HMFGetOSLogHandle();
    v140 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "matCredIPKExternalRepresentation");
      v142 = (HMDUser *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v171 = v141;
      v172 = 2112;
      v173 = v142;
      _os_log_impl(&dword_2218F0000, v140, OS_LOG_TYPE_INFO, "%{public}@Updating acwgIssuerPublicKeyExternalRepresentation to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v138);
    objc_msgSend(v8, "matCredIPKExternalRepresentation");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setAcwgIssuerPublicKeyExternalRepresentation:](v139, "setAcwgIssuerPublicKeyExternalRepresentation:", v134);
  }

LABEL_81:
  objc_msgSend(v166, "transactionResult");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairingIdentity");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    v145 = (void *)MEMORY[0x24BE1BBB0];
    objc_msgSend(v8, "pairingIdentity");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "hmd_pairingIdentityWithDictionary:", v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDUser pairingIdentity](v17, "pairingIdentity");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = HMFEqualObjects();

    if ((v149 & 1) == 0)
      -[HMDUser setPairingIdentity:](v17, "setPairingIdentity:", v147);

  }
  -[HMDUser _transactionAccessorySettingsUpdated:](v17, "_transactionAccessorySettingsUpdated:", v8);
  -[HMDUser _transactionUserSettingsUpdated:](v17, "_transactionUserSettingsUpdated:", v8);
  -[HMDUser _transactionPhotosPersonManagerSettingsUpdated:](v17, "_transactionPhotosPersonManagerSettingsUpdated:", v8);
  objc_msgSend(v8, "ownerCharacteristicAuthorizationData");
  v150 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "propertyWasSet:", CFSTR("ownerCharacteristicAuthorizationData")))
  {
    -[HMDUser ownerCharacteristicAuthorizationData](v17, "ownerCharacteristicAuthorizationData");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = HMFEqualObjects();

    if ((v152 & 1) == 0)
    {
      v153 = (void *)MEMORY[0x227676638]();
      v154 = v17;
      HMFGetOSLogHandle();
      v155 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUser ownerCharacteristicAuthorizationData](v154, "ownerCharacteristicAuthorizationData");
        v157 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v171 = v156;
        v172 = 2112;
        v173 = v157;
        v174 = 2112;
        v175 = v150;
        _os_log_impl(&dword_2218F0000, v155, OS_LOG_TYPE_INFO, "%{public}@Updating owner user's characteristic authorization data %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v153);
      -[HMDUser setOwnerCharacteristicAuthorizationData:](v154, "setOwnerCharacteristicAuthorizationData:", v150);
    }
  }
  objc_msgSend(v143, "markChanged");
  objc_msgSend(v162, "workQueue");
  v158 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDUser__transactionUserUpdated_newValues_message___block_invoke;
  block[3] = &unk_24E79C268;
  v159 = v166;
  v168 = v159;
  v169 = 0;
  dispatch_group_notify(group, v158, block);

}

- (void)handleUpdatedCATForUser
{
  id v2;

  -[HMDUser home](self, "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleCATUpdate");

}

- (void)_transactionAccessorySettingsUpdated:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HMDUser assistantAccessControl](self, "assistantAccessControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areActivityNotificationsEnabledForPersonalRequests");
  objc_msgSend(v9, "activityNotificationsEnabledForPersonalRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v5 != v7)
  {
    objc_msgSend(v9, "activityNotificationsEnabledForPersonalRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivityNotificationsEnabledForPersonalRequests:", objc_msgSend(v8, "BOOLValue"));

    -[HMDUser postUserSettingsUpdatedNotificationWithReason:](self, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("Personal request settings enabled"));
  }

}

- (void)_transactionUserSettingsUpdated:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  int v68;
  int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  int v86;
  int v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  int v92;
  int v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  int v98;
  int v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  int v104;
  int v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  int v110;
  int v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  int v116;
  int v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  int v122;
  int v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  int v128;
  int v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  int v134;
  int v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  int v140;
  int v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  int v146;
  int v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  int v152;
  int v153;
  void *v154;
  id v155;

  v155 = a3;
  objc_msgSend(v155, "allowExplicitContent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(v155, "allowExplicitContent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "BOOLValue"),
        v8 = -[HMDUser allowExplicitContent](self, "allowExplicitContent"),
        v6,
        v5,
        v7 == v8))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v155, "allowExplicitContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setAllowExplicitContent:](self, "setAllowExplicitContent:", objc_msgSend(v9, "BOOLValue"));

    v10 = 1;
  }
  objc_msgSend(v155, "allowiTunesAccount");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v155, "allowiTunesAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");
    v15 = -[HMDUser allowiTunesAccount](self, "allowiTunesAccount");

    if (v14 != v15)
    {
      objc_msgSend(v155, "allowiTunesAccount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setAllowiTunesAccount:](self, "setAllowiTunesAccount:", objc_msgSend(v16, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "dolbyAtmosEnabled");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v155, "dolbyAtmosEnabled");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");
    v21 = -[HMDUser dolbyAtmosEnabled](self, "dolbyAtmosEnabled");

    if (v20 != v21)
    {
      objc_msgSend(v155, "dolbyAtmosEnabled");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setDolbyAtmosEnabled:](self, "setDolbyAtmosEnabled:", objc_msgSend(v22, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "losslessMusicEnabled");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_msgSend(v155, "losslessMusicEnabled");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");
    v27 = -[HMDUser losslessMusicEnabled](self, "losslessMusicEnabled");

    if (v26 != v27)
    {
      objc_msgSend(v155, "losslessMusicEnabled");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setLosslessMusicEnabled:](self, "setLosslessMusicEnabled:", objc_msgSend(v28, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "playbackInfluencesEnabled");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(v155, "playbackInfluencesEnabled");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");
    v33 = -[HMDUser playbackInfluencesEnabled](self, "playbackInfluencesEnabled");

    if (v32 != v33)
    {
      objc_msgSend(v155, "playbackInfluencesEnabled");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setPlaybackInfluencesEnabled:](self, "setPlaybackInfluencesEnabled:", objc_msgSend(v34, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "siriIdentifyVoiceEnabled");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    objc_msgSend(v155, "siriIdentifyVoiceEnabled");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");
    v39 = -[HMDUser siriIdentifyVoiceEnabled](self, "siriIdentifyVoiceEnabled");

    if (v38 != v39)
    {
      objc_msgSend(v155, "siriIdentifyVoiceEnabled");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setSiriIdentifyVoiceEnabled:](self, "setSiriIdentifyVoiceEnabled:", objc_msgSend(v40, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerAddSceneButtonPresentedCount");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    objc_msgSend(v155, "ownerAddSceneButtonPresentedCount");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "integerValue");
    v45 = -[HMDUser ownerAddSceneButtonPresentedCount](self, "ownerAddSceneButtonPresentedCount");

    if (v44 != v45)
    {
      objc_msgSend(v155, "ownerAddSceneButtonPresentedCount");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerAddSceneButtonPresentedCount:](self, "setOwnerAddSceneButtonPresentedCount:", objc_msgSend(v46, "integerValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerCompletedSwitchingHomesOnboardingUI");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    objc_msgSend(v155, "ownerCompletedSwitchingHomesOnboardingUI");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "BOOLValue");
    v51 = -[HMDUser ownerCompletedSwitchingHomesOnboardingUI](self, "ownerCompletedSwitchingHomesOnboardingUI");

    if (v50 != v51)
    {
      objc_msgSend(v155, "ownerCompletedSwitchingHomesOnboardingUI");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerCompletedSwitchingHomesOnboardingUI:](self, "setOwnerCompletedSwitchingHomesOnboardingUI:", objc_msgSend(v52, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedAccessCodeOnboarding");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    objc_msgSend(v155, "ownerDismissedAccessCodeOnboarding");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "BOOLValue");
    v57 = -[HMDUser ownerDismissedAccessCodeOnboarding](self, "ownerDismissedAccessCodeOnboarding");

    if (v56 != v57)
    {
      objc_msgSend(v155, "ownerDismissedAccessCodeOnboarding");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedAccessCodeOnboarding:](self, "setOwnerDismissedAccessCodeOnboarding:", objc_msgSend(v58, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedAccessoryFirmwareUpdateOnboarding");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    objc_msgSend(v155, "ownerDismissedAccessoryFirmwareUpdateOnboarding");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLValue");
    v63 = -[HMDUser ownerDismissedAccessoryFirmwareUpdateOnboarding](self, "ownerDismissedAccessoryFirmwareUpdateOnboarding");

    if (v62 != v63)
    {
      objc_msgSend(v155, "ownerDismissedAccessoryFirmwareUpdateOnboarding");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedAccessoryFirmwareUpdateOnboarding:](self, "setOwnerDismissedAccessoryFirmwareUpdateOnboarding:", objc_msgSend(v64, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedAnnounceOnboarding");
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = (void *)v65;
    objc_msgSend(v155, "ownerDismissedAnnounceOnboarding");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "BOOLValue");
    v69 = -[HMDUser ownerDismissedAnnounceOnboarding](self, "ownerDismissedAnnounceOnboarding");

    if (v68 != v69)
    {
      objc_msgSend(v155, "ownerDismissedAnnounceOnboarding");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedAnnounceOnboarding:](self, "setOwnerDismissedAnnounceOnboarding:", objc_msgSend(v70, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedCameraRecordingOnboarding");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)v71;
    objc_msgSend(v155, "ownerDismissedCameraRecordingOnboarding");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "BOOLValue");
    v75 = -[HMDUser ownerDismissedCameraRecordingOnboarding](self, "ownerDismissedCameraRecordingOnboarding");

    if (v74 != v75)
    {
      objc_msgSend(v155, "ownerDismissedCameraRecordingOnboarding");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedCameraRecordingOnboarding:](self, "setOwnerDismissedCameraRecordingOnboarding:", objc_msgSend(v76, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedCameraRecordingSetupBanner");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    objc_msgSend(v155, "ownerDismissedCameraRecordingSetupBanner");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "BOOLValue");
    v81 = -[HMDUser ownerDismissedCameraRecordingSetupBanner](self, "ownerDismissedCameraRecordingSetupBanner");

    if (v80 != v81)
    {
      objc_msgSend(v155, "ownerDismissedCameraRecordingSetupBanner");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedCameraRecordingSetupBanner:](self, "setOwnerDismissedCameraRecordingSetupBanner:", objc_msgSend(v82, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedCameraUpgradeOfferBanner");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    objc_msgSend(v155, "ownerDismissedCameraUpgradeOfferBanner");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "BOOLValue");
    v87 = -[HMDUser ownerDismissedCameraUpgradeOfferBanner](self, "ownerDismissedCameraUpgradeOfferBanner");

    if (v86 != v87)
    {
      objc_msgSend(v155, "ownerDismissedCameraUpgradeOfferBanner");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedCameraUpgradeOfferBanner:](self, "setOwnerDismissedCameraUpgradeOfferBanner:", objc_msgSend(v88, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedHomeTheaterOnboarding");
  v89 = objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    v90 = (void *)v89;
    objc_msgSend(v155, "ownerDismissedHomeTheaterOnboarding");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "BOOLValue");
    v93 = -[HMDUser ownerDismissedHomeTheaterOnboarding](self, "ownerDismissedHomeTheaterOnboarding");

    if (v92 != v93)
    {
      objc_msgSend(v155, "ownerDismissedHomeTheaterOnboarding");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedHomeTheaterOnboarding:](self, "setOwnerDismissedHomeTheaterOnboarding:", objc_msgSend(v94, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedIdentifyVoiceOnboarding");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    objc_msgSend(v155, "ownerDismissedIdentifyVoiceOnboarding");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "BOOLValue");
    v99 = -[HMDUser ownerDismissedIdentifyVoiceOnboarding](self, "ownerDismissedIdentifyVoiceOnboarding");

    if (v98 != v99)
    {
      objc_msgSend(v155, "ownerDismissedIdentifyVoiceOnboarding");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedIdentifyVoiceOnboarding:](self, "setOwnerDismissedIdentifyVoiceOnboarding:", objc_msgSend(v100, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedIdentifyVoiceSetupBanner");
  v101 = objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    v102 = (void *)v101;
    objc_msgSend(v155, "ownerDismissedIdentifyVoiceSetupBanner");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "BOOLValue");
    v105 = -[HMDUser ownerDismissedIdentifyVoiceSetupBanner](self, "ownerDismissedIdentifyVoiceSetupBanner");

    if (v104 != v105)
    {
      objc_msgSend(v155, "ownerDismissedIdentifyVoiceSetupBanner");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedIdentifyVoiceSetupBanner:](self, "setOwnerDismissedIdentifyVoiceSetupBanner:", objc_msgSend(v106, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedNaturalLightingOnboarding");
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    v108 = (void *)v107;
    objc_msgSend(v155, "ownerDismissedNaturalLightingOnboarding");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v109, "BOOLValue");
    v111 = -[HMDUser ownerDismissedNaturalLightingOnboarding](self, "ownerDismissedNaturalLightingOnboarding");

    if (v110 != v111)
    {
      objc_msgSend(v155, "ownerDismissedNaturalLightingOnboarding");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedNaturalLightingOnboarding:](self, "setOwnerDismissedNaturalLightingOnboarding:", objc_msgSend(v112, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedTVViewingProfileOnboarding");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    objc_msgSend(v155, "ownerDismissedTVViewingProfileOnboarding");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v115, "BOOLValue");
    v117 = -[HMDUser ownerDismissedTVViewingProfileOnboarding](self, "ownerDismissedTVViewingProfileOnboarding");

    if (v116 != v117)
    {
      objc_msgSend(v155, "ownerDismissedTVViewingProfileOnboarding");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedTVViewingProfileOnboarding:](self, "setOwnerDismissedTVViewingProfileOnboarding:", objc_msgSend(v118, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedTVViewingProfileSetupBanner");
  v119 = objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    v120 = (void *)v119;
    objc_msgSend(v155, "ownerDismissedTVViewingProfileSetupBanner");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v121, "BOOLValue");
    v123 = -[HMDUser ownerDismissedTVViewingProfileSetupBanner](self, "ownerDismissedTVViewingProfileSetupBanner");

    if (v122 != v123)
    {
      objc_msgSend(v155, "ownerDismissedTVViewingProfileSetupBanner");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedTVViewingProfileSetupBanner:](self, "setOwnerDismissedTVViewingProfileSetupBanner:", objc_msgSend(v124, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedUserSplitMediaAccountWarning");
  v125 = objc_claimAutoreleasedReturnValue();
  if (v125)
  {
    v126 = (void *)v125;
    objc_msgSend(v155, "ownerDismissedUserSplitMediaAccountWarning");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v127, "BOOLValue");
    v129 = -[HMDUser ownerDismissedUserSplitMediaAccountWarning](self, "ownerDismissedUserSplitMediaAccountWarning");

    if (v128 != v129)
    {
      objc_msgSend(v155, "ownerDismissedUserSplitMediaAccountWarning");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedUserSplitMediaAccountWarning:](self, "setOwnerDismissedUserSplitMediaAccountWarning:", objc_msgSend(v130, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedWalletKeyExpressModeOnboarding");
  v131 = objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    v132 = (void *)v131;
    objc_msgSend(v155, "ownerDismissedWalletKeyExpressModeOnboarding");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v133, "BOOLValue");
    v135 = -[HMDUser ownerDismissedWalletKeyExpressModeOnboarding](self, "ownerDismissedWalletKeyExpressModeOnboarding");

    if (v134 != v135)
    {
      objc_msgSend(v155, "ownerDismissedWalletKeyExpressModeOnboarding");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedWalletKeyExpressModeOnboarding:](self, "setOwnerDismissedWalletKeyExpressModeOnboarding:", objc_msgSend(v136, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissedWelcomeUI");
  v137 = objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    v138 = (void *)v137;
    objc_msgSend(v155, "ownerDismissedWelcomeUI");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend(v139, "BOOLValue");
    v141 = -[HMDUser ownerDismissedWelcomeUI](self, "ownerDismissedWelcomeUI");

    if (v140 != v141)
    {
      objc_msgSend(v155, "ownerDismissedWelcomeUI");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissedWelcomeUI:](self, "setOwnerDismissedWelcomeUI:", objc_msgSend(v142, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerHasUserSeenRMVNewLanguageNotification");
  v143 = objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    v144 = (void *)v143;
    objc_msgSend(v155, "ownerHasUserSeenRMVNewLanguageNotification");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v145, "BOOLValue");
    v147 = -[HMDUser ownerHasUserSeenRMVNewLanguageNotification](self, "ownerHasUserSeenRMVNewLanguageNotification");

    if (v146 != v147)
    {
      objc_msgSend(v155, "ownerHasUserSeenRMVNewLanguageNotification");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerHasUserSeenRMVNewLanguageNotification:](self, "setOwnerHasUserSeenRMVNewLanguageNotification:", objc_msgSend(v148, "BOOLValue"));

      v10 = 1;
    }
  }
  objc_msgSend(v155, "ownerDismissed2024EnergyOnboarding");
  v149 = objc_claimAutoreleasedReturnValue();
  if (v149)
  {
    v150 = (void *)v149;
    objc_msgSend(v155, "ownerDismissed2024EnergyOnboarding");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v151, "BOOLValue");
    v153 = -[HMDUser ownerDismissed2024EnergyOnboarding](self, "ownerDismissed2024EnergyOnboarding");

    if (v152 != v153)
    {
      objc_msgSend(v155, "ownerDismissed2024EnergyOnboarding");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUser setOwnerDismissed2024EnergyOnboarding:](self, "setOwnerDismissed2024EnergyOnboarding:", objc_msgSend(v154, "BOOLValue"));

LABEL_78:
      -[HMDUser postUserSettingsUpdatedNotificationWithReason:](self, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("User Settings updated"));
      goto LABEL_79;
    }
  }
  if (v10)
    goto LABEL_78;
LABEL_79:

}

- (void)_transactionPhotosPersonManagerSettingsUpdated:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HMDUser__transactionPhotosPersonManagerSettingsUpdated___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

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
  void *v14;
  void *v15;
  void *v16;
  HMDUser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
      -[HMDUser home](self, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accessCodeManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "handleRemovedUserAccessCodeModel:forUser:message:", v12, self, v7);
      }
      else
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v19;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not handling removed HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", (uint8_t *)&v21, 0xCu);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "respondWithError:", v20);

      }
    }

  }
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

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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
    -[HMDUser accessCode](self, "accessCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      -[HMDUser accessCodeChangedByUserUUID](self, "accessCodeChangedByUserUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    -[HMDUser accessCode](self, "accessCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser uuid](self, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser accessCodeChangedByUserUUID](self, "accessCodeChangedByUserUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccessCodeDataManager createUserAccessCodeModelFromAccessCode:forUserUUID:changedByUserUUID:](HMDAccessCodeDataManager, "createUserAccessCodeModelFromAccessCode:forUserUUID:changedByUserUUID:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v16);
    goto LABEL_10;
  }
LABEL_11:
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return -[HMDUser modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", a3, 4);
}

- (id)newModelWithChangeType:(unint64_t)a3
{
  void *v5;
  __objc2_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRestrictedGuestEnabled")
    && -[HMDUser isRestrictedGuest](self, "isRestrictedGuest"))
  {
    v6 = HMDGuestModel;
  }
  else
  {
    v6 = HMDUserModel;
  }
  v7 = [v6 alloc];
  -[HMDUser uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v9);

  return v10;
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
  void *v17;
  void *v18;
  void *v19;
  int v20;
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
  HMDResidentUserModel *v33;
  HMDResidentUserModel *v34;
  HMDResidentUserModel *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDUser *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
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
  -[HMDUser mergeIdentifier](self, "mergeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HMDResidentUserModel setIdsMergeIdentifier:](v11, "setIdsMergeIdentifier:", v15);
  }
  else
  {
    -[HMDUser account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "senderCorrelationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentUserModel setIdsMergeIdentifier:](v11, "setIdsMergeIdentifier:", v17);

  }
  if (a4 < 3)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setPrivilege:](v11, "setPrivilege:", v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setRemoteAccessAllowed:](v11, "setRemoteAccessAllowed:", v19);

  if (a4 == 3)
  {
LABEL_11:
    v20 = 0;
  }
  else
  {
    -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[HMDUser presenceAuthStatus](self, "presenceAuthStatus");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "number");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentUserModel setPresenceAuthorizationStatus:](v11, "setPresenceAuthorizationStatus:", v23);

    }
    v20 = 1;
  }
  -[HMDUser pairingIdentity](self, "pairingIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hmd_dictionaryEncoding");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setPairingIdentity:](v11, "setPairingIdentity:", v25);

  -[HMDUser userID](self, "userID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setUserID:](v11, "setUserID:", v26);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setCamerasAccessLevel:](v11, "setCamerasAccessLevel:", v27);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserModel setAudioAnalysisUserDropInAccessLevel:](v11, "setAudioAnalysisUserDropInAccessLevel:", v28);

  -[HMDUser matterCASEAuthenticatedTagID](self, "matterCASEAuthenticatedTagID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentUserModel setMatterCASEAuthenticatedTagID:](v11, "setMatterCASEAuthenticatedTagID:", v29);

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentUserModel setAnnounceAccessAllowed:](v11, "setAnnounceAccessAllowed:", v30);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentUserModel setAnnounceAccessLevel:](v11, "setAnnounceAccessLevel:", v31);

  }
  if (-[HMDUser isRestrictedGuest](self, "isRestrictedGuest"))
  {
    -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "uuidsOfAllowedAccessories");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentUserModel setAllowedAccessoryUUIDs:](v35, "setAllowedAccessoryUUIDs:", v37);

      v38 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentUserModel allowedAccessoryUUIDs](v35, "allowedAccessoryUUIDs");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138543618;
        v45 = v41;
        v46 = 2112;
        v47 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Added allowed accessory UUIDs to user model: %@", (uint8_t *)&v44, 0x16u);

      }
      objc_autoreleasePoolPop(v38);

    }
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

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing user cloud data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  queue = v4->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__HMDUser_removeCloudData__block_invoke;
  block[3] = &unk_24E79C240;
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
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  -[HMDUser userID](self, "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDUser privilege](self, "privilege");
  v5 = -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  v6 = -[HMDUser camerasAccessLevel](self, "camerasAccessLevel");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDUser announceAccessLevel](self, "announceAccessLevel");
  v9 = -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel");
  -[HMDUser restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUser userDictionaryWithUserID:privilege:remoteAccessAllowed:cameraAccessLevel:announceAccessAllowed:announceAccessLevel:audioAnalysisUserDropInAccessLevel:restrictedGuestAccessSettings:](HMDUser, "userDictionaryWithUserID:privilege:remoteAccessAllowed:cameraAccessLevel:announceAccessAllowed:announceAccessLevel:audioAnalysisUserDropInAccessLevel:restrictedGuestAccessSettings:", v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)settingsControllerFollowerKeyPaths:(id)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("root.music.allowiTunesAccount");
  v5[0] = CFSTR("root.siri.identifyVoice");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Did start local zone for backing store controller: %@", (uint8_t *)&v11, 0x16u);

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

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Did stop backing store controller: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUser postUserSettingsUpdatedNotificationWithReason:](v6, "postUserSettingsUpdatedNotificationWithReason:", CFSTR("User Settings Removed"));
  -[HMDUser privateBackingStoreController](v6, "privateBackingStoreController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Nil-ing out the person settings manager", (uint8_t *)&v14, 0xCu);

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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v15);
    goto LABEL_11;
  }
  if (!v9)
  {
    v15 = (void *)MEMORY[0x227676638]();
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
  v21 = (void *)MEMORY[0x227676638](v11, v12, v13);
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
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);

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

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v15);
    goto LABEL_11;
  }
  if (!v9)
  {
    v15 = (void *)MEMORY[0x227676638]();
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
  v21 = (void *)MEMORY[0x227676638](v11, v12, v13);
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
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);

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

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    v18 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v23, 0x16u);

    }
LABEL_16:

    objc_autoreleasePoolPop(v18);
    LOBYTE(v17) = 0;
    goto LABEL_19;
  }
  if (!v9)
  {
    v18 = (void *)MEMORY[0x227676638]();
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

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x227676638]();
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
    v11 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

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

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x227676638]();
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
    v11 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

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

- (id)setHasUserSeenRMVNewLanguageNotification:(BOOL)a3
{
  _BOOL8 v3;
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
  HMDUser *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  BOOL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDUser isOwner](self, "isOwner"))
  {
    v6 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(v5, "backingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __52__HMDUser_setHasUserSeenRMVNewLanguageNotification___block_invoke;
    v24[3] = &unk_24E798DB8;
    v24[4] = self;
    v25 = v3;
    objc_msgSend(v6, "inContext:perform:", v8, v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sharedUserPrivateSettingsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v8 && v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v18;
        v28 = 2112;
        v29 = CFSTR("root.home.hasUserSeenRMVNewLanguageNotification");
        v30 = 2112;
        v31 = CFSTR("ownerHasUserSeenRMVNewLanguageNotification");
        v32 = 2112;
        v33 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating shared user setting: '%@' (%@) = %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("root.home.hasUserSeenRMVNewLanguageNotification"));

      objc_msgSend(v13, "updateSettingsForHome:ofType:withValues:context:", v7, 1, v20, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2112;
        v29 = CFSTR("root.home.hasUserSeenRMVNewLanguageNotification");
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Context or manager is nil when updating %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
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

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDUser cloudShareID](self, "cloudShareID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing cloud share id", (uint8_t *)&v9, 0xCu);

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

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUser cloudShareID](self, "cloudShareID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDUser setCloudShareID:](self, "setCloudShareID:", v4);
    -[HMDUser home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "saveToCurrentAccountWithReason:", CFSTR("HMDUserCloudShareIDCodingKey"));

    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@User has updated their cloud share id and is cloud share ready", (uint8_t *)&v19, 0xCu);

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
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cloud Share ID has unexpectedly changed", (uint8_t *)&v19, 0xCu);

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
    dispatch_once(&trustTargetUUID_onceToken, &__block_literal_global_595);
  v3 = (void *)MEMORY[0x24BDD1880];
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
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__HMDUser_configureCloudShareTrustManager__block_invoke;
      block[3] = &unk_24E79C240;
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

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[HMDUser isOwner](self, "isOwner")
    && -[HMDUser isCurrentUser](self, "isCurrentUser")
    && (objc_msgSend(v7, "isOwner") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Will share cloud share trust with user: %@", (uint8_t *)&v14, 0x16u);

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

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust manager did fetch owner cloud share id: %@", (uint8_t *)&v12, 0x16u);

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

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Trust has been configured", (uint8_t *)&v9, 0xCu);

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

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed cloud share trust", (uint8_t *)&v9, 0xCu);

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

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUser home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, v17);

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

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUser home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_598);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Aggregating settings to migrate user settings for Accessories = %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_599;
  v13[3] = &unk_24E793BC8;
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
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke;
  v8[3] = &unk_24E793C18;
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
  objc_msgSend(v3, "na_map:", &__block_literal_global_655);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
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
  return (HMBShareUserID *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCloudShareID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NAFuture)cloudShareIDFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 200, 1);
}

- (HMDUserPhotosPersonDataManager)photosPersonDataManager
{
  return (HMDUserPhotosPersonDataManager *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPhotosPersonDataManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (HMDPersonSettingsManager)personSettingsManager
{
  return (HMDPersonSettingsManager *)objc_getProperty(self, a2, 216, 1);
}

- (void)setPersonSettingsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)accessCode
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAccessCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSUUID)accessCodeChangedByUserUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAccessCodeChangedByUserUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (HMDUserDataController)userDataController
{
  return (HMDUserDataController *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUserDataController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSDictionary)ownerCharacteristicAuthorizationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setOwnerCharacteristicAuthorizationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSData)acwgIssuerPublicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAcwgIssuerPublicKeyExternalRepresentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (unint64_t)userAccessPolicy
{
  return self->_userAccessPolicy;
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 272, 1);
}

- (void)setShareMessenger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (HMDUserSettingsBackingStoreController)privateBackingStoreController
{
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPrivateBackingStoreController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
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
  return (HMDUserDataSource *)objc_getProperty(self, a2, 288, 1);
}

- (HMDSiriMultiUserNewLanguageNotificationManager)siriMultiUserNewLanguageNotificationManager
{
  return (HMDSiriMultiUserNewLanguageNotificationManager *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSiriMultiUserNewLanguageNotificationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (HMDUserAccessorySettingsDataController)accessorySettingsDataController
{
  return (HMDUserAccessorySettingsDataController *)objc_getProperty(self, a2, 304, 1);
}

- (void)setAccessorySettingsDataController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSSet)cachedCurrentUserPairingIdentityIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 312, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 320, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 328, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
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
  return (HMDCloudShareTrustManager *)objc_getProperty(self, a2, 344, 1);
}

- (void)setCloudShareTrustManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (HMDUserSettingsBackingStoreController)sharedBackingStoreController
{
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSharedBackingStoreController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_getProperty(self, a2, 360, 1);
}

- (unint64_t)ownerAddSceneButtonPresentedCount
{
  return self->_ownerAddSceneButtonPresentedCount;
}

- (void)setOwnerAddSceneButtonPresentedCount:(unint64_t)a3
{
  self->_ownerAddSceneButtonPresentedCount = a3;
}

- (BOOL)ownerCompletedSwitchingHomesOnboardingUI
{
  return self->_ownerCompletedSwitchingHomesOnboardingUI;
}

- (void)setOwnerCompletedSwitchingHomesOnboardingUI:(BOOL)a3
{
  self->_ownerCompletedSwitchingHomesOnboardingUI = a3;
}

- (BOOL)ownerDismissed2024EnergyOnboarding
{
  return self->_ownerDismissed2024EnergyOnboarding;
}

- (void)setOwnerDismissed2024EnergyOnboarding:(BOOL)a3
{
  self->_ownerDismissed2024EnergyOnboarding = a3;
}

- (BOOL)ownerDismissedAccessCodeOnboarding
{
  return self->_ownerDismissedAccessCodeOnboarding;
}

- (void)setOwnerDismissedAccessCodeOnboarding:(BOOL)a3
{
  self->_ownerDismissedAccessCodeOnboarding = a3;
}

- (BOOL)ownerDismissedAccessoryFirmwareUpdateOnboarding
{
  return self->_ownerDismissedAccessoryFirmwareUpdateOnboarding;
}

- (void)setOwnerDismissedAccessoryFirmwareUpdateOnboarding:(BOOL)a3
{
  self->_ownerDismissedAccessoryFirmwareUpdateOnboarding = a3;
}

- (BOOL)ownerDismissedAnnounceOnboarding
{
  return self->_ownerDismissedAnnounceOnboarding;
}

- (void)setOwnerDismissedAnnounceOnboarding:(BOOL)a3
{
  self->_ownerDismissedAnnounceOnboarding = a3;
}

- (BOOL)ownerDismissedCameraRecordingOnboarding
{
  return self->_ownerDismissedCameraRecordingOnboarding;
}

- (void)setOwnerDismissedCameraRecordingOnboarding:(BOOL)a3
{
  self->_ownerDismissedCameraRecordingOnboarding = a3;
}

- (BOOL)ownerDismissedCameraRecordingSetupBanner
{
  return self->_ownerDismissedCameraRecordingSetupBanner;
}

- (void)setOwnerDismissedCameraRecordingSetupBanner:(BOOL)a3
{
  self->_ownerDismissedCameraRecordingSetupBanner = a3;
}

- (BOOL)ownerDismissedCameraUpgradeOfferBanner
{
  return self->_ownerDismissedCameraUpgradeOfferBanner;
}

- (void)setOwnerDismissedCameraUpgradeOfferBanner:(BOOL)a3
{
  self->_ownerDismissedCameraUpgradeOfferBanner = a3;
}

- (BOOL)ownerDismissedHomeTheaterOnboarding
{
  return self->_ownerDismissedHomeTheaterOnboarding;
}

- (void)setOwnerDismissedHomeTheaterOnboarding:(BOOL)a3
{
  self->_ownerDismissedHomeTheaterOnboarding = a3;
}

- (BOOL)ownerDismissedIdentifyVoiceOnboarding
{
  return self->_ownerDismissedIdentifyVoiceOnboarding;
}

- (void)setOwnerDismissedIdentifyVoiceOnboarding:(BOOL)a3
{
  self->_ownerDismissedIdentifyVoiceOnboarding = a3;
}

- (BOOL)ownerDismissedIdentifyVoiceSetupBanner
{
  return self->_ownerDismissedIdentifyVoiceSetupBanner;
}

- (void)setOwnerDismissedIdentifyVoiceSetupBanner:(BOOL)a3
{
  self->_ownerDismissedIdentifyVoiceSetupBanner = a3;
}

- (BOOL)ownerDismissedNaturalLightingOnboarding
{
  return self->_ownerDismissedNaturalLightingOnboarding;
}

- (void)setOwnerDismissedNaturalLightingOnboarding:(BOOL)a3
{
  self->_ownerDismissedNaturalLightingOnboarding = a3;
}

- (BOOL)ownerDismissedTVViewingProfileOnboarding
{
  return self->_ownerDismissedTVViewingProfileOnboarding;
}

- (void)setOwnerDismissedTVViewingProfileOnboarding:(BOOL)a3
{
  self->_ownerDismissedTVViewingProfileOnboarding = a3;
}

- (BOOL)ownerDismissedTVViewingProfileSetupBanner
{
  return self->_ownerDismissedTVViewingProfileSetupBanner;
}

- (void)setOwnerDismissedTVViewingProfileSetupBanner:(BOOL)a3
{
  self->_ownerDismissedTVViewingProfileSetupBanner = a3;
}

- (BOOL)ownerDismissedUserSplitMediaAccountWarning
{
  return self->_ownerDismissedUserSplitMediaAccountWarning;
}

- (void)setOwnerDismissedUserSplitMediaAccountWarning:(BOOL)a3
{
  self->_ownerDismissedUserSplitMediaAccountWarning = a3;
}

- (BOOL)ownerDismissedWalletKeyExpressModeOnboarding
{
  return self->_ownerDismissedWalletKeyExpressModeOnboarding;
}

- (void)setOwnerDismissedWalletKeyExpressModeOnboarding:(BOOL)a3
{
  self->_ownerDismissedWalletKeyExpressModeOnboarding = a3;
}

- (BOOL)ownerDismissedWelcomeUI
{
  return self->_ownerDismissedWelcomeUI;
}

- (void)setOwnerDismissedWelcomeUI:(BOOL)a3
{
  self->_ownerDismissedWelcomeUI = a3;
}

- (BOOL)ownerHasUserSeenRMVNewLanguageNotification
{
  return self->_ownerHasUserSeenRMVNewLanguageNotification;
}

- (void)setOwnerHasUserSeenRMVNewLanguageNotification:(BOOL)a3
{
  self->_ownerHasUserSeenRMVNewLanguageNotification = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

- (BOOL)allowiTunesAccount
{
  return self->_allowiTunesAccount;
}

- (void)setAllowiTunesAccount:(BOOL)a3
{
  self->_allowiTunesAccount = a3;
}

- (BOOL)dolbyAtmosEnabled
{
  return self->_dolbyAtmosEnabled;
}

- (void)setDolbyAtmosEnabled:(BOOL)a3
{
  self->_dolbyAtmosEnabled = a3;
}

- (BOOL)losslessMusicEnabled
{
  return self->_losslessMusicEnabled;
}

- (void)setLosslessMusicEnabled:(BOOL)a3
{
  self->_losslessMusicEnabled = a3;
}

- (BOOL)playbackInfluencesEnabled
{
  return self->_playbackInfluencesEnabled;
}

- (void)setPlaybackInfluencesEnabled:(BOOL)a3
{
  self->_playbackInfluencesEnabled = a3;
}

- (BOOL)siriIdentifyVoiceEnabled
{
  return self->_siriIdentifyVoiceEnabled;
}

- (void)setSiriIdentifyVoiceEnabled:(BOOL)a3
{
  self->_siriIdentifyVoiceEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_sharedBackingStoreController, 0);
  objc_storeStrong((id *)&self->_cloudShareTrustManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedCurrentUserPairingIdentityIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataController, 0);
  objc_storeStrong((id *)&self->_siriMultiUserNewLanguageNotificationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_privateBackingStoreController, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_acwgIssuerPublicKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_ownerCharacteristicAuthorizationData, 0);
  objc_storeStrong((id *)&self->_userDataController, 0);
  objc_storeStrong((id *)&self->_accessCodeChangedByUserUUID, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_personSettingsManager, 0);
  objc_storeStrong((id *)&self->_photosPersonDataManager, 0);
  objc_storeStrong((id *)&self->_cloudShareIDFuture, 0);
  objc_storeStrong((id *)&self->_cloudShareID, 0);
  objc_storeStrong((id *)&self->_matterCASEAuthenticatedTagID, 0);
  objc_storeStrong((id *)&self->_restrictedGuestAccessSettings, 0);
  objc_storeStrong((id *)&self->_assistantAccessControl, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_mergeIdentifier, 0);
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
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke_2;
  v6[3] = &unk_24E793BF0;
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

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("root.music.allowExplicitContent"));

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@setting found = %@", (uint8_t *)&v13, 0x16u);

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

void __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_599(uint64_t a1, void *a2)
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

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2557E0510))
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
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_2;
        v16[3] = &unk_24E7979C8;
        v8 = *(void **)(a1 + 32);
        v16[4] = *(_QWORD *)(a1 + 40);
        v9 = objc_msgSend(v8, "na_any:", v16);
        v10 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Aggregated value = %@ for allowExplicitContent", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
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

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@checking allowExplicitContent setting for accessory %@", (uint8_t *)&v10, 0x16u);

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

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("79E0D39A-83CC-42C1-99FC-5B4E0745E284"));
  v1 = (void *)trustTargetUUID_namespace;
  trustTargetUUID_namespace = v0;

}

uint64_t __52__HMDUser_setHasUserSeenRMVNewLanguageNotification___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findUserWithModelID:](HMCContext, "findUserWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v13;
      v20 = 2112;
      v21 = v2;
      v22 = 2112;
      v23 = CFSTR("root.home.hasUserSeenRMVNewLanguageNotification");
      v14 = "%{public}@Unable to fetch the user with id [%@] when updating %@";
      v15 = v7;
      v16 = 32;
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v4);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v8;
    v20 = 2112;
    v21 = CFSTR("root.home.hasUserSeenRMVNewLanguageNotification");
    v22 = 2112;
    v23 = CFSTR("ownerHasUserSeenRMVNewLanguageNotification");
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating owner user setting: '%@' (%@) = %@", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("ownerHasUserSeenRMVNewLanguageNotification"));

  +[HMCContext currentContext](HMCContext, "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "save");

  if ((v12 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v13;
      v14 = "%{public}@Error when saving the update";
      v15 = v7;
      v16 = 12;
LABEL_9:
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, v16);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

  return 1;
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

void __58__HMDUser__transactionPhotosPersonManagerSettingsUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "photosPersonDataManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleUpdatedUserModel:", *(_QWORD *)(a1 + 40));

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

void __33__HMDUser_uniqueIDForAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFHome findHomeMemberWithUUID:context:](_MKFHome, "findHomeMemberWithUUID:context:", v2, v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (v10)
  {
    objc_msgSend(v10, "uniqueIDForAccessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToNumber:", &unk_24E96D0B8);

    v4 = v10;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v10, "uniqueIDForAccessories");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v4 = v10;
    }
  }

}

void __51__HMDUser_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received resident update notification: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __39__HMDUser_areAccessoriesInAllowedList___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "restrictedGuestAccessSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuidsOfAllowedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

void __46__HMDUser_handleRestrictedGuestScheduleTimer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  char v45;
  void *v46;
  const char *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("HMD.BGTM.NK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v7;
    v53 = 2112;
    v54 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@RG schedule timer fired: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "restrictedGuestScheduleStartTimerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  objc_msgSend(*(id *)(a1 + 40), "restrictedGuestScheduleEndTimerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HMFEqualObjects();

  if ((v9 & 1) != 0 || (v11 & 1) != 0)
  {
    +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 40);
    if (v9)
    {
      objc_msgSend(v17, "restrictedGuestAccessSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nextScheduledInterval");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "containsDate:", v20);

        if ((v21 & 1) != 0)
        {
          v22 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "_notifyEveryOneAboutRestrictedGuestScheduleNotification:", CFSTR("HMDUserRestrictedGuestScheduleStartedNotification")));
          v23 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "endDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v25;
            v53 = 2112;
            v54 = v26;
            _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Going to schedule the end period timer: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v22);
          objc_msgSend(*(id *)(a1 + 40), "restrictedGuestScheduleEndTimerID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "endDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(_QWORD *)(a1 + 40);
          v50 = 0;
          v30 = objc_msgSend(v16, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v27, v28, v29, sel_handleRestrictedGuestScheduleTimer_, &v50);
          v31 = v50;

          if ((v30 & 1) != 0)
            goto LABEL_31;
          v32 = (void *)MEMORY[0x227676638]();
          v33 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
LABEL_30:

            objc_autoreleasePoolPop(v32);
LABEL_31:

            goto LABEL_32;
          }
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "endDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v35;
          v53 = 2112;
          v54 = v36;
          v55 = 2112;
          v56 = v31;
          v37 = "%{public}@Failed to schedule end timer: %@ / %@";
LABEL_22:
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, v37, buf, 0x20u);

          goto LABEL_30;
        }
        v32 = (void *)MEMORY[0x227676638]();
        v33 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v52 = v48;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Looks like we are not within the allowed time interval anymore.", buf, 0xCu);

        }
LABEL_29:
        v31 = 0;
        goto LABEL_30;
      }
      v32 = (void *)MEMORY[0x227676638]();
      v33 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
LABEL_28:
        v19 = 0;
        goto LABEL_29;
      }
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v46;
      v47 = "%{public}@Looks like the schedule is not valid anymore.";
    }
    else
    {
      objc_msgSend(v17, "_notifyEveryOneAboutRestrictedGuestScheduleNotification:", CFSTR("HMDUserRestrictedGuestScheduleEndedNotification"));
      objc_msgSend(*(id *)(a1 + 40), "restrictedGuestAccessSettings");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "nextScheduledInterval");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x227676638]();
      v33 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v39)
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v40;
          v53 = 2112;
          v54 = v41;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Going to schedule the start period timer: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(*(id *)(a1 + 40), "restrictedGuestScheduleStartTimerID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *(_QWORD *)(a1 + 40);
        v49 = 0;
        v45 = objc_msgSend(v16, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v42, v43, v44, sel_handleRestrictedGuestScheduleTimer_, &v49);
        v31 = v49;

        if ((v45 & 1) != 0)
          goto LABEL_31;
        v32 = (void *)MEMORY[0x227676638]();
        v33 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v35;
        v53 = 2112;
        v54 = v36;
        v55 = 2112;
        v56 = v31;
        v37 = "%{public}@Failed to schedule start timer: %@ / %@";
        goto LABEL_22;
      }
      if (!v39)
        goto LABEL_28;
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v46;
      v47 = "%{public}@No more intervals in the schedule. Nothing to schedule";
    }
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, v47, buf, 0xCu);

    goto LABEL_28;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v15;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@This is neither start nor end timer. File a radar for BTM", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
LABEL_32:

}

void __57__HMDUser_scheduleRestrictedGuestAccessTimersWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "restrictedGuestAccessSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "schedule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 138543874;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to schedule timers for restricted guest: %@, reason: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "cancelRestrictedGuestScheduledTimers");
  objc_msgSend(*(id *)(a1 + 32), "restrictedGuestAccessSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextScheduledInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "_handleRestrictedGuestNewSchedule:", v10);

}

uint64_t __51__HMDUser__migrateAnnounceNotificationModeIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnnounceNotificationModeToLocalStore:managedObjectContext:", (int)objc_msgSend(*(id *)(a1 + 40), "intValue"), *(_QWORD *)(a1 + 48));
}

void __54__HMDUser__readAnnounceNotificationModeFromLocalStore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[MKFLocalBulletinAnnounceUserSettingRegistration fetchAnnounceRegistrationWithHomeUUID:managedObjectContext:](MKFLocalBulletinAnnounceUserSettingRegistration, "fetchAnnounceRegistrationWithHomeUUID:managedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 48), "setAnnounceNotificationModeForCurrentDevice:", (int)objc_msgSend(v2, "announceNotificationMode")));
    v5 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "announceNotificationModeForCurrentDevice"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Announce Notification Mode : %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Did not find announce setting in local store.", (uint8_t *)&v10, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __45__HMDUser__saveAnnounceSettingsToLocalStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnnounceNotificationModeToLocalStore:managedObjectContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __42__HMDUser_updateAnnounceNotificationMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnnounceNotificationMode:", *(_QWORD *)(a1 + 40));
}

void __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessorySettingsDataController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessorySettingsDataController");
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

void __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_431(uint64_t a1, void *a2)
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

void __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_434(uint64_t a1, void *a2)
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

uint64_t __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
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

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    v8 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send remote share client repair message: %@", (uint8_t *)&v12, 0x16u);

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

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x24BDD7170]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received user share message response. nonce:%@ Error: %@", (uint8_t *)&v13, 0x20u);

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

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send cloud share with owner message. Error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 40), "_handleCloudShareWithOwnerMessageError");
    }
    if (v5)
    {
      v14 = *MEMORY[0x24BDD7170];
      v15 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
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
    v4 = (objc_class *)MEMORY[0x24BE3F228];
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

uint64_t __42__HMDUser_initializeUserSettingsWithHome___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "configurePhotosPersonDataManager");
  return objc_msgSend(*(id *)(a1 + 32), "configurePersonSettingsManager");
}

void __47__HMDUser_handleUserDataControllerInitialized___block_invoke(uint64_t a1)
{
  HMDSiriMultiUserNewLanguageNotificationManager *v2;
  void *v3;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentUser"))
  {
    if (isiPhoneDevice())
    {
      v4 = -[HMDSiriMultiUserNewLanguageNotificationManagerContext initWithUser:workQueue:]([HMDSiriMultiUserNewLanguageNotificationManagerContext alloc], "initWithUser:workQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));
      -[HMDSiriMultiUserNewLanguageNotificationManagerContext configure](v4, "configure");
      v2 = -[HMDSiriMultiUserNewLanguageNotificationManager initWithContext:]([HMDSiriMultiUserNewLanguageNotificationManager alloc], "initWithContext:", v4);
      objc_msgSend(*(id *)(a1 + 32), "setSiriMultiUserNewLanguageNotificationManager:", v2);

      objc_msgSend(*(id *)(a1 + 32), "siriMultiUserNewLanguageNotificationManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "checkAllMediaAccessoriesAndPostNotificationIfNecessary");

    }
  }
}

uint64_t __29__HMDUser_configureWithHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshDisplayName");
}

+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4 forceHH1Key:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
  {
    v37 = 0;
    v38 = 0;
    v36 = 0;
    v14 = objc_msgSend(v12, "getControllerPublicKey:secretKey:username:allowCreation:error:", &v38, 0, &v37, 0, &v36);
    v15 = v38;
    v16 = v37;
    v17 = v36;
    v18 = v17;
    if ((v14 & 1) != 0)
    {
      v19 = a1;

LABEL_6:
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v15);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BBB0]), "initWithIdentifier:publicKey:privateKey:permissions:", v16, v21, 0, (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1);

      a1 = v19;
      goto LABEL_14;
    }
    v23 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = a1;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v25;
      v41 = 2112;
      v42 = v18;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get current user from keychain with error: %@", buf, 0x16u);

      a1 = v35;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v37 = 0;
    v38 = 0;
    v20 = objc_msgSend(v12, "getOrCreateHH2ControllerKey:secretKey:keyPair:username:", &v38, 0, 0, &v37);
    v15 = v38;
    v16 = v37;
    if ((v20 & 1) != 0)
    {
      v19 = a1;
      goto LABEL_6;
    }
    v26 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get/create HH2 controller key from keychain", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }
  v22 = 0;
LABEL_14:

  if (v22)
  {
    v29 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccountHandle:home:pairingIdentity:privilege:", v11, v8, v22, a3);
    objc_msgSend(v29, "refreshDisplayName");
  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = a1;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v33;
      v41 = 2112;
      v42 = 0;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v29 = 0;
  }

  return v29;
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

  v34 = *MEMORY[0x24BDAC8D0];
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

      v23 = objc_alloc(MEMORY[0x24BE1BBB0]);
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
    v18 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", buf, 0x16u);

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

  v42[2] = *MEMORY[0x24BDAC8D0];
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
    v18 = (void *)MEMORY[0x24BDD1880];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("05A41D49-2A4D-4D9E-8A3E-43A779B973BA"));
    objc_msgSend(v11, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v20;
    objc_msgSend(v14, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x24BDD1880];
    if (!v10 || !v11)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("05A41D49-2A4D-4D9E-8A3E-43A779B973BA"));
    objc_msgSend(v11, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    v41[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  v24 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Created user UUID: %@ from userID: %@ homeUUID: %@ uuid: %@ pairingIdentity: %@", (uint8_t *)&v29, 0x3Eu);

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

+ (id)allowedClassesForAnnounceNotificationMode
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allowedClassesForSyncData
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allLastUserSyncDataArchives
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  v21 = v2;
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("HMDUser-Sync-Data-")))
        {
          v11 = (void *)MEMORY[0x24BDD17C8];
          v12 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@/%@"), v12, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = (void *)MEMORY[0x227676638]();
            v15 = a1;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = v8;
              v18 = v5;
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v29 = v19;
              v30 = 2112;
              v31 = v13;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Found hh2 shared user last sync data %@", buf, 0x16u);

              v5 = v18;
              v8 = v17;
            }

            objc_autoreleasePoolPop(v14);
            objc_msgSend(v23, "addObject:", v13);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }

  return v23;
}

+ (id)getSyncDataFromLocalDiskWithArchive:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v4, 2, &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;
    if (!v7)
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = a1;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v28;
        v36 = 2112;
        v37 = v4;
        v38 = 2112;
        v39 = v8;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from file : %@ / %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      v16 = 0;
      goto LABEL_21;
    }
    v9 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend((id)objc_opt_class(), "allowedClassesForSyncData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v10, v7, &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;

    if (v11)
    {
      v13 = v11;
      objc_opt_class();
      v14 = objc_opt_isKindOfClass() & 1;
      if (v14)
        v15 = v13;
      else
        v15 = 0;
      v16 = v15;

      if (v14)
        goto LABEL_20;
      v17 = (void *)MEMORY[0x227676638]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        v36 = 2112;
        v37 = v13;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);

      }
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v29 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v30;
        v36 = 2112;
        v37 = v12;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);

      }
      v16 = 0;
    }

    objc_autoreleasePoolPop(v17);
LABEL_20:

    v8 = v12;
LABEL_21:

    goto LABEL_22;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = a1;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2112;
    v37 = v4;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@HH1 sync data file does not exist : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  v16 = 0;
LABEL_22:

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t172 != -1)
    dispatch_once(&logCategory__hmf_once_t172, &__block_literal_global_489);
  return (id)logCategory__hmf_once_v173;
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
  uint64_t v12;
  HMDUser *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDUser *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  HMDUser *v51;
  __int16 v52;
  id v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x24BDAC8D0];
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
    v12 = objc_claimAutoreleasedReturnValue();

    v46 = (void *)v12;
    v13 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:]([HMDUser alloc], "initWithAccountHandle:home:pairingIdentity:privilege:", v12, v7, 0, v9);
    __displayNameForUser(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setDisplayName:](v13, "setDisplayName:", v14);

    -[HMDUser setRemoteAccessAllowed:](v13, "setRemoteAccessAllowed:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x24BDD7048]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      -[HMDUser setCamerasAccessLevel:](v13, "setCamerasAccessLevel:", objc_msgSend(v15, "integerValue"));
    v45 = v16;
    if (v13)
    {
      v17 = *MEMORY[0x24BDD7008];
      v18 = v6;
      objc_msgSend(v18, "hmf_numberForKey:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hmf_numberForKey:", CFSTR("HMDUserAnnounceAccessLevelCodingKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v13, v19, v20);
    }
    else
    {
      v21 = 0;
    }
    -[HMDUser setAnnounceAccessLevel:](v13, "setAnnounceAccessLevel:", v21);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD6AB8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v43 = v7;
      v44 = v10;
      v23 = (void *)MEMORY[0x24BDD1620];
      v24 = (void *)MEMORY[0x24BDBCF20];
      v54[0] = objc_opt_class();
      v54[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      objc_msgSend(v23, "unarchivedObjectOfClasses:fromData:error:", v26, v22, &v47);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (HMDUser *)v47;

      if (v28)
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = a1;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = v29;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v32;
          v50 = 2112;
          v51 = v28;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode restricted guest settings from user dictionary with error: %@", buf, 0x16u);

          v29 = v42;
        }

        objc_autoreleasePoolPop(v29);
      }
      else
      {
        -[HMDUser setRestrictedGuestAccessSettings:](v13, "setRestrictedGuestAccessSettings:", v27);
      }
      v7 = v43;

      v10 = v44;
    }
    v37 = (void *)MEMORY[0x227676638]();
    v38 = a1;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v40;
      v50 = 2112;
      v51 = v13;
      v52 = 2112;
      v53 = v6;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@user [%@] from dictionary: [%@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v37);

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = a1;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user from dictionary because userID is not given", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    v13 = 0;
  }

  return v13;
}

+ (id)userDictionaryWithUserID:(id)a3 privilege:(unint64_t)a4 remoteAccessAllowed:(BOOL)a5 cameraAccessLevel:(unint64_t)a6 announceAccessAllowed:(id)a7 announceAccessLevel:(unint64_t)a8 audioAnalysisUserDropInAccessLevel:(unint64_t)a9 restrictedGuestAccessSettings:(id)a10
{
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v12 = a5;
  v15 = a7;
  v16 = a10;
  v17 = (void *)MEMORY[0x24BDBCED8];
  v18 = a3;
  objc_msgSend(v17, "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("userID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("HM.userAdministratorType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("HM.isUserAllowedRemoteAccess"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDD7048]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("HMDUserAnnounceAccessLevelCodingKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDD5AF0]);

  if (v16)
  {
    encodeRootObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BDD6AB8]);

  }
  if (v15)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD7008]);
  v26 = (void *)objc_msgSend(v19, "copy");

  return v26;
}

+ (void)migrateHH1SettingsToHH2ForSharedUserWithUUID:(id)a3 homeUUID:(id)a4 sharedZone:(id)a5 backingStoreContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v18;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Migrating shared user settings from HH1 to HH2 for home : %@, user: %@, sharedZone: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __96__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_sharedZone_backingStoreContext___block_invoke;
    v20[3] = &unk_24E796BC0;
    v21 = v13;
    v22 = v11;
    v25 = v15;
    v23 = v12;
    v24 = v10;
    objc_msgSend(v21, "performBlock:", v20);

  }
  else
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to open shared zone. This can be due to 1. This user did not exist in HH1 world and they are a brand new user in HH2 world.2. The device on which this user is accepting the invitation does not have the HH1 V5 data.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

+ (void)migrateHH1SettingsToHH2ForSharedUserWithUUID:(id)a3 homeUUID:(id)a4 privateZone:(id)a5 backingStoreContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v18;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Migrating private user settings from HH1 to HH2 for home : %@, user: %@, privateZone: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __97__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_privateZone_backingStoreContext___block_invoke;
    v20[3] = &unk_24E796BC0;
    v21 = v13;
    v22 = v11;
    v25 = v15;
    v23 = v12;
    v24 = v10;
    objc_msgSend(v21, "performBlock:", v20);

  }
  else
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to open private zone. This can be due to 1. This user did not exist in HH1 world and they are a brand new user in HH2 world.2. The device on which this user is accepting the invitation does not have the HH1 V5 data.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

+ (void)_fetchAndMigratePhotosPersonManagerSettingsFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "hmd_assertIsExecuting"));
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate photos person manager settings from V5 to Core Data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v8, "queryModelsOfType:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __105__HMDUser__fetchAndMigratePhotosPersonManagerSettingsFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_24E793C60;
  v19 = v10;
  v20 = v9;
  v21 = v12;
  v16 = v9;
  v17 = v10;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

}

+ (void)_fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "hmd_assertIsExecuting"));
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate user listening history models from V5 to Core Data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v8, "queryModelsOfType:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_24E793C88;
  v20 = v10;
  v21 = v12;
  v19 = v9;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

}

+ (void)_fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "hmd_assertIsExecuting"));
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate media content profile access control models from V5 to Core Data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v8, "queryModelsOfType:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_24E793CB0;
  v20 = v10;
  v21 = v12;
  v19 = v9;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

}

+ (void)_fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "hmd_assertIsExecuting"));
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate assistant access control models from V5 to Core Data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v8, "queryModelsOfType:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_24E793CD8;
  v20 = v10;
  v21 = v12;
  v19 = v9;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

}

+ (void)__findOrCreateCKSharedUserAccessorySettingsForAccessory:(id)a3 usingManagedObjectContext:(id)a4 rootShareObject:(id)a5 listeningHistoryEnabled:(id)a6 mediaContentProfileEnabled:(id)a7 personalRequestsEnabled:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v44 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x227676638](objc_msgSend(v15, "hmd_assertIsExecuting"));
  v20 = a1;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v48 = v22;
    v49 = 2112;
    v50 = v14;
    v51 = 2112;
    v52 = v44;
    v53 = 2112;
    v54 = v16;
    v55 = 2112;
    v56 = v17;
    v57 = 2112;
    v58 = v18;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Going to check whether we have shared settings for accessory : %@ for root: %@. [Listening History: %@], [Media Access control : %@], [Personal request enabled : %@]", buf, 0x3Eu);

  }
  v42 = v16;

  objc_autoreleasePoolPop(v19);
  +[MKFCKSharedUserAccessorySettings fetchRequest](MKFCKSharedUserAccessorySettings, "fetchRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v14;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("accessoryModelID"), v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPredicate:", v24);

  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cloudPrivateStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAffectedStores:", v27);

  objc_msgSend(v23, "setFetchLimit:", 1);
  v45 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v23, &v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v45;
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v20;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = v31;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v35;
      v49 = 2112;
      v50 = v43;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Did not find the accessorySettings for accessory UUID : %@. Going to create a new one", buf, 0x16u);

      v31 = v34;
    }

    objc_autoreleasePoolPop(v31);
    objc_msgSend(v44, "homeModelID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKSharedUserAccessorySettings createWithHomeModelID:accessoryModelID:persistentStore:context:](MKFCKSharedUserAccessorySettings, "createWithHomeModelID:accessoryModelID:persistentStore:context:", v36, v43, v26, v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setRoot:", v44);
    v30 = objc_msgSend(v44, "addAccessorySettingsObject:", v29);
  }
  v37 = (void *)MEMORY[0x227676638](v30);
  v38 = v20;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v40;
    v49 = 2112;
    v50 = v29;
    _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Working with %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v37);
  if (v42)
    objc_msgSend(v29, "setListeningHistoryEnabled:", objc_msgSend(v42, "BOOLValue"));
  if (v17)
    objc_msgSend(v29, "setMediaContentProfileEnabled:", objc_msgSend(v17, "BOOLValue"));
  if (v18)
    objc_msgSend(v29, "setPersonalRequestsEnabled:", objc_msgSend(v18, "BOOLValue"));

}

+ (void)_saveSharedUserSettingsToCoreData:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "hmd_assertIsExecuting");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__HMDUser__saveSharedUserSettingsToCoreData_managedObjectContext_rootShareObject___block_invoke;
  v11[3] = &unk_24E793D00;
  v12 = v8;
  v13 = a1;
  v10 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

+ (id)_openZoneWithName:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Opening zone with name: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = objc_alloc_init(MEMORY[0x24BE4ECF0]);
  v23 = 0;
  objc_msgSend(v7, "existingPrivateZonesWithName:configuration:delegate:error:", v6, v12, 0, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (v13)
  {
    objc_msgSend(v13, "localZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638](objc_msgSend(v15, "startUp"));
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully opened local zone [%@]", buf, 0x16u);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v20 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v21;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zone with name %@: %@", buf, 0x20u);

    }
    v15 = 0;
  }

  objc_autoreleasePoolPop(v16);
  return v15;
}

+ (id)localPrivateZoneForSharedUserUUID:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "privateZoneNameForUserUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_openZoneWithName:inDatabase:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)localSharedZoneForSharedUserUUID:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "sharedZoneNameForUserUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_openZoneWithName:inDatabase:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully created local zone [%@] for user : %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = v9;
  }

  return v9;
}

+ (id)getSettingsUsingPreOrderTraversal:(id)a3 rootUUID:(id)a4 keyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    v37 = 0;
    objc_msgSend(v8, "fetchModelsWithParentModelID:error:", v9, &v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    if (v13)
    {
      v15 = MEMORY[0x24BDAC760];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke;
      v32[3] = &unk_24E793D28;
      v36 = a1;
      v16 = v10;
      v33 = v16;
      v34 = v8;
      v17 = v12;
      v35 = v17;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
      v25 = v15;
      v26 = 3221225472;
      v27 = __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke_2;
      v28 = &unk_24E793D50;
      v31 = a1;
      v29 = v16;
      v18 = v17;
      v30 = v18;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v25);
      v19 = (void *)objc_msgSend(v18, "copy", v25, v26, v27, v28);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v23;
        v40 = 2112;
        v41 = v9;
        v42 = 2112;
        v43 = v14;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@fetch models with root UUID : %@ failed with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v19 = (void *)objc_msgSend(v12, "copy");
    }

  }
  else
  {
    v19 = (void *)objc_msgSend(v11, "copy");
  }

  return v19;
}

+ (id)appendRootPath:(id)a3 withSettingPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v14;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendRootPath:withSettingPath:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "hmbModelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getSettingsUsingPreOrderTraversal:rootUUID:keyPath:", v11, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
      objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v13);

  }
}

void __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendRootPath:withSettingPath:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDSetting settingValueWithModel:](HMDSetting, "settingValueWithModel:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      v13 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9));
      v14 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v16;
        v19 = 2112;
        v20 = v9;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%@] : [%@]", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
}

void __82__HMDUser__saveSharedUserSettingsToCoreData_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmd_attributeForSettingsPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "numberValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v23 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v26 = v13;
      v27 = 2112;
      v28 = v5;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating shared user setting '%@' (%@.%@) = %@", buf, 0x34u);

      v10 = v23;
      v6 = v24;
    }

    objc_autoreleasePoolPop(v10);
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v8, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v9, v18);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Invalid settings key path '%@' for shared user settings update", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

void __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "accessoryUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2;
  v12[3] = &unk_24E798E98;
  v15 = a1[6];
  v13 = a1[4];
  v14 = a1[5];
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  objc_msgSend(v3, "activityNotificationsEnabledForPersonalRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setActivityNotificationsEnabledForPersonalRequests:", objc_msgSend(v5, "BOOLValue"));

  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1[6];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityNotificationsEnabledForPersonalRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "BOOLValue");
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Migrating activityNotificationsEnabledForPersonalRequests : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

}

uint64_t __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "__findOrCreateCKSharedUserAccessorySettingsForAccessory:usingManagedObjectContext:rootShareObject:listeningHistoryEnabled:mediaContentProfileEnabled:personalRequestsEnabled:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0, MEMORY[0x24BDBD1C8]);
}

void __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2;
  v4[3] = &unk_24E798E98;
  v7 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "__findOrCreateCKSharedUserAccessorySettingsForAccessory:usingManagedObjectContext:rootShareObject:listeningHistoryEnabled:mediaContentProfileEnabled:personalRequestsEnabled:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, MEMORY[0x24BDBD1C8], 0);
}

void __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2;
  v4[3] = &unk_24E798E98;
  v7 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "__findOrCreateCKSharedUserAccessorySettingsForAccessory:usingManagedObjectContext:rootShareObject:listeningHistoryEnabled:mediaContentProfileEnabled:personalRequestsEnabled:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1C8], 0, 0);
}

void __105__HMDUser__fetchAndMigratePhotosPersonManagerSettingsFromLocalZone_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "sharingFaceClassificationsEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSharePhotosFaceClassifications:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(v3, "zoneUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPhotosPersonDataZoneUUID:", v5);

  v6 = *(void **)(a1 + 40);
  v18 = 0;
  v7 = objc_msgSend(v6, "save:", &v18);
  v8 = v18;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      v14 = "%{public}@Successfully stored photos person manager settings";
      v15 = v12;
      v16 = OS_LOG_TYPE_INFO;
      v17 = 12;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v15, v16, v14, buf, v17);

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2112;
    v22 = v8;
    v14 = "%{public}@Unable to save the photos person manager settings: %@";
    v15 = v12;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v9);
}

void __97__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_privateZone_backingStoreContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  _BOOL4 v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  void *v25;
  void *v26;
  void *context;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKSharedUserPrivateRoot fetchRequest](MKFCKSharedUserPrivateRoot, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v2, "cloudPrivateStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAffectedStores:", v7);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v29 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x227676638]();
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "getSettingsUsingPreOrderTraversal:rootUUID:keyPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &stru_24E79DB48);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[HMDHome loadMigrationCharacteristicsAuthorizationDataFromDiskWithHomeUUID:](HMDHome, "loadMigrationCharacteristicsAuthorizationDataFromDiskWithHomeUUID:", *(_QWORD *)(a1 + 40));
    v13 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") || -[NSObject count](v13, "count"))
    {
      if (-[NSObject count](v13, "count"))
      {
        v28 = v9;
        context = (void *)MEMORY[0x227676638](objc_msgSend(v10, "setCharacteristicAuthorizationData:", v13));
        v14 = *(id *)(a1 + 64);
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = v2;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "characteristicAuthorizationData");
          v25 = v3;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v16;
          v32 = 2112;
          v33 = v17;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating shared user characteristics authorization data to %@", buf, 0x16u);

          v3 = v25;
          v2 = v26;
        }

        objc_autoreleasePoolPop(context);
        +[HMDHome removeCharacteristicAuthorizationDataMigrationFileFromDiskWithhHomeUUID:](HMDHome, "removeCharacteristicAuthorizationDataMigrationFileFromDiskWithhHomeUUID:", *(_QWORD *)(a1 + 40));
        v9 = v28;
      }
      if (objc_msgSend(v12, "count"))
        objc_msgSend(*(id *)(a1 + 64), "_saveSharedUserSettingsToCoreData:managedObjectContext:rootShareObject:", v12, v3, v10);

      objc_autoreleasePoolPop(v11);
      v18 = objc_msgSend(*(id *)(a1 + 32), "save");
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 64);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if ((v18 & 1) != 0)
      {
        if (v19)
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v20;
          v21 = "%{public}@Successfully migrated V5 private settings for shared user to Core Data";
LABEL_17:
          v22 = v13;
          v23 = OS_LOG_TYPE_INFO;
          v24 = 12;
          goto LABEL_18;
        }
      }
      else if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v20;
        v21 = "%{public}@Unable to save the migrated V5 private settings for user";
        goto LABEL_17;
      }
    }
  }
  else
  {
    v12 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      v32 = 2112;
      v33 = v9;
      v21 = "%{public}@Unable to fetch shared user private root object: %@";
      v22 = v13;
      v23 = OS_LOG_TYPE_ERROR;
      v24 = 22;
LABEL_18:
      _os_log_impl(&dword_2218F0000, v22, v23, v21, buf, v24);

    }
  }

  objc_autoreleasePoolPop(v11);
}

void __96__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_sharedZone_backingStoreContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKSharedUserDataRoot fetchRequest](MKFCKSharedUserDataRoot, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v2, "cloudPrivateStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAffectedStores:", v7);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v27 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x227676638]();
  if (!v10)
  {
    v12 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch shared user data object: %@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  objc_msgSend((id)objc_opt_class(), "getSettingsUsingPreOrderTraversal:rootUUID:keyPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &stru_24E79DB48);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(*(id *)(a1 + 64), "_saveSharedUserSettingsToCoreData:managedObjectContext:rootShareObject:", v12, v3, v10);

    objc_autoreleasePoolPop(v11);
    v13 = (void *)MEMORY[0x227676638]();
    objc_msgSend(*(id *)(a1 + 64), "_fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone:managedObjectContext:rootShareObject:", *(_QWORD *)(a1 + 48), v3, v10);
    objc_autoreleasePoolPop(v13);
    v14 = (void *)MEMORY[0x227676638]();
    objc_msgSend(*(id *)(a1 + 64), "_fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone:managedObjectContext:rootShareObject:", *(_QWORD *)(a1 + 48), v3, v10);
    objc_autoreleasePoolPop(v14);
    v15 = (void *)MEMORY[0x227676638]();
    objc_msgSend(*(id *)(a1 + 64), "_fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone:managedObjectContext:rootShareObject:", *(_QWORD *)(a1 + 48), v3, v10);
    objc_autoreleasePoolPop(v15);
    v16 = MEMORY[0x227676638]();
    objc_msgSend(*(id *)(a1 + 64), "_fetchAndMigratePhotosPersonManagerSettingsFromLocalZone:managedObjectContext:rootShareObject:", *(_QWORD *)(a1 + 48), v3, v10);
    objc_autoreleasePoolPop((void *)v16);
    LOBYTE(v16) = objc_msgSend(*(id *)(a1 + 32), "save");
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if ((v16 & 1) != 0)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v19;
        v20 = "%{public}@Successfully migrated V5 settings for shared user to Core Data";
LABEL_13:
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, v20, buf, 0xCu);

      }
    }
    else if (v18)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      v20 = "%{public}@Unable to save the migrated V5 settings for user";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  v26 = v9;
  v22 = (void *)MEMORY[0x227676638]();
  v23 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v25;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Did not find any settings model for user", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  v9 = v26;
LABEL_15:

  objc_autoreleasePoolPop(v11);
}

void __22__HMDUser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v173;
  logCategory__hmf_once_v173 = v0;

}

@end
