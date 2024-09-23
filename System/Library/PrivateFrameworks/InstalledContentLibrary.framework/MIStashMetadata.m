@implementation MIStashMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIStashMetadata)initWithCoder:(id)a3
{
  id v4;
  MIStashMetadata *v5;
  uint64_t v6;
  NSDate *dateStashed;
  uint64_t v8;
  NSDate *dateOriginallyInstalled;

  v4 = a3;
  v5 = -[MIStashMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateStashed"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateStashed = v5->_dateStashed;
    v5->_dateStashed = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateOriginallyInstalled"));
    v8 = objc_claimAutoreleasedReturnValue();
    dateOriginallyInstalled = v5->_dateOriginallyInstalled;
    v5->_dateOriginallyInstalled = (NSDate *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MIStashMetadata dateStashed](self, "dateStashed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDateStashed:", v6);

  -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDateOriginallyInstalled:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MIStashMetadata dateStashed](self, "dateStashed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dateStashed"));

  -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dateOriginallyInstalled"));

}

- (BOOL)isEqual:(id)a3
{
  MIStashMetadata *v4;
  MIStashMetadata *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = (MIStashMetadata *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIStashMetadata dateStashed](self, "dateStashed");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStashMetadata dateStashed](v5, "dateStashed");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIStashMetadata dateOriginallyInstalled](v5, "dateOriginallyInstalled");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MICompareObjects(v9, v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MIStashMetadata dateStashed](self, "dateStashed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIStashMetadata dateStashed](self, "dateStashed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIStashMetadata dateOriginallyInstalled](self, "dateOriginallyInstalled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> dateStashed=%@ dateOriginallyInstalled=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)metadataFromURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v25;
  id v26;

  v5 = a3;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 3, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v17 = objc_msgSend(v8, "code");

      if (v17 == 260)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v5, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIStashMetadata metadataFromURL:error:]", 108, CFSTR("MIInstallerErrorDomain"), 130, v8, 0, CFSTR("Failed to read stash metadata from %@"), v21, (uint64_t)v20);
    v22 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
    v11 = 0;
    v8 = (void *)v22;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v25 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v25);
  v10 = v25;

  if (!v9)
  {
    objc_msgSend(v5, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIStashMetadata metadataFromURL:error:]", 115, CFSTR("MIInstallerErrorDomain"), 130, v10, 0, CFSTR("Failed to read stash metadata from %@"), v19, (uint64_t)v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v9 = 0;
    v11 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v9, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIStashMetadata metadataFromURL:error:]", 121, CFSTR("MIInstallerErrorDomain"), 130, v12, 0, CFSTR("Failed to decode stash metadata from %@"), v14, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v15;
  }
  objc_msgSend(v9, "finishDecoding");
  v8 = v10;
  if (a4)
  {
LABEL_15:
    if (!v11)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_17:
  v23 = v11;

  return v23;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v7, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v15 = 0;
    v9 = objc_msgSend(v8, "writeToURL:options:error:", v6, 268435457, &v15);
    v10 = v15;
    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIStashMetadata serializeToURL:error:]", 159, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Failed to write serialized MIStashedBundleMetadata to %@"), v12, (uint64_t)v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }
    if (a4 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10 == 0;
}

- (NSDate)dateStashed
{
  return self->_dateStashed;
}

- (void)setDateStashed:(id)a3
{
  objc_storeStrong((id *)&self->_dateStashed, a3);
}

- (NSDate)dateOriginallyInstalled
{
  return self->_dateOriginallyInstalled;
}

- (void)setDateOriginallyInstalled:(id)a3
{
  objc_storeStrong((id *)&self->_dateOriginallyInstalled, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOriginallyInstalled, 0);
  objc_storeStrong((id *)&self->_dateStashed, 0);
}

@end
