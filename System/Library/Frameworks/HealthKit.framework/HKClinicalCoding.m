@implementation HKClinicalCoding

- (HKClinicalCoding)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalCoding)initWithSystem:(id)a3 version:(id)a4 code:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKClinicalCoding *v11;
  uint64_t v12;
  NSString *system;
  uint64_t v14;
  NSString *version;
  uint64_t v16;
  NSString *code;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKClinicalCoding;
  v11 = -[HKClinicalCoding init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    system = v11->_system;
    v11->_system = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    version = v11->_version;
    v11->_version = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    code = v11->_code;
    v11->_code = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalCoding *v4;
  HKClinicalCoding *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;

  v4 = (HKClinicalCoding *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKClinicalCoding system](v5, "system");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalCoding system](self, "system");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKClinicalCoding system](self, "system");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_19;
        v10 = (void *)v9;
        -[HKClinicalCoding system](v5, "system");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalCoding system](self, "system");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (!v13)
          goto LABEL_20;
      }
      -[HKClinicalCoding version](v5, "version");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalCoding version](self, "version");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKClinicalCoding version](self, "version");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_19;
        v17 = (void *)v16;
        -[HKClinicalCoding version](v5, "version");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalCoding version](self, "version");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (!v20)
          goto LABEL_20;
      }
      -[HKClinicalCoding code](v5, "code");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalCoding code](self, "code");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

LABEL_24:
        v14 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      -[HKClinicalCoding code](self, "code");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        -[HKClinicalCoding code](v5, "code");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalCoding code](self, "code");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqualToString:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_system, "hash");
  v4 = -[NSString hash](self->_version, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_code, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalCoding)initWithCoder:(id)a3
{
  id v4;
  HKClinicalCoding *v5;
  uint64_t v6;
  NSString *system;
  uint64_t v8;
  NSString *version;
  uint64_t v10;
  NSString *code;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKClinicalCoding;
  v5 = -[HKClinicalCoding init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SystemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    system = v5->_system;
    v5->_system = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
    v8 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Code"));
    v10 = objc_claimAutoreleasedReturnValue();
    code = v5->_code;
    v5->_code = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *system;
  id v5;

  system = self->_system;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", system, CFSTR("SystemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_code, CFSTR("Code"));

}

- (NSString)system
{
  return self->_system;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)code
{
  return self->_code;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

@end
