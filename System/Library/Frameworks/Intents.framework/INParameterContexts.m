@implementation INParameterContexts

- (id)_initWithIntent:(id)a3 decoder:(id)a4 JSONDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  INParameterContexts *v11;
  INParameterContexts *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INParameterContexts;
  v11 = -[INParameterContexts init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INParameterContexts _updateSuggestedValuesForIntent:decoder:JSONDictionary:](v11, "_updateSuggestedValuesForIntent:decoder:JSONDictionary:", v8, v9, v10);
    -[INParameterContexts _updateOperatorsForIntent:JSONDictionary:](v12, "_updateOperatorsForIntent:JSONDictionary:", v8, v10);
  }

  return v12;
}

- (void)_updateOperatorsForIntent:(id)a3 JSONDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *operatorsDictionary;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v5, "_codableDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "_codableDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "propertyName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("operators"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v23, "setObject:forKey:", v19, v17);
            }

          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  v20 = (NSDictionary *)objc_msgSend(v23, "copy");
  operatorsDictionary = self->_operatorsDictionary;
  self->_operatorsDictionary = v20;

}

- (void)_updateSuggestedValuesForIntent:(id)a3 decoder:(id)a4 JSONDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  NSDictionary *v37;
  NSDictionary *suggestedValuesDictionary;
  id v39;
  id v41;
  id obj;
  void *v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke;
  v55[3] = &unk_1E228C5D0;
  v39 = v8;
  v56 = v39;
  v43 = v7;
  v44 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D7812C4](v55);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v7, "_codableDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v52;
    v41 = v10;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v17);
        objc_msgSend(v18, "propertyName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          if (objc_msgSend(v18, "modifier"))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v22 = v21;
              else
                v22 = 0;
            }
            else
            {
              v22 = 0;
            }
            v27 = v22;

            ((void (**)(_QWORD, id, void *))v44)[2](v44, v27, v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = objc_msgSend(v18, "objectClass");
            if (v29 != objc_opt_class())
              goto LABEL_31;
            objc_msgSend(v43, "valueForKey:", v19);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_opt_class();
              v31 = (objc_opt_isKindOfClass() & 1) != 0 ? v30 : 0;
            }
            else
            {
              v31 = 0;
            }
            v35 = v31;

            objc_msgSend(v35, "setAlternatives:", v28);
            if (!v35)
              goto LABEL_31;
          }
          else
          {
            v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v9, "objectForKeyedSubscript:", v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
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
            v32 = v26;

            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke_2;
            v45[3] = &unk_1E228C5F8;
            v50 = v44;
            v45[4] = v18;
            v33 = v23;
            v46 = v33;
            v47 = v43;
            v48 = v19;
            v34 = v24;
            v49 = v34;
            objc_msgSend(v32, "enumerateObjectsUsingBlock:", v45);

            if (objc_msgSend(v33, "count"))
              v28 = (void *)objc_msgSend(v33, "copy");
            else
              v28 = 0;
            v10 = v41;
            if (objc_msgSend(v34, "count"))
              v35 = (id)objc_msgSend(v34, "copy");
            else
              v35 = 0;

            if (!v35)
              goto LABEL_31;
          }
          objc_msgSend(v43, "setValue:forKey:", v35, v19);

LABEL_31:
          objc_msgSend(v10, "if_setObjectIfNonNil:forKey:", v28, v19);

        }
        ++v17;
      }
      while (v15 != v17);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      v15 = v36;
    }
    while (v36);
  }

  v37 = (NSDictionary *)objc_msgSend(v10, "copy");
  suggestedValuesDictionary = self->_suggestedValuesDictionary;
  self->_suggestedValuesDictionary = v37;

}

