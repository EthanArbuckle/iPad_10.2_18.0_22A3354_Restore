@implementation ASMigrationDisplayItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASMigrationDisplayItem)initWithCoder:(id)a3
{
  id v4;
  ASMigrationDisplayItem *v5;
  id v6;
  id v7;
  ASMigrationDisplayItem *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASMigrationDisplayItem;
  v5 = -[ASPickerDisplayItem initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v5;
  }
  else
  {
    v10 = objc_opt_class();
    ASErrorF(1, (uint64_t)"%@ init failed", v11, v12, v13, v14, v15, v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v17);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *peripheralIdentifier;
  NSString *hotspotSSID;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASMigrationDisplayItem;
  -[ASPickerDisplayItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  peripheralIdentifier = self->_peripheralIdentifier;
  if (peripheralIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", peripheralIdentifier, CFSTR("mPid"));
  hotspotSSID = self->_hotspotSSID;
  if (hotspotSSID)
    objc_msgSend(v4, "encodeObject:forKey:", hotspotSSID, CFSTR("mHSd"));

}

- (ASMigrationDisplayItem)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ASMigrationDisplayItem *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ASMigrationDisplayItem *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASMigrationDisplayItem;
  v7 = -[ASPickerDisplayItem initWithXPCObject:error:](&v24, sel_initWithXPCObject_error_, v6, a4);
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  if (MEMORY[0x2349290D0](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_4;
  }
  CUXPCDecodeNSUUID();
  CUXPCDecodeNSString();
  v14 = v7;
LABEL_4:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSUUID *peripheralIdentifier;
  id v6;
  NSString *hotspotSSID;
  id v8;
  const char *v9;
  objc_super v10;
  unsigned __int8 uuid[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASMigrationDisplayItem;
  -[ASPickerDisplayItem encodeWithXPCObject:](&v10, sel_encodeWithXPCObject_, v4);
  peripheralIdentifier = self->_peripheralIdentifier;
  if (peripheralIdentifier)
  {
    v6 = v4;
    -[NSUUID getUUIDBytes:](peripheralIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v6, "mPid", uuid);

  }
  hotspotSSID = self->_hotspotSSID;
  v8 = v4;
  v9 = -[NSString UTF8String](objc_retainAutorelease(hotspotSSID), "UTF8String");
  if (v9)
    xpc_dictionary_set_string(v8, "mHSd", v9);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASMigrationDisplayItem;
  v4 = -[ASPickerDisplayItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSUUID copy](self->_peripheralIdentifier, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_hotspotSSID, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ASMigrationDisplayItem *v4;
  ASMigrationDisplayItem *v5;
  ASMigrationDisplayItem *v6;
  NSUUID *peripheralIdentifier;
  void *v8;
  NSUUID *v9;
  NSUUID *v10;
  NSUUID *v11;
  int v12;
  char v13;
  NSString *hotspotSSID;
  void *v15;
  NSString *p_isa;
  NSUUID *v17;

  v4 = (ASMigrationDisplayItem *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!-[ASMigrationDisplayItem isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v13 = 0;
LABEL_19:

      goto LABEL_20;
    }
    peripheralIdentifier = self->_peripheralIdentifier;
    -[ASMigrationDisplayItem peripheralIdentifier](v6, "peripheralIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = peripheralIdentifier;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if ((v9 == 0) == (v10 != 0))
      {
        v13 = 0;
        p_isa = (NSString *)&v10->super.isa;
LABEL_17:

        goto LABEL_18;
      }
      v12 = -[NSUUID isEqual:](v9, "isEqual:", v10);

      if (!v12)
      {
        v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    hotspotSSID = self->_hotspotSSID;
    -[ASMigrationDisplayItem hotspotSSID](v6, "hotspotSSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    p_isa = hotspotSSID;
    v17 = v15;
    v9 = v17;
    if (p_isa == (NSString *)v17)
    {
      v13 = 1;
    }
    else if ((p_isa == 0) == (v17 != 0))
    {
      v13 = 0;
    }
    else
    {
      v13 = -[NSString isEqual:](p_isa, "isEqual:", v17);
    }

    goto LABEL_17;
  }
  v13 = 1;
LABEL_20:

  return v13;
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  NSUUID *peripheralIdentifier;
  __CFString *v6;
  NSString *hotspotSSID;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSUUID *v12;
  NSString *v13;
  id v14;

  CUAppendF();
  v14 = 0;
  CUAppendF();
  v4 = (__CFString *)v14;

  peripheralIdentifier = self->_peripheralIdentifier;
  if (peripheralIdentifier)
  {
    v12 = peripheralIdentifier;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  hotspotSSID = self->_hotspotSSID;
  if (hotspotSSID)
  {
    v13 = hotspotSSID;
    CUAppendF();
    v8 = v4;

    v4 = v8;
  }
  v9 = &stru_250420148;
  if (v4)
    v9 = v4;
  v10 = v9;

  return v10;
}

- (NSUUID)peripheralIdentifier
{
  return self->_peripheralIdentifier;
}

- (void)setPeripheralIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)hotspotSSID
{
  return self->_hotspotSSID;
}

- (void)setHotspotSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotSSID, 0);
  objc_storeStrong((id *)&self->_peripheralIdentifier, 0);
}

@end
