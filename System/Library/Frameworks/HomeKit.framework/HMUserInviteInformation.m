@implementation HMUserInviteInformation

- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  HMUserInviteInformation *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[HMUserInviteInformation initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:](self, "initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:", v8, v6, v5, 0, 1);

  return v9;
}

- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5 announceAccess:(BOOL)a6 camerasAccessLevel:(unint64_t)a7
{
  id v13;
  HMUserInviteInformation *v14;
  HMUserInviteInformation *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMUserInviteInformation;
  v14 = -[HMUserInviteInformation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userID, a3);
    v15->_administrator = a4;
    v15->_remoteAccessAllowed = a5;
    v15->_camerasAccessLevel = a7;
    v15->_announceAccessAllowed = a6;
  }

  return v15;
}

- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5 announceAccess:(BOOL)a6 camerasAccessLevel:(unint64_t)a7 restrictedGuest:(BOOL)a8 restrictedGuestHomeAccessSettings:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v16;
  HMUserInviteInformation *v17;
  HMUserInviteInformation *v18;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v16 = a9;
  v17 = -[HMUserInviteInformation initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:](self, "initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:", a3, v13, v12, v11, a7);
  v18 = v17;
  if (v17)
  {
    v17->_restrictedGuest = a8;
    objc_storeStrong((id *)&v17->_restrictedGuestHomeAccessSettings, a9);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_13;
  -[HMUserInviteInformation userID](self, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    v9 = -[HMUserInviteInformation isAdministrator](self, "isAdministrator");
    if (v9 == objc_msgSend(v6, "isAdministrator"))
    {
      v10 = -[HMUserInviteInformation isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
      if (v10 == objc_msgSend(v6, "isRemoteAccessAllowed"))
      {
        v11 = -[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
        if (v11 == objc_msgSend(v6, "isAnnounceAccessAllowed"))
        {
          v13 = -[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel");
          v14 = objc_msgSend(v6, "camerasAccessLevel");

          if (v13 == v14)
          {
            v15 = -[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest");
            if (v15 == objc_msgSend(v6, "isRestrictedGuest"))
            {
              -[HMUserInviteInformation restrictedGuestHomeAccessSettings](self, "restrictedGuestHomeAccessSettings");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "restrictedGuestHomeAccessSettings");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = HMFEqualObjects();
              goto LABEL_10;
            }
          }
LABEL_13:
          v12 = 0;
          goto LABEL_14;
        }
      }
    }
  }
  v12 = 0;
LABEL_10:

LABEL_14:
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;

  -[HMUserInviteInformation userID](self, "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = v4 ^ -[HMUserInviteInformation isAdministrator](self, "isAdministrator");
  v6 = -[HMUserInviteInformation isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  v7 = v5 ^ v6 ^ -[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  v8 = -[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel");
  v9 = v8 ^ -[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest");
  -[HMUserInviteInformation restrictedGuestHomeAccessSettings](self, "restrictedGuestHomeAccessSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)_validateInviteInformationForHome:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  HMUserInviteInformation *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  HMUserInviteInformation *v12;
  int v14;
  void *v15;
  __int16 v16;
  HMUserInviteInformation *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HMUserInviteInformation isAdministrator](self, "isAdministrator")
    || !-[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest"))
  {
    -[HMUserInviteInformation restrictedGuestHomeAccessSettings](self, "restrictedGuestHomeAccessSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMUserInviteInformation isAdministrator](self, "isAdministrator"))
    {
      if (v6)
      {
        v7 = (void *)MEMORY[0x1A1AC1AAC]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v10;
          v16 = 2112;
          v17 = v8;
          v11 = "%{public}@An admin cannot have restricted guest access settings : %@";
LABEL_13:
          _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, 0x16u);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (-[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest")
           && (-[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed")
            || -[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel")
            || v6 && (objc_msgSend(v6, "doAllAccessoriesBelongToHome:", v4) & 1) == 0))
    {
      v7 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v10;
        v16 = 2112;
        v17 = v12;
        v11 = "%{public}@Restricted guest home access settings are not valid. Either accessory list is empty or they all "
              "do not belong to the same home where this user is supposed to be invited in. : %@";
        goto LABEL_13;
      }
LABEL_14:

      objc_autoreleasePoolPop(v7);
      v5 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v5 = 1;
    goto LABEL_18;
  }
  v5 = 0;
LABEL_19:

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableUserInviteInformation *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  unint64_t v9;
  _BOOL8 v10;
  void *v11;
  HMMutableUserInviteInformation *v12;

  v4 = [HMMutableUserInviteInformation alloc];
  -[HMUserInviteInformation userID](self, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMUserInviteInformation isAdministrator](self, "isAdministrator");
  v7 = -[HMUserInviteInformation isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  v8 = -[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  v9 = -[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel");
  v10 = -[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest");
  -[HMUserInviteInformation restrictedGuestHomeAccessSettings](self, "restrictedGuestHomeAccessSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMUserInviteInformation initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:restrictedGuest:restrictedGuestHomeAccessSettings:](v4, "initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:restrictedGuest:restrictedGuestHomeAccessSettings:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMUserInviteInformation userID](self, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMUserInviteInformationUserIDCodingKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isAdministrator](self, "isAdministrator"), CFSTR("HMUserInviteInformationAdministratorCodingKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"), CFSTR("HMUserInviteInformationAnnounceAccessAllowedCodingKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), CFSTR("HMUserInviteInformationRemoteAccessCodingKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel"), CFSTR("HMUserInviteInformationCamerasAccessLevelCodingKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest"), CFSTR("HMUserInviteInformationRestrictedGuestPrivilegeCodingKey"));
  -[HMUserInviteInformation restrictedGuestHomeAccessSettings](self, "restrictedGuestHomeAccessSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMUserInviteInformationRestrictedGuestHomeAccessSettingsCodingKey"));

}

- (HMUserInviteInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  HMUserInviteInformation *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMUserInviteInformationUserIDCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMUserInviteInformationAdministratorCodingKey"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMUserInviteInformationAnnounceAccessAllowedCodingKey"));
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMUserInviteInformationRemoteAccessCodingKey"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMUserInviteInformationCamerasAccessLevelCodingKey"));
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMUserInviteInformationRestrictedGuestPrivilegeCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMUserInviteInformationRestrictedGuestHomeAccessSettingsCodingKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMUserInviteInformation initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:restrictedGuest:restrictedGuestHomeAccessSettings:](self, "initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:restrictedGuest:restrictedGuestHomeAccessSettings:", v5, v6, v8, v7, v9, v10, v11);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserInviteInformation userID](self, "userID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("User ID"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserInviteInformation isAdministrator](self, "isAdministrator");
  HMFBooleanToString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Administrator"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserInviteInformation isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  HMFBooleanToString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Remote Access Allowed"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Announce Access Allowed"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  HMUserCameraAccessLevelAsString(-[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Cameras Access Level"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest");
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Restricted Guest"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserInviteInformation restrictedGuestHomeAccessSettings](self, "restrictedGuestHomeAccessSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Restricted guest access settings"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isAdministrator
{
  return self->_administrator;
}

- (BOOL)isRemoteAccessAllowed
{
  return self->_remoteAccessAllowed;
}

- (unint64_t)camerasAccessLevel
{
  return self->_camerasAccessLevel;
}

- (BOOL)isAnnounceAccessAllowed
{
  return self->_announceAccessAllowed;
}

- (BOOL)isRestrictedGuest
{
  return self->_restrictedGuest;
}

- (HMRestrictedGuestHomeAccessSettings)restrictedGuestHomeAccessSettings
{
  return (HMRestrictedGuestHomeAccessSettings *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRestrictedGuestHomeAccessSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedGuestHomeAccessSettings, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
