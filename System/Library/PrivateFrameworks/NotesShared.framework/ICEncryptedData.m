@implementation ICEncryptedData

- (ICEncryptedData)initWithData:(id)a3 tag:(id)a4 initializationVector:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICEncryptedData *v11;
  uint64_t v12;
  NSData *data;
  uint64_t v14;
  NSData *tag;
  uint64_t v16;
  NSData *initializationVector;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICEncryptedData;
  v11 = -[ICEncryptedData init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    data = v11->_data;
    v11->_data = (NSData *)v12;

    v14 = objc_msgSend(v9, "copy");
    tag = v11->_tag;
    v11->_tag = (NSData *)v14;

    v16 = objc_msgSend(v10, "copy");
    initializationVector = v11->_initializationVector;
    v11->_initializationVector = (NSData *)v16;

  }
  return v11;
}

- (ICEncryptedData)initWithData:(id)a3 tag:(id)a4 initializationVector:(id)a5 fallbackTag:(id)a6 fallbackInitializationVector:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ICEncryptedData *v17;
  uint64_t v18;
  NSData *data;
  uint64_t v20;
  NSData *tag;
  uint64_t v22;
  NSData *initializationVector;
  uint64_t v24;
  NSData *fallbackTag;
  uint64_t v26;
  NSData *fallbackInitializationVector;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ICEncryptedData;
  v17 = -[ICEncryptedData init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    data = v17->_data;
    v17->_data = (NSData *)v18;

    v20 = objc_msgSend(v13, "copy");
    tag = v17->_tag;
    v17->_tag = (NSData *)v20;

    v22 = objc_msgSend(v14, "copy");
    initializationVector = v17->_initializationVector;
    v17->_initializationVector = (NSData *)v22;

    v24 = objc_msgSend(v15, "copy");
    fallbackTag = v17->_fallbackTag;
    v17->_fallbackTag = (NSData *)v24;

    v26 = objc_msgSend(v16, "copy");
    fallbackInitializationVector = v17->_fallbackInitializationVector;
    v17->_fallbackInitializationVector = (NSData *)v26;

  }
  return v17;
}

