@implementation DMTMobileGestaltBackedDeviceInformationPrimitives

- (NSString)serialNumber
{
  NSString *serialNumber;
  NSString *v4;
  NSString *v5;

  serialNumber = self->_serialNumber;
  if (!serialNumber)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_serialNumber;
    self->_serialNumber = v4;

    serialNumber = self->_serialNumber;
  }
  return (NSString *)(id)-[NSString copy](serialNumber, "copy");
}

- (NSString)deviceUDID
{
  NSString *deviceUDID;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  deviceUDID = self->_deviceUDID;
  if (!deviceUDID)
  {
    v4 = (void *)MGCopyAnswer();
    v5 = (void *)MGCopyAnswer();
    v6 = (void *)MGCopyAnswer();
    v7 = (void *)MGCopyAnswer();
    v8 = (void *)MGCopyAnswer();
    if (_DMTLogGeneral_onceToken_2 != -1)
      dispatch_once(&_DMTLogGeneral_onceToken_2, &__block_literal_global_3);
    v9 = _DMTLogGeneral_logObj_2;
    if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_2, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138544386;
      v14 = v4;
      v15 = 2114;
      v16 = v5;
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_debug_impl(&dword_21FD69000, v9, OS_LOG_TYPE_DEBUG, "arrowUniqueID: %{public}@,\n provisioningUniqueID: %{public}@,\n unqiueChipID: %{public}@,\n uniqueDeviceID: %{public}@,\n attestationUniqueDeviceID: %{public}@", (uint8_t *)&v13, 0x34u);
    }
    v10 = (NSString *)MGCopyAnswer();
    v11 = self->_deviceUDID;
    self->_deviceUDID = v10;

    deviceUDID = self->_deviceUDID;
  }
  return (NSString *)(id)-[NSString copy](deviceUDID, "copy");
}

- (NSString)modelIdentifier
{
  NSString *modelIdentifier;
  NSString *v4;
  NSString *v5;

  modelIdentifier = self->_modelIdentifier;
  if (!modelIdentifier)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_modelIdentifier;
    self->_modelIdentifier = v4;

    modelIdentifier = self->_modelIdentifier;
  }
  return (NSString *)(id)-[NSString copy](modelIdentifier, "copy");
}

- (NSString)marketingModelName
{
  NSString *marketingModelName;
  NSString *v4;
  NSString *v5;

  marketingModelName = self->_marketingModelName;
  if (!marketingModelName)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_marketingModelName;
    self->_marketingModelName = v4;

    marketingModelName = self->_marketingModelName;
  }
  return (NSString *)(id)-[NSString copy](marketingModelName, "copy");
}

- (NSString)deviceClass
{
  NSString *deviceClass;
  NSString *v4;
  NSString *v5;

  deviceClass = self->_deviceClass;
  if (!deviceClass)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_deviceClass;
    self->_deviceClass = v4;

    deviceClass = self->_deviceClass;
  }
  return deviceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_marketingModelName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
