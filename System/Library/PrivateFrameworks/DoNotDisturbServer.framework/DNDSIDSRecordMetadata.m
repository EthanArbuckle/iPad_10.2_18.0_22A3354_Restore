@implementation DNDSIDSRecordMetadata

- (DNDSIDSRecordMetadata)initWithRecordID:(id)a3 lastModified:(id)a4 deleted:(BOOL)a5
{
  id v8;
  id v9;
  DNDSIDSRecordMetadata *v10;
  uint64_t v11;
  DNDSIDSRecordID *recordID;
  uint64_t v13;
  NSDate *lastModified;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDSIDSRecordMetadata;
  v10 = -[DNDSIDSRecordMetadata init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    recordID = v10->_recordID;
    v10->_recordID = (DNDSIDSRecordID *)v11;

    v13 = objc_msgSend(v9, "copy");
    lastModified = v10->_lastModified;
    v10->_lastModified = (NSDate *)v13;

    v10->_deleted = a5;
  }

  return v10;
}

- (id)_initWithRecordMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  DNDSIDSRecordMetadata *v8;

  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastModified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isDeleted");

  v8 = -[DNDSIDSRecordMetadata initWithRecordID:lastModified:deleted:](self, "initWithRecordID:lastModified:deleted:", v5, v6, v7);
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[DNDSIDSRecordID hash](self->_recordID, "hash");
  return -[NSDate hash](self->_lastModified, "hash") ^ v3 ^ self->_deleted;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DNDSIDSRecordMetadata *v7;
  DNDSIDSRecordMetadata *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = (DNDSIDSRecordMetadata *)a3;
  if (self == v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[DNDSIDSRecordMetadata recordID](self, "recordID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSIDSRecordMetadata recordID](v8, "recordID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[DNDSIDSRecordMetadata recordID](self, "recordID");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        -[DNDSIDSRecordMetadata recordID](v8, "recordID");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          LOBYTE(v14) = 0;
LABEL_27:

          goto LABEL_28;
        }
        v4 = (void *)v12;
        -[DNDSIDSRecordMetadata recordID](self, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSIDSRecordMetadata recordID](v8, "recordID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v5))
        {
          LOBYTE(v14) = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      -[DNDSIDSRecordMetadata lastModified](self, "lastModified");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSIDSRecordMetadata lastModified](v8, "lastModified");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
        goto LABEL_16;
      -[DNDSIDSRecordMetadata lastModified](self, "lastModified");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

        LOBYTE(v14) = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      -[DNDSIDSRecordMetadata lastModified](v8, "lastModified");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        LOBYTE(v14) = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      -[DNDSIDSRecordMetadata lastModified](self, "lastModified");
      v19 = objc_claimAutoreleasedReturnValue();
      -[DNDSIDSRecordMetadata lastModified](v8, "lastModified");
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v19;
      v21 = (void *)v19;
      v4 = (void *)v20;
      if (objc_msgSend(v21, "isEqual:", v20))
      {
LABEL_16:
        v22 = -[DNDSIDSRecordMetadata isDeleted](self, "isDeleted");
        v14 = v22 ^ -[DNDSIDSRecordMetadata isDeleted](v8, "isDeleted") ^ 1;
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          v13 = v27;
          v4 = v28;
          v5 = v26;
          if (v9 != v10)
            goto LABEL_26;
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    LOBYTE(v14) = 0;
  }
LABEL_29:

  return v14;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSIDSRecordMetadata recordID](self, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSIDSRecordMetadata lastModified](self, "lastModified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DNDSIDSRecordMetadata isDeleted](self, "isDeleted");
  v8 = "NO";
  if (v7)
    v8 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; recordID: %@; lastModified: %@; deleted: %s>"),
    v4,
    self,
    v5,
    v6,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSIDSRecordMetadata _initWithRecordMetadata:]([DNDSMutableIDSRecordMetadata alloc], "_initWithRecordMetadata:", self);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bs_safeDictionaryForKey:", CFSTR("recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[DNDSIDSRecordID newWithDictionaryRepresentation:context:](DNDSIDSRecordID, "newWithDictionaryRepresentation:context:", v8, v6);

  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "bs_safeNumberForKey:", CFSTR("lastModified"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bs_safeNumberForKey:", CFSTR("deleted"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRecordID:lastModified:deleted:", v9, v12, v14);

  return v15;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("recordID");
  -[DNDSIDSRecordID dictionaryRepresentationWithContext:](self->_recordID, "dictionaryRepresentationWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("lastModified");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_lastModified, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("deleted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (DNDSIDSRecordID)recordID
{
  return self->_recordID;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
