@implementation SGReminderMetadata

- (SGReminderMetadata)initWithRecordId:(id)a3 sourceUniqueIdentifier:(id)a4
{
  id v7;
  id v8;
  SGReminderMetadata *v9;
  SGReminderMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGReminderMetadata;
  v9 = -[SGReminderMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordId, a3);
    objc_storeStrong((id *)&v10->_sourceUniqueIdentifier, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGReminderMetadata recordId: %@ sourceUniqueIdentifier: %@>"), self->_recordId, self->_sourceUniqueIdentifier);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SGRecordId hash](self->_recordId, "hash");
  return -[NSString hash](self->_sourceUniqueIdentifier, "hash") - v3 + 32 * v3;
}

- (void)encodeWithCoder:(id)a3
{
  SGRecordId *recordId;
  id v5;

  recordId = self->_recordId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordId, CFSTR("recordId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceUniqueIdentifier, CFSTR("sourceUniqueIdentifier"));

}

- (SGReminderMetadata)initWithCoder:(id)a3
{
  id v5;
  SGReminderMetadata *v6;
  void *v7;
  void *v8;
  SGRecordId *v9;
  void *recordId;
  void *v11;
  uint64_t v12;
  NSString *sourceUniqueIdentifier;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGReminderMetadata;
  v6 = -[SGReminderMetadata init](&v15, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("recordId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      recordId = v6->_recordId;
      v6->_recordId = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      recordId = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(recordId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGReminderMetadata.m"), 54, CFSTR("nonnull property %s *%s was null when decoded"), "SGRecordId", "recordId");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("sourceUniqueIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    sourceUniqueIdentifier = v6->_sourceUniqueIdentifier;
    v6->_sourceUniqueIdentifier = (NSString *)v12;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[SGRecordId copyWithZone:](self->_recordId, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_sourceUniqueIdentifier, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SGReminderMetadata *v4;
  SGReminderMetadata *v5;
  BOOL v6;

  v4 = (SGReminderMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGReminderMetadata isEqualToReminderMetadata:](self, "isEqualToReminderMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToReminderMetadata:(id)a3
{
  id v4;
  _QWORD *v5;
  SGRecordId *recordId;
  SGRecordId *v7;
  SGRecordId *v8;
  SGRecordId *v9;
  BOOL v10;
  char v11;
  NSString *v12;
  NSString *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  recordId = self->_recordId;
  v7 = (SGRecordId *)*((id *)v4 + 1);
  if (recordId == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = recordId;
    v10 = -[SGRecordId isEqual:](v9, "isEqual:", v8);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_sourceUniqueIdentifier;
  v13 = v12;
  if (v12 == (NSString *)v5[2])
    v11 = 1;
  else
    v11 = -[NSString isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (NSString)sourceUniqueIdentifier
{
  return self->_sourceUniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
