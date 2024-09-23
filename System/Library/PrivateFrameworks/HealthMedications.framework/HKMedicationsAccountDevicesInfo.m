@implementation HKMedicationsAccountDevicesInfo

- (HKMedicationsAccountDevicesInfo)initWithMedicationFeatureDevicesInfo:(id)a3 localDeviceInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HKMedicationsAccountDevicesInfo *v10;
  uint64_t v11;
  NSArray *medicationFeatureDevicesInfo;
  uint64_t v13;
  HKMedicationsDeviceInfo *localDeviceInfo;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationsAccountDevicesInfo.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medicationFeatureDevicesInfo != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationsAccountDevicesInfo.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localDeviceInfo != nil"));

LABEL_3:
  if ((objc_msgSend(v9, "isLocalDevice") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationsAccountDevicesInfo.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localDeviceInfo.isLocalDevice == YES"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationsAccountDevicesInfo;
  v10 = -[HKMedicationsAccountDevicesInfo init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    medicationFeatureDevicesInfo = v10->_medicationFeatureDevicesInfo;
    v10->_medicationFeatureDevicesInfo = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    localDeviceInfo = v10->_localDeviceInfo;
    v10->_localDeviceInfo = (HKMedicationsDeviceInfo *)v13;

  }
  return v10;
}

- (id)remoteDevices
{
  void *v3;

  v3 = (void *)-[NSArray mutableCopy](self->_medicationFeatureDevicesInfo, "mutableCopy");
  objc_msgSend(v3, "removeObjectIdenticalTo:", self->_localDeviceInfo);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationsAccountDevicesInfo *v4;
  HKMedicationsAccountDevicesInfo *v5;
  HKMedicationsDeviceInfo *localDeviceInfo;
  HKMedicationsDeviceInfo *v7;
  NSArray *medicationFeatureDevicesInfo;
  NSArray *v9;
  char v10;

  v4 = (HKMedicationsAccountDevicesInfo *)a3;
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
      if (localDeviceInfo != v7 && (!v7 || !-[HKMedicationsDeviceInfo isEqual:](localDeviceInfo, "isEqual:")))
        goto LABEL_11;
      medicationFeatureDevicesInfo = self->_medicationFeatureDevicesInfo;
      v9 = v5->_medicationFeatureDevicesInfo;
      if (medicationFeatureDevicesInfo == v9)
      {
        v10 = 1;
        goto LABEL_13;
      }
      if (v9)
        v10 = -[NSArray isEqualToArray:](medicationFeatureDevicesInfo, "isEqualToArray:");
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

  v3 = -[HKMedicationsDeviceInfo hash](self->_localDeviceInfo, "hash");
  return -[NSArray hash](self->_medicationFeatureDevicesInfo, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *medicationFeatureDevicesInfo;
  id v5;

  medicationFeatureDevicesInfo = self->_medicationFeatureDevicesInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", medicationFeatureDevicesInfo, CFSTR("MedicationFeatureDevices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localDeviceInfo, CFSTR("LocalDevice"));

}

- (HKMedicationsAccountDevicesInfo)initWithCoder:(id)a3
{
  id v4;
  HKMedicationsAccountDevicesInfo *v5;
  void *v6;
  uint64_t v7;
  NSArray *medicationFeatureDevicesInfo;
  uint64_t v9;
  HKMedicationsDeviceInfo *localDeviceInfo;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationsAccountDevicesInfo;
  v5 = -[HKMedicationsAccountDevicesInfo init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("MedicationFeatureDevices"));
    v7 = objc_claimAutoreleasedReturnValue();
    medicationFeatureDevicesInfo = v5->_medicationFeatureDevicesInfo;
    v5->_medicationFeatureDevicesInfo = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalDevice"));
    v9 = objc_claimAutoreleasedReturnValue();
    localDeviceInfo = v5->_localDeviceInfo;
    v5->_localDeviceInfo = (HKMedicationsDeviceInfo *)v9;

  }
  return v5;
}

- (NSArray)medicationFeatureDevicesInfo
{
  return self->_medicationFeatureDevicesInfo;
}

- (HKMedicationsDeviceInfo)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_medicationFeatureDevicesInfo, 0);
}

@end
