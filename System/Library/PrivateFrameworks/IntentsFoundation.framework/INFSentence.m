@implementation INFSentence

- (INFSentence)init
{
  INFSentence *v2;
  INFSentence *v3;
  NSString *identifier;
  NSString *format;
  uint64_t v6;
  NSMutableDictionary *relationships;
  uint64_t v8;
  NSMutableDictionary *placeholdersToTokens;
  NSSet *placeholders;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)INFSentence;
  v2 = -[INFSentence init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1E9778A78;

    format = v3->_format;
    v3->_format = (NSString *)&stru_1E9778A78;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    relationships = v3->_relationships;
    v3->_relationships = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    placeholdersToTokens = v3->_placeholdersToTokens;
    v3->_placeholdersToTokens = (NSMutableDictionary *)v8;

    placeholders = v3->_placeholders;
    v3->_placeholders = 0;

  }
  return v3;
}

- (INFSentence)initWithIdentifier:(id)a3
{
  id v4;
  INFSentence *v5;
  uint64_t v6;
  NSString *identifier;

  v4 = a3;
  v5 = -[INFSentence init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (INFSentence)initWithDictionary:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  INFSentence *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  NSString *format;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *relationships;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *placeholdersToTokens;

  v6 = a3;
  v7 = a4;
  v8 = -[INFSentence init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCSentenceFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    format = v8->_format;
    v8->_format = (NSString *)v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCSentenceRelationships"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "mutableCopy");
    relationships = v8->_relationships;
    v8->_relationships = (NSMutableDictionary *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCSentencePlaceholders"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCSentencePlaceholders"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "mutableCopy");
      placeholdersToTokens = v8->_placeholdersToTokens;
      v8->_placeholdersToTokens = (NSMutableDictionary *)v19;

    }
  }

  return v8;
}

- (NSSet)placeholders
{
  NSSet *placeholders;

  placeholders = self->_placeholders;
  if (!placeholders)
  {
    -[INFSentence generatePlaceholders](self, "generatePlaceholders");
    placeholders = self->_placeholders;
  }
  return placeholders;
}

- (void)generatePlaceholders
{
  void *v3;
  void *v4;
  void *v5;
  NSString *format;
  uint64_t v7;
  NSSet *v8;
  NSSet *placeholders;
  NSSet *v10;
  id v11;
  _QWORD v12[5];
  NSSet *v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB38E8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%#@%@@"), CFSTR("([a-zA-Z0-9\\-_]+)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regularExpressionWithPattern:options:error:", v5, 0, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  format = self->_format;
  v7 = -[NSString length](format, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__INFSentence_generatePlaceholders__block_invoke;
  v12[3] = &unk_1E9778750;
  v12[4] = self;
  v8 = v3;
  v13 = v8;
  objc_msgSend(v11, "enumerateMatchesInString:options:range:usingBlock:", format, 0, 0, v7, v12);
  placeholders = self->_placeholders;
  self->_placeholders = v8;
  v10 = v8;

}

- (void)setFormat:(id)a3
{
  NSString *v4;
  NSString *format;
  NSSet *placeholders;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  format = self->_format;
  self->_format = v4;

  placeholders = self->_placeholders;
  self->_placeholders = 0;

}

- (void)setToken:(id)a3 forPlaceholder:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_placeholdersToTokens, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setNumber:(id)a3 forPlaceholder:(id)a4
{
  void *v6;
  NSString *identifier;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  id v12;

  v6 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@"), identifier, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[INFNumber numberWithIdentifier:](INFNumber, "numberWithIdentifier:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:", v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_collection);
  objc_msgSend(WeakRetained, "addToken:", v10);

  -[INFSentence setToken:forPlaceholder:](self, "setToken:forPlaceholder:", v10, v8);
}

- (void)placeholder:(id)a3 dependsOn:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relationships, "setObject:forKeyedSubscript:", a4, a3);
}

