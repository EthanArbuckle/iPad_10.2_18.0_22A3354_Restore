@implementation HDMockIDSDevice

- (id)copyWithZone:(_NSZone *)a3
{
  HDMockIDSDevice *v4;

  v4 = objc_alloc_init(HDMockIDSDevice);
  -[HDMockIDSDevice setUniqueID:](v4, "setUniqueID:", self->_uniqueID);
  -[HDMockIDSDevice setUniqueIDOverride:](v4, "setUniqueIDOverride:", self->_uniqueIDOverride);
  -[HDMockIDSDevice setNsuuid:](v4, "setNsuuid:", self->_nsuuid);
  -[HDMockIDSDevice setService:](v4, "setService:", self->_service);
  -[HDMockIDSDevice setName:](v4, "setName:", self->_name);
  -[HDMockIDSDevice setProductBuildVersion:](v4, "setProductBuildVersion:", self->_productBuildVersion);
  -[HDMockIDSDevice setBuildType:](v4, "setBuildType:", self->_buildType);
  -[HDMockIDSDevice setDeviceType:](v4, "setDeviceType:", self->_deviceType);
  -[HDMockIDSDevice setProductType:](v4, "setProductType:", self->_productType);
  -[HDMockIDSDevice setModelNumber:](v4, "setModelNumber:", self->_modelNumber);
  -[HDMockIDSDevice setSystemVersion:](v4, "setSystemVersion:", self->_systemVersion);
  -[HDMockIDSDevice setRegionCode:](v4, "setRegionCode:", self->_regionCode);
  -[HDMockIDSDevice setElectrocardiogramVersion:](v4, "setElectrocardiogramVersion:", self->_electrocardiogramVersion);
  -[HDMockIDSDevice setBackgroundAtrialFibrillationVersion:](v4, "setBackgroundAtrialFibrillationVersion:", self->_backgroundAtrialFibrillationVersion);
  -[HDMockIDSDevice setIsActive:](v4, "setIsActive:", self->_isActive);
  -[HDMockIDSDevice setSupportsCinnamonHW:](v4, "setSupportsCinnamonHW:", self->_supportsCinnamonHW);
  -[HDMockIDSDevice setIdentities:](v4, "setIdentities:", self->_identities);
  -[HDMockIDSDevice setSupportsCinnamonAntimonyGloryF:](v4, "setSupportsCinnamonAntimonyGloryF:", self->_supportsCinnamonAntimonyGloryF);
  return v4;
}

- (int64_t)relationship
{
  return 1;
}

- (BOOL)isLocallyPaired
{
  return 1;
}

- (BOOL)isDefaultPairedDevice
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (id)hd_destinationIdentifier
{
  return (id)IDSCopyIDForDevice();
}

- (BOOL)hd_isEquivalentToDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[HDMockIDSDevice hd_deviceIdentifier](self, "hd_deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hd_deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "hd_deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HDMockIDSDevice hd_deviceIdentifier](self, "hd_deviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hd_deviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (NSUUID)nanoRegistryPairingID
{
  return self->_nanoRegistryPairingID;
}

- (void)setNanoRegistryPairingID:(id)a3
{
  objc_storeStrong((id *)&self->_nanoRegistryPairingID, a3);
}

- (NSUUID)nsuuid
{
  return self->_nsuuid;
}

- (void)setNsuuid:(id)a3
{
  objc_storeStrong((id *)&self->_nsuuid, a3);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)uniqueIDOverride
{
  return self->_uniqueIDOverride;
}

- (void)setUniqueIDOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)buildType
{
  return self->_buildType;
}

- (void)setBuildType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)electrocardiogramVersion
{
  return self->_electrocardiogramVersion;
}

- (void)setElectrocardiogramVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)backgroundAtrialFibrillationVersion
{
  return self->_backgroundAtrialFibrillationVersion;
}

- (void)setBackgroundAtrialFibrillationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)supportsCinnamonHW
{
  return self->_supportsCinnamonHW;
}

- (void)setSupportsCinnamonHW:(BOOL)a3
{
  self->_supportsCinnamonHW = a3;
}

- (BOOL)supportsCinnamonAntimonyGloryF
{
  return self->_supportsCinnamonAntimonyGloryF;
}

- (void)setSupportsCinnamonAntimonyGloryF:(BOOL)a3
{
  self->_supportsCinnamonAntimonyGloryF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAtrialFibrillationVersion, 0);
  objc_storeStrong((id *)&self->_electrocardiogramVersion, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_buildType, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_uniqueIDOverride, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_nsuuid, 0);
  objc_storeStrong((id *)&self->_nanoRegistryPairingID, 0);
}

@end
