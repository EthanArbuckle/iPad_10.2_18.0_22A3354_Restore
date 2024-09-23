@implementation DNDSMeDeviceStore

- (DNDSMeDeviceStore)init
{
  return (DNDSMeDeviceStore *)-[DNDSMeDeviceStore _initWithStore:](self, "_initWithStore:", 0);
}

- (id)_initWithStore:(id)a3
{
  id v4;
  DNDSMeDeviceStore *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *meDeviceName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DNDSMeDeviceStore;
  v5 = -[DNDSMeDeviceStore init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "meDeviceStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = &unk_1E86DE520;
    objc_storeStrong((id *)&v5->_meDeviceStatus, v9);

    objc_msgSend(v4, "meDeviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    meDeviceName = v5->_meDeviceName;
    v5->_meDeviceName = (NSString *)v11;

  }
  return v5;
}

- (id)_initWithStatus:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  DNDSMeDeviceStore *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSMeDeviceStore;
  v9 = -[DNDSMeDeviceStore init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_meDeviceStatus, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[DNDSMeDeviceStore meDeviceStatus](self, "meDeviceStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSMeDeviceStore meDeviceName](self, "meDeviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  DNDSMeDeviceStore *v4;
  DNDSMeDeviceStore *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (DNDSMeDeviceStore *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSMeDeviceStore meDeviceStatus](self, "meDeviceStatus");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSMeDeviceStore meDeviceStatus](v5, "meDeviceStatus");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSMeDeviceStore meDeviceStatus](self, "meDeviceStatus");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v9 = (void *)v8;
        -[DNDSMeDeviceStore meDeviceStatus](v5, "meDeviceStatus");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        -[DNDSMeDeviceStore meDeviceStatus](self, "meDeviceStatus");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSMeDeviceStore meDeviceStatus](v5, "meDeviceStatus");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      -[DNDSMeDeviceStore meDeviceName](self, "meDeviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSMeDeviceStore meDeviceName](v5, "meDeviceName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[DNDSMeDeviceStore meDeviceName](self, "meDeviceName");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[DNDSMeDeviceStore meDeviceName](v5, "meDeviceName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[DNDSMeDeviceStore meDeviceName](self, "meDeviceName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSMeDeviceStore meDeviceName](v5, "meDeviceName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v22, "isEqual:", v20);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {

          v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7)
        goto LABEL_24;
      goto LABEL_22;
    }
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSMeDeviceStore meDeviceStatus](self, "meDeviceStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsignedIntegerValue");
  DNDMeDeviceStatusToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMeDeviceStore meDeviceName](self, "meDeviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; meDeviceStatus: %@; meDeviceName: %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSMeDeviceStore _initWithStore:]([DNDSMutableMeDeviceStore alloc], "_initWithStore:", self);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("meDeviceStatus"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("meDeviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStatus:name:", v6, v7);
  return v8;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  NSString *meDeviceName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", self->_meDeviceStatus, CFSTR("meDeviceStatus"));
  meDeviceName = self->_meDeviceName;
  if (meDeviceName)
    objc_msgSend(v4, "setObject:forKey:", meDeviceName, CFSTR("meDeviceName"));
  return v4;
}

- (NSNumber)meDeviceStatus
{
  return self->_meDeviceStatus;
}

- (NSString)meDeviceName
{
  return self->_meDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDeviceName, 0);
  objc_storeStrong((id *)&self->_meDeviceStatus, 0);
}

@end
