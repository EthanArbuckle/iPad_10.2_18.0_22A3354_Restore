@implementation ASCodableMigrationAvailableItemContainer

- (BOOL)hasMigrationAvailableItem
{
  return self->_migrationAvailableItem != 0;
}

- (BOOL)hasSystemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ASCodableMigrationAvailableItemContainer;
  -[ASCodableMigrationAvailableItemContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableMigrationAvailableItemContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ASCodableCloudKitMigrationAvailableItem *migrationAvailableItem;
  void *v5;
  NSData *systemFieldsOnlyRecord;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  migrationAvailableItem = self->_migrationAvailableItem;
  if (migrationAvailableItem)
  {
    -[ASCodableCloudKitMigrationAvailableItem dictionaryRepresentation](migrationAvailableItem, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("migrationAvailableItem"));

  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if (systemFieldsOnlyRecord)
    objc_msgSend(v3, "setObject:forKey:", systemFieldsOnlyRecord, CFSTR("systemFieldsOnlyRecord"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableMigrationAvailableItemContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_migrationAvailableItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_migrationAvailableItem)
  {
    objc_msgSend(v4, "setMigrationAvailableItem:");
    v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    objc_msgSend(v5, "setSystemFieldsOnlyRecord:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ASCodableCloudKitMigrationAvailableItem copyWithZone:](self->_migrationAvailableItem, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_systemFieldsOnlyRecord, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ASCodableCloudKitMigrationAvailableItem *migrationAvailableItem;
  NSData *systemFieldsOnlyRecord;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((migrationAvailableItem = self->_migrationAvailableItem, !((unint64_t)migrationAvailableItem | v4[1]))
     || -[ASCodableCloudKitMigrationAvailableItem isEqual:](migrationAvailableItem, "isEqual:")))
  {
    systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
    if ((unint64_t)systemFieldsOnlyRecord | v4[2])
      v7 = -[NSData isEqual:](systemFieldsOnlyRecord, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[ASCodableCloudKitMigrationAvailableItem hash](self->_migrationAvailableItem, "hash");
  return -[NSData hash](self->_systemFieldsOnlyRecord, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ASCodableCloudKitMigrationAvailableItem *migrationAvailableItem;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  migrationAvailableItem = self->_migrationAvailableItem;
  v6 = v4[1];
  v7 = v4;
  if (migrationAvailableItem)
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableCloudKitMigrationAvailableItem mergeFrom:](migrationAvailableItem, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableMigrationAvailableItemContainer setMigrationAvailableItem:](self, "setMigrationAvailableItem:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[ASCodableMigrationAvailableItemContainer setSystemFieldsOnlyRecord:](self, "setSystemFieldsOnlyRecord:");
    v4 = v7;
  }

}

- (ASCodableCloudKitMigrationAvailableItem)migrationAvailableItem
{
  return self->_migrationAvailableItem;
}

- (void)setMigrationAvailableItem:(id)a3
{
  objc_storeStrong((id *)&self->_migrationAvailableItem, a3);
}

- (NSData)systemFieldsOnlyRecord
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
  objc_storeStrong((id *)&self->_migrationAvailableItem, 0);
}

@end
