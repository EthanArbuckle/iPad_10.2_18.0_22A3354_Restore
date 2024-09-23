@implementation FCCKRecordIDMapping

- (FCCKRecordIDMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordName:(id)a5 toRecordName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCCKRecordIDMapping *v15;
  FCCKRecordIDMapping *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCCKRecordIDMapping;
  v15 = -[FCCKRecordIDMapping init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v16->_toZoneSchema, a4);
    objc_storeStrong((id *)&v16->_fromRecordName, a5);
    objc_storeStrong((id *)&v16->_toRecordName, a6);
  }

  return v16;
}

- (CKRecordID)fromRecordID
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCCKRecordIDMapping fromRecordName](self, "fromRecordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordIDMapping fromZoneSchema](self, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 24);
  else
    v7 = 0;
  v8 = v7;
  v9 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, v8);

  return (CKRecordID *)v9;
}

- (CKRecordID)toRecordID
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCCKRecordIDMapping toRecordName](self, "toRecordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordIDMapping toZoneSchema](self, "toZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 24);
  else
    v7 = 0;
  v8 = v7;
  v9 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, v8);

  return (CKRecordID *)v9;
}

- (BOOL)hasChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v3 = (void *)MEMORY[0x1E0DE7910];
  -[FCCKRecordIDMapping fromZoneSchema](self, "fromZoneSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordIDMapping toZoneSchema](self, "toZoneSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5))
  {
    v6 = (void *)MEMORY[0x1E0DE7910];
    -[FCCKRecordIDMapping fromRecordName](self, "fromRecordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKRecordIDMapping toRecordName](self, "toRecordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (FCCKZoneSchema)fromZoneSchema
{
  return self->_fromZoneSchema;
}

- (FCCKZoneSchema)toZoneSchema
{
  return self->_toZoneSchema;
}

- (NSString)fromRecordName
{
  return self->_fromRecordName;
}

- (NSString)toRecordName
{
  return self->_toRecordName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toRecordName, 0);
  objc_storeStrong((id *)&self->_fromRecordName, 0);
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end
