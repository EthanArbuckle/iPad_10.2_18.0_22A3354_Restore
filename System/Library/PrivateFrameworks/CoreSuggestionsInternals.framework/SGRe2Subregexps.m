@implementation SGRe2Subregexps

- (SGRe2Subregexps)initWithSubregexps:(id)a3 prefilter:(id)a4
{
  id v7;
  id v8;
  SGRe2Subregexps *v9;
  uint64_t v10;
  NSArray *subregexps;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRe2.mm"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subregexps"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SGRe2Subregexps;
  v9 = -[SGRe2Subregexps init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    subregexps = v9->_subregexps;
    v9->_subregexps = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_prefilter, a4);
  }

  return v9;
}

- (id)existsInUtf8:(const char *)a3
{
  SGRe2PrefilterTree *prefilter;
  void *v6;
  id v7;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    prefilter = self->_prefilter;
    if (prefilter)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__29392;
      v23 = __Block_byref_object_dispose__29393;
      v24 = 0;
      -[SGRe2PrefilterTree regexpIdsThatMightMatchUtf8:](prefilter, "regexpIdsThatMightMatchUtf8:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __32__SGRe2Subregexps_existsInUtf8___block_invoke;
      v18[3] = &unk_1E7DB4E38;
      v18[5] = &v19;
      v18[6] = a3;
      v18[4] = self;
      objc_msgSend(v6, "enumerateIndexesUsingBlock:", v18);

      v7 = (id)v20[5];
      _Block_object_dispose(&v19, 8);

      return v7;
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_subregexps;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "existsInUtf8:", a3, (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {

            return v13;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  return 0;
}

- (id)matchesUtf8:(const char *)a3
{
  SGRe2PrefilterTree *prefilter;
  void *v6;
  id v7;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    prefilter = self->_prefilter;
    if (prefilter)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__29392;
      v23 = __Block_byref_object_dispose__29393;
      v24 = 0;
      -[SGRe2PrefilterTree regexpIdsThatMightMatchUtf8:](prefilter, "regexpIdsThatMightMatchUtf8:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __31__SGRe2Subregexps_matchesUtf8___block_invoke;
      v18[3] = &unk_1E7DB4E38;
      v18[5] = &v19;
      v18[6] = a3;
      v18[4] = self;
      objc_msgSend(v6, "enumerateIndexesUsingBlock:", v18);

      v7 = (id)v20[5];
      _Block_object_dispose(&v19, 8);

      return v7;
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_subregexps;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "matchesUtf8:", a3, (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {

            return v13;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  return 0;
}

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  SGRe2PrefilterTree *prefilter;
  void *v13;
  int v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  const char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  prefilter = self->_prefilter;
  if (prefilter)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    -[SGRe2PrefilterTree regexpIdsThatMightMatchUtf8:](prefilter, "regexpIdsThatMightMatchUtf8:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __68__SGRe2Subregexps__enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke;
    v24[3] = &unk_1E7DB4E60;
    v24[4] = self;
    v28 = a3;
    v25 = v10;
    v29 = a5;
    v26 = v11;
    v27 = &v30;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", v24);

    v14 = *((_DWORD *)v31 + 6);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = self->_subregexps;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v15);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "_enumerateMatchesInUtf8:fromString:ngroups:block:", a3, v10, a5, v11, (_QWORD)v20))
          {

            v14 = 0;
            goto LABEL_13;
          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
        if (v16)
          continue;
        break;
      }
    }

    v14 = 1;
  }
LABEL_13:

  return v14;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSArray _pas_componentsJoinedByString:](self->_subregexps, "_pas_componentsJoinedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<RE2 %@>"), v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefilter, 0);
  objc_storeStrong((id *)&self->_subregexps, 0);
}

void __68__SGRe2Subregexps__enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_enumerateMatchesInUtf8:fromString:ngroups:block:", a1[8], a1[5], a1[9], a1[6]);

  if (!v6)
  {
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __31__SGRe2Subregexps_matchesUtf8___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchesUtf8:", a1[6]);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v6 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
    v6 = obj;
    *a3 = 1;
  }

}

void __32__SGRe2Subregexps_existsInUtf8___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existsInUtf8:", a1[6]);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v6 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
    v6 = obj;
    *a3 = 1;
  }

}

@end
