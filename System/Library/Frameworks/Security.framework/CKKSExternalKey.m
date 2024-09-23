@implementation CKKSExternalKey

- (CKKSExternalKey)initWithView:(id)a3 uuid:(id)a4 parentTLKUUID:(id)a5 keyData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKKSExternalKey *v15;
  CKKSExternalKey *v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKKSExternalKey;
  v15 = -[CKKSExternalKey init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_view, a3);
    objc_storeStrong((id *)&v16->_uuid, a4);
    if (v13)
      v17 = v13;
    else
      v17 = v12;
    objc_storeStrong((id *)&v16->_parentKeyUUID, v17);
    objc_storeStrong((id *)&v16->_keyData, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKKSExternalKey uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CKKSExternalKey: %@ (%@)>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKKSExternalKey)initWithCoder:(id)a3
{
  id v4;
  CKKSExternalKey *v5;
  uint64_t v6;
  NSString *view;
  uint64_t v8;
  NSString *uuid;
  uint64_t v10;
  NSString *parentKeyUUID;
  uint64_t v12;
  NSData *keyData;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKKSExternalKey;
  v5 = -[CKKSExternalKey init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("view"));
    v6 = objc_claimAutoreleasedReturnValue();
    view = v5->_view;
    v5->_view = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentKeyUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    parentKeyUUID = v5->_parentKeyUUID;
    v5->_parentKeyUUID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyData"));
    v12 = objc_claimAutoreleasedReturnValue();
    keyData = v5->_keyData;
    v5->_keyData = (NSData *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKKSExternalKey view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("view"));

  -[CKKSExternalKey uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uuid"));

  -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parentKeyUUID"));

  -[CKKSExternalKey keyData](self, "keyData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keyData"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  int v18;

  v5 = a3;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    -[CKKSExternalKey view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7))
    {
      v12 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[CKKSExternalKey uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9))
    {
      v12 = 0;
LABEL_19:

      goto LABEL_20;
    }
    -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "parentKeyUUID"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentKeyUUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", v3))
      {
        v12 = 0;
        goto LABEL_15;
      }
      v16 = v11;
      v18 = 1;
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    -[CKKSExternalKey keyData](self, "keyData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "isEqualToData:", v14);

    if (!v18)
    {
LABEL_16:
      if (!v10)

      goto LABEL_19;
    }
    v11 = v16;
LABEL_15:

    goto LABEL_16;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("view");
  -[CKKSExternalKey view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("uuid");
  -[CKKSExternalKey uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("parentKeyUUID");
  -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("keyData");
  -[CKKSExternalKey keyData](self, "keyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)keyData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_parentKeyUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parseFromJSONDict:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CKKSExternalKey *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parentKeyUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keyData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
    v11 = (void *)v10;
    if (v6 && v7 && v8 && v10)
    {
      v12 = -[CKKSExternalKey initWithView:uuid:parentTLKUUID:keyData:]([CKKSExternalKey alloc], "initWithView:uuid:parentTLKUUID:keyData:", v6, v7, v8, v10);
      goto LABEL_16;
    }
    if (!a4)
    {
LABEL_15:
      v12 = 0;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v6)
    {
      if (v7)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(v15, "addObject:", CFSTR("view"));
      if (v7)
      {
LABEL_12:
        if (v8)
          goto LABEL_13;
        goto LABEL_21;
      }
    }
    objc_msgSend(v16, "addObject:", CFSTR("uuid"));
    if (v8)
    {
LABEL_13:
      if (v11)
      {
LABEL_14:
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB2F90];
        v21[0] = *MEMORY[0x1E0CB2D50];
        v21[1] = CFSTR("missingkeys");
        v22[0] = CFSTR("Missing some required field");
        v22[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, -50, v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
LABEL_22:
      objc_msgSend(v16, "addObject:", CFSTR("keyData"));
      goto LABEL_14;
    }
LABEL_21:
    objc_msgSend(v16, "addObject:", CFSTR("parentKeyUUID"));
    if (v11)
      goto LABEL_14;
    goto LABEL_22;
  }
  if (!a4)
  {
    v12 = 0;
    goto LABEL_17;
  }
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2F90];
  v23 = *MEMORY[0x1E0CB2D50];
  v24[0] = CFSTR("No wrapped key to parse");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -50, v11);
  v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:
  return v12;
}

@end
