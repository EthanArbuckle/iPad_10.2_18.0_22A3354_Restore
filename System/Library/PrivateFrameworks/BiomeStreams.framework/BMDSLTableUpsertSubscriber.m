@implementation BMDSLTableUpsertSubscriber

- (BMDSLTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  BMDSLTableUpsertSubscriber *v12;
  uint64_t v13;
  NSString *tableName;
  uint64_t v15;
  NSString *identifier;
  objc_super v18;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BMDSLTableUpsertSubscriber;
  v12 = -[BMDSLBaseCodable initWithName:version:](&v18, sel_initWithName_version_, a5, v6);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    tableName = v12->_tableName;
    v12->_tableName = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v15;

  }
  return v12;
}

- (BMDSLTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4
{
  return -[BMDSLTableUpsertSubscriber initWithTableName:identifier:name:version:](self, "initWithTableName:identifier:name:version:", a3, a4, CFSTR("tableUpsertSubscriber"), 1);
}

- (id)bpsSubscriber
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[BMDSLTableUpsertSubscriber identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMComputeXPCSubscription storageForIdentifier:](BMComputeXPCSubscription, "storageForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0D01C18]);
  -[BMDSLTableUpsertSubscriber tableName](self, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLTableUpsertSubscriber identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTableName:identifier:keyValueStore:", v6, v7, v4);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMDSLTableUpsertSubscriber;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[BMDSLTableUpsertSubscriber tableName](self, "tableName", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tableName"));

  -[BMDSLTableUpsertSubscriber identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (BMDSLTableUpsertSubscriber)initWithCoder:(id)a3
{
  id v4;
  BMDSLTableUpsertSubscriber *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLTableUpsertSubscriber;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tableName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLTableUpsertSubscriber initWithTableName:identifier:name:version:](v5, "initWithTableName:identifier:name:version:", v6, v7, CFSTR("tableUpsertSubscriber"), 1);

  }
  return v5;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
