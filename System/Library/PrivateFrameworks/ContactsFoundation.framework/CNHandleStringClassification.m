@implementation CNHandleStringClassification

- (CNHandleStringClassification)initWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNHandleStringClassification *v8;

  v4 = a3;
  objc_msgSend(v4, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unknown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNHandleStringClassification initWithEmailAddresses:phoneNumbers:unknown:](self, "initWithEmailAddresses:phoneNumbers:unknown:", v5, v6, v7);
  return v8;
}

- (CNHandleStringClassification)initWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 unknown:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNHandleStringClassification *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CNHandleStringClassification *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CNHandleStringClassification;
  v11 = -[CNHandleStringClassification init](&v24, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    if (v12)
      v15 = (void *)v12;
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v11->_emailAddresses, v15);

    v16 = objc_msgSend(v9, "copy");
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v14;
    objc_storeStrong((id *)&v11->_phoneNumbers, v18);

    v19 = objc_msgSend(v10, "copy");
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v14;
    objc_storeStrong((id *)&v11->_unknown, v21);

    v22 = v11;
  }

  return v11;
}

- (NSArray)unknown
{
  return self->_unknown;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknown, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("emailAddresses"), self->_emailAddresses);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("phoneNumbers"), self->_phoneNumbers);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("unknown"), self->_unknown);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CNHandleStringClassification *v4;
  NSArray *emailAddresses;
  NSArray *phoneNumbers;
  NSArray *unknown;
  BOOL v8;

  v4 = (CNHandleStringClassification *)a3;
  v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (emailAddresses = self->_emailAddresses,
          (unint64_t)emailAddresses | (unint64_t)v4->_emailAddresses)
      && !-[NSArray isEqual:](emailAddresses, "isEqual:")
      || (phoneNumbers = self->_phoneNumbers, (unint64_t)phoneNumbers | (unint64_t)v4->_phoneNumbers)
      && !-[NSArray isEqual:](phoneNumbers, "isEqual:")
      || (unknown = self->_unknown, (unint64_t)unknown | (unint64_t)v4->_unknown)
      && !-[NSArray isEqual:](unknown, "isEqual:"))
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = +[CNHashBuilder arrayHash:](CNHashBuilder, "arrayHash:", self->_emailAddresses);
  v4 = +[CNHashBuilder arrayHash:](CNHashBuilder, "arrayHash:", self->_phoneNumbers) - v3 + 32 * v3;
  return +[CNHashBuilder arrayHash:](CNHashBuilder, "arrayHash:", self->_unknown) - v4 + 32 * v4 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNHandleStringClassification)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNHandleStringClassification *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_emailAddresses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_phoneNumbers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_unknown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CNHandleStringClassification initWithEmailAddresses:phoneNumbers:unknown:](self, "initWithEmailAddresses:phoneNumbers:unknown:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *emailAddresses;
  id v5;

  emailAddresses = self->_emailAddresses;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", emailAddresses, CFSTR("_emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("_phoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unknown, CFSTR("_unknown"));

}

@end
