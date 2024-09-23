@implementation LNActionDescriptionMetadata

- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5 resultValueName:(id)a6
{
  return -[LNActionDescriptionMetadata initWithDescriptionText:categoryName:searchKeywords:resultValueName:icon:](self, "initWithDescriptionText:categoryName:searchKeywords:resultValueName:icon:", a3, a4, a5, a6, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_resultValueName, 0);
  objc_storeStrong((id *)&self->_searchKeywords, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNActionDescriptionMetadata descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("descriptionText"));

  -[LNActionDescriptionMetadata categoryName](self, "categoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("categoryName"));

  -[LNActionDescriptionMetadata searchKeywords](self, "searchKeywords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("searchKeywords"));

  -[LNActionDescriptionMetadata resultValueName](self, "resultValueName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("resultValueName"));

}

- (LNDisplayRepresentation)categoryName
{
  return self->_categoryName;
}

- (LNStaticDeferredLocalizedString)descriptionText
{
  return self->_descriptionText;
}

- (NSArray)searchKeywords
{
  return self->_searchKeywords;
}

- (LNStaticDeferredLocalizedString)resultValueName
{
  return self->_resultValueName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNActionDescriptionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNActionDescriptionMetadata *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptionText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("searchKeywords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resultValueName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[LNActionDescriptionMetadata initWithDescriptionText:categoryName:searchKeywords:resultValueName:](self, "initWithDescriptionText:categoryName:searchKeywords:resultValueName:", v5, v6, v10, v11);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5 resultValueName:(id)a6 icon:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  LNActionDescriptionMetadata *v18;
  uint64_t v19;
  LNStaticDeferredLocalizedString *descriptionText;
  uint64_t v21;
  LNDisplayRepresentation *categoryName;
  uint64_t v23;
  NSArray *searchKeywords;
  uint64_t v25;
  LNStaticDeferredLocalizedString *resultValueName;
  uint64_t v27;
  LNActionDescriptionIcon *icon;
  LNActionDescriptionMetadata *v29;
  void *v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionDescriptionMetadata.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionDescription"));

  }
  v32.receiver = self;
  v32.super_class = (Class)LNActionDescriptionMetadata;
  v18 = -[LNActionDescriptionMetadata init](&v32, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    descriptionText = v18->_descriptionText;
    v18->_descriptionText = (LNStaticDeferredLocalizedString *)v19;

    v21 = objc_msgSend(v14, "copy");
    categoryName = v18->_categoryName;
    v18->_categoryName = (LNDisplayRepresentation *)v21;

    v23 = objc_msgSend(v15, "copy");
    searchKeywords = v18->_searchKeywords;
    v18->_searchKeywords = (NSArray *)v23;

    v25 = objc_msgSend(v16, "copy");
    resultValueName = v18->_resultValueName;
    v18->_resultValueName = (LNStaticDeferredLocalizedString *)v25;

    v27 = objc_msgSend(v17, "copy");
    icon = v18->_icon;
    v18->_icon = (LNActionDescriptionIcon *)v27;

    v29 = v18;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[LNActionDescriptionMetadata descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionMetadata categoryName](self, "categoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionMetadata searchKeywords](self, "searchKeywords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionMetadata resultValueName](self, "resultValueName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithDescriptionText:categoryName:searchKeywords:resultValueName:", v5, v6, v7, v8);

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionMetadata descriptionText](self, "descriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionMetadata categoryName](self, "categoryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionMetadata searchKeywords](self, "searchKeywords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionMetadata resultValueName](self, "resultValueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, description: %@, categoryName: %@, searchKeywords: [%@], resultValueName: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[LNActionDescriptionMetadata descriptionText](self, "descriptionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNActionDescriptionMetadata searchKeywords](self, "searchKeywords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNActionDescriptionMetadata categoryName](self, "categoryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNActionDescriptionMetadata resultValueName](self, "resultValueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNActionDescriptionMetadata *v4;
  LNActionDescriptionMetadata *v5;
  LNActionDescriptionMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  void *v32;

  v4 = (LNActionDescriptionMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    -[LNActionDescriptionMetadata descriptionText](self, "descriptionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionDescriptionMetadata descriptionText](v6, "descriptionText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_33;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[LNActionDescriptionMetadata searchKeywords](self, "searchKeywords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionDescriptionMetadata searchKeywords](v6, "searchKeywords");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_32;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    -[LNActionDescriptionMetadata categoryName](self, "categoryName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionDescriptionMetadata categoryName](v6, "categoryName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          v12 = objc_msgSend(v20, "isEqual:", v24);

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    -[LNActionDescriptionMetadata resultValueName](self, "resultValueName", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionDescriptionMetadata resultValueName](v6, "resultValueName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29)
        LOBYTE(v12) = objc_msgSend(v28, "isEqual:", v29);
    }

    v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (LNActionDescriptionMetadata)actionDescriptionMetadataWithIcon:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[LNActionDescriptionMetadata copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[5];
  v5[5] = v6;

  return (LNActionDescriptionMetadata *)v5;
}

- (LNActionDescriptionIcon)icon
{
  return self->_icon;
}

- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5
{
  return -[LNActionDescriptionMetadata initWithDescriptionText:categoryName:searchKeywords:resultValueName:](self, "initWithDescriptionText:categoryName:searchKeywords:resultValueName:", a3, a4, a5, 0);
}

@end
