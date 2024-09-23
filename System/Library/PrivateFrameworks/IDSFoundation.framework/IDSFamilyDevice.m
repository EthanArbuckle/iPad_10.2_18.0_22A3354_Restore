@implementation IDSFamilyDevice

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  double v5;
  __CFDictionary *v6;
  NSString *ownerHandle;
  NSString *deviceName;
  void *v9;
  NSString *deviceColor;
  NSString *buildVersion;
  NSString *deviceUniqueID;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v3;
  ownerHandle = self->_ownerHandle;
  if (ownerHandle)
    CFDictionarySetValue(v3, CFSTR("FamilyDeviceOwnerHandleKey"), ownerHandle);
  deviceName = self->_deviceName;
  if (deviceName)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceNameKey"), deviceName);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v4, self->_deviceType, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceTypeKey"), v9);

  deviceColor = self->_deviceColor;
  if (deviceColor)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceColorKey"), deviceColor);
  buildVersion = self->_buildVersion;
  if (buildVersion)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceBuildVersionKey"), buildVersion);
  deviceUniqueID = self->_deviceUniqueID;
  if (deviceUniqueID)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceUniqueIDKey"), deviceUniqueID);
  return v6;
}

- (IDSFamilyDevice)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  IDSFamilyDevice *v6;
  double v7;
  uint64_t v8;
  NSString *ownerHandle;
  const char *v10;
  double v11;
  uint64_t v12;
  NSString *deviceName;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  double v21;
  uint64_t v22;
  NSString *deviceColor;
  const char *v24;
  double v25;
  uint64_t v26;
  NSString *buildVersion;
  const char *v28;
  double v29;
  uint64_t v30;
  NSString *deviceUniqueID;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IDSFamilyDevice;
  v6 = -[IDSFamilyDevice init](&v33, sel_init);
  if (v6)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("FamilyDeviceOwnerHandleKey"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    ownerHandle = v6->_ownerHandle;
    v6->_ownerHandle = (NSString *)v8;

    objc_msgSend_objectForKey_(v4, v10, (uint64_t)CFSTR("FamilyDeviceNameKey"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    deviceName = v6->_deviceName;
    v6->_deviceName = (NSString *)v12;

    objc_msgSend_objectForKey_(v4, v14, (uint64_t)CFSTR("FamilyDeviceTypeKey"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_deviceType = objc_msgSend_integerValue(v16, v17, v18, v19);

    objc_msgSend_objectForKey_(v4, v20, (uint64_t)CFSTR("FamilyDeviceColorKey"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    deviceColor = v6->_deviceColor;
    v6->_deviceColor = (NSString *)v22;

    objc_msgSend_objectForKey_(v4, v24, (uint64_t)CFSTR("FamilyDeviceBuildVersionKey"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    buildVersion = v6->_buildVersion;
    v6->_buildVersion = (NSString *)v26;

    objc_msgSend_objectForKey_(v4, v28, (uint64_t)CFSTR("FamilyDeviceUniqueIDKey"), v29);
    v30 = objc_claimAutoreleasedReturnValue();
    deviceUniqueID = v6->_deviceUniqueID;
    v6->_deviceUniqueID = (NSString *)v30;

  }
  return v6;
}

- (IDSFamilyDevice)initWithOwnerHandle:(id)a3 deviceName:(id)a4 deviceType:(int64_t)a5 deviceColor:(id)a6 buildVersion:(id)a7 deviceUniqueID:(id)a8
{
  id v15;
  id v16;
  id v17;
  IDSFamilyDevice *v18;
  IDSFamilyDevice *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)IDSFamilyDevice;
  v18 = -[IDSFamilyDevice init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_ownerHandle, a3);
    objc_storeStrong((id *)&v19->_deviceName, a4);
    v19->_deviceType = a5;
    objc_storeStrong((id *)&v19->_deviceColor, a6);
    objc_storeStrong((id *)&v19->_buildVersion, a7);
    objc_storeStrong((id *)&v19->_deviceUniqueID, a8);
  }

  return v19;
}

- (NSString)ownerHandle
{
  return self->_ownerHandle;
}

- (void)setOwnerHandle:(id)a3
{
  objc_storeStrong((id *)&self->_ownerHandle, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceColor, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_ownerHandle, 0);
}

@end
