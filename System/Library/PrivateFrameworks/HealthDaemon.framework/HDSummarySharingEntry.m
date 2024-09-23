@implementation HDSummarySharingEntry

- (HDSummarySharingEntry)initWithCodableEntry:(id)a3 CNContactIdentifier:(id)a4 isPaused:(BOOL)a5
{
  id v9;
  id v10;
  HDSummarySharingEntry *v11;
  HDSummarySharingEntry *v12;
  uint64_t v13;
  NSString *CNContactIdentifier;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSummarySharingEntry;
  v11 = -[HDSummarySharingEntry init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_codableEntry, a3);
    v13 = objc_msgSend(v10, "copy");
    CNContactIdentifier = v12->_CNContactIdentifier;
    v12->_CNContactIdentifier = (NSString *)v13;

    v12->_isPaused = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p codableEntry=%@, contactIdentifier=%@, isPaused=%d"), v5, self, self->_codableEntry, self->_CNContactIdentifier, self->_isPaused);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HDCodableSummarySharingEntry hash](self->_codableEntry, "hash");
  return -[NSString hash](self->_CNContactIdentifier, "hash") ^ v3 ^ self->_isPaused;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HDSummarySharingEntry *v7;
  HDSummarySharingEntry *v8;
  HDCodableSummarySharingEntry *codableEntry;
  HDCodableSummarySharingEntry *v10;
  uint64_t v11;
  void *v12;
  HDCodableSummarySharingEntry *v13;
  BOOL v14;
  NSString *CNContactIdentifier;
  NSString *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  _BOOL4 isPaused;
  void *v24;

  v7 = (HDSummarySharingEntry *)a3;
  if (self == v7)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      codableEntry = self->_codableEntry;
      -[HDSummarySharingEntry codableEntry](v8, "codableEntry");
      v10 = (HDCodableSummarySharingEntry *)objc_claimAutoreleasedReturnValue();
      if (codableEntry != v10)
      {
        -[HDSummarySharingEntry codableEntry](v8, "codableEntry");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
          goto LABEL_22;
        }
        v12 = (void *)v11;
        v13 = self->_codableEntry;
        -[HDSummarySharingEntry codableEntry](v8, "codableEntry");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HDCodableSummarySharingEntry isEqual:](v13, "isEqual:", v5))
        {
          v14 = 0;
LABEL_21:

          goto LABEL_22;
        }
        v24 = v12;
      }
      CNContactIdentifier = self->_CNContactIdentifier;
      -[HDSummarySharingEntry CNContactIdentifier](v8, "CNContactIdentifier");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (CNContactIdentifier != v16)
      {
        -[HDSummarySharingEntry CNContactIdentifier](v8, "CNContactIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {

          v14 = 0;
          goto LABEL_20;
        }
        v3 = (void *)v17;
        v18 = v5;
        v19 = self->_CNContactIdentifier;
        -[HDSummarySharingEntry CNContactIdentifier](v8, "CNContactIdentifier");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v19;
        v5 = v18;
        v4 = (void *)v20;
        if (!-[NSString isEqualToString:](v21, "isEqualToString:", v20))
        {
          v14 = 0;
          goto LABEL_15;
        }
      }
      isPaused = self->_isPaused;
      v14 = isPaused == -[HDSummarySharingEntry isPaused](v8, "isPaused");
      if (CNContactIdentifier != v16)
      {
LABEL_15:
        v12 = v24;

        if (codableEntry == v10)
          goto LABEL_22;
        goto LABEL_21;
      }

LABEL_20:
      v12 = v24;
      if (codableEntry != v10)
        goto LABEL_21;
LABEL_22:

      goto LABEL_23;
    }
    v14 = 0;
  }
LABEL_23:

  return v14;
}

- (id)sharingEntry
{
  void *v3;

  -[HDCodableSummarySharingEntry sharingEntry](self->_codableEntry, "sharingEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setCNContactIdentifier:", self->_CNContactIdentifier);
  objc_msgSend(v3, "_setIsPaused:", self->_isPaused);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HDCodableSummarySharingEntry *codableEntry;
  id v5;

  codableEntry = self->_codableEntry;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codableEntry, CFSTR("CodableEntry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_CNContactIdentifier, CFSTR("CNContactIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPaused, CFSTR("IsPaused"));

}

- (HDSummarySharingEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HDSummarySharingEntry *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CodableEntry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CNContactIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsPaused"));

  v8 = -[HDSummarySharingEntry initWithCodableEntry:CNContactIdentifier:isPaused:](self, "initWithCodableEntry:CNContactIdentifier:isPaused:", v5, v6, v7);
  return v8;
}

- (HDCodableSummarySharingEntry)codableEntry
{
  return self->_codableEntry;
}

- (NSString)CNContactIdentifier
{
  return self->_CNContactIdentifier;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CNContactIdentifier, 0);
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
