@implementation TKTokenID

- (TKTokenID)initWithTokenID:(id)a3
{
  id v4;
  TKTokenID *v5;
  NSString *v6;
  TKTokenID *v7;
  NSString *stringRepresentation;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)TKTokenID;
    v5 = -[TKTokenID init](&v10, sel_init);
    if (v5)
    {
      if ((objc_msgSend(v4, "hasSuffix:", CFSTR(":")) & 1) != 0)
      {
        objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = (NSString *)v4;
      }
      stringRepresentation = v5->_stringRepresentation;
      v5->_stringRepresentation = v6;

    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)classID
{
  void *v2;
  void *v3;
  void *v4;

  -[TKTokenID stringRepresentation](self, "stringRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)stringRepresentation
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenID)initWithClassID:(id)a3 instanceID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  TKTokenID *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
  v10 = -[TKTokenID initWithTokenID:](self, "initWithTokenID:", v8);

  return v10;
}

- (TKTokenID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  TKTokenID *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[TKTokenID initWithTokenID:](self, "initWithTokenID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TKTokenID stringRepresentation](self, "stringRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tokenID"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TKTokenID stringRepresentation](self, "stringRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TKTokenID stringRepresentation](self, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)instanceID
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[TKTokenID stringRepresentation](self, "stringRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = &stru_1E708AD68;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<tkid:%@>"), self->_stringRepresentation);
}

+ (id)encodedKeyID:(id)a3
{
  id v3;
  TKBERTLVRecord *v4;
  void *v5;

  v3 = a3;
  v4 = -[TKBERTLVRecord initWithPropertyList:]([TKBERTLVRecord alloc], "initWithPropertyList:", v3);
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("failed to serialize objectID '%@'"), v3);
  -[TKTLVRecord data](v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)encodedCertificateID:(id)a3
{
  void *v3;
  TKBERTLVRecord *v4;
  void *v5;

  objc_msgSend(a1, "encodedKeyID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TKBERTLVRecord initWithTag:value:]([TKBERTLVRecord alloc], "initWithTag:value:", 0x5FC8C6BFE112, v3);
  -[TKTLVRecord data](v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)decodedObjectID:(id)a3 isCertificate:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[TKTLVRecord recordFromData:](TKBERTLVRecord, "recordFromData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "tag") != 0x5FC8C6BFE112)
  {
    objc_msgSend(v9, "propertyList");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v11 = (void *)v13;
      v12 = 0;
    }
    else
    {
      -[TKTokenID stringRepresentation](self, "stringRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CD6BB0]);

      if (v15)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
        objc_msgSend(v16, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
      v12 = 0;
      if (a5 && !v11)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB2D50];
        v22[0] = CFSTR("corrupted objectID detected");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -3, v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v12 = 0;
        v11 = 0;
      }
    }
    goto LABEL_12;
  }
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenID decodedObjectID:isCertificate:error:](self, "decodedObjectID:isCertificate:error:", v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 1;
LABEL_12:
    *a4 = v12;
  }
  v19 = v11;

  return v19;
}

- (id)decodedKeyID:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  -[TKTokenID decodedObjectID:isCertificate:error:](self, "decodedObjectID:isCertificate:error:", a3, &v9, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v9)
  {

    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2938];
      v11[0] = CFSTR("Expecting key, but provided certificate objectID");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -6, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v5 = 0;
  }
  return v5;
}

- (id)decodedCertificateID:(id)a3 error:(id *)a4
{
  char v5;

  v5 = 0;
  -[TKTokenID decodedObjectID:isCertificate:error:](self, "decodedObjectID:isCertificate:error:", a3, &v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

@end
