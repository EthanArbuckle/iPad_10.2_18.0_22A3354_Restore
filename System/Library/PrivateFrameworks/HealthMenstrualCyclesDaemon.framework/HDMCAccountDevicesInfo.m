@implementation HDMCAccountDevicesInfo

- (BOOL)hasHealthAppDevicesWithHigherAlgorithmVersions
{
  NSArray *healthAppDevicesInfo;
  _QWORD v4[5];

  healthAppDevicesInfo = self->_healthAppDevicesInfo;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__HDMCAccountDevicesInfo_hasHealthAppDevicesWithHigherAlgorithmVersions__block_invoke;
  v4[3] = &unk_24DB225C0;
  v4[4] = self;
  return -[NSArray hk_containsObjectPassingTest:](healthAppDevicesInfo, "hk_containsObjectPassingTest:", v4);
}

BOOL __72__HDMCAccountDevicesInfo_hasHealthAppDevicesWithHigherAlgorithmVersions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "dayStreamProcessorAlgorithmVersion");
  return v3 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dayStreamProcessorAlgorithmVersion");
}

- (BOOL)localDeviceIsOnlyDeviceWithNotifications
{
  void *v3;
  unint64_t v4;
  BOOL result;

  -[NSArray hk_filter:](self->_healthAppDevicesInfo, "hk_filter:", &__block_literal_global_275);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  result = -[HDMCDeviceInfo someNotificationsEnabled](self->_localDeviceInfo, "someNotificationsEnabled");
  if (v4 >= 2)
    return 0;
  return result;
}

uint64_t __66__HDMCAccountDevicesInfo_localDeviceIsOnlyDeviceWithNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "someNotificationsEnabled");
}

- (BOOL)shouldFireNotifications
{
  if (-[HDMCAccountDevicesInfo localDeviceIsOnlyDeviceWithNotifications](self, "localDeviceIsOnlyDeviceWithNotifications"))
  {
    return 1;
  }
  else
  {
    return !-[HDMCAccountDevicesInfo hasHealthAppDevicesWithHigherAlgorithmVersions](self, "hasHealthAppDevicesWithHigherAlgorithmVersions");
  }
}

- (HDMCAccountDevicesInfo)initWithHealthAppDevicesInfo:(id)a3 localDeviceInfo:(id)a4
{
  id v6;
  id v7;
  HDMCAccountDevicesInfo *v8;
  uint64_t v9;
  NSArray *healthAppDevicesInfo;
  uint64_t v11;
  HDMCDeviceInfo *localDeviceInfo;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMCAccountDevicesInfo;
  v8 = -[HDMCAccountDevicesInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    healthAppDevicesInfo = v8->_healthAppDevicesInfo;
    v8->_healthAppDevicesInfo = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    localDeviceInfo = v8->_localDeviceInfo;
    v8->_localDeviceInfo = (HDMCDeviceInfo *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HDMCAccountDevicesInfo *v4;
  HDMCAccountDevicesInfo *v5;
  HDMCDeviceInfo *localDeviceInfo;
  HDMCDeviceInfo *v7;
  NSArray *healthAppDevicesInfo;
  NSArray *v9;
  char v10;

  v4 = (HDMCAccountDevicesInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      localDeviceInfo = self->_localDeviceInfo;
      v7 = v5->_localDeviceInfo;
      if (localDeviceInfo != v7 && (!v7 || !-[HDMCDeviceInfo isEqual:](localDeviceInfo, "isEqual:")))
        goto LABEL_11;
      healthAppDevicesInfo = self->_healthAppDevicesInfo;
      v9 = v5->_healthAppDevicesInfo;
      if (healthAppDevicesInfo == v9)
      {
        v10 = 1;
        goto LABEL_13;
      }
      if (v9)
        v10 = -[NSArray isEqualToArray:](healthAppDevicesInfo, "isEqualToArray:");
      else
LABEL_11:
        v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HDMCDeviceInfo hash](self->_localDeviceInfo, "hash");
  return -[NSArray hash](self->_healthAppDevicesInfo, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_healthAppDevicesInfo, 0);
}

@end
