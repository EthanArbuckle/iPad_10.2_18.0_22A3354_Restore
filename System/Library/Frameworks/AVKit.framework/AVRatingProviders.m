@implementation AVRatingProviders

- (AVRatingProviders)init
{

  return 0;
}

- (AVRatingProviders)initWithFileURL:(id)a3
{
  id v4;
  AVRatingProviders *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSDictionary *plist;
  AVRatingProviders *v29;
  const char *v30;
  NSObject *v31;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AVRatingProviders;
  v5 = -[AVRatingProviders init](&v34, sel_init);
  if (!v5)
    goto LABEL_24;
  if (!v4)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "expected fileURL", buf, 2u);
    }

  }
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = v33;
  if (!v11)
  {
    _AVLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[AVRatingProviders initWithFileURL:]";
      v37 = 2114;
      v38 = v4;
      v39 = 2114;
      v40 = v12;
      _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to read %{public}@: %{public}@", buf, 0x20u);
    }
    goto LABEL_44;
  }
  if (MGGetBoolAnswer())
  {
    -[NSDictionary allKeys](v11, "allKeys");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v13, "count")
      || (-[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "length"),
          v14,
          v15 != 2))
    {
      _AVLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[AVRatingProviders initWithFileURL:]";
        _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "%s error: keys of root dictionary should be country codes", buf, 0xCu);
      }
      goto LABEL_43;
    }
    -[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("ratingMovies"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("ratingMovies"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("ratingMovies"));
          v21 = objc_claimAutoreleasedReturnValue();
          -[NSObject firstObject](v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v23 = objc_opt_isKindOfClass();

          if ((v23 & 1) != 0)
          {
            -[NSObject firstObject](v21, "firstObject");
            v24 = objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", CFSTR("rank"));
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", CFSTR("rating"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {

                goto LABEL_23;
              }
            }
            _AVLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v36 = "-[AVRatingProviders initWithFileURL:]";
              _os_log_impl(&dword_1AC4B1000, v31, OS_LOG_TYPE_DEFAULT, "%s error: expect ratingMovies elements to have 'rank' and 'rating' keys", buf, 0xCu);
            }

          }
          else
          {
            _AVLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v36 = "-[AVRatingProviders initWithFileURL:]";
              _os_log_impl(&dword_1AC4B1000, v24, OS_LOG_TYPE_DEFAULT, "%s error: expect ratingMovies elements to be dictionaries", buf, 0xCu);
            }
          }

          goto LABEL_42;
        }
        _AVLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "-[AVRatingProviders initWithFileURL:]";
          v30 = "%s error: expect ratingMovies to be an array";
          goto LABEL_35;
        }
LABEL_42:

LABEL_43:
LABEL_44:

        v29 = 0;
        goto LABEL_45;
      }
      _AVLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_42;
      *(_DWORD *)buf = 136315138;
      v36 = "-[AVRatingProviders initWithFileURL:]";
      v30 = "%s error: expect value dictionaries to have 'ratingMovies' at least";
    }
    else
    {
      _AVLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_42;
      *(_DWORD *)buf = 136315138;
      v36 = "-[AVRatingProviders initWithFileURL:]";
      v30 = "%s error: expect root values to be dictionaries";
    }
LABEL_35:
    _os_log_impl(&dword_1AC4B1000, v21, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
    goto LABEL_42;
  }
LABEL_23:
  plist = v5->_plist;
  v5->_plist = v11;

LABEL_24:
  v29 = v5;
LABEL_45:

  return v29;
}

- (void)_loadRatingsMaps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *mapForMovies;
  uint64_t v23;
  NSDictionary *mapForTVShows;
  id obj;
  uint64_t v26;
  AVRatingProviders *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Movies"), CFSTR("domain"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("TVShows"), CFSTR("domain"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v27 = self;
  -[AVRatingProviders plist](self, "plist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v38;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
        -[AVRatingProviders plist](v27, "plist");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ratingMovies"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v34;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v34 != v14)
                objc_enumerationMutation(v11);
              _MakeReverseDictionaryForRatingDictionary(v8, *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15++), v3);
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v13);
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ratingTVShows"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              _MakeReverseDictionaryForRatingDictionary(v8, *(void **)(*((_QWORD *)&v29 + 1) + 8 * v20++), v4);
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v18);
        }

        ++v7;
      }
      while (v7 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v28);
  }

  v21 = objc_msgSend(v3, "copy");
  mapForMovies = v27->_mapForMovies;
  v27->_mapForMovies = (NSDictionary *)v21;

  v23 = objc_msgSend(v4, "copy");
  mapForTVShows = v27->_mapForTVShows;
  v27->_mapForTVShows = (NSDictionary *)v23;

}

