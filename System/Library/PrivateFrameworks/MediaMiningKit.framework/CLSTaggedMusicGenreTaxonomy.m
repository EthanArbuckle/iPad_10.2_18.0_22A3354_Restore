@implementation CLSTaggedMusicGenreTaxonomy

+ (id)taggedGenreForGenre:(id)a3 isExactMatch:(BOOL *)a4
{
  BOOL *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a4)
    v4 = a4;
  else
    v4 = (BOOL *)&v41;
  *v4 = 0;
  v5 = (void *)MEMORY[0x1E0D71900];
  objc_msgSend(a3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithoutDiacriticsFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_taggedMusicGenres");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    *v4 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_additionalMusicGenres");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v10 = (void *)v12;
      *v4 = 0;
    }
    else
    {
      v36 = v11;
      v13 = v7;
      objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addCharactersInString:", CFSTR("-"));
      v34 = v14;
      v35 = v13;
      objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\W"), 1, &v46);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v46;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v43 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            v24 = objc_msgSend(v23, "length");
            if (objc_msgSend(v16, "numberOfMatchesInString:options:range:", v23, 0, 0, v24) != v24)
              objc_msgSend(v17, "addObject:", v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v20);
      }

      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v25 = v17;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v38;
        v11 = v36;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v38 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
            objc_msgSend(v8, "objectForKeyedSubscript:", v30);
            v31 = objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              objc_msgSend(v36, "objectForKeyedSubscript:", v30);
              v31 = objc_claimAutoreleasedReturnValue();
              if (!v31)
                continue;
            }
            v10 = (void *)v31;
            goto LABEL_29;
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          v10 = 0;
          if (v27)
            continue;
          break;
        }
      }
      else
      {
        v10 = 0;
        v11 = v36;
      }
LABEL_29:

    }
  }

  return v10;
}

+ (id)_taggedMusicGenres
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CLSTaggedMusicGenreTaxonomy__taggedMusicGenres__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_taggedMusicGenres_onceToken != -1)
    dispatch_once(&_taggedMusicGenres_onceToken, block);
  return (id)s_taggedMusicGenres;
}

+ (id)_additionalMusicGenres
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CLSTaggedMusicGenreTaxonomy__additionalMusicGenres__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_additionalMusicGenres_onceToken != -1)
    dispatch_once(&_additionalMusicGenres_onceToken, block);
  return (id)s_additionalMusicGenres;
}

void __53__CLSTaggedMusicGenreTaxonomy__additionalMusicGenres__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  readGenresFromDictionaryInBundleWithKey(v2, CFSTR("additionalGenres"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)s_additionalMusicGenres;
  s_additionalMusicGenres = v0;

}

void __49__CLSTaggedMusicGenreTaxonomy__taggedMusicGenres__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  readGenresFromDictionaryInBundleWithKey(v2, CFSTR("taggedGenres"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)s_taggedMusicGenres;
  s_taggedMusicGenres = v0;

}

@end
