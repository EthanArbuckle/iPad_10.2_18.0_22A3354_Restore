@implementation INCodableEnum

+ (id)__INCodableEnumValueSynonymsKey
{
  return CFSTR("INEnumValueSynonyms");
}

+ (id)__INCodableEnumValueNameKey
{
  return CFSTR("INEnumValueName");
}

+ (id)__INCodableEnumValueIndexKey
{
  return CFSTR("INEnumValueIndex");
}

+ (id)__INCodableEnumValueDisplayNameIDKey
{
  return CFSTR("INEnumValueDisplayNameID");
}

+ (id)__INCodableEnumValueDisplayNameKey
{
  return CFSTR("INEnumValueDisplayName");
}

- (NSString)name
{
  return self->_name;
}

- (void)_setLocalizationTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)_setEnumNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *name;
  void *v8;
  NSString *v9;
  NSString *displayName;
  void *v11;
  NSString *v12;
  NSString *displayNameID;
  void *v14;
  void *v15;
  int64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  INCodableEnumValue *v28;
  void *v29;
  uint64_t v30;
  NSDictionary *valuesByIndex;
  uint64_t v32;
  NSArray *values;
  void *v34;
  INCodableEnum *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "__NameKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v6;

  objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  self->_displayName = v9;

  objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v11);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayNameID = self->_displayNameID;
  self->_displayNameID = v12;

  v35 = self;
  objc_msgSend((id)objc_opt_class(), "__TypeKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("State")) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    v17 = objc_msgSend(v15, "isEqualToString:", CFSTR("Options"));
    v16 = 2;
    if (!v17)
      v16 = 0;
  }
  self->_type = v16;

  objc_msgSend((id)objc_opt_class(), "__ValuesKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v4;
  objc_msgSend(v4, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v19;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v28 = objc_alloc_init(INCodableEnumValue);
        -[INCodableEnumValue _setCodableEnum:](v28, "_setCodableEnum:", v35);
        -[INCodableEnumValue updateWithDictionary:](v28, "updateWithDictionary:", v27);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableEnumValue index](v28, "index"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, v29);

        objc_msgSend(v20, "addObject:", v28);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v24);
  }

  v30 = objc_msgSend(v21, "copy");
  valuesByIndex = v35->_valuesByIndex;
  v35->_valuesByIndex = (NSDictionary *)v30;

  v32 = objc_msgSend(v20, "copy");
  values = v35->_values;
  v35->_values = (NSArray *)v32;

}

+ (id)__ValuesKey
{
  return CFSTR("INEnumValues");
}

+ (id)__TypeKey
{
  return CFSTR("INEnumType");
}

+ (id)__NameKey
{
  return CFSTR("INEnumName");
}

+ (id)__DisplayNameIDKey
{
  return CFSTR("INEnumDisplayNameID");
}

+ (id)__DisplayNameKey
{
  return CFSTR("INEnumDisplayName");
}

