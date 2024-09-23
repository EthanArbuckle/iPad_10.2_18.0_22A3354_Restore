@implementation ASMigrationAvailableItem

- (ASCodableCloudKitMigrationAvailableItem)codableMigrationAvailableItem
{
  ASCodableCloudKitMigrationAvailableItem *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(ASCodableCloudKitMigrationAvailableItem);
  -[ASMigrationAvailableItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitMigrationAvailableItem setIdentifier:](v3, "setIdentifier:", v4);

  -[ASMigrationAvailableItem relationshipIdentifier](self, "relationshipIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitMigrationAvailableItem setRelationshipIdentifier:](v3, "setRelationshipIdentifier:", v5);

  return v3;
}

+ (id)migrationAvailableItemWithCodableItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  ASMigrationAvailableItem *v6;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "relationshipIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[ASMigrationAvailableItem initWithIdentifier:relationshipIdentifier:]([ASMigrationAvailableItem alloc], "initWithIdentifier:relationshipIdentifier:", v4, v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)migrationAvailableItemsWithRecords:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_373);
}

id __86__ASMigrationAvailableItem_CloudKitCodingSupport__migrationAvailableItemsWithRecords___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ActivitySharingMigrationAvailableRecord"));

  if (v4)
  {
    +[ASMigrationAvailableItem migrationAvailableItemWithRecord:](ASMigrationAvailableItem, "migrationAvailableItemWithRecord:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)migrationAvailableItemWithRecord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  ASCodableCloudKitMigrationAvailableItem *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;

  v3 = a3;
  if (_ASCloudKitSchemaVersionForRecord(v3) == 1)
  {
    objc_msgSend(v3, "encryptedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptedData"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
    {
      v8 = -[ASCodableCloudKitMigrationAvailableItem initWithData:]([ASCodableCloudKitMigrationAvailableItem alloc], "initWithData:", v6);
      +[ASMigrationAvailableItem migrationAvailableItemWithCodableItem:](ASMigrationAvailableItem, "migrationAvailableItemWithCodableItem:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v3, "encodeSystemFieldsWithCoder:", v10);
      objc_msgSend(v10, "finishEncoding");
      v11 = objc_alloc(MEMORY[0x24BDD1620]);
      objc_msgSend(v10, "encodedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v13 = (void *)objc_msgSend(v11, "initForReadingFromData:error:", v12, &v17);
      v14 = v17;

      if (v14)
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.5();
      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithCoder:", v13);
      objc_msgSend(v9, "setSystemFieldsOnlyRecord:", v15);

      v7 = v9;
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[ASMigrationAvailableItem(CloudKitCodingSupport) migrationAvailableItemWithRecord:].cold.1();
      v7 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[ASMigrationAvailableItem(CloudKitCodingSupport) migrationAvailableItemWithRecord:].cold.3();
    v7 = 0;
  }

  return v7;
}

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  -[ASMigrationAvailableItem systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (objc_msgSend(v7, "recordID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "zoneID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqual:", v6),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[ASMigrationAvailableItem relationshipIdentifier](self, "relationshipIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("ActivitySharingMigrationAvailableRecord"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v14, v6);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ActivitySharingMigrationAvailableRecord"), v15);

    v8 = (void *)v16;
  }
  _ASUpdateSchemaVersionOnRecord(1, v8, a4);
  -[ASMigrationAvailableItem codableMigrationAvailableItem](self, "codableMigrationAvailableItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encryptedValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("EncryptedData"));

  return v8;
}

- (ASMigrationAvailableItem)initWithRelationshipIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  ASMigrationAvailableItem *v8;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASMigrationAvailableItem initWithIdentifier:relationshipIdentifier:](self, "initWithIdentifier:relationshipIdentifier:", v7, v5);

  return v8;
}

- (ASMigrationAvailableItem)initWithIdentifier:(id)a3 relationshipIdentifier:(id)a4
{
  id v7;
  id v8;
  ASMigrationAvailableItem *v9;
  ASMigrationAvailableItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASMigrationAvailableItem;
  v9 = -[ASMigrationAvailableItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_relationshipIdentifier, a4);
  }

  return v10;
}

- (NSString)description
{
  const __CFString *v2;

  if (self->_systemFieldsOnlyRecord)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ASMigrationAvailableItem (%@), systemFieldsOnlyRecord exists: %@"), self->_relationshipIdentifier, v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[ASMigrationAvailableItem relationshipIdentifier](self, "relationshipIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relationshipIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASMigrationAvailableItem relationshipIdentifier](self, "relationshipIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (CKRecord)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (ASCodableMigrationAvailableItemContainer)codableMigrationAvailableItemContainer
{
  ASCodableMigrationAvailableItemContainer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(ASCodableMigrationAvailableItemContainer);
  -[ASMigrationAvailableItem codableMigrationAvailableItem](self, "codableMigrationAvailableItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableMigrationAvailableItemContainer setMigrationAvailableItem:](v3, "setMigrationAvailableItem:", v4);

  -[ASMigrationAvailableItem systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1618];
    -[ASMigrationAvailableItem systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCodableMigrationAvailableItemContainer setSystemFieldsOnlyRecord:](v3, "setSystemFieldsOnlyRecord:", v8);

  }
  return v3;
}

+ (id)migrationAvailableItemWithCodableContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "migrationAvailableItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASMigrationAvailableItem migrationAvailableItemWithCodableItem:](ASMigrationAvailableItem, "migrationAvailableItemWithCodableItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "systemFieldsOnlyRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ASSecureUnarchiveClassWithDataAndStrictness(v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemFieldsOnlyRecord:", v8);

  return v5;
}

@end
