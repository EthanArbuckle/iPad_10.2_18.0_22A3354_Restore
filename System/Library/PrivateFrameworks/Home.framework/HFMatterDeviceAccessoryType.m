@implementation HFMatterDeviceAccessoryType

- (HFMatterDeviceAccessoryType)initWithDeviceType:(id)a3
{
  id v5;
  id *v6;
  HFMatterDeviceAccessoryType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFMatterDeviceAccessoryType;
  v6 = -[HFAccessoryType _init](&v9, sel__init);
  v7 = (HFMatterDeviceAccessoryType *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HFMatterDeviceAccessoryType *v4;
  HFMatterDeviceAccessoryType *v5;
  HFMatterDeviceAccessoryType *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = (HFMatterDeviceAccessoryType *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFMatterDeviceAccessoryType deviceType](v5, "deviceType");
      v6 = (HFMatterDeviceAccessoryType *)objc_claimAutoreleasedReturnValue();
      -[HFMatterDeviceAccessoryType deviceType](self, "deviceType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HFMatterDeviceAccessoryType isEqual:](v6, "isEqual:", v7))
      {
        v8 = 1;
LABEL_13:

        goto LABEL_14;
      }
      -[HFMatterDeviceAccessoryType equivalentServiceType](v5, "equivalentServiceType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMatterDeviceAccessoryType equivalentServiceType](self, "equivalentServiceType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqualToString:", v10);

LABEL_10:
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HFMatterDeviceAccessoryType equivalentServiceType](self, "equivalentServiceType");
      v5 = (HFMatterDeviceAccessoryType *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      -[HFMatterDeviceAccessoryType serviceType](v6, "serviceType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HFMatterDeviceAccessoryType isEqualToString:](v5, "isEqualToString:", v7))
      {
        v8 = 0;
        goto LABEL_13;
      }
      -[HFMatterDeviceAccessoryType subtype](v6, "subtype");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9 == 0;
      goto LABEL_10;
    }
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)equivalentServiceType
{
  id v3;
  void *v4;
  void *v5;

  objc_opt_class();
  objc_opt_self();
  if (qword_1ED378930 != -1)
    dispatch_once(&qword_1ED378930, &__block_literal_global_279);
  v3 = (id)qword_1ED378938;
  -[HFMatterDeviceAccessoryType deviceType](self, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __55__HFMatterDeviceAccessoryType__deviceTypeToServiceType__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[11];
  _QWORD v7[12];

  v7[11] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9A70];
  v6[0] = &unk_1EA7CB908;
  v6[1] = &unk_1EA7CB920;
  v7[0] = v0;
  v7[1] = v0;
  v6[2] = &unk_1EA7CB938;
  v6[3] = &unk_1EA7CB950;
  v7[2] = v0;
  v7[3] = v0;
  v1 = *MEMORY[0x1E0CB9A80];
  v6[4] = &unk_1EA7CB968;
  v6[5] = &unk_1EA7CB9B0;
  v2 = *MEMORY[0x1E0CB9AD8];
  v7[4] = v1;
  v7[5] = v2;
  v6[6] = &unk_1EA7CB9C8;
  v6[7] = &unk_1EA7CB9E0;
  v7[6] = v2;
  v7[7] = v2;
  v6[8] = &unk_1EA7CB9F8;
  v6[9] = &unk_1EA7CB980;
  v3 = *MEMORY[0x1E0CB9AA0];
  v7[8] = v2;
  v7[9] = v3;
  v6[10] = &unk_1EA7CB998;
  v7[10] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED378938;
  qword_1ED378938 = v4;

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HFMatterDeviceAccessoryType deviceType](self, "deviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("matterDeviceType: 0x%02x"), objc_msgSend(v3, "intValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)na_identity
{
  if (qword_1ED378940 != -1)
    dispatch_once(&qword_1ED378940, &__block_literal_global_283);
  return (id)qword_1ED378948;
}

void __42__HFMatterDeviceAccessoryType_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_286);
  objc_msgSend(v0, "build");
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)qword_1ED378948;
  qword_1ED378948 = v2;

}

uint64_t __42__HFMatterDeviceAccessoryType_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceType");
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
}

@end
