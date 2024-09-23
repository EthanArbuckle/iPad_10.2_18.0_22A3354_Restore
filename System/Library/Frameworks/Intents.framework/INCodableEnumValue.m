@implementation INCodableEnumValue

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  INCodableEnumValueSynonym *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCodableEnumValue __INCodableEnumIndexKey](self, "__INCodableEnumIndexKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setIndex:](self, "setIndex:", objc_msgSend(v6, "integerValue"));

  -[INCodableEnumValue __INCodableEnumNameKey](self, "__INCodableEnumNameKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setName:](self, "setName:", v8);

  -[INCodableEnumValue __INCodableEnumDisplayNameKey](self, "__INCodableEnumDisplayNameKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setDisplayName:](self, "setDisplayName:", v10);

  -[INCodableEnumValue __INCodableEnumDisplayNameIDKey](self, "__INCodableEnumDisplayNameIDKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setDisplayNameLocID:](self, "setDisplayNameLocID:", v12);

  -[INCodableEnumValue __INCodableEnumSynonymsKey](self, "__INCodableEnumSynonymsKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  if (objc_msgSend(v16, "count"))
  {
    v25 = v4;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = objc_alloc_init(INCodableEnumValueSynonym);
            -[INCodableEnumValueSynonym _setCodableEnumValue:](v24, "_setCodableEnumValue:", self);
            -[INCodableEnumValueSynonym updateWithDictionary:](v24, "updateWithDictionary:", v23);
            objc_msgSend(v17, "if_addObjectIfNonNil:", v24);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    -[INCodableEnumValue setSynonyms:](self, "setSynonyms:", v17);
    v4 = v25;
  }

}

- (id)__INCodableEnumSynonymsKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValue _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableEnumNameKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValue _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableEnumIndexKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValue _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueIndexKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableEnumDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValue _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableEnumDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValue _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (INCodableEnum)_codableEnum
{
  return (INCodableEnum *)objc_loadWeakRetained((id *)&self->_codableEnum);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void)setDisplayNameLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)index
{
  return self->_index;
}

- (void)_setCodableEnum:(id)a3
{
  objc_storeWeak((id *)&self->_codableEnum, a3);
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableEnumValue index](self, "index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "if_flatMap:", &__block_literal_global_65580);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend(v7, "_intents_compareValue:relation:", v11, a4);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = v8;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    v17 = objc_msgSend(v16, "index");
    objc_msgSend(v13, "numberWithInteger:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "_intents_compareValue:relation:", v18, a4);

  }
  return v12;
}

id __90__INCodableEnumValue_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "index"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  INCodableEnumValue *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[INCodableEnumValue init](+[INCodableEnumValue allocWithZone:](INCodableEnumValue, "allocWithZone:", a3), "init");
  -[INCodableEnumValue setIndex:](v4, "setIndex:", -[INCodableEnumValue index](self, "index"));
  -[INCodableEnumValue name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setName:](v4, "setName:", v5);

  -[INCodableEnumValue displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setDisplayName:](v4, "setDisplayName:", v6);

  -[INCodableEnumValue displayNameLocID](self, "displayNameLocID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setDisplayNameLocID:](v4, "setDisplayNameLocID:", v7);

  return v4;
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableEnumValue index](self, "index"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INCodableEnumValue name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[INCodableEnumValue displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[INCodableEnumValue displayNameLocID](self, "displayNameLocID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v4;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[INCodableEnumValue index](self, "index");
    if (v5 == objc_msgSend(v4, "index"))
    {
      -[INCodableEnumValue name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        v13 = v8;
        if (!v8 || !v9)
          goto LABEL_23;
        v14 = objc_msgSend(v8, "isEqualToString:", v9);

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      -[INCodableEnumValue displayName](self, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        v11 = objc_msgSend(v13, "isEqualToString:", v17);

        if (!v11)
          goto LABEL_23;
      }
      -[INCodableEnumValue displayNameLocID](self, "displayNameLocID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayNameLocID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      v22 = v21;
      v18 = v22;
      if (v19 == v22)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v19 && v22)
          LOBYTE(v11) = objc_msgSend(v19, "isEqualToString:", v22);
      }

      goto LABEL_22;
    }
  }
  LOBYTE(v11) = 0;
LABEL_25:

  return v11;
}

- (NSString)localizedDisplayName
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableEnumValue localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDisplayNameForLanguage:(id)a3
{
  void *v4;
  void *v5;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[INCodableEnumValue _codableEnum](self, "_codableEnum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue displayNameLocID](self, "displayNameLocID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_localizationTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v6, v7, v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableEnumValue dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[5];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCodableEnumValue __INCodableEnumIndexKey](self, "__INCodableEnumIndexKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableEnumValue index](self, "index"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v6;
  v44[0] = v6;
  -[INCodableEnumValue __INCodableEnumNameKey](self, "__INCodableEnumNameKey");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v37;
  -[INCodableEnumValue name](self, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v8;
  v44[1] = v8;
  -[INCodableEnumValue __INCodableEnumDisplayNameKey](self, "__INCodableEnumDisplayNameKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v36;
  -[INCodableEnumValue localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v10;
  v44[2] = v10;
  -[INCodableEnumValue __INCodableEnumDisplayNameIDKey](self, "__INCodableEnumDisplayNameIDKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v35;
  -[INCodableEnumValue displayNameLocID](self, "displayNameLocID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v12;
  v44[3] = v12;
  -[INCodableEnumValue __INCodableEnumSynonymsKey](self, "__INCodableEnumSynonymsKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v34;
  -[INCodableEnumValue synonyms](self, "synonyms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    goto LABEL_19;
  v28 = v7;
  v29 = v5;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[INCodableEnumValue synonyms](self, "synonyms");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentationWithLocalizer:", v4, v28, v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "if_addObjectIfNonNil:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v19);
  }

  v7 = v28;
  v5 = v29;
  if (v16)
  {
    v23 = 0;
    v24 = v16;
  }
  else
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v28, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v23 = 1;
  }
  v44[4] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 5, v28, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)

  if (!v13)
  if (!v11)

  if (!v9)
  if (!v7)

  objc_msgSend(v25, "if_dictionaryWithNonEmptyValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", -[INCodableEnumValue index](self, "index"), CFSTR("index"));
  -[INCodableEnumValue name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, CFSTR("name"));

  objc_msgSend(v6, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValue localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, CFSTR("localizedName"));
  }
  -[INCodableEnumValue displayName](self, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intents_encodeForPlistRepresentationWithParameters:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, CFSTR("displayName"));

  -[INCodableEnumValue displayNameLocID](self, "displayNameLocID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v14, CFSTR("displayNameLocID"));

  -[INCodableEnumValue synonyms](self, "synonyms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", v15, CFSTR("synonyms"), &v19);
  v16 = v19;

  if (v16)
  {
    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }
  else
  {
    v17 = (void *)objc_msgSend(v7, "copy");
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[INCodableEnumValue index](self, "index"), CFSTR("index"));
  -[INCodableEnumValue name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[INCodableEnumValue displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[INCodableEnumValue displayNameLocID](self, "displayNameLocID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayNameLocID"));

  -[INCodableEnumValue synonyms](self, "synonyms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("synonyms"));

  -[INCodableEnumValue _codableEnum](self, "_codableEnum");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v9, CFSTR("_codableEnum"));

}

- (INCodableEnumValue)initWithCoder:(id)a3
{
  id v4;
  INCodableEnumValue *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INCodableEnumValue;
  v5 = -[INCodableEnumValue init](&v18, sel_init);
  if (v5)
  {
    -[INCodableEnumValue setIndex:](v5, "setIndex:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("index")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValue setName:](v5, "setName:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("displayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValue setDisplayName:](v5, "setDisplayName:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameLocID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValue setDisplayNameLocID:](v5, "setDisplayNameLocID:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_codableEnum"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValue _setCodableEnum:](v5, "_setCodableEnum:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("synonyms"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValue setSynonyms:](v5, "setSynonyms:", v16);

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayNameLocID
{
  return self->_displayNameLocID;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
  objc_storeStrong((id *)&self->_synonyms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_displayNameLocID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_codableEnum);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  INCodableEnumValue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INCodableEnumValue *v11;
  void *v12;
  id v13;
  void *v14;
  INCodableEnumValue *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  INCodableEnumValue *v21;
  id v22;

  v5 = a3;
  v6 = objc_alloc_init(INCodableEnumValue);
  -[INCodableEnumValue setIndex:](v6, "setIndex:", objc_msgSend(v5, "intents_intForKey:", CFSTR("index")));
  objc_msgSend(v5, "intents_stringForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setName:](v6, "setName:", v7);

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("localizedName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setLocalizedName:](v6, "setLocalizedName:", v8);

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("displayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setDisplayName:](v6, "setDisplayName:", v9);

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("displayNameLocID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValue setDisplayNameLocID:](v6, "setDisplayNameLocID:", v10);

  v22 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __66__INCodableEnumValue_makeFromWidgetPlistableRepresentation_error___block_invoke;
  v20 = &unk_1E22924C0;
  v11 = v6;
  v21 = v11;
  +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:](INCodableEnumValueSynonym, "intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:", v5, CFSTR("synonyms"), &v22, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v22;
  v14 = v13;
  if (v13)
  {
    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }
  else
  {
    -[INCodableEnumValue setSynonyms:](v11, "setSynonyms:", v12, v17, v18, v19, v20);
    v15 = v11;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __66__INCodableEnumValue_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCodableEnumValue:", *(_QWORD *)(a1 + 32));
}

@end
