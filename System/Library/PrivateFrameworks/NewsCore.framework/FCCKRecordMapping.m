@implementation FCCKRecordMapping

- (FCCKRecordMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordSchema:(id)a5 toRecordSchema:(id)a6 recordIDMapping:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FCCKRecordMapping *v17;
  FCCKRecordMapping *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FCCKRecordMapping;
  v17 = -[FCCKRecordMapping init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v18->_toZoneSchema, a4);
    objc_storeStrong((id *)&v18->_fromRecordSchema, a5);
    objc_storeStrong((id *)&v18->_toRecordSchema, a6);
    objc_storeStrong((id *)&v18->_recordIDMapping, a7);
  }

  return v18;
}

- (BOOL)hasChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = (void *)MEMORY[0x1E0DE7910];
  -[FCCKRecordMapping fromZoneSchema](self, "fromZoneSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordMapping toZoneSchema](self, "toZoneSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5))
  {
    v6 = (void *)MEMORY[0x1E0DE7910];
    -[FCCKRecordMapping fromRecordSchema](self, "fromRecordSchema");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKRecordMapping toRecordSchema](self, "toRecordSchema");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8))
    {
      -[FCCKRecordMapping recordIDMapping](self, "recordIDMapping");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasChanges");

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
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

- (FCCKRecordIDMapping)recordIDMapping
{
  return self->_recordIDMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDMapping, 0);
  objc_storeStrong((id *)&self->_toRecordSchema, 0);
  objc_storeStrong((id *)&self->_fromRecordSchema, 0);
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end
