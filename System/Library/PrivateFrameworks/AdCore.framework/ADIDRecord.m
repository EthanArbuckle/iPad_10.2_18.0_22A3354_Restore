@implementation ADIDRecord

- (ADIDRecord)initWithID:(id)a3
{
  id v4;
  ADIDRecord *v5;
  uint64_t v6;
  NSString *ID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADIDRecord;
  v5 = -[ADIDRecord init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    ID = v5->_ID;
    v5->_ID = (NSString *)v6;

    v5->_dirty = 1;
  }

  return v5;
}

- (NSString)ID
{
  return self->_ID;
}

- (ADIDRecord)init
{
  ADIDRecord *v2;
  void *v3;
  uint64_t v4;
  NSString *ID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ADIDRecord;
  v2 = -[ADIDRecord init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    ID = v2->_ID;
    v2->_ID = (NSString *)v4;

    v2->_dirty = 1;
  }
  return v2;
}

- (void)setID:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_ID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_ID, a3);
    self->_dirty = 1;
  }

}

- (NSData)encryptedID
{
  NSData *encryptedID;
  NSData *v4;
  NSData *v5;

  encryptedID = self->_encryptedID;
  if (!encryptedID)
  {
    ADEncryptString(self->_ID);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_encryptedID;
    self->_encryptedID = v4;

    encryptedID = self->_encryptedID;
  }
  return encryptedID;
}

- (id)dictionaryRepresentation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_ID, CFSTR("kADiAdIDRecord_iAdIDKey"));
  return v3;
}

- (id)description
{
  return self->_ID;
}

- (BOOL)isEqual:(id)a3
{
  ADIDRecord *v4;
  ADIDRecord *v5;
  ADIDRecord *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (ADIDRecord *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[ADIDRecord ID](self, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADIDRecord ID](v6, "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqualToString:", v8);
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (void)setEncryptedID:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedID, a3);
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
