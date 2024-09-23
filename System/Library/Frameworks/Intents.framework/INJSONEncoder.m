@implementation INJSONEncoder

- (INJSONEncoder)init
{
  INJSONEncoderConfiguration *v3;
  INJSONEncoder *v4;

  v3 = objc_alloc_init(INJSONEncoderConfiguration);
  v4 = -[INJSONEncoder initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (INJSONEncoder)initWithConfiguration:(id)a3
{
  id v4;
  INJSONEncoder *v5;
  uint64_t v6;
  INJSONEncoderConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INJSONEncoder;
  v5 = -[INJSONEncoder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (INJSONEncoderConfiguration *)v6;

  }
  return v5;
}

- (id)encodeObject:(id)a3 withCodableDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && objc_msgSend(v5, "conformsToProtocol:", &unk_1EE040D30)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_intents_encodeWithJSONEncoder:codableDescription:", self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (!v6)
  {
    +[INSchema systemSchema](INSchema, "systemSchema");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_objectDescriptionForTypeOfClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE040D30) & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "_intents_encodeWithJSONEncoder:codableDescription:", self, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 0;
        goto LABEL_28;
      }
      v21 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v23 = v21;
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v34 = "-[INJSONEncoder encodeObject:withCodableDescription:]";
        v35 = 2112;
        v36 = v25;
        _os_log_error_impl(&dword_18BEBC000, v23, OS_LOG_TYPE_ERROR, "%s %@ is not JSON encodable", buf, 0x16u);

      }
      v6 = 0;
LABEL_27:
      v7 = 0;
      goto LABEL_28;
    }
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v6;
  objc_msgSend(v6, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "propertyName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "hasPrefix:", CFSTR("_")) & 1) == 0
          && objc_msgSend(v5, "_intents_isValidKey:", v17))
        {
          objc_msgSend(v5, "valueForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[INJSONEncoder encodeObject:withCodableAttribute:](self, "encodeObject:withCodableAttribute:", v18, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v19, v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  v6 = v26;
  objc_msgSend(v26, "semanticRoot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("_type"));
  v7 = (void *)objc_msgSend(v9, "copy");

LABEL_28:
  return v7;
}

- (id)encodeObject:(id)a3
{
  return -[INJSONEncoder encodeObject:withCodableDescription:](self, "encodeObject:withCodableDescription:", a3, 0);
}

- (id)encodeObject:(id)a3 withCodableAttribute:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[INJSONEncoder _encodeObject:codableAttribute:](self, "_encodeObject:codableAttribute:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), v7, (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = (void *)objc_msgSend(v9, "copy");
  }
  else
  {

    -[INJSONEncoder _encodeObject:codableAttribute:](self, "_encodeObject:codableAttribute:", v8, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (INJSONEncoderConfiguration)configuration
{
  return (INJSONEncoderConfiguration *)(id)-[INJSONEncoderConfiguration copy](self->_configuration, "copy");
}

- (id)_encodeObject:(id)a3 codableAttribute:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  char isKindOfClass;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
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
    v20 = v9;

    if (objc_msgSend(v20, "type") == 8 || objc_msgSend(v20, "type") == 7)
    {
      v21 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      -[INJSONEncoder encodeObject:](self, "encodeObject:", v23);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = v6;
    }
    goto LABEL_59;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v7;
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
      }
      else
      {
        v19 = 0;
      }
      v20 = v19;

      objc_msgSend(v20, "codableDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "_nullable_schema");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_objectDescriptionForTypeOfClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v43 = v28;
      }
      else
      {
        objc_msgSend(v20, "codableDescription");
        v43 = (id)objc_claimAutoreleasedReturnValue();
      }
      v44 = v43;
      -[INJSONEncoder encodeObject:withCodableDescription:](self, "encodeObject:withCodableDescription:", v6, v43);
      v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_58:
LABEL_59:

      goto LABEL_60;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v7;
      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[INSchema systemSchema](INSchema, "systemSchema");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_types");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "typeName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v28 = 0;
          v24 = v20;
          v20 = 0;
        }
      }
      else
      {
        v24 = 0;
        v28 = 0;
      }

      -[INJSONEncoder encodeObject:withCodableDescription:](self, "encodeObject:withCodableDescription:", v6, v28);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_58;
    }
LABEL_32:
    v14 = 0;
    goto LABEL_60;
  }
  v10 = v6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  v14 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    v15 = objc_msgSend(v10, "integerValue");
    v16 = v7;
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v29 = v17;

    objc_msgSend(v29, "codableEnum");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "type") == 2)
    {
      v47 = v29;
      v48 = v13;
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v46 = v30;
      objc_msgSend(v30, "values");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v50 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            if (((v15 >> objc_msgSend(v37, "index")) & 1) != 0)
            {
              objc_msgSend(v37, "name");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
              {
                objc_msgSend(v37, "name");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v39);

              }
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v34);
      }

      v14 = (id)objc_msgSend(v31, "copy");
      v29 = v47;
      v13 = v48;
      v30 = v46;
    }
    else
    {
      objc_msgSend(v29, "valueForIndex:", v15);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "name");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_60:
  return v14;
}

- (INJSONEncoderConfiguration)_storedConfiguration
{
  return self->_configuration;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[INJSONEncoder initWithConfiguration:]([INJSONEncoder alloc], "initWithConfiguration:", self->_configuration);
}

- (void)setLanguageCode:(id)a3
{
  -[INJSONEncoderConfiguration setLanguageCode:](self->_configuration, "setLanguageCode:", a3);
}

- (NSString)languageCode
{
  return -[INJSONEncoderConfiguration languageCode](self->_configuration, "languageCode");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
