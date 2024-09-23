@implementation FCCKRecordZoneIDMapping

- (FCCKRecordZoneIDMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4
{
  id v7;
  id v8;
  FCCKRecordZoneIDMapping *v9;
  FCCKRecordZoneIDMapping *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCKRecordZoneIDMapping;
  v9 = -[FCCKRecordZoneIDMapping init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v10->_toZoneSchema, a4);
  }

  return v10;
}

- (BOOL)hasChanges
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DE7910];
  -[FCCKRecordZoneIDMapping fromZoneSchema](self, "fromZoneSchema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneIDMapping toZoneSchema](self, "toZoneSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5) ^ 1;

  return (char)v3;
}

- (FCCKZoneSchema)fromZoneSchema
{
  return self->_fromZoneSchema;
}

- (FCCKZoneSchema)toZoneSchema
{
  return self->_toZoneSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end