- (void)reportCyclesIfAny
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)-[NSMutableDictionary copy](self->_relationships, "copy");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__INFSentence_reportCyclesIfAny__block_invoke;
  v4[3] = &unk_1E9778778;
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (NSString)resolvedSentence
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  INFSentence *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableDictionary *relationships;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id obj;
  id v57;
  INFSentence *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  -[INFSentence reportCyclesIfAny](self, "reportCyclesIfAny");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", self->_format);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[INFSentence collection](self, "collection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v58 = self;
  v4 = self->_placeholdersToTokens;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v73 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v58->_placeholdersToTokens, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "tokenWithIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[INFSentenceTokenWithContext sentenceResolvedTokenWithOriginalToken:placeholderName:](INFSentenceTokenWithContext, "sentenceResolvedTokenWithOriginalToken:placeholderName:", v11, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    }
    while (v6);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  v15 = v58;
  obj = v13;
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v69 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        relationships = v58->_relationships;
        objc_msgSend(v19, "placeholderName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](relationships, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(v19, "setResolved:", 1);
          objc_msgSend(v19, "originalToken");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contributingSentenceContext");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setContext:", v24);

        }
      }
      v13 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v16);
  }

  if (-[INFSentence containsUnresolvedTokens:](v58, "containsUnresolvedTokens:", v13))
  {
    do
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      -[INFSentence unresolvedInArray:](v15, "unresolvedInArray:", v13);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v65;
        v54 = *(_QWORD *)v65;
        do
        {
          v28 = 0;
          v55 = v26;
          do
          {
            if (*(_QWORD *)v65 != v27)
              objc_enumerationMutation(v57);
            v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v28);
            v30 = v15->_relationships;
            objc_msgSend(v29, "placeholderName");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableDictionary objectForKeyedSubscript:](v15->_placeholdersToTokens, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "tokenWithIdentifier:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[INFSentence concreteToken:in:](v15, "concreteToken:in:", v34, v13);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "isResolved"))
            {
              objc_msgSend(v35, "context");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "originalToken");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "contributingSentenceContext");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "combinedWithContext:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = v58;
              v26 = v55;

              v27 = v54;
              objc_msgSend(v29, "setContext:", v39);
              objc_msgSend(v29, "setResolved:", 1);

              v13 = obj;
            }

            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
        }
        while (v26);
      }

    }
    while (-[INFSentence containsUnresolvedTokens:](v15, "containsUnresolvedTokens:", v13));
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v40 = v13;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v61 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
        v46 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v45, "placeholderName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("%%#@%@@"), v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "originalToken");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "context");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringForContext:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
          objc_msgSend(v53, "replaceOccurrencesOfString:withString:options:range:", v48, v51, 0, 0, objc_msgSend(v53, "length"));

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    }
    while (v42);
  }

  return (NSString *)v53;
}

- (BOOL)containsUnresolvedTokens:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__INFSentence_containsUnresolvedTokens___block_invoke;
  v6[3] = &unk_1E97787A0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)unresolvedInArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isResolved", (_QWORD)v12) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)concreteToken:(id)a3 in:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "originalToken", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)filteredPlaceholders
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  INFGrammarCollection **p_collection;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  char isKindOfClass;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_placeholdersToTokens, "mutableCopy");
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    p_collection = &self->_collection;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)p_collection);
        objc_msgSend(WeakRetained, "tokenWithIdentifier:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_format, CFSTR("LOCSentenceFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_relationships, CFSTR("LOCSentenceRelationships"));
  -[INFSentence filteredPlaceholders](self, "filteredPlaceholders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("LOCSentencePlaceholders"));

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)format
{
  return self->_format;
}

- (void)setPlaceholders:(id)a3
{
  objc_storeStrong((id *)&self->_placeholders, a3);
}

- (NSMutableDictionary)relationships
{
  return self->_relationships;
}

- (void)setRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_relationships, a3);
}

- (NSMutableDictionary)placeholdersToTokens
{
  return self->_placeholdersToTokens;
}

- (void)setPlaceholdersToTokens:(id)a3
{
  objc_storeStrong((id *)&self->_placeholdersToTokens, a3);
}

- (INFGrammarCollection)collection
{
  return (INFGrammarCollection *)objc_loadWeakRetained((id *)&self->_collection);
}

- (void)setCollection:(id)a3
{
  objc_storeWeak((id *)&self->_collection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collection);
  objc_storeStrong((id *)&self->_placeholdersToTokens, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_placeholders, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __40__INFSentence_containsUnresolvedTokens___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isResolved");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __32__INFSentence_reportCyclesIfAny__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v15);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v15;
  if (v5)
  {
    v7 = *MEMORY[0x1E0C99768];
    v8 = MEMORY[0x1E0C9AAB0];
    v9 = v15;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "raise:format:", v7, CFSTR("Cycle detected when reaching %@ from %@"), v13, v9);

      }
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v6);
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v6;
    }
    while (v14);
  }

}

void __35__INFSentence_generatePlaceholders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v10 = v3;
    v4 = (unint64_t)objc_msgSend(v3, "numberOfRanges") >= 2;
    v3 = v10;
    if (v4)
    {
      v5 = objc_msgSend(v10, "rangeAtIndex:", 1);
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 32), "format");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "substringWithRange:", v5, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      v3 = v10;
    }
  }

}

+ (id)sentenceWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

@end