- (void)_loadRatingMapsIfNeeded
{
  if (!self->_mapForTVShows)
    -[AVRatingProviders _loadRatingsMaps](self, "_loadRatingsMaps");
}

- (id)_movieMapForRating:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AVRatingProviders _loadRatingMapsIfNeeded](self, "_loadRatingMapsIfNeeded");
  -[AVRatingProviders mapForMovies](self, "mapForMovies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _KeyForRating(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_tvShowsMapForRating:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AVRatingProviders _loadRatingMapsIfNeeded](self, "_loadRatingMapsIfNeeded");
  -[AVRatingProviders mapForTVShows](self, "mapForTVShows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _KeyForRating(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)findRatingString:(id)a3 domain:(int64_t)a4 country:(id)a5 shouldPreferTVDomain:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v39;
  __CFString *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[4];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  __CFString *v53;
  __int16 v54;
  __CFString *v55;
  uint64_t v56;

  v6 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a5;
  -[AVRatingProviders _movieMapForRating:](self, "_movieMapForRating:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  -[AVRatingProviders _tvShowsMapForRating:](self, "_tvShowsMapForRating:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 | v13)
  {
    v41 = v10;
    +[AVMediaContentRating contentRestrictionsCountryCode](AVMediaContentRating, "contentRestrictionsCountryCode");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "countryCode");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = &stru_1E5BB5F88;
    v39 = (void *)v16;
    v40 = v11;
    if (v11)
      v18 = v11;
    else
      v18 = &stru_1E5BB5F88;
    if (v14)
      v19 = (const __CFString *)v14;
    else
      v19 = &stru_1E5BB5F88;
    v47[0] = v18;
    v47[1] = v19;
    if (v16)
      v17 = (const __CFString *)v16;
    v47[2] = v17;
    v47[3] = CFSTR("US");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (objc_msgSend(v25, "length"))
          {
            _bestMatch((void *)v12, (void *)v13, v25, a4, v6);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v30 = v26;
              v33 = v20;
              v35 = v30;
              goto LABEL_33;
            }
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v22)
          continue;
        break;
      }
    }

    v27 = (void *)MEMORY[0x1E0C99E20];
    if (v12)
      v28 = (void *)v12;
    else
      v28 = (void *)MEMORY[0x1E0C9AA70];
    objc_msgSend(v28, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend((id)v13, "allKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObjectsFromArray:", v31);

    }
    objc_msgSend(v30, "removeObject:", CFSTR("ratingString"));
    objc_msgSend(v30, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(v33, "sortUsingSelector:", sel_compare_);
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _bestMatch((void *)v12, (void *)v13, v34, a4, v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
    v11 = v40;
    v10 = v41;
  }
  else
  {
    _AVLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v36 = CFSTR("Unknown");
      if (a4 == 1)
        v36 = CFSTR("Movies");
      if (a4 == 2)
        v36 = CFSTR("TVShows");
      v37 = v36;
      *(_DWORD *)buf = 136315906;
      v49 = "-[AVRatingProviders findRatingString:domain:country:shouldPreferTVDomain:]";
      v50 = 2114;
      v51 = v10;
      v52 = 2114;
      v53 = v37;
      v54 = 2114;
      v55 = v11;
      _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s * There is no rating that matches '%{public}@' (%{public}@, %{public}@)", buf, 0x2Au);

    }
    v35 = 0;
  }

  return v35;
}

- (id)findRatingString:(id)a3
{
  return -[AVRatingProviders findRatingString:domain:country:shouldPreferTVDomain:](self, "findRatingString:domain:country:shouldPreferTVDomain:", a3, 0, 0, 0);
}

- (NSDictionary)plist
{
  return self->_plist;
}

- (void)setPlist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)mapForMovies
{
  return self->_mapForMovies;
}

- (NSDictionary)mapForTVShows
{
  return self->_mapForTVShows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapForTVShows, 0);
  objc_storeStrong((id *)&self->_mapForMovies, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

+ (id)ratingProvidersWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  AVBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileURL:", v6);
  return v7;
}

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AVRatingProviders_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken_13998 != -1)
    dispatch_once(&shared_onceToken_13998, block);
  return (id)shared__providers;
}

void __27__AVRatingProviders_shared__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "ratingProvidersWithName:", CFSTR("RatingProviders.plist"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)shared__providers;
  shared__providers = v1;

}

@end