- (id)description
{
  void *v2;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[ICEncryptedData fallbackTag](self, "fallbackTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    -[ICEncryptedData fallbackInitializationVector](self, "fallbackInitializationVector");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v2 != 0;
  }
  objc_msgSend(v7, "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, hasFallback: %@>"), v6, self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICEncryptedData data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;
    if (v8 == v7)
      v11 = 0;
    else
      v11 = v7;
    v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
      {
        LOBYTE(v15) = 0;
LABEL_70:

LABEL_71:
        return v15;
      }
      LODWORD(v15) = objc_msgSend((id)v10, "isEqual:", v12);

      if (!(_DWORD)v15)
        goto LABEL_71;
    }
    objc_msgSend(v5, "tag");
    v10 = objc_claimAutoreleasedReturnValue();
    -[ICEncryptedData tag](self, "tag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v10)
      v16 = 0;
    else
      v16 = (void *)v10;
    v17 = v16;
    if (v8 == v13)
      v18 = 0;
    else
      v18 = v13;
    v19 = v18;
    if (v17 | v19)
    {
      v20 = (void *)v19;
      if (v17)
        v21 = v19 == 0;
      else
        v21 = 1;
      if (v21)
      {
        LOBYTE(v15) = 0;
LABEL_69:

        goto LABEL_70;
      }
      LODWORD(v15) = objc_msgSend((id)v17, "isEqual:", v19);

      if (!(_DWORD)v15)
        goto LABEL_70;
    }
    v48 = v7;
    objc_msgSend(v5, "initializationVector");
    v17 = objc_claimAutoreleasedReturnValue();
    -[ICEncryptedData initializationVector](self, "initializationVector");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v17)
      v22 = 0;
    else
      v22 = (void *)v17;
    v15 = v22;
    if (v8 == v20)
      v23 = 0;
    else
      v23 = v20;
    v24 = v23;
    if (v15 | v24)
    {
      v25 = (void *)v24;
      v26 = (void *)v15;
      LOBYTE(v15) = 0;
      if (!v26 || !v24)
      {
        v47 = v26;
LABEL_67:

LABEL_68:
        v7 = v48;
        goto LABEL_69;
      }
      v27 = v26;
      v46 = objc_msgSend(v26, "isEqual:", v24);

      if (!v46)
      {
        LOBYTE(v15) = 0;
        goto LABEL_68;
      }
    }
    v45 = v6;
    objc_msgSend(v5, "fallbackTag");
    v28 = objc_claimAutoreleasedReturnValue();
    -[ICEncryptedData fallbackTag](self, "fallbackTag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v28;
    if (v8 == (void *)v28)
      v29 = 0;
    else
      v29 = (void *)v28;
    v15 = v29;
    if (v8 == v25)
      v30 = 0;
    else
      v30 = v25;
    v31 = v30;
    if (v15 | v31)
    {
      v32 = (void *)v31;
      v33 = (void *)v15;
      LOBYTE(v15) = 0;
      if (!v33 || !v31)
      {
        v44 = v33;
LABEL_65:

LABEL_66:
        v6 = v45;
        goto LABEL_67;
      }
      v34 = v33;
      LODWORD(v43) = objc_msgSend(v33, "isEqual:", v31);

      if (!(_DWORD)v43)
      {
        LOBYTE(v15) = 0;
        goto LABEL_66;
      }
    }
    objc_msgSend(v5, "fallbackInitializationVector", v43);
    v35 = objc_claimAutoreleasedReturnValue();
    -[ICEncryptedData fallbackInitializationVector](self, "fallbackInitializationVector");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v35;
    if (v8 == (void *)v35)
      v36 = 0;
    else
      v36 = (void *)v35;
    v37 = v36;
    v14 = v8 == v32;
    v38 = (unint64_t)v37;
    if (v14)
      v39 = 0;
    else
      v39 = v32;
    v40 = v39;
    v41 = (void *)v40;
    if (v38 | v40)
    {
      LOBYTE(v15) = 0;
      if (v38 && v40)
        LOBYTE(v15) = objc_msgSend((id)v38, "isEqual:", v40, v44);
    }
    else
    {
      LOBYTE(v15) = 1;
    }

    goto LABEL_65;
  }
  LOBYTE(v15) = 1;
  return v15;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  result = self->_hash;
  if (!result)
  {
    -[ICEncryptedData data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    -[ICEncryptedData tag](self, "tag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");
    LOBYTE(v8) = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "hash");

    }
    -[ICEncryptedData initializationVector](self, "initializationVector");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "hash"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hash");

    }
    -[ICEncryptedData fallbackTag](self, "fallbackTag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "hash"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hash");

    }
    -[ICEncryptedData fallbackInitializationVector](self, "fallbackInitializationVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "hash"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = v5;
      v21 = v6;
      v22 = v4;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hash");

      v4 = v22;
      v6 = v21;
      v5 = v24;
    }
    self->_hash = ICHashWithHashKeys(v5, v14, v15, v16, v17, v18, v19, v20, v8);

    return self->_hash;
  }
  return result;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[ICEncryptedData data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "length");

  if (v4)
  {
    -[ICEncryptedData tag](self, "tag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    if (v6
      && (-[ICEncryptedData initializationVector](self, "initializationVector"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "length")))
    {
      v7 = 1;
    }
    else
    {
      -[ICEncryptedData fallbackTag](self, "fallbackTag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        -[ICEncryptedData fallbackInitializationVector](self, "fallbackInitializationVector");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "length") != 0;

      }
      else
      {
        v7 = 0;
      }

      if (!v6)
        goto LABEL_11;
    }

LABEL_11:
    return v7;
  }
  return 0;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)tag
{
  return self->_tag;
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (NSData)fallbackTag
{
  return self->_fallbackTag;
}

- (NSData)fallbackInitializationVector
{
  return self->_fallbackInitializationVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackInitializationVector, 0);
  objc_storeStrong((id *)&self->_fallbackTag, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
