@implementation INJSONDecoder

- (void)decodeObject:(id)a3 withCodableDescription:(id)a4 from:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && objc_msgSend(v7, "conformsToProtocol:", &unk_1EE040D30)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "_intents_decodeWithJSONDecoder:codableDescription:from:", self, v8, v9);
LABEL_5:

    goto LABEL_23;
  }
  if (v8
    || (+[INSchema systemSchema](INSchema, "systemSchema"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "_objectDescriptionForTypeOfClass:", objc_opt_class()),
        v8 = objc_claimAutoreleasedReturnValue(),
        v10,
        v8))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[NSObject attributes](v8, "attributes", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v17, "propertyName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "_intents_isValidKey:", v18))
          {
            v19 = v9;
            if (v9)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v20 = v19;
              else
                v20 = 0;
            }
            else
            {
              v20 = 0;
            }
            v21 = v20;

            objc_msgSend(v21, "objectForKeyedSubscript:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[INJSONDecoder decodeWithCodableAttribute:from:](self, "decodeWithCodableAttribute:from:", v17, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "_setterForProperty:", v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "if_setValueIfNonNil:forKey:", v23, v24);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

  }
  else
  {
    if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE040D30) & 1) == 0)
    {
      v25 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      v8 = v25;
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v36 = "-[INJSONDecoder decodeObject:withCodableDescription:from:]";
      v37 = 2112;
      v38 = v27;
      _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s %@ is not JSON decodable", buf, 0x16u);

      goto LABEL_5;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "_intents_decodeWithJSONDecoder:codableDescription:from:", self, 0, v9);
  }
LABEL_23:

}

- (id)decodeWithCodableAttribute:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  v10 = v6;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "codableEnum");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || v13 && objc_msgSend(v13, "type") == 2)
  {
    -[INJSONDecoder _decodeWithCodableAttribute:from:](self, "_decodeWithCodableAttribute:from:", v10, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v13;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          -[INJSONDecoder _decodeWithCodableAttribute:from:](self, "_decodeWithCodableAttribute:from:", v10, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v18);
    }

    v14 = (void *)objc_msgSend(v15, "copy");
    v13 = v23;
  }

  return v14;
}

- (id)decodeObjectOfClass:(Class)a3 from:(id)a4
{
  return -[INJSONDecoder _decodeObjectOfClass:withCodableDescription:from:outCodableDescription:](self, "_decodeObjectOfClass:withCodableDescription:from:outCodableDescription:", a3, 0, a4, 0);
}

