@implementation CNUILikenessFingerprint

uint64_t __62__CNUILikenessFingerprint_publicFingerprintForContacts_scope___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "publicFingerprintForContact:", a2);
}

- (unint64_t)hash
{
  return -[_CNUILikenessFingerprintImpl hash](self->_impl, "hash");
}

uint64_t __49__CNUILikenessFingerprint_fingerprintForContact___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

+ (id)publicFingerprintForContacts:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__CNUILikenessFingerprint_publicFingerprintForContacts_scope___block_invoke;
  v18[3] = &__block_descriptor_40_e29___NSString_16__0__CNContact_8l;
  v18[4] = a1;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_cn_map:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v7, "count");

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fingerprintForScope:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "arrayByAddingObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", &stru_1EA606688);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __49__CNUILikenessFingerprint_fingerprintForContact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fingerprintForScope:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = objc_msgSend(v4, "style");
  v6 = objc_msgSend(v4, "backgroundStyle");
  objc_msgSend(v4, "scale");
  v8 = v7;
  v9 = objc_msgSend(v4, "rightToLeft");
  objc_msgSend(v4, "maskedAvatarIndices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "_cn_map:", &__block_literal_global_194);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1EA606688;
  }
  v13 = CFSTR("RTL");
  if (!v9)
    v13 = &stru_1EA606688;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld_%ld_@%.1f%@_[%@]"), v5, v6, v8, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)fingerprintForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  v4 = a3;
  if (objc_msgSend(v4, "hasBeenPersisted"))
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fingerprintForContactIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v4, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v9);

    objc_msgSend(v6, "appendString:", CFSTR(";"));
  }
  objc_msgSend(v4, "middleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(v4, "middleName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v12);

    objc_msgSend(v6, "appendString:", CFSTR(";"));
  }
  objc_msgSend(v4, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend(v4, "familyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v15);

    objc_msgSend(v6, "appendString:", CFSTR(";"));
  }
  objc_msgSend(v4, "emailAddresses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(v4, "emailAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_cn_map:", &__block_literal_global_4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(";"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v20);

    objc_msgSend(v6, "appendString:", CFSTR(";"));
  }
  objc_msgSend(v4, "phoneNumbers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    objc_msgSend(v4, "phoneNumbers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_cn_map:", &__block_literal_global_2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(";"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v25);

    objc_msgSend(v6, "appendString:", CFSTR(";"));
  }
  objc_msgSend(v4, "imageData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    objc_msgSend(v6, "appendString:", CFSTR("image:"));
    objc_msgSend(v4, "imageData");
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v5 = (void *)v28;
    objc_msgSend(a1, "fingerprintForData:", v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v31);

    goto LABEL_18;
  }
  objc_msgSend(v4, "thumbnailImageData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    objc_msgSend(v6, "appendString:", CFSTR("thumbnail:"));
    objc_msgSend(v4, "thumbnailImageData");
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_19:

  return v6;
}

+ (id)publicFingerprintForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;

  v4 = a3;
  if (!objc_msgSend(v4, "hasBeenPersisted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v6, "appendString:", CFSTR("image:"));
      objc_msgSend(v4, "imageData");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "thumbnailImageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
      {
        objc_msgSend(v6, "appendString:", CFSTR("object:"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v15);

        objc_msgSend(v6, "appendString:", CFSTR("identifier:"));
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v5);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(v6, "appendString:", CFSTR("thumbnail:"));
      objc_msgSend(v4, "thumbnailImageData");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v9;
    objc_msgSend(a1, "fingerprintForData:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v12;
    objc_msgSend(v6, "appendString:", v12);

    goto LABEL_9;
  }
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fingerprintForContactIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

+ (id)fingerprintForContactIdentifier:(id)a3
{
  return a3;
}

- (CNUILikenessFingerprint)initWithContacts:(id)a3 badges:(id)a4 scope:(id)a5
{
  return -[CNUILikenessFingerprint initWithContacts:badges:scope:isResolutionIndependent:](self, "initWithContacts:badges:scope:isResolutionIndependent:", a3, a4, a5, 1);
}

- (CNUILikenessFingerprint)initWithImpl:(id)a3
{
  id v5;
  CNUILikenessFingerprint *v6;
  CNUILikenessFingerprint *v7;
  CNUILikenessFingerprint *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUILikenessFingerprint;
  v6 = -[CNUILikenessFingerprint init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = -[_CNUILikenessFingerprintImpl isEqual:](self->_impl, "isEqual:", v7[1]);
  else
    v8 = 0;

  return v8;
}

+ (id)implForContact:(id)a3
{
  id v3;
  _CNUILikenessFingerprintPersistedContactImpl *v4;
  uint64_t v5;
  _CNUILikenessFingerprintNonpersistedContactImpl *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasBeenPersisted"))
  {
    v4 = [_CNUILikenessFingerprintPersistedContactImpl alloc];
    objc_msgSend(v3, "identifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = -[_CNUILikenessFingerprintPersistedContactImpl initWithContactIdentifier:](v4, "initWithContactIdentifier:", v5);
    v3 = (id)v5;
  }
  else
  {
    v6 = -[_CNUILikenessFingerprintNonpersistedContactImpl initWithContact:]([_CNUILikenessFingerprintNonpersistedContactImpl alloc], "initWithContact:", v3);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (id)fingerprintForData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
}

+ (id)fingerprintForContacts:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__CNUILikenessFingerprint_fingerprintForContacts_scope___block_invoke;
  v18[3] = &__block_descriptor_40_e29___NSString_16__0__CNContact_8l;
  v18[4] = a1;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_cn_map:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v7, "count");

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fingerprintForScope:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "arrayByAddingObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", &stru_1EA606688);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __56__CNUILikenessFingerprint_fingerprintForContacts_scope___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fingerprintForContact:", a2);
}

- (CNUILikenessFingerprint)initWithContact:(id)a3
{
  id v4;
  void *v5;
  CNUILikenessFingerprint *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "implForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNUILikenessFingerprint initWithImpl:](self, "initWithImpl:", v5);
  return v6;
}

- (CNUILikenessFingerprint)initWithContacts:(id)a3 badges:(id)a4 scope:(id)a5 isResolutionIndependent:(BOOL)a6
{
  _BOOL8 v6;
  CNUILikenessFingerprint *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _CNUILikenessFingerprintGroupImpl *v15;
  CNUILikenessFingerprint *v16;
  _QWORD v18[4];
  CNUILikenessFingerprint *v19;

  v6 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__CNUILikenessFingerprint_initWithContacts_badges_scope_isResolutionIndependent___block_invoke;
  v18[3] = &unk_1EA6033B0;
  v10 = self;
  v19 = v10;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "_cn_map:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v14, "setExcludePointSizeInEqualityCheck:", v6);
  v15 = -[_CNUILikenessFingerprintGroupImpl initWithImpls:scope:badges:]([_CNUILikenessFingerprintGroupImpl alloc], "initWithImpls:scope:badges:", v13, v14, v12);

  v16 = -[CNUILikenessFingerprint initWithImpl:](v10, "initWithImpl:", v15);
  return v16;
}

id __81__CNUILikenessFingerprint_initWithContacts_badges_scope_isResolutionIndependent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "implForContact:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasContactIdentifier:(id)a3
{
  return -[_CNUILikenessFingerprintImpl hasContactIdentifier:](self->_impl, "hasContactIdentifier:", a3);
}

- (id)description
{
  return (id)-[_CNUILikenessFingerprintImpl description](self->_impl, "description");
}

@end
