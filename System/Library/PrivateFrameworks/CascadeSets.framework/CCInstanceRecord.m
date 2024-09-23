@implementation CCInstanceRecord

- (CCInstanceRecord)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabaseValueRow:", v3);

  return v4;
}

+ (id)genSQLCreateStatements
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer NOT NULL, \"%@\" integer NOT NULL, \"%@\" integer NOT NULL, PRIMARY KEY (\"%@\") FOREIGN KEY (\"%@\") REFERENCES \"%@\" (\"%@\") ON UPDATE CASCADE ON DELETE CASCADE);"),
    CFSTR("instance"),
    CFSTR("source_item_id_hash"),
    CFSTR("provenance_row_id"),
    CFSTR("modified"),
    CFSTR("source_item_id_hash"),
    CFSTR("provenance_row_id"),
    CFSTR("provenance"),
    CFSTR("provenance_row_id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE INDEX \"%@\" ON \"%@\" (\"%@\" ASC);"),
    CFSTR("idx_instance_modified"),
    CFSTR("instance"),
    CFSTR("modified"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)tableName
{
  return CFSTR("instance");
}

- (CCInstanceRecord)initWithDatabaseValueRow:(id)a3
{
  id v4;
  CCInstanceRecord *v5;
  uint64_t v6;
  NSNumber *sourceItemIdHash;
  uint64_t v8;
  NSNumber *provenanceRowId;
  uint64_t v10;
  NSNumber *modified;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCInstanceRecord;
  v5 = -[CCInstanceRecord init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "numberValueAtColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    sourceItemIdHash = v5->_sourceItemIdHash;
    v5->_sourceItemIdHash = (NSNumber *)v6;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    provenanceRowId = v5->_provenanceRowId;
    v5->_provenanceRowId = (NSNumber *)v8;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 2);
    v10 = objc_claimAutoreleasedReturnValue();
    modified = v5->_modified;
    v5->_modified = (NSNumber *)v10;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCInstanceRecord;
  -[CCInstanceRecord description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("sourceItemIdHash: %@, provenanceRowId: %@, modified: %@"), self->_sourceItemIdHash, self->_provenanceRowId, self->_modified);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  CCInstanceRecord *v4;
  CCInstanceRecord *v5;
  BOOL v6;

  v4 = (CCInstanceRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCInstanceRecord isEqualToItemRecord:](self, "isEqualToItemRecord:", v5);

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4;
  void *v5;
  NSNumber *sourceItemIdHash;
  void *v7;
  NSNumber *provenanceRowId;
  void *v9;
  NSNumber *modified;
  void *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sourceItemIdHash = self->_sourceItemIdHash;
    objc_msgSend(v4, "sourceItemIdHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber isEqual:](sourceItemIdHash, "isEqual:", v7))
    {
      provenanceRowId = self->_provenanceRowId;
      objc_msgSend(v5, "provenanceRowId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSNumber isEqual:](provenanceRowId, "isEqual:", v9))
      {
        modified = self->_modified;
        objc_msgSend(v5, "modified");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSNumber isEqual:](modified, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSNumber hash](self->_sourceItemIdHash, "hash");
  v4 = -[NSNumber hash](self->_provenanceRowId, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_modified, "hash");
}

- (NSNumber)sourceItemIdHash
{
  return self->_sourceItemIdHash;
}

- (NSNumber)provenanceRowId
{
  return self->_provenanceRowId;
}

- (NSNumber)modified
{
  return self->_modified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_provenanceRowId, 0);
  objc_storeStrong((id *)&self->_sourceItemIdHash, 0);
}

@end
