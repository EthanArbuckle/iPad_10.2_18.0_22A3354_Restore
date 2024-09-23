@implementation HMDHomeData

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableHomeData *v5;

  v5 = -[HMDMutableHomeData init](+[HMDMutableHomeData allocWithZone:](HMDMutableHomeData, "allocWithZone:"), "init");
  __HMDHomeDataCopyProperties(v5, self, (uint64_t)a3);
  return v5;
}

- (id)homeWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDHomeData homes](self, "homes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)primaryHomeUUID
{
  return self->_primaryHomeUUID;
}

- (void)setPrimaryHomeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSUUID)lastCurrentHomeUUID
{
  return self->_lastCurrentHomeUUID;
}

- (void)setLastCurrentHomeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(int64_t)a3
{
  self->_dataVersion = a3;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(int64_t)a3
{
  self->_schemaVersion = a3;
}

- (int64_t)recoveryVersion
{
  return self->_recoveryVersion;
}

- (void)setRecoveryVersion:(int64_t)a3
{
  self->_recoveryVersion = a3;
}

- (NSUUID)dataTag
{
  return self->_dataTag;
}

- (void)setDataTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)UUIDsOfRemovedHomes
{
  return self->_UUIDsOfRemovedHomes;
}

- (void)setUUIDsOfRemovedHomes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)cloudZones
{
  return self->_cloudZones;
}

- (void)setCloudZones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)incomingInvitations
{
  return self->_incomingInvitations;
}

- (void)setIncomingInvitations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)pendingReasonSaved
{
  return self->_pendingReasonSaved;
}

- (void)setPendingReasonSaved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)pendingUserManagementOperations
{
  return self->_pendingUserManagementOperations;
}

- (void)setPendingUserManagementOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)unprocessedOperationIdentifiers
{
  return self->_unprocessedOperationIdentifiers;
}

- (void)setUnprocessedOperationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (HMDApplicationData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)residentEnabledState
{
  return self->_residentEnabledState;
}

- (void)setResidentEnabledState:(int64_t)a3
{
  self->_residentEnabledState = a3;
}

- (HMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSArray)remoteAccounts
{
  return self->_remoteAccounts;
}

- (void)setRemoteAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (HMDAccountHandle)primaryAccountHandle
{
  return self->_primaryAccountHandle;
}

- (void)setPrimaryAccountHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)accessAllowedWhenLocked
{
  return self->_accessAllowedWhenLocked;
}

- (void)setAccessAllowedWhenLocked:(BOOL)a3
{
  self->_accessAllowedWhenLocked = a3;
}

- (NSDictionary)demoAccessories
{
  return self->_demoAccessories;
}

- (void)setDemoAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)demoFinalized
{
  return self->_demoFinalized;
}

- (void)setDemoFinalized:(BOOL)a3
{
  self->_demoFinalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoAccessories, 0);
  objc_storeStrong((id *)&self->_primaryAccountHandle, 0);
  objc_storeStrong((id *)&self->_remoteAccounts, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_unprocessedOperationIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingUserManagementOperations, 0);
  objc_storeStrong((id *)&self->_pendingReasonSaved, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_incomingInvitations, 0);
  objc_storeStrong((id *)&self->_cloudZones, 0);
  objc_storeStrong((id *)&self->_UUIDsOfRemovedHomes, 0);
  objc_storeStrong((id *)&self->_dataTag, 0);
  objc_storeStrong((id *)&self->_lastCurrentHomeUUID, 0);
  objc_storeStrong((id *)&self->_primaryHomeUUID, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_homes, 0);
}

+ (void)configureKeyedArchiverClassMappings
{
  objc_msgSend(MEMORY[0x24BDD1618], "setClassName:forClass:", CFSTR("HMDAccessory"), objc_opt_class());
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDAccessory"));
  objc_msgSend(MEMORY[0x24BDD1618], "setClassName:forClass:", CFSTR("HMDCharacteristicNotificationRegistry"), objc_opt_class());
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDCharacteristicNotificationRegistry"));
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDWHAAccessory"));
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDMediaSystemExtended"));
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDMediaSystemExtendedV2"));
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDAppleMediaAccessorySensor"));
}

@end