- (INCodableEnum)initWithName:(id)a3 displayName:(id)a4 displayNameID:(id)a5 enumNamespace:(id)a6 type:(int64_t)a7 values:(id)a8 localizationTable:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  INCodableEnum *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *displayName;
  uint64_t v26;
  NSString *displayNameID;
  uint64_t v28;
  NSString *enumNamespace;
  uint64_t v30;
  NSArray *values;
  void *v32;
  uint64_t v33;
  NSDictionary *valuesByIndex;
  uint64_t v35;
  INCodableLocalizationTable *localizationTable;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INCodableEnum;
  v21 = -[INCodableEnum init](&v38, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    displayName = v21->_displayName;
    v21->_displayName = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    displayNameID = v21->_displayNameID;
    v21->_displayNameID = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    enumNamespace = v21->_enumNamespace;
    v21->_enumNamespace = (NSString *)v28;

    v21->_type = a7;
    v30 = objc_msgSend(v19, "copy");
    values = v21->_values;
    v21->_values = (NSArray *)v30;

    -[INCodableEnum values](v21, "values");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnum valuesByIndexForValues:](v21, "valuesByIndexForValues:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    valuesByIndex = v21->_valuesByIndex;
    v21->_valuesByIndex = (NSDictionary *)v33;

    v35 = objc_msgSend(v20, "copy");
    localizationTable = v21->_localizationTable;
    v21->_localizationTable = (INCodableLocalizationTable *)v35;

  }
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  INCodableEnum *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  INCodableEnum *v12;

  v4 = +[INCodableEnum allocWithZone:](INCodableEnum, "allocWithZone:", a3);
  -[INCodableEnum name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnum displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnum displayNameID](self, "displayNameID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnum enumNamespace](self, "enumNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INCodableEnum type](self, "type");
  -[INCodableEnum values](self, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnum _localizationTable](self, "_localizationTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[INCodableEnum initWithName:displayName:displayNameID:enumNamespace:type:values:localizationTable:](v4, "initWithName:displayName:displayNameID:enumNamespace:type:values:localizationTable:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[INCodableEnum enumNamespace](self, "enumNamespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INCodableEnum name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[INCodableEnum displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[INCodableEnum displayNameID](self, "displayNameID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableEnum type](self, "type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[INCodableEnum values](self, "values");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ objc_msgSend(v13, "hash");
  -[INCodableEnum _localizationTable](self, "_localizationTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash") ^ v12;

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  NSString *displayName;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;

  v7 = a3;
  if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    v8 = -[INCodableEnum type](self, "type");
    if (v8 == objc_msgSend(v7, "type"))
    {
      -[INCodableEnum name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToString:", v10))
      {
        v12 = 0;
        goto LABEL_26;
      }
      displayName = self->_displayName;
      if (displayName || (objc_msgSend(v7, "displayName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[INCodableEnum displayName](self, "displayName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "displayName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v4, "isEqualToString:", v5))
        {
          v12 = 0;
          goto LABEL_23;
        }
        v27 = 1;
      }
      else
      {
        v27 = 0;
      }
      -[INCodableEnum displayNameID](self, "displayNameID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayNameID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", v14))
      {
        v24 = v3;
        -[INCodableEnum enumNamespace](self, "enumNamespace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "enumNamespace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v15;
        if (objc_msgSend(v15, "isEqualToString:", v25))
        {
          -[INCodableEnum values](self, "values");
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "values");
          v17 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v16;
          v18 = (void *)v16;
          v19 = (void *)v17;
          if (objc_msgSend(v18, "isEqual:", v17))
          {
            -[INCodableEnum _localizationTable](self, "_localizationTable");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "_localizationTable");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v22, "isEqual:", v21);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

        if ((v27 & 1) == 0)
        {
          v3 = v24;
          if (displayName)
            goto LABEL_26;
          goto LABEL_25;
        }
        v3 = v24;
      }
      else
      {

        v12 = 0;
        if (!v27)
        {
LABEL_24:
          if (!displayName)
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
      }
LABEL_23:

      goto LABEL_24;
    }
  }
  v12 = 0;
LABEL_27:

  return v12;
}

- (id)valueForIndex:(unint64_t)a3
{
  NSDictionary *valuesByIndex;
  void *v4;
  void *v5;

  valuesByIndex = self->_valuesByIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](valuesByIndex, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)localizedDisplayName
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableEnum localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INCodableEnum displayNameID](self, "displayNameID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnum displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnum _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableEnum dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[INCodableEnum values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[INCodableEnum values](self, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentationWithLocalizer:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v10);
  }

  objc_msgSend((id)objc_opt_class(), "__NameKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v34;
  -[INCodableEnum name](self, "name");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v33 = v15;
  v30 = (void *)v14;
  v40[0] = v14;
  objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v32;
  -[INCodableEnum localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v4);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v16;
  v40[1] = v16;
  objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v31;
  -[INCodableEnum displayNameID](self, "displayNameID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v29, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[2] = v19;
  objc_msgSend((id)objc_opt_class(), "__TypeKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v20;
  v21 = -[INCodableEnum type](self, "type");
  v22 = CFSTR("State");
  if (v21 != 1)
    v22 = 0;
  if (v21 == 2)
    v22 = CFSTR("Options");
  v23 = v22;
  v24 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[3] = v24;
  objc_msgSend((id)objc_opt_class(), "__ValuesKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v25;
  v40[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  if (!v18)

  if (!v17)
  if (!v33)

  objc_msgSend(v26, "if_dictionaryWithNonEmptyValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)valuesByIndexForValues:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "index", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v19;
  id v20;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_setIntegerIfNonZero:forKey:", -[INCodableEnum type](self, "type"), CFSTR("type"));
  -[INCodableEnum name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v9, CFSTR("name"));

  -[INCodableEnum displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intents_encodeForPlistRepresentationWithParameters:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v11, CFSTR("displayName"));

  -[INCodableEnum displayNameID](self, "displayNameID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v12, CFSTR("displayNameID"));

  -[INCodableEnum enumNamespace](self, "enumNamespace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v13, CFSTR("enumNamespace"));

  -[INCodableEnum values](self, "values");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "intents_setArrayOfWidgetPlistRepresentable:forKey:parameters:error:", v14, CFSTR("values"), v7, &v20);

  v15 = v20;
  if (!v15)
  {
    -[INCodableEnum _localizationTable](self, "_localizationTable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v8, "intents_setWidgetPlistRepresentable:forKey:error:", v17, CFSTR("_localizationTable"), &v19);
    v15 = v19;

    if (!v15)
    {
      v16 = v8;
      goto LABEL_8;
    }
    if (a4)
      goto LABEL_3;
LABEL_6:
    v16 = 0;
    goto LABEL_8;
  }
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v15 = objc_retainAutorelease(v15);
  v16 = 0;
  *a4 = v15;
LABEL_8:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[INCodableEnum type](self, "type"), CFSTR("type"));
  -[INCodableEnum name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[INCodableEnum displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[INCodableEnum displayNameID](self, "displayNameID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayNameID"));

  -[INCodableEnum enumNamespace](self, "enumNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("enumNamespace"));

  -[INCodableEnum values](self, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("values"));

  -[INCodableEnum _localizationTable](self, "_localizationTable");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_localizationTable"));

}

- (INCodableEnum)initWithCoder:(id)a3
{
  id v4;
  INCodableEnum *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSString *displayNameID;
  uint64_t v15;
  NSString *enumNamespace;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *values;
  uint64_t v22;
  INCodableLocalizationTable *localizationTable;
  void *v24;
  uint64_t v25;
  NSDictionary *valuesByIndex;
  void *v27;
  INCodableLocalizationTable *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)INCodableEnum;
  v5 = -[INCodableEnum init](&v32, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("displayName"));
    v11 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameID"));
    v13 = objc_claimAutoreleasedReturnValue();
    displayNameID = v5->_displayNameID;
    v5->_displayNameID = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumNamespace"));
    v15 = objc_claimAutoreleasedReturnValue();
    enumNamespace = v5->_enumNamespace;
    v5->_enumNamespace = (NSString *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("values"));
    v20 = objc_claimAutoreleasedReturnValue();
    values = v5->_values;
    v5->_values = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizationTable"));
    v22 = objc_claimAutoreleasedReturnValue();
    localizationTable = v5->_localizationTable;
    v5->_localizationTable = (INCodableLocalizationTable *)v22;

    -[INCodableEnum values](v5, "values");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnum valuesByIndexForValues:](v5, "valuesByIndexForValues:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    valuesByIndex = v5->_valuesByIndex;
    v5->_valuesByIndex = (NSDictionary *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationTable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_alloc_init(INCodableLocalizationTable);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationTable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableLocalizationTable setTableName:](v28, "setTableName:", v29);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableLocalizationTable setBundleIdentifier:](v28, "setBundleIdentifier:", v30);

      -[INCodableEnum _setLocalizationTable:](v5, "_setLocalizationTable:", v28);
    }
  }

  return v5;
}

- (INCodableLocalizationTable)_localizationTable
{
  return self->_localizationTable;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayNameID
{
  return self->_displayNameID;
}

- (NSString)enumNamespace
{
  return self->_enumNamespace;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_enumNamespace, 0);
  objc_storeStrong((id *)&self->_displayNameID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localizationTable, 0);
  objc_storeStrong((id *)&self->_valuesByIndex, 0);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  INCodableEnum *v6;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSString *displayName;
  INCodableEnum *v11;
  void *v12;
  id v13;
  id v14;
  INCodableEnum *v15;
  uint64_t v16;
  INCodableLocalizationTable *localizationTable;
  uint64_t v18;
  NSString *displayNameID;
  uint64_t v20;
  NSString *enumNamespace;
  void *v22;
  uint64_t v23;
  NSDictionary *valuesByIndex;
  id v26;
  _QWORD v27[4];
  INCodableEnum *v28;
  id v29;

  v5 = a3;
  v6 = objc_alloc_init(INCodableEnum);
  v6->_type = objc_msgSend(v5, "intents_intForKey:", CFSTR("type"));
  objc_msgSend(v5, "intents_stringForKey:", CFSTR("name"));
  v7 = objc_claimAutoreleasedReturnValue();
  name = v6->_name;
  v6->_name = (NSString *)v7;

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("displayName"));
  v9 = objc_claimAutoreleasedReturnValue();
  displayName = v6->_displayName;
  v6->_displayName = (NSString *)v9;

  v29 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__INCodableEnum_makeFromWidgetPlistableRepresentation_error___block_invoke;
  v27[3] = &unk_1E22924C0;
  v11 = v6;
  v28 = v11;
  +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:](INCodableEnumValue, "intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:", v5, CFSTR("values"), &v29, v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;
  if (!v13)
  {
    objc_storeStrong((id *)&v11->_values, v12);
    v26 = 0;
    +[NSObject intents_widgetPlistRepresentableInDict:key:error:](INCodableLocalizationTable, "intents_widgetPlistRepresentableInDict:key:error:", v5, CFSTR("_localizationTable"), &v26);
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = v26;
    localizationTable = v11->_localizationTable;
    v11->_localizationTable = (INCodableLocalizationTable *)v16;

    if (!v14)
    {
      objc_msgSend(v5, "intents_stringForKey:", CFSTR("displayNameID"));
      v18 = objc_claimAutoreleasedReturnValue();
      displayNameID = v11->_displayNameID;
      v11->_displayNameID = (NSString *)v18;

      objc_msgSend(v5, "intents_stringForKey:", CFSTR("enumNamespace"));
      v20 = objc_claimAutoreleasedReturnValue();
      enumNamespace = v11->_enumNamespace;
      v11->_enumNamespace = (NSString *)v20;

      -[INCodableEnum values](v11, "values");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableEnum valuesByIndexForValues:](v11, "valuesByIndexForValues:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      valuesByIndex = v11->_valuesByIndex;
      v11->_valuesByIndex = (NSDictionary *)v23;

      v15 = v11;
      goto LABEL_8;
    }
    if (a4)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    goto LABEL_8;
  }
  v14 = v13;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v14 = objc_retainAutorelease(v14);
  v15 = 0;
  *a4 = v14;
LABEL_8:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __61__INCodableEnum_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCodableEnum:", *(_QWORD *)(a1 + 32));
}

+ (id)__INCodableEnumValueSynonymSynonymIDKey
{
  return CFSTR("INEnumValueSynonymSynonymID");
}

+ (id)__INCodableEnumValueSynonymSynonymKey
{
  return CFSTR("INEnumValueSynonymSynonym");
}

+ (id)__INCodableEnumValueSynonymPronunciationHintIDKey
{
  return CFSTR("INEnumValueSynonymPronunciationHintID");
}

+ (id)__INCodableEnumValueSynonymPronunciationHintKey
{
  return CFSTR("INEnumValueSynonymPronunciationHint");
}

@end