- (BOOL)_isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[NSDictionary allKeys](self->_suggestedValuesDictionary, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSDictionary allKeys](self->_operatorsDictionary, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *typedSuggestedValuesDictionary;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("suggestedValuesFor")))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("suggestedValuesFor"), "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_ASCIIStringByLowercasingFirstCharacter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    typedSuggestedValuesDictionary = self->_typedSuggestedValuesDictionary;
    if (!typedSuggestedValuesDictionary)
    {
      v25 = v6;
      v26 = v4;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_suggestedValuesDictionary, "count"));
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[NSDictionary allKeys](self->_suggestedValuesDictionary, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            -[NSDictionary objectForKey:](self->_suggestedValuesDictionary, "objectForKey:", v14, v25, v26);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v16 = v15;
              else
                v16 = 0;
            }
            else
            {
              v16 = 0;
            }
            v17 = v16;

            objc_msgSend(v17, "if_map:", &__block_literal_global_36977);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "setValue:forKey:", v18, v14);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v11);
      }

      v19 = (NSDictionary *)objc_msgSend(v8, "copy");
      v20 = self->_typedSuggestedValuesDictionary;
      self->_typedSuggestedValuesDictionary = v19;

      typedSuggestedValuesDictionary = self->_typedSuggestedValuesDictionary;
      v6 = v25;
      v4 = v26;
    }
    -[NSDictionary objectForKey:](typedSuggestedValuesDictionary, "objectForKey:", v6, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("operatorsFor")))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("operatorsFor"), "length"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "if_ASCIIStringByLowercasingFirstCharacter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary objectForKey:](self->_operatorsDictionary, "objectForKey:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)INParameterContexts;
    -[INParameterContexts valueForUndefinedKey:](&v27, sel_valueForUndefinedKey_, v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSDictionary allKeys](self->_suggestedValuesDictionary, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_suggestedValuesDictionary, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "attributeByName:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "encodeObject:withCodableAttribute:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  objc_msgSend(v17, "setValue:forKey:", v7, CFSTR("suggestedValues"));
  objc_msgSend(v17, "if_setObjectIfNonNil:forKey:", self->_operatorsDictionary, CFSTR("operators"));

  return v17;
}

- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *suggestedValuesDictionary;
  NSDictionary *v24;
  NSDictionary *operatorsDictionary;
  id v26;
  id obj;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v29 = a4;
  v7 = a5;
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
  v26 = v8;
  objc_msgSend(v26, "objectForKey:", CFSTR("suggestedValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v11, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
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

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __78__INParameterContexts__intents_decodeWithJSONDecoder_codableDescription_from___block_invoke;
        v31[3] = &unk_1E228C660;
        v32 = v30;
        v33 = v29;
        v34 = v17;
        objc_msgSend(v20, "if_map:", v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "if_setObjectIfNonNil:forKey:", v21, v17);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v14);
  }

  v22 = (NSDictionary *)objc_msgSend(v12, "copy");
  suggestedValuesDictionary = self->_suggestedValuesDictionary;
  self->_suggestedValuesDictionary = v22;

  objc_msgSend(v26, "objectForKey:", CFSTR("operators"));
  v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  operatorsDictionary = self->_operatorsDictionary;
  self->_operatorsDictionary = v24;

}

- (NSDictionary)_suggestedValuesDictionary
{
  return self->_suggestedValuesDictionary;
}

- (void)_setSuggestedValuesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedValuesDictionary, a3);
}

- (NSDictionary)_typedSuggestedValuesDictionary
{
  return self->_typedSuggestedValuesDictionary;
}

- (void)_setTypedSuggestedValuesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_typedSuggestedValuesDictionary, a3);
}

- (NSDictionary)_operatorsDictionary
{
  return self->_operatorsDictionary;
}

- (void)_setOperatorsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_operatorsDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorsDictionary, 0);
  objc_storeStrong((id *)&self->_typedSuggestedValuesDictionary, 0);
  objc_storeStrong((id *)&self->_suggestedValuesDictionary, 0);
}

id __78__INParameterContexts__intents_decodeWithJSONDecoder_codableDescription_from___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)a1[4];
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "attributeByName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decodeWithCodableAttribute:from:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __44__INParameterContexts_valueForUndefinedKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    INTypedObjectWithCustomObject(v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

id __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestedValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v5;
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
    v11 = v9;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("value"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(*(id *)(a1 + 32), "decodeWithCodableAttribute:from:", v6, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "if_addObjectIfNonNil:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v7, "count"))
      v10 = (void *)objc_msgSend(v7, "copy");
    else
      v10 = 0;
    v5 = v20;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 72);
  v17 = v5;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v17;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v8, *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "if_addObjectIfNonNil:", v9);
  v10 = objc_msgSend(*(id *)(a1 + 32), "objectClass");
  if (v10 == objc_opt_class())
  {
    objc_msgSend(*(id *)(a1 + 48), "valueForKey:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    if (objc_msgSend(v13, "count") > a3)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
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

      objc_msgSend(v16, "setAlternatives:", v9);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v16);

    }
  }

}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "_intents_decodeWithJSONDecoder:codableDescription:from:", v10, v9, v8);

  return v11;
}

@end
