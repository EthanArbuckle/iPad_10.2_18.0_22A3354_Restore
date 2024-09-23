@implementation PHSearchQueryQUToken

- (PHSearchQueryQUToken)initWithText:(id)a3 entityCategoryTypes:(id)a4 metadata:(id)a5
{
  id v10;
  id v11;
  id v12;
  PHSearchQueryQUToken *v13;
  PHSearchQueryQUToken *v14;
  PHSearchQueryQUToken *v15;
  void *v17;
  objc_super v18;
  _QWORD v19[4];
  PHSearchQueryQUToken *v20;
  SEL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryQUToken.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__PHSearchQueryQUToken_initWithText_entityCategoryTypes_metadata___block_invoke;
  v19[3] = &unk_1E35D7168;
  v21 = a2;
  v13 = self;
  v20 = v13;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v19);
  v18.receiver = v13;
  v18.super_class = (Class)PHSearchQueryQUToken;
  v14 = -[PHSearchQueryQUToken init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_text, a3);
    objc_storeStrong((id *)&v15->_entityCategoryTypes, a4);
    objc_storeStrong((id *)&v15->_metadata, a5);
  }

  return v15;
}

- (unint64_t)ambiguityType
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  int v20;
  uint64_t *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  _QWORD v32[10];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  if (!-[PHSearchQueryQUToken hasMemoryGenAnnotation](self, "hasMemoryGenAnnotation")
    || (-[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4 != 1))
  {
    -[PHSearchQueryQUToken metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v49 = 0;
        v50 = &v49;
        v51 = 0x2020000000;
        v52 = 2;
        v45 = 0;
        v46 = &v45;
        v47 = 0x2020000000;
        v48 = 2;
        v41 = 0;
        v42 = &v41;
        v43 = 0x2020000000;
        v44 = 2;
        v37 = 0;
        v38 = &v37;
        v39 = 0x2020000000;
        v40 = 2;
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 0;
        -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __37__PHSearchQueryQUToken_ambiguityType__block_invoke;
        v32[3] = &unk_1E35D7190;
        v32[4] = self;
        v32[5] = &v33;
        v32[6] = &v49;
        v32[7] = &v45;
        v32[8] = &v41;
        v32[9] = &v37;
        objc_msgSend(v9, "enumerateIndexesUsingBlock:", v32);

        if (!*((_BYTE *)v34 + 24))
        {
          if (-[PHSearchQueryQUToken hasMemoryGenAnnotation](self, "hasMemoryGenAnnotation"))
            v5 = 1;
          else
            v5 = 2;
          goto LABEL_35;
        }
        -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11 < 2)
        {
          -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsIndex:", 2);

          if (v20)
          {
            v21 = v50;
LABEL_32:
            v5 = v21[3];
            goto LABEL_35;
          }
          -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsIndex:", 3);

          if (!v23)
          {
            -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "containsIndex:", 1);

            if (v28)
            {
              v21 = v38;
            }
            else
            {
              -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "containsIndex:", 4);

              if (!v30)
              {
                v5 = 2;
                goto LABEL_35;
              }
              v21 = v42;
            }
            goto LABEL_32;
          }
        }
        else
        {
          if (!-[PHSearchQueryQUToken hasMemoryGenAnnotation](self, "hasMemoryGenAnnotation"))
            goto LABEL_34;
          -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "containsIndex:", 3) & 1) == 0)
          {

            goto LABEL_24;
          }
          -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsIndex:", 13);

          if (!v14)
            goto LABEL_24;
          -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16 != 2)
          {
            -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            if (v18 > 2)
              goto LABEL_34;
LABEL_24:
            if (!v50[3])
            {
              -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v24, "containsIndex:", 2) & 1) != 0)
              {
                -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "containsIndex:", 14);

                if ((v26 & 1) != 0)
                {
                  v5 = 0;
LABEL_35:
                  _Block_object_dispose(&v33, 8);
                  _Block_object_dispose(&v37, 8);
                  _Block_object_dispose(&v41, 8);
                  _Block_object_dispose(&v45, 8);
                  _Block_object_dispose(&v49, 8);
                  return v5;
                }
              }
              else
              {

              }
            }
LABEL_34:
            v5 = 1;
            goto LABEL_35;
          }
        }
        v21 = v46;
        goto LABEL_32;
      }
    }
    else
    {

    }
    return 2;
  }
  return 0;
}

