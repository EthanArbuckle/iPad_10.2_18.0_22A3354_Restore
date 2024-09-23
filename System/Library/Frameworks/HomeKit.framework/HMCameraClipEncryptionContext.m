@implementation HMCameraClipEncryptionContext

- (HMCameraClipEncryptionContext)initWithKey:(id)a3 scheme:(unint64_t)a4
{
  id v6;
  void *v7;
  HMCameraClipEncryptionContext *v8;
  uint64_t v9;
  NSData *key;
  HMCameraClipEncryptionContext *v12;
  SEL v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    v12 = (HMCameraClipEncryptionContext *)_HMFPreconditionFailure();
    return (HMCameraClipEncryptionContext *)-[HMCameraClipEncryptionContext description](v12, v13);
  }
  v7 = v6;
  v14.receiver = self;
  v14.super_class = (Class)HMCameraClipEncryptionContext;
  v8 = -[HMCameraClipEncryptionContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    key = v8->_key;
    v8->_key = (NSData *)v9;

    v8->_scheme = a4;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipEncryptionContext key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" key length: %lu"), objc_msgSend(v4, "length"));

  HMStringFromCameraClipEncryptionScheme(-[HMCameraClipEncryptionContext scheme](self, "scheme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" scheme: %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

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
    objc_msgSend(v6, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipEncryptionContext key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToData:", v9))
    {
      v10 = objc_msgSend(v7, "scheme");
      v11 = v10 == -[HMCameraClipEncryptionContext scheme](self, "scheme");
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

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCameraClipEncryptionContext key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMCameraClipEncryptionContext key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("k"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[HMCameraClipEncryptionContext scheme](self, "scheme"), CFSTR("s"));
}

- (HMCameraClipEncryptionContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  HMCameraClipEncryptionContext *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("k"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("s"));

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[HMCameraClipEncryptionContext initWithKey:scheme:](self, "initWithKey:scheme:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)scheme
{
  return self->_scheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
