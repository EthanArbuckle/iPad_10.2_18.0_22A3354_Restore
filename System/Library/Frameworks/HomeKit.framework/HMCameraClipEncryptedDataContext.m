@implementation HMCameraClipEncryptedDataContext

- (HMCameraClipEncryptedDataContext)initWithDataRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMCameraClipEncryptedDataContext *v9;
  HMCameraClipEncryptedDataContext *v11;
  SEL v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "subdataWithRange:", 0, 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subdataWithRange:", objc_msgSend(v5, "length") - 16, 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subdataWithRange:", 16, objc_msgSend(v5, "length") - 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMCameraClipEncryptedDataContext initWithInitializationVector:ciphertext:tag:](self, "initWithInitializationVector:ciphertext:tag:", v6, v8, v7);

    return v9;
  }
  else
  {
    v11 = (HMCameraClipEncryptedDataContext *)_HMFPreconditionFailure();
    return -[HMCameraClipEncryptedDataContext initWithInitializationVector:ciphertext:tag:](v11, v12, v13, v14, v15);
  }
}

- (HMCameraClipEncryptedDataContext)initWithInitializationVector:(id)a3 ciphertext:(id)a4 tag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMCameraClipEncryptedDataContext *v12;
  uint64_t v13;
  NSData *initializationVector;
  uint64_t v15;
  NSData *ciphertext;
  uint64_t v17;
  NSData *tag;
  HMCameraClipEncryptedDataContext *v20;
  SEL v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  v11 = v10;
  if (objc_msgSend(v8, "length") != 16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v11)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "length") != 16)
  {
LABEL_13:
    v20 = (HMCameraClipEncryptedDataContext *)_HMFPreconditionFailure();
    return (HMCameraClipEncryptedDataContext *)-[HMCameraClipEncryptedDataContext description](v20, v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)HMCameraClipEncryptedDataContext;
  v12 = -[HMCameraClipEncryptedDataContext init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    initializationVector = v12->_initializationVector;
    v12->_initializationVector = (NSData *)v13;

    v15 = objc_msgSend(v9, "copy");
    ciphertext = v12->_ciphertext;
    v12->_ciphertext = (NSData *)v15;

    v17 = objc_msgSend(v11, "copy");
    tag = v12->_tag;
    v12->_tag = (NSData *)v17;

  }
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipEncryptedDataContext initializationVector](self, "initializationVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" IV length: %lu"), objc_msgSend(v4, "length"));

  -[HMCameraClipEncryptedDataContext ciphertext](self, "ciphertext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Ciphertext length: %lu"), objc_msgSend(v5, "length"));

  -[HMCameraClipEncryptedDataContext tag](self, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Tag length: %lu"), objc_msgSend(v6, "length"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (NSData)dataRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[HMCameraClipEncryptedDataContext initializationVector](self, "initializationVector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[HMCameraClipEncryptedDataContext ciphertext](self, "ciphertext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") + v4;
  -[HMCameraClipEncryptedDataContext tag](self, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "length");

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipEncryptedDataContext initializationVector](self, "initializationVector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendData:", v10);

  -[HMCameraClipEncryptedDataContext ciphertext](self, "ciphertext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendData:", v11);

  -[HMCameraClipEncryptedDataContext tag](self, "tag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendData:", v12);

  v13 = (void *)objc_msgSend(v9, "copy");
  return (NSData *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "initializationVector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipEncryptedDataContext initializationVector](self, "initializationVector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToData:", v9))
    {
      objc_msgSend(v7, "ciphertext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCameraClipEncryptedDataContext ciphertext](self, "ciphertext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToData:", v11))
      {
        objc_msgSend(v7, "tag");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMCameraClipEncryptedDataContext tag](self, "tag");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToData:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMCameraClipEncryptedDataContext initializationVector](self, "initializationVector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMCameraClipEncryptedDataContext ciphertext](self, "ciphertext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMCameraClipEncryptedDataContext tag](self, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSData)initializationVector
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)ciphertext
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)tag
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_ciphertext, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
}

@end