- (id)metadataForCategoryType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "entityCategoryTypeKeyForEntityTypeCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchQueryQUToken metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasMemoryGenAnnotation
{
  void *v2;
  char v3;

  -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsIndex:", 5) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 6) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 7) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 11) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 12) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 8) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 10) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 9) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 13) & 1) != 0
    || (objc_msgSend(v2, "containsIndex:", 14) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "containsIndex:", 15);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PHSearchQueryQUToken *v4;
  PHSearchQueryQUToken *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;

  v4 = (PHSearchQueryQUToken *)a3;
  if (v4 == self)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PHSearchQueryQUToken text](self, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHSearchQueryQUToken text](v5, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          && (-[PHSearchQueryQUToken entityCategoryTypes](v5, "entityCategoryTypes"),
              (v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v11 = (void *)v10;
          -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHSearchQueryQUToken entityCategoryTypes](v5, "entityCategoryTypes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToIndexSet:", v13);

          if ((v14 & 1) != 0)
          {
LABEL_7:
            -[PHSearchQueryQUToken metadata](self, "metadata");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15
              && (-[PHSearchQueryQUToken metadata](v5, "metadata"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v17 = (void *)v16;
              -[PHSearchQueryQUToken metadata](self, "metadata");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHSearchQueryQUToken metadata](v5, "metadata");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqualToDictionary:", v19);

            }
            else
            {
              -[PHSearchQueryQUToken metadata](self, "metadata");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHSearchQueryQUToken metadata](v5, "metadata");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v17 == v18;
            }

            goto LABEL_18;
          }
        }
        else
        {
          -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHSearchQueryQUToken entityCategoryTypes](v5, "entityCategoryTypes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          if (v21 == v22)
            goto LABEL_7;
        }
      }
      v20 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v20 = 0;
  }
LABEL_19:

  return v20;
}

- (PHSearchQueryQUToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PHSearchQueryQUToken *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchQueryDisambiguationPropertyText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchQueryDisambiguationPropertyEntityCategoryTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("PHSearchQueryDisambiguationPropertyMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PHSearchQueryQUToken initWithText:entityCategoryTypes:metadata:](self, "initWithText:entityCategoryTypes:metadata:", v5, v6, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("PHSearchQueryDisambiguationPropertyText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityCategoryTypes, CFSTR("PHSearchQueryDisambiguationPropertyEntityCategoryTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("PHSearchQueryDisambiguationPropertyMetadata"));

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __35__PHSearchQueryQUToken_description__block_invoke;
  v14[3] = &unk_1E35D91E0;
  v15 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v14);

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PHSearchQueryQUToken text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchQueryQUToken metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHSearchQueryQUToken ambiguityType](self, "ambiguityType");
  v10 = CFSTR("PHSearchAmbiguityTypeNone");
  if (v9 == 1)
    v10 = CFSTR("PHSearchAmbiguityTypePartiallyAmbiguous");
  if (v9 == 2)
    v10 = CFSTR("PHSearchAmbiguityTypeFullyAmbiguous");
  v11 = v10;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("text: %@, metadata: %@, entityCategories: %@, ambiguity: %@"), v7, v8, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  PHSearchQueryQUToken *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHSearchQueryQUToken entityCategoryTypes](self, "entityCategoryTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __38__PHSearchQueryQUToken_jsonDictionary__block_invoke;
  v35[3] = &unk_1E35D91E0;
  v5 = v3;
  v36 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v35);

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHSearchQueryQUToken text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("query_term"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("entity_category_types"));
  v8 = -[PHSearchQueryQUToken ambiguityType](self, "ambiguityType");
  v9 = CFSTR("PHSearchAmbiguityTypeNone");
  if (v8 == 1)
    v9 = CFSTR("PHSearchAmbiguityTypePartiallyAmbiguous");
  if (v8 == 2)
    v9 = CFSTR("PHSearchAmbiguityTypeFullyAmbiguous");
  v10 = v9;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("ambiguity_type"));

  +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchQueryQUToken metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v29 = v11;
    v30 = self;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = v13;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v21 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v21, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm"));
          objc_msgSend(v21, "stringFromDate:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v17);
    }

    -[PHSearchQueryQUToken metadata](v30, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    v11 = v29;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, v29);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("metadata"));

  }
  else
  {
    -[PHSearchQueryQUToken metadata](self, "metadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("metadata"));

  }
  v26 = (void *)objc_msgSend(v6, "copy", v28);

  return v26;
}

- (NSString)text
{
  return self->_text;
}

