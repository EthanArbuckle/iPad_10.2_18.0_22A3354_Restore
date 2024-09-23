@implementation _CSTokenScope

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CSTokenScope)initWithTitle:(id)a3 tokenTitle:(id)a4 scopeType:(int64_t)a5
{
  id v8;
  id v9;
  _CSTokenScope *v10;
  _CSTokenScope *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CSTokenScope;
  v10 = -[_CSTokenScope init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[_CSTokenScope setTitle:](v10, "setTitle:", v8);
    -[_CSTokenScope setTokenTitle:](v11, "setTokenTitle:", v9);
    -[_CSTokenScope setScopeType:](v11, "setScopeType:", a5);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSTokenScope setQueryTemplates:](v11, "setQueryTemplates:", v12);

  }
  return v11;
}

- (_CSTokenScope)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _CSTokenScope *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("tokenTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scopeType"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("queryTemplates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_CSTokenScope initWithTitle:tokenTitle:scopeType:](self, "initWithTitle:tokenTitle:scopeType:", v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSTokenScope setQueryTemplates:](v9, "setQueryTemplates:", v10);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_CSTokenScope title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[_CSTokenScope tokenTitle](self, "tokenTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tokenTitle"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_CSTokenScope scopeType](self, "scopeType"), CFSTR("scopeType"));
  -[_CSTokenScope queryTemplates](self, "queryTemplates");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("queryTemplates"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _CSTokenScope *v4;
  void *v5;
  void *v6;
  _CSTokenScope *v7;
  void *v8;
  void *v9;

  v4 = [_CSTokenScope alloc];
  -[_CSTokenScope title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSTokenScope tokenTitle](self, "tokenTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_CSTokenScope initWithTitle:tokenTitle:scopeType:](v4, "initWithTitle:tokenTitle:scopeType:", v5, v6, -[_CSTokenScope scopeType](self, "scopeType"));

  -[_CSTokenScope queryTemplates](self, "queryTemplates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[_CSTokenScope setQueryTemplates:](v7, "setQueryTemplates:", v9);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _CSTokenScope *v4;
  BOOL v5;

  v4 = (_CSTokenScope *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_CSTokenScope isEqualToTokenScope:](self, "isEqualToTokenScope:", v4);
  }

  return v5;
}

- (BOOL)isEqualToTokenScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  BOOL v15;

  v4 = a3;
  -[_CSTokenScope queryTemplates](self, "queryTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToSet:", v6);

  if (!v7)
    goto LABEL_5;
  -[_CSTokenScope title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_5;
  -[_CSTokenScope tokenTitle](self, "tokenTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    v14 = -[_CSTokenScope scopeType](self, "scopeType");
    v15 = v14 == objc_msgSend(v4, "scopeType");
  }
  else
  {
LABEL_5:
    v15 = 0;
  }

  return v15;
}

- (void)addQueryTemplate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CSTokenScope queryTemplates](self, "queryTemplates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addQueryAttributes:(id)a3
{
  -[_CSTokenScope addQueryAttributes:modifier:](self, "addQueryAttributes:modifier:", a3, 0);
}

- (void)addQueryAttributes:(id)a3 modifier:(id)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = -[__CFString length](v7, "length");
  v9 = CFSTR("cwdx{modifier}");
  if (v8)
    v9 = v7;
  v10 = v9;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"{handle}*\"%@"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), v10, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CSTokenScope addQueryTemplate:](self, "addQueryTemplate:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)queryForHandles:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v33;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        v27 = v5;
        v6 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v5);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        -[_CSTokenScope queryTemplates](self, "queryTemplates");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v13);

              if (v14 == 0x7FFFFFFFFFFFFFFFLL)
                v15 = &stru_1E2406B38;
              else
                v15 = CFSTR("t");
              objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{modifier}"), v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{handle}"), v6);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v17);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v9);
        }

        v5 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" || "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("(%@)"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)scopesFromCSTokenScopes:(id)a3 displayString:(id)a4 handles:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        v26[0] = CFSTR("TOKEN");
        objc_msgSend(v15, "tokenTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v16;
        v27[1] = v8;
        v26[1] = CFSTR("TEXT");
        v26[2] = CFSTR("QUERY");
        objc_msgSend(v15, "queryForHandles:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = v17;
        v26[3] = CFSTR("TYPE");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "scopeType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27[3] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v19);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v12);
  }

  return v10;
}

+ (id)tokenScopesForPerson
{
  return (id)objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:modifiers:", &unk_1E242F3D0, &unk_1E242F3E8, &unk_1E242F400, &unk_1E242F460, &unk_1E242F478);
}

+ (id)tokenScopesForSenderContains
{
  return (id)objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:modifiers:", &unk_1E242F490, &unk_1E242F4A8, &unk_1E242F4C0, &unk_1E242F520, &unk_1E242F538);
}

+ (id)tokenScopesForSubjectContains
{
  return (id)objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:", &unk_1E242F550, &unk_1E242F568, &unk_1E242F580, &unk_1E242F5C8);
}

+ (id)tokenScopesForAttachmentNameContains
{
  return (id)objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:", &unk_1E242F5E0, &unk_1E242F5F8, &unk_1E242F610, &unk_1E242F658);
}

+ (id)tokenScopesForAttachmentType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:", &unk_1E242F670, &unk_1E242F688, &unk_1E242F6A0, &unk_1E242F6E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"*{handle}\"cwdx{modifier}"), CFSTR("kMDItemAttachmentTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryTemplates:", v4);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

+ (id)tokenScopesForMessageWithAttachments
{
  return (id)objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:", &unk_1E242F700, &unk_1E242F718, &unk_1E242F730, &unk_1E242F760);
}

+ (id)tokenScopesForAllTokens
{
  return (id)objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:", &unk_1E242F778, &unk_1E242F790, &unk_1E242F7A8, &unk_1E242F838);
}

+ (id)tokenScopesWithTitles:(id)a3 tokenTitles:(id)a4 scopeTypes:(id)a5 queryAttributesList:(id)a6
{
  return (id)objc_msgSend(a1, "tokenScopesWithTitles:tokenTitles:scopeTypes:queryAttributesList:modifiers:", a3, a4, a5, a6, 0);
}

+ (id)tokenScopesWithTitles:(id)a3 tokenTitles:(id)a4 scopeTypes:(id)a5 queryAttributesList:(id)a6 modifiers:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0C99DE8];
  v16 = a3;
  objc_msgSend(v15, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92___CSTokenScope_tokenScopesWithTitles_tokenTitles_scopeTypes_queryAttributesList_modifiers___block_invoke;
  v25[3] = &unk_1E2401820;
  v26 = v11;
  v27 = v12;
  v28 = v14;
  v29 = v13;
  v30 = v17;
  v18 = v17;
  v19 = v13;
  v20 = v14;
  v21 = v12;
  v22 = v11;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v25);

  v23 = (void *)objc_msgSend(v18, "copy");
  return v23;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)tokenTitle
{
  return self->_tokenTitle;
}

- (void)setTokenTitle:(id)a3
{
  objc_storeStrong((id *)&self->_tokenTitle, a3);
}

- (int64_t)scopeType
{
  return self->_scopeType;
}

- (void)setScopeType:(int64_t)a3
{
  self->_scopeType = a3;
}

- (NSMutableSet)queryTemplates
{
  return self->_queryTemplates;
}

- (void)setQueryTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_queryTemplates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryTemplates, 0);
  objc_storeStrong((id *)&self->_tokenTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