- (id)decodeObjectsOfClass:(Class)a3 from:(id)a4
{
  id v6;
  void *v7;
  id v8;
  char isKindOfClass;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;

    if ((isKindOfClass & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            -[INJSONDecoder decodeObjectOfClass:from:](self, "decodeObjectOfClass:from:", a3, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              objc_msgSend(v7, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

    }
    else
    {
      -[INJSONDecoder decodeObjectOfClass:from:](self, "decodeObjectOfClass:from:", a3, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v7, "addObject:", v18);

    }
    if (objc_msgSend(v7, "count", (_QWORD)v20))
      v17 = (void *)objc_msgSend(v7, "copy");
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_decodeObjectOfClass:(Class)a3 withCodableDescription:(id)a4 from:(id)a5 outCodableDescription:(id *)a6
{
  id v10;
  id v11;
  INCustomObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (!v11)
    goto LABEL_26;
  if ((Class)objc_opt_class() != a3
    && -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE040D30)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class _intents_decodeWithJSONDecoder:codableDescription:from:](a3, "_intents_decodeWithJSONDecoder:codableDescription:from:", self, v10, v11);
    v12 = (INCustomObject *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (!v10)
  {
    +[INSchema systemSchema](INSchema, "systemSchema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_objectDescriptionForTypeOfClass:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE040D30) & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class _intents_decodeWithJSONDecoder:codableDescription:from:](a3, "_intents_decodeWithJSONDecoder:codableDescription:from:", self, 0, v11);
        v12 = (INCustomObject *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        goto LABEL_27;
      }
      v21 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v23 = v21;
        NSStringFromClass(a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 136315394;
        v26 = "-[INJSONDecoder _decodeObjectOfClass:withCodableDescription:from:outCodableDescription:]";
        v27 = 2112;
        v28 = v24;
        _os_log_error_impl(&dword_18BEBC000, v23, OS_LOG_TYPE_ERROR, "%s %@ is not JSON decodable", (uint8_t *)&v25, 0x16u);

      }
      v10 = 0;
LABEL_26:
      v12 = 0;
      goto LABEL_27;
    }
  }
  if ((Class)objc_opt_class() == a3)
  {
    v14 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("_type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v10, "_nullable_schema");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_objectDescriptionWithSemanticKeypath:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = v19;

        v10 = v20;
      }

    }
    v12 = -[INCustomObject initWithObject:codableDescription:]([INCustomObject alloc], "initWithObject:codableDescription:", 0, v10);

  }
  else
  {
    v12 = (INCustomObject *)objc_alloc_init(a3);
  }
  -[INJSONDecoder decodeObject:withCodableDescription:from:](self, "decodeObject:withCodableDescription:from:", v12, v10, v11);
  if (a6)
  {
    v10 = objc_retainAutorelease(v10);
    *a6 = v10;
  }
LABEL_27:

  return v12;
}

- (id)_decodeWithCodableAttribute:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
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
    v14 = v9;

    if (objc_msgSend(v14, "type") == 8 || objc_msgSend(v14, "type") == 7)
    {
      -[INJSONDecoder decodeObjectOfClass:from:](self, "decodeObjectOfClass:from:", objc_opt_class(), v7);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v7;
    }
    v18 = v15;
LABEL_46:

    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v19 = v11;

    objc_msgSend(v19, "codableEnum");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "type");
    v22 = v7;
    v23 = v22;
    if (v21 == 2)
    {
      if (v22)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;
      }
      else
      {
        v24 = 0;
      }
      v51 = v20;
      v52 = v6;
      v32 = v24;

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v33 = v32;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v34)
      {
        v35 = v34;
        v36 = 0;
        v37 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v55 != v37)
              objc_enumerationMutation(v33);
            v39 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
            if (v39)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v19, "valueWithName:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v36 |= 1 << objc_msgSend(v40, "index");

              }
            }

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v35);
      }
      else
      {
        v36 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v52;
      v20 = v51;
    }
    else
    {
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = v10;
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
        }
        else
        {
          v26 = 0;
        }
        v48 = v26;

        objc_msgSend(v48, "valueWithName:", v23);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
          v27 = objc_msgSend(v49, "index");
        else
          v27 = 0;

      }
      else
      {
        v27 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v6;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v14 = v13;

      objc_msgSend(v14, "codableDescription");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      -[INJSONDecoder _decodeObjectOfClass:withCodableDescription:from:outCodableDescription:](self, "_decodeObjectOfClass:withCodableDescription:from:outCodableDescription:", objc_msgSend(v14, "objectClass"), v28, v7, &v53);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v53;
      v30 = v29;
      if (v29 && v29 != v28)
      {
        objc_msgSend(v14, "setCodableDescription:", v29);
        objc_msgSend(v30, "typeName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObjectTypeName:", v31);

      }
      goto LABEL_46;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v6;
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
      v41 = v17;

      +[INSchema systemSchema](INSchema, "systemSchema");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_types");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "typeName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = objc_msgSend(v41, "objectClass");
      -[INJSONDecoder _decodeObjectOfClass:withCodableDescription:from:outCodableDescription:](self, "_decodeObjectOfClass:withCodableDescription:from:outCodableDescription:", v47, v46, v7, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
  }
LABEL_70:

  return v18;
}

@end