- (NSIndexSet)entityCategoryTypes
{
  return self->_entityCategoryTypes;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entityCategoryTypes, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

void __38__PHSearchQueryQUToken_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  __CFString *v4;

  if ((unint64_t)(a2 - 1) > 0xE)
    v3 = CFSTR("PHSearchEntityCategoryTypeUndefined");
  else
    v3 = off_1E35D5EC0[a2 - 1];
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __35__PHSearchQueryQUToken_description__block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  __CFString *v4;

  if ((unint64_t)(a2 - 1) > 0xE)
    v3 = CFSTR("PHSearchEntityCategoryTypeUndefined");
  else
    v3 = off_1E35D5EC0[a2 - 1];
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __37__PHSearchQueryQUToken_ambiguityType__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "metadataForCategoryType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  switch(a2)
  {
    case 1:
      v5 = v4;
      v6 = v5;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v7 + 24))
      {
        v8 = 1;
      }
      else
      {
        v8 = objc_msgSend(v5, "count") == 2;
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      *(_BYTE *)(v7 + 24) = v8;
      if (objc_msgSend(v6, "count") != 2)
        goto LABEL_32;
      v21 = 0;
      v22 = a1 + 72;
      goto LABEL_31;
    case 2:
      v17 = v4;
      v18 = v17;
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v19 + 24))
      {
        v20 = 1;
      }
      else
      {
        v20 = objc_msgSend(v17, "count") != 0;
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      *(_BYTE *)(v19 + 24) = v20;
      if (objc_msgSend(v18, "count") == 1)
      {
        v21 = 0;
      }
      else
      {
        if ((unint64_t)objc_msgSend(v18, "count") < 2)
          goto LABEL_32;
        v21 = 1;
      }
      v22 = a1 + 48;
      goto LABEL_31;
    case 3:
      v9 = v4;
      v10 = v9;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v11 + 24))
      {
        v12 = 1;
      }
      else
      {
        v12 = objc_msgSend(v9, "count") != 0;
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      *(_BYTE *)(v11 + 24) = v12;
      if (objc_msgSend(v10, "count") == 1)
      {
        v21 = 0;
      }
      else
      {
        if ((unint64_t)objc_msgSend(v10, "count") < 2)
          goto LABEL_32;
        v21 = 1;
      }
      v22 = a1 + 56;
      goto LABEL_31;
    case 4:
      v13 = v4;
      v14 = v13;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v15 + 24))
      {
        v16 = 1;
      }
      else
      {
        v16 = objc_msgSend(v13, "count") != 0;
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      *(_BYTE *)(v15 + 24) = v16;
      if (objc_msgSend(v14, "count") == 1)
      {
        v21 = 0;
      }
      else
      {
        if ((unint64_t)objc_msgSend(v14, "count") < 2)
          goto LABEL_32;
        v21 = 1;
      }
      v22 = a1 + 64;
LABEL_31:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v22 + 8) + 24) = v21;
LABEL_32:

      v4 = v23;
LABEL_33:

      return;
    default:
      goto LABEL_33;
  }
}

void __66__PHSearchQueryQUToken_initWithText_entityCategoryTypes_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!+[PHSearchQueryQUToken _isSupportedEntityCategoryType:](PHSearchQueryQUToken, "_isSupportedEntityCategoryType:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PHSearchQueryQUToken.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isSupportedType"));

  }
}

+ (id)entityCategoryTypeKeyForEntityTypeCategory:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  if (objc_msgSend(a1, "_isSupportedEntityCategoryType:"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    if (a3 - 1 > 0xE)
      v5 = CFSTR("PHSearchEntityCategoryTypeUndefined");
    else
      v5 = off_1E35D5EC0[a3 - 1];
    v7 = v5;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)isGenericLocation:(id)a3
{
  id v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  char v7;

  v3 = a3;
  v4 = CFSTR("PHSearchEntityCategoryTypeLocations");
  v5 = objc_msgSend(v3, "containsObject:", CFSTR("PHSearchEntityCategoryTypeLocations"));

  v6 = CFSTR("PHSearchEntityCategoryTypeMemoriesWhat");
  v7 = objc_msgSend(v3, "containsObject:", CFSTR("PHSearchEntityCategoryTypeMemoriesWhat"));

  return v5 & v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_isSupportedEntityCategoryType:(unint64_t)a3
{
  return a3 - 1 < 0xF;
}

+ (id)_supportedEntityCategoryTypes
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 13);
  objc_msgSend(v2, "addIndex:", 11);
  objc_msgSend(v2, "addIndex:", 5);
  objc_msgSend(v2, "addIndex:", 6);
  objc_msgSend(v2, "addIndex:", 7);
  objc_msgSend(v2, "addIndex:", 12);
  objc_msgSend(v2, "addIndex:", 8);
  objc_msgSend(v2, "addIndex:", 10);
  objc_msgSend(v2, "addIndex:", 9);
  objc_msgSend(v2, "addIndex:", 14);
  objc_msgSend(v2, "addIndex:", 15);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

@end
