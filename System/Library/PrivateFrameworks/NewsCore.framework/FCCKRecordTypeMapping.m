@implementation FCCKRecordTypeMapping

- (FCCKRecordTypeMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordSchema:(id)a5 toRecordSchema:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCCKRecordTypeMapping *v15;
  FCCKRecordTypeMapping *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCCKRecordTypeMapping;
  v15 = -[FCCKRecordTypeMapping init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v16->_toZoneSchema, a4);
    objc_storeStrong((id *)&v16->_fromRecordSchema, a5);
    objc_storeStrong((id *)&v16->_toRecordSchema, a6);
  }

  return v16;
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
  -[FCCKRecordTypeMapping fromZoneSchema](self, "fromZoneSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordTypeMapping toZoneSchema](self, "toZoneSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5))
  {
    v6 = (void *)MEMORY[0x1E0DE7910];
    -[FCCKRecordTypeMapping fromRecordSchema](self, "fromRecordSchema");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKRecordTypeMapping toRecordSchema](self, "toRecordSchema");
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

- (FCCKRecordSchema)fromRecordSchema
{
  return self->_fromRecordSchema;
}

- (FCCKRecordSchema)toRecordSchema
{
  return self->_toRecordSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toRecordSchema, 0);
  objc_storeStrong((id *)&self->_fromRecordSchema, 0);
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end
