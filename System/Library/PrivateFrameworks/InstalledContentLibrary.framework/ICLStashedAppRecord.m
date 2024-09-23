@implementation ICLStashedAppRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLStashedAppRecord)initWithCoder:(id)a3
{
  id v4;
  ICLStashedAppRecord *v5;
  uint64_t v6;
  NSDate *stashedAtTimestamp;
  uint64_t v8;
  NSDate *stashOriginalInstallTimestamp;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICLStashedAppRecord;
  v5 = -[ICLAppRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stashedAtTimestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    stashedAtTimestamp = v5->_stashedAtTimestamp;
    v5->_stashedAtTimestamp = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stashOriginalInstallTimestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    stashOriginalInstallTimestamp = v5->_stashOriginalInstallTimestamp;
    v5->_stashOriginalInstallTimestamp = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICLStashedAppRecord;
  v4 = a3;
  -[ICLAppRecord encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stashedAtTimestamp"));

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("stashOriginalInstallTimestamp"));

}

- (ICLStashedAppRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4;
  ICLStashedAppRecord *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICLStashedAppRecord;
  v5 = -[ICLAppRecord initWithLegacyRecordDictionary:](&v13, sel_initWithLegacyRecordDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StashedAtTimestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    -[ICLStashedAppRecord setStashedAtTimestamp:](v5, "setStashedAtTimestamp:", v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StashOriginalInstallTimestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    -[ICLStashedAppRecord setStashOriginalInstallTimestamp:](v5, "setStashOriginalInstallTimestamp:", v11);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICLStashedAppRecord;
  v5 = -[ICLAppRecord copyWithZone:](&v11, sel_copyWithZone_);
  -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setStashedAtTimestamp:", v7);

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setStashOriginalInstallTimestamp:", v9);

  return v5;
}

- (id)legacyRecordDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)ICLStashedAppRecord;
  -[ICLAppRecord legacyRecordDictionary](&v9, sel_legacyRecordDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("StashedAtTimestamp"));

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("StashOriginalInstallTimestamp"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ICLStashedAppRecord *v4;
  ICLStashedAppRecord *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  objc_super v14;

  v4 = (ICLStashedAppRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)ICLStashedAppRecord;
      if (-[ICLAppRecord isEqual:](&v14, sel_isEqual_, v4))
      {
        v5 = v4;
        -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLStashedAppRecord stashedAtTimestamp](v5, "stashedAtTimestamp");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLStashedAppRecord stashOriginalInstallTimestamp](v5, "stashOriginalInstallTimestamp");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = MICompareObjects(v9, v10);

          if (v11)
          {
            v12 = 1;
LABEL_16:

            goto LABEL_17;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_15:
            v12 = 0;
            goto LABEL_16;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_15;
        }
        MOLogWrite();
        goto LABEL_15;
      }
    }
    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  -[ICLStashedAppRecord stashedAtTimestamp](self, "stashedAtTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ICLStashedAppRecord stashOriginalInstallTimestamp](self, "stashOriginalInstallTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  v8.receiver = self;
  v8.super_class = (Class)ICLStashedAppRecord;
  return v6 ^ -[ICLAppRecord hash](&v8, sel_hash);
}

- (NSDate)stashedAtTimestamp
{
  return self->_stashedAtTimestamp;
}

- (void)setStashedAtTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSDate)stashOriginalInstallTimestamp
{
  return self->_stashOriginalInstallTimestamp;
}

- (void)setStashOriginalInstallTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashOriginalInstallTimestamp, 0);
  objc_storeStrong((id *)&self->_stashedAtTimestamp, 0);
}

@end
