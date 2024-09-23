@implementation HKClinicalCodingCollection

- (HKClinicalCodingCollection)init
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

- (HKClinicalCodingCollection)initWithText:(id)a3 codings:(id)a4
{
  id v6;
  id v7;
  HKClinicalCodingCollection *v8;
  uint64_t v9;
  NSSet *codings;
  uint64_t v11;
  NSString *text;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalCodingCollection;
  v8 = -[HKClinicalCodingCollection init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    codings = v8->_codings;
    v8->_codings = (NSSet *)v9;

    v11 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalCodingCollection *v4;
  HKClinicalCodingCollection *v5;
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
  char v20;

  v4 = (HKClinicalCodingCollection *)a3;
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
      -[HKClinicalCodingCollection codings](v5, "codings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalCodingCollection codings](self, "codings");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKClinicalCodingCollection codings](self, "codings");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        -[HKClinicalCodingCollection codings](v5, "codings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalCodingCollection codings](self, "codings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToSet:", v12);

        if (!v13)
          goto LABEL_15;
      }
      -[HKClinicalCodingCollection text](v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalCodingCollection text](self, "text");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_17:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKClinicalCodingCollection text](self, "text");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HKClinicalCodingCollection text](v5, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalCodingCollection text](self, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](self->_codings, "hash");
  return -[NSString hash](self->_text, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalCodingCollection)initWithCoder:(id)a3
{
  id v4;
  HKClinicalCodingCollection *v5;
  void *v6;
  uint64_t v7;
  NSSet *codings;
  uint64_t v9;
  NSString *text;
  HKClinicalCodingCollection *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKClinicalCodingCollection;
  v5 = -[HKClinicalCodingCollection init](&v15, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("CodingsKey")) & 1) == 0)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
      objc_msgSend(v4, "failWithError:", v13);

      v11 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("CodingsKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    codings = v5->_codings;
    v5->_codings = (NSSet *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TextKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v9;

  }
  v11 = v5;
LABEL_6:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *codings;
  id v5;

  codings = self->_codings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codings, CFSTR("CodingsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("TextKey"));

}

- (NSString)text
{
  return self->_text;
}

- (NSSet)codings
{
  return self->_codings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codings, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
