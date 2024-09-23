@implementation MapsSuggestionsEntry

- (BOOL)updateUndecoratedTitle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      v13 = 1024;
      v14 = 97;
      v15 = 2082;
      v16 = "-[MapsSuggestionsEntry(BusinessLogic) updateUndecoratedTitle:]";
      v17 = 2082;
      v18 = "nil == (undecoratedTitle)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a title", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_7;
  }
  -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(v4, "copy");
  -[MapsSuggestionsEntry setUndecoratedTitle:](self, "setUndecoratedTitle:", v7);

  v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)updateUndecoratedSubtitle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      v13 = 1024;
      v14 = 108;
      v15 = 2082;
      v16 = "-[MapsSuggestionsEntry(BusinessLogic) updateUndecoratedSubtitle:]";
      v17 = 2082;
      v18 = "nil == (undecoratedSubtitle)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a subtitle", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_7;
  }
  -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(v4, "copy");
  -[MapsSuggestionsEntry setUndecoratedSubtitle:](self, "setUndecoratedSubtitle:", v7);

  v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)startsBeforeEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      v13 = 1024;
      v14 = 129;
      v15 = 2082;
      v16 = "-[MapsSuggestionsEntry(BusinessLogic) startsBeforeEntry:]";
      v17 = 2082;
      v18 = "nil == (otherEntry)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires another suggestions entry", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_8;
  }
  if (!-[MapsSuggestionsEntry hasStartTime](self, "hasStartTime") || !objc_msgSend(v4, "hasStartTime"))
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  -[MapsSuggestionsEntry startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7 < 0.0;

LABEL_9:
  return v8;
}

- (BOOL)expiresBeforeEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      v16 = 1024;
      v17 = 140;
      v18 = 2082;
      v19 = "-[MapsSuggestionsEntry(BusinessLogic) expiresBeforeEntry:]";
      v20 = 2082;
      v21 = "nil == (otherEntry)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires another suggestion entry", (uint8_t *)&v14, 0x26u);
    }

LABEL_8:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "expires");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v11 = 1;
    goto LABEL_10;
  }
  -[MapsSuggestionsEntry expires](self, "expires");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_8;
  -[MapsSuggestionsEntry expires](self, "expires");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expires");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10 < 0.0;

LABEL_10:
  return v11;
}

- (void)mergeFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4
{
  uint64_t v4;

  LOWORD(v4) = 0;
  -[MapsSuggestionsEntry mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:](self, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", a3, a4, 0, 1, 0, 0, v4);
}

- (void)mergeFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4 protectTitles:(BOOL)a5 protectTitleDecorations:(BOOL)a6 protectMapItem:(BOOL)a7 protectWeight:(BOOL)a8 protectExpiration:(BOOL)a9 protectIcon:(BOOL)a10
{
  uint64_t v12;
  uint64_t v13;
  MapsSuggestionsEntry *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  MapsSuggestionsEntry *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  MapsSuggestionsEntry *v38;
  MapsSuggestionsEntry *v39;
  void *v40;
  NSObject *v41;
  _BOOL8 v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  double v60;
  double v61;
  double v62;
  MapsSuggestionsEntry *v63;
  int64_t v64;
  MapsSuggestionsEntry *v65;
  MapsSuggestionsEntry *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  _BOOL8 v70;
  MapsSuggestionsEntry *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  BOOL v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  const char *v94;
  uint64_t v95;

  v12 = a6;
  v13 = a5;
  v95 = *MEMORY[0x1E0C80C00];
  v16 = (MapsSuggestionsEntry *)a3;
  if (!v16)
  {
    GEOFindOrCreateLog();
    v24 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      v89 = 1024;
      v90 = 178;
      v91 = 2082;
      v92 = "-[MapsSuggestionsEntry(BusinessLogic) mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecoration"
            "s:protectMapItem:protectWeight:protectExpiration:protectIcon:]";
      v93 = 2082;
      v94 = "nil == (otherEntry)";
      v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an other suggestions entry";
LABEL_45:
      _os_log_impl(&dword_1A427D000, &v24->super, OS_LOG_TYPE_ERROR, v25, buf, 0x26u);
    }
LABEL_113:

    goto LABEL_114;
  }
  if (!-[MapsSuggestionsEntry isEqualToEntry:](self, "isEqualToEntry:", v16))
  {
    v17 = a9;
    if (a4)
    {
      if (a4 == 1)
      {
        if ((v13 & 1) != 0)
          goto LABEL_69;
        -[MapsSuggestionsEntry title](self, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry undecoratedTitle](v16, "undecoratedTitle");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
          goto LABEL_8;
        v20 = (void *)v19;
        -[MapsSuggestionsEntry undecoratedTitle](v16, "undecoratedTitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if ((v23 & 1) == 0)
        {
          -[MapsSuggestionsEntry undecoratedTitle](v16, "undecoratedTitle");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setUndecoratedTitle:](self, "setUndecoratedTitle:", v43);

        }
        else
        {
LABEL_8:
          if ((v12 & 1) != 0)
            goto LABEL_56;
        }
        -[MapsSuggestionsEntry title](v16, "title");
        v44 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v44;
LABEL_56:
        if (v18)
        {
          -[MapsSuggestionsEntry title](self, "title");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v18, "isEqualToString:", v45);

          if ((v46 & 1) == 0)
            -[MapsSuggestionsEntry setTitle:](self, "setTitle:", v18);
        }

        -[MapsSuggestionsEntry subtitle](self, "subtitle");
        v13 = objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry undecoratedSubtitle](v16, "undecoratedSubtitle");
        v47 = objc_claimAutoreleasedReturnValue();
        if (!v47)
          goto LABEL_61;
        v48 = (void *)v47;
        -[MapsSuggestionsEntry undecoratedSubtitle](v16, "undecoratedSubtitle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqualToString:", v50);

        if ((v51 & 1) == 0)
        {
          -[MapsSuggestionsEntry undecoratedSubtitle](v16, "undecoratedSubtitle");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setUndecoratedSubtitle:](self, "setUndecoratedSubtitle:", v52);

        }
        else
        {
LABEL_61:
          if ((v12 & 1) != 0)
          {
LABEL_65:
            v17 = a9;
            if (v13)
            {
              -[MapsSuggestionsEntry subtitle](self, "subtitle");
              v12 = objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend((id)v13, "isEqualToString:", v12);

              if ((v53 & 1) == 0)
                -[MapsSuggestionsEntry setSubtitle:](self, "setSubtitle:", v13);
            }

LABEL_69:
            if (a7)
              goto LABEL_84;
            -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54)
            {
              -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
              v12 = objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry geoMapItem](v16, "geoMapItem");
              v13 = objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend((id)v12, "isEqual:", v13) & 1) == 0)
              {

                goto LABEL_80;
              }
              v86 = v17;
            }
            else
            {
              v86 = v17;
            }
            -[MapsSuggestionsEntry geoMapItem](v16, "geoMapItem");
            v55 = objc_claimAutoreleasedReturnValue();
            if (!v55)
            {
              v17 = v86;
              if (!v54)
                goto LABEL_84;

              goto LABEL_83;
            }
            v56 = (void *)v55;
            -[MapsSuggestionsEntry geoMapItem](v16, "geoMapItem");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v57, "isEqual:", v58);

            if (v54)
            {

            }
            v17 = v86;
            if ((v59 & 1) != 0)
            {
LABEL_84:
              if (!a8)
              {
                -[MapsSuggestionsEntry weight](self, "weight");
                v61 = v60;
                -[MapsSuggestionsEntry weight](v16, "weight");
                if (v61 <= v62)
                  v63 = v16;
                else
                  v63 = self;
                -[MapsSuggestionsEntry weight](v63, "weight");
                -[MapsSuggestionsEntry setWeight:](self, "setWeight:");
              }
              v64 = -[MapsSuggestionsEntry type](self, "type");
              if (v64 != -[MapsSuggestionsEntry type](v16, "type"))
                -[MapsSuggestionsEntry _overrideType:](self, "_overrideType:", -[MapsSuggestionsEntry type](v16, "type"));
              if (v17)
                goto LABEL_100;
              v65 = self;
              v66 = v16;
              if (!v65)
              {
                GEOFindOrCreateLog();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
                  v89 = 1024;
                  v90 = 51;
                  v91 = 2082;
                  v92 = "NSDate *_mergeExpirationOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
                  v93 = 2082;
                  v94 = "nil == (a)";
                  _os_log_impl(&dword_1A427D000, v68, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry A", buf, 0x26u);
                }

                v67 = 0;
                goto LABEL_99;
              }
              if (-[MapsSuggestionsEntry deleted](v65, "deleted") || -[MapsSuggestionsEntry deleted](v66, "deleted"))
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_99:

                -[MapsSuggestionsEntry setExpires:](v65, "setExpires:", v67);
LABEL_100:
                if (!a10)
                {
                  -[MapsSuggestionsEntry iconData](v16, "iconData");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MapsSuggestionsEntry setIconData:](self, "setIconData:", v69);

                }
                v70 = -[MapsSuggestionsEntry deleted](v16, "deleted")
                   || -[MapsSuggestionsEntry deleted](self, "deleted");
                -[MapsSuggestionsEntry setDeleted:](self, "setDeleted:", v70);
                -[MapsSuggestionsEntry mergeSpecificsFromSuggestionEntry:behavior:](self, "mergeSpecificsFromSuggestionEntry:behavior:", v16, 1);
                v24 = self;
                v71 = v16;
                if (v24)
                {
                  -[MapsSuggestionsEntry originatingSourceName](v24, "originatingSourceName");
                  v72 = objc_claimAutoreleasedReturnValue();
                  -[MapsSuggestionsEntry originatingSourceName](v71, "originatingSourceName");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v72 && (-[NSObject isEqualToString:](v72, "isEqualToString:", v73) & 1) == 0)
                    -[MapsSuggestionsEntry setString:forKey:](v24, "setString:forKey:", v73, CFSTR("MapsSuggestionsNewSourceKey"));

                }
                else
                {
                  GEOFindOrCreateLog();
                  v72 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446978;
                    v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
                    v89 = 1024;
                    v90 = 81;
                    v91 = 2082;
                    v92 = "void _mergeOriginsOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
                    v93 = 2082;
                    v94 = "nil == (oriEntry)";
                    _os_log_impl(&dword_1A427D000, v72, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion oriEntry", buf, 0x26u);
                  }
                }

                goto LABEL_113;
              }
              -[MapsSuggestionsEntry expires](v65, "expires");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (v75)
              {

              }
              else
              {
                -[MapsSuggestionsEntry expires](v66, "expires");
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v67)
                  goto LABEL_99;
              }
              -[MapsSuggestionsEntry expires](v65, "expires");
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              -[MapsSuggestionsEntry expires](v66, "expires");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v82;
              if (v81)
              {

                -[MapsSuggestionsEntry expires](v65, "expires");
                v83 = objc_claimAutoreleasedReturnValue();
                v84 = (void *)v83;
                if (v67)
                {
                  -[MapsSuggestionsEntry expires](v66, "expires");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "laterDate:", v85);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v67 = (void *)v83;
                }
              }
              goto LABEL_99;
            }
LABEL_80:
            -[MapsSuggestionsEntry geoMapItem](v16, "geoMapItem");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setGeoMapItem:](self, "setGeoMapItem:", v54);
LABEL_83:

            goto LABEL_84;
          }
        }
        -[MapsSuggestionsEntry subtitle](v16, "subtitle");
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = v12;
        goto LABEL_65;
      }
      GEOFindOrCreateLog();
      v24 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
        v89 = 1024;
        v90 = 257;
        v91 = 2082;
        v92 = "-[MapsSuggestionsEntry(BusinessLogic) mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorati"
              "ons:protectMapItem:protectWeight:protectExpiration:protectIcon:]";
        v93 = 2082;
        v94 = "YES";
        v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMergeBehavior!";
        goto LABEL_45;
      }
      goto LABEL_113;
    }
    if ((v13 & 1) != 0)
      goto LABEL_29;
    -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      -[MapsSuggestionsEntry undecoratedTitle](v16, "undecoratedTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_17;
      -[MapsSuggestionsEntry undecoratedTitle](v16, "undecoratedTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setUndecoratedTitle:](self, "setUndecoratedTitle:", v26);
    }

LABEL_17:
    -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      -[MapsSuggestionsEntry undecoratedSubtitle](v16, "undecoratedSubtitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        goto LABEL_21;
      -[MapsSuggestionsEntry undecoratedSubtitle](v16, "undecoratedSubtitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setUndecoratedSubtitle:](self, "setUndecoratedSubtitle:", v28);
    }

LABEL_21:
    -[MapsSuggestionsEntry title](self, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      -[MapsSuggestionsEntry title](v16, "title");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
LABEL_25:
        -[MapsSuggestionsEntry subtitle](self, "subtitle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          -[MapsSuggestionsEntry subtitle](v16, "subtitle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
            goto LABEL_29;
          -[MapsSuggestionsEntry subtitle](v16, "subtitle");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry setSubtitle:](self, "setSubtitle:", v32);
        }

LABEL_29:
        if (!a7)
        {
          -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
LABEL_33:

            goto LABEL_34;
          }
          -[MapsSuggestionsEntry geoMapItem](v16, "geoMapItem");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            -[MapsSuggestionsEntry geoMapItem](v16, "geoMapItem");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setGeoMapItem:](self, "setGeoMapItem:", v34);
            goto LABEL_33;
          }
        }
LABEL_34:
        if (!a8)
        {
          -[MapsSuggestionsEntry weight](self, "weight");
          if (v36 == 0.0)
          {
            -[MapsSuggestionsEntry weight](v16, "weight");
            if (v37 != 0.0)
            {
              -[MapsSuggestionsEntry weight](v16, "weight");
              -[MapsSuggestionsEntry setWeight:](self, "setWeight:");
            }
          }
        }
        if (a9)
          goto LABEL_50;
        v38 = self;
        v39 = v16;
        if (!v38)
        {
          GEOFindOrCreateLog();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
            v89 = 1024;
            v90 = 51;
            v91 = 2082;
            v92 = "NSDate *_mergeExpirationOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
            v93 = 2082;
            v94 = "nil == (a)";
            _os_log_impl(&dword_1A427D000, v41, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry A", buf, 0x26u);
          }

          v40 = 0;
          goto LABEL_49;
        }
        if (-[MapsSuggestionsEntry deleted](v38, "deleted") || -[MapsSuggestionsEntry deleted](v39, "deleted"))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:

          -[MapsSuggestionsEntry setExpires:](v38, "setExpires:", v40);
LABEL_50:
          v42 = -[MapsSuggestionsEntry deleted](v16, "deleted") || -[MapsSuggestionsEntry deleted](self, "deleted");
          -[MapsSuggestionsEntry setDeleted:](self, "setDeleted:", v42);
          -[MapsSuggestionsEntry mergeSpecificsFromSuggestionEntry:behavior:](self, "mergeSpecificsFromSuggestionEntry:behavior:", v16, 0);
          goto LABEL_114;
        }
        -[MapsSuggestionsEntry expires](v38, "expires");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
        {

        }
        else
        {
          -[MapsSuggestionsEntry expires](v39, "expires");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
            goto LABEL_49;
        }
        -[MapsSuggestionsEntry expires](v38, "expires");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        -[MapsSuggestionsEntry expires](v39, "expires");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v77;
        if (v76)
        {

          -[MapsSuggestionsEntry expires](v38, "expires");
          v78 = objc_claimAutoreleasedReturnValue();
          v79 = (void *)v78;
          if (v40)
          {
            -[MapsSuggestionsEntry expires](v39, "expires");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "laterDate:", v80);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v40 = (void *)v78;
          }
        }
        goto LABEL_49;
      }
      -[MapsSuggestionsEntry title](v16, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry setTitle:](self, "setTitle:", v30);
    }

    goto LABEL_25;
  }
LABEL_114:

}

- (void)_selectETAFrom:(void *)a3 destinationKey:(void *)a4 otherEntry:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    MapsSuggestionsDestinationKey(a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringForKey:", CFSTR("MapsSuggestionsDestinationForETAKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      if (objc_msgSend(v9, "isEqualToString:", v7))
      {
        v12 = a1;
        v13 = v17;
LABEL_8:
        objc_msgSend(v12, "setETA:forKey:", v13, CFSTR("MapsSuggestionsETAKey"));
        goto LABEL_9;
      }
      objc_msgSend(v8, "stringForKey:", CFSTR("MapsSuggestionsDestinationForETAKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "isEqualToString:", v14);

      if (!v15)
      {
        v12 = a1;
        v13 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v8, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setETA:forKey:", v16, CFSTR("MapsSuggestionsETAKey"));

    }
LABEL_9:

  }
}

- (void)mergeSpecificsFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4
{
  id v6;
  MapsSuggestionsEntry *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v25 = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      v27 = 1024;
      v28 = 288;
      v29 = 2082;
      v30 = "-[MapsSuggestionsEntry(BusinessLogic) mergeSpecificsFromSuggestionEntry:behavior:]";
      v31 = 2082;
      v32 = "nil == (otherEntry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an other suggestions entry";
LABEL_16:
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v25, 0x26u);
    }
LABEL_17:

    goto LABEL_18;
  }
  v7 = self;
  objc_sync_enter(v7);
  -[MapsSuggestionsEntry sourceSpecificInfo](v7, "sourceSpecificInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceSpecificInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 1;
    goto LABEL_13;
  }
  -[MapsSuggestionsEntry ETAForKey:](v7, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry stringForKey:](v7, "stringForKey:", CFSTR("MapsSuggestionsDestinationForETAKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (a4 != 1)
    {
      v11 = 0;
      goto LABEL_12;
    }
    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[MapsSuggestionsEntry sourceSpecificInfo](v7, "sourceSpecificInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDictionary:", v17);

    objc_msgSend(v6, "sourceSpecificInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v19);

    v20 = (void *)objc_msgSend(v18, "mutableCopy");
    -[MapsSuggestionsEntry setSourceSpecificInfo:](v7, "setSourceSpecificInfo:", v20);

    -[MapsSuggestionsEntry _selectETAFrom:destinationKey:otherEntry:](v7, v14, v15, v6);
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "sourceSpecificInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v21, "initWithDictionary:", v22);

    -[MapsSuggestionsEntry sourceSpecificInfo](v7, "sourceSpecificInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v23);

    v24 = (void *)objc_msgSend(v18, "mutableCopy");
    -[MapsSuggestionsEntry setSourceSpecificInfo:](v7, "setSourceSpecificInfo:", v24);

    -[MapsSuggestionsEntry _selectETAFrom:destinationKey:otherEntry:](v7, v14, v15, v6);
  }

  v11 = 1;
LABEL_12:

LABEL_13:
  objc_sync_exit(v7);

  if (!v11)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v25 = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      v27 = 1024;
      v28 = 321;
      v29 = 2082;
      v30 = "-[MapsSuggestionsEntry(BusinessLogic) mergeSpecificsFromSuggestionEntry:behavior:]";
      v31 = 2082;
      v32 = "YES";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMergeBehavior!";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_18:

}

- (void)replaceByEntry:(id)a3
{
  -[MapsSuggestionsEntry replaceByEntry:forceDecoratedOverwrites:](self, "replaceByEntry:forceDecoratedOverwrites:", a3, 1);
}

- (void)replaceByEntry:(id)a3 forceDecoratedOverwrites:(BOOL)a4
{
  void *v4;
  void *v5;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  int64_t v59;
  void *v60;
  MapsSuggestionsEntry *v61;
  void *v62;
  void *v63;
  MapsSuggestionsEntry *v64;
  id v65;
  void *v66;
  void *v67;
  NSObject *v68;
  _BOOL4 v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  uint64_t v78;

  v69 = a4;
  v78 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "undecoratedTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
      {

LABEL_11:
        objc_msgSend(v7, "undecoratedTitle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry setUndecoratedTitle:](self, "setUndecoratedTitle:", v8);
LABEL_14:

        goto LABEL_15;
      }
    }
    objc_msgSend(v7, "undecoratedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "undecoratedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v8)
      {

      }
      if ((v13 & 1) == 0)
        goto LABEL_11;
    }
    else if (v8)
    {

      goto LABEL_14;
    }
LABEL_15:
    -[MapsSuggestionsEntry undecoratedTitleWhenLocked](self, "undecoratedTitleWhenLocked");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[MapsSuggestionsEntry undecoratedTitleWhenLocked](self, "undecoratedTitleWhenLocked");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "undecoratedTitleWhenLocked");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
      {

LABEL_22:
        objc_msgSend(v7, "undecoratedTitleWhenLocked");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry setUndecoratedTitleWhenLocked:](self, "setUndecoratedTitleWhenLocked:", v14);
LABEL_25:

        goto LABEL_26;
      }
    }
    objc_msgSend(v7, "undecoratedTitleWhenLocked");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v7, "undecoratedTitleWhenLocked");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry undecoratedTitleWhenLocked](self, "undecoratedTitleWhenLocked");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (v14)
      {

      }
      if ((v18 & 1) == 0)
        goto LABEL_22;
    }
    else if (v14)
    {

      goto LABEL_25;
    }
LABEL_26:
    -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "undecoratedSubtitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
      {

LABEL_33:
        objc_msgSend(v7, "undecoratedSubtitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry setUndecoratedSubtitle:](self, "setUndecoratedSubtitle:", v19);
LABEL_36:

        goto LABEL_37;
      }
    }
    objc_msgSend(v7, "undecoratedSubtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v7, "undecoratedSubtitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (v19)
      {

      }
      if ((v23 & 1) == 0)
        goto LABEL_33;
    }
    else if (v19)
    {

      goto LABEL_36;
    }
LABEL_37:
    -[MapsSuggestionsEntry undecoratedSubtitleWhenLocked](self, "undecoratedSubtitleWhenLocked");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24
      || (-[MapsSuggestionsEntry undecoratedSubtitleWhenLocked](self, "undecoratedSubtitleWhenLocked"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "undecoratedSubtitleWhenLocked"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v4, "isEqual:", v5) & 1) != 0))
    {
      objc_msgSend(v7, "undecoratedSubtitleWhenLocked");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        if (!v24)
          goto LABEL_48;

        goto LABEL_47;
      }
      objc_msgSend(v7, "undecoratedSubtitleWhenLocked");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry undecoratedSubtitleWhenLocked](self, "undecoratedSubtitleWhenLocked");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (v24)
      {

      }
      if ((v28 & 1) != 0)
      {
LABEL_48:
        if (!v69)
          goto LABEL_93;
        -[MapsSuggestionsEntry title](self, "title");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          -[MapsSuggestionsEntry title](self, "title");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "title");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqual:", v4) & 1) == 0)
          {

LABEL_56:
            objc_msgSend(v7, "title");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setTitle:](self, "setTitle:", v29);
LABEL_59:

            goto LABEL_60;
          }
        }
        objc_msgSend(v7, "title");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v7, "title");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry title](self, "title");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqual:", v32);

          if (v29)
          {

          }
          if ((v33 & 1) == 0)
            goto LABEL_56;
        }
        else if (v29)
        {

          goto LABEL_59;
        }
LABEL_60:
        -[MapsSuggestionsEntry titleWhenLocked](self, "titleWhenLocked");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          -[MapsSuggestionsEntry titleWhenLocked](self, "titleWhenLocked");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "titleWhenLocked");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqual:", v4) & 1) == 0)
          {

LABEL_67:
            objc_msgSend(v7, "titleWhenLocked");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setTitleWhenLocked:](self, "setTitleWhenLocked:", v34);
LABEL_70:

            goto LABEL_71;
          }
        }
        objc_msgSend(v7, "titleWhenLocked");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          objc_msgSend(v7, "titleWhenLocked");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry titleWhenLocked](self, "titleWhenLocked");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqual:", v37);

          if (v34)
          {

          }
          if ((v38 & 1) == 0)
            goto LABEL_67;
        }
        else if (v34)
        {

          goto LABEL_70;
        }
LABEL_71:
        -[MapsSuggestionsEntry subtitle](self, "subtitle");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39
          || (-[MapsSuggestionsEntry subtitle](self, "subtitle"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v7, "subtitle"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(v24, "isEqual:", v4) & 1) != 0))
        {
          objc_msgSend(v7, "subtitle");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v40)
          {
            if (!v39)
              goto LABEL_82;

LABEL_81:
LABEL_82:
            -[MapsSuggestionsEntry subtitleWhenLocked](self, "subtitleWhenLocked");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
            {
              -[MapsSuggestionsEntry subtitleWhenLocked](self, "subtitleWhenLocked");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "subtitleWhenLocked");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v24, "isEqual:", v4) & 1) == 0)
              {

LABEL_89:
                objc_msgSend(v7, "subtitleWhenLocked");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[MapsSuggestionsEntry setSubtitleWhenLocked:](self, "setSubtitleWhenLocked:", v44);
LABEL_92:

                goto LABEL_93;
              }
            }
            objc_msgSend(v7, "subtitleWhenLocked");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
            {
              objc_msgSend(v7, "subtitleWhenLocked");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry subtitleWhenLocked](self, "subtitleWhenLocked");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v46, "isEqual:", v47);

              if (v44)
              {

              }
              if ((v48 & 1) == 0)
                goto LABEL_89;
            }
            else if (v44)
            {

              goto LABEL_92;
            }
LABEL_93:
            -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {
              -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "geoMapItem");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v24, "isEqual:", v4) & 1) == 0)
              {

LABEL_100:
                objc_msgSend(v7, "geoMapItem");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                -[MapsSuggestionsEntry setGeoMapItem:](self, "setGeoMapItem:", v49);
LABEL_103:

                goto LABEL_104;
              }
            }
            objc_msgSend(v7, "geoMapItem");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              objc_msgSend(v7, "geoMapItem");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v51, "isEqual:", v52);

              if (v49)
              {

              }
              if ((v53 & 1) == 0)
                goto LABEL_100;
            }
            else if (v49)
            {

              goto LABEL_103;
            }
LABEL_104:
            -[MapsSuggestionsEntry expires](self, "expires");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v54
              || (-[MapsSuggestionsEntry expires](self, "expires"),
                  v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v7, "expires"),
                  v4 = (void *)objc_claimAutoreleasedReturnValue(),
                  (objc_msgSend(v24, "isEqual:", v4) & 1) != 0))
            {
              objc_msgSend(v7, "expires");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v55)
              {
                if (!v54)
                {
LABEL_115:
                  v59 = -[MapsSuggestionsEntry type](self, "type");
                  if (v59 != objc_msgSend(v7, "type"))
                    -[MapsSuggestionsEntry _overrideType:](self, "_overrideType:", objc_msgSend(v7, "type"));
                  -[MapsSuggestionsEntry setIconData:](self, "setIconData:", 0);
                  objc_msgSend(v7, "weight");
                  -[MapsSuggestionsEntry setWeight:](self, "setWeight:");
                  -[MapsSuggestionsEntry originatingSourceName](self, "originatingSourceName");
                  v9 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "originatingSourceName");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((-[NSObject isEqualToString:](v9, "isEqualToString:", v60) & 1) == 0)
                    -[MapsSuggestionsEntry setString:forKey:](self, "setString:forKey:", v60, CFSTR("MapsSuggestionsNewSourceKey"));
                  v61 = self;
                  objc_sync_enter(v61);
                  objc_msgSend(v7, "sourceSpecificInfo");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = (void *)objc_msgSend(v62, "copy");
                  -[MapsSuggestionsEntry setSourceSpecificInfo:](v61, "setSourceSpecificInfo:", v63);

                  objc_sync_exit(v61);
                  v64 = v61;
                  v65 = v7;
                  if (v64)
                  {
                    -[MapsSuggestionsEntry originatingSourceName](v64, "originatingSourceName");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "originatingSourceName");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v66 && (objc_msgSend(v66, "isEqualToString:", v67) & 1) == 0)
                      -[MapsSuggestionsEntry setString:forKey:](v64, "setString:forKey:", v67, CFSTR("MapsSuggestionsNewSourceKey"));

                  }
                  else
                  {
                    GEOFindOrCreateLog();
                    v68 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446978;
                      v71 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
                      v72 = 1024;
                      v73 = 81;
                      v74 = 2082;
                      v75 = "void _mergeOriginsOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
                      v76 = 2082;
                      v77 = "nil == (oriEntry)";
                      _os_log_impl(&dword_1A427D000, v68, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion oriEntry", buf, 0x26u);
                    }

                  }
                  goto LABEL_128;
                }

LABEL_114:
                goto LABEL_115;
              }
              objc_msgSend(v7, "expires");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              -[MapsSuggestionsEntry expires](self, "expires");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v56, "isEqual:", v57);

              if (v54)
              {

              }
              if ((v58 & 1) != 0)
                goto LABEL_115;
            }
            else
            {

            }
            objc_msgSend(v7, "expires");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsEntry setExpires:](self, "setExpires:", v54);
            goto LABEL_114;
          }
          objc_msgSend(v7, "subtitle");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[MapsSuggestionsEntry subtitle](self, "subtitle");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v41, "isEqual:", v42);

          if (v39)
          {

          }
          if ((v43 & 1) != 0)
            goto LABEL_82;
        }
        else
        {

        }
        objc_msgSend(v7, "subtitle");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[MapsSuggestionsEntry setSubtitle:](self, "setSubtitle:", v39);
        goto LABEL_81;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "undecoratedSubtitleWhenLocked");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setUndecoratedSubtitleWhenLocked:](self, "setUndecoratedSubtitleWhenLocked:", v24);
LABEL_47:

    goto LABEL_48;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v71 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
    v72 = 1024;
    v73 = 331;
    v74 = 2082;
    v75 = "-[MapsSuggestionsEntry(BusinessLogic) replaceByEntry:forceDecoratedOverwrites:]";
    v76 = 2082;
    v77 = "nil == (otherEntry)";
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an other suggestions entry", buf, 0x26u);
  }
LABEL_128:

}

- (BOOL)hasStartTime
{
  return -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
}

- (BOOL)hasEndTime
{
  return -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey"));
}

- (BOOL)hasStartAndEndTime
{
  _BOOL4 v3;

  v3 = -[MapsSuggestionsEntry hasStartTime](self, "hasStartTime");
  if (v3)
    LOBYTE(v3) = -[MapsSuggestionsEntry hasEndTime](self, "hasEndTime");
  return v3;
}

- (id)startTime
{
  return -[MapsSuggestionsEntry dateForKey:](self, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
}

- (id)endTime
{
  return -[MapsSuggestionsEntry dateForKey:](self, "dateForKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey"));
}

- (BOOL)hasEssentialFlightInfo
{
  return -[MapsSuggestionsEntry type](self, "type") == 15
      && -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsFlightDepartureTimeKey"))
      && -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"))
      && -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
}

- (BOOL)hasFullFlightInfoAndGate
{
  return -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsFlightDepartureGateKey"))
      && -[MapsSuggestionsEntry BOOLeanForKey:is:](self, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsFlightMapItemIsGateKey"), 1)&& -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsFlightStatusKey"))&& -[MapsSuggestionsEntry hasEssentialFlightInfo](self, "hasEssentialFlightInfo");
}

- (id)departingAirportCode
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[MapsSuggestionsEntry hasEssentialFlightInfo](self, "hasEssentialFlightInfo"))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v9 = 1024;
      v10 = 395;
      v11 = 2082;
      v12 = "-[MapsSuggestionsEntry(Flight) departingAirportCode]";
      v13 = 2082;
      v14 = "! [self hasEssentialFlightInfo]";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This can only be called on an Flight Entry", (uint8_t *)&v7, 0x26u);
    }
    goto LABEL_9;
  }
  -[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject length](v3, "length") != 3)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v9 = 1024;
      v10 = 397;
      v11 = 2082;
      v12 = "-[MapsSuggestionsEntry(Flight) departingAirportCode]";
      v13 = 2082;
      v14 = "3u != airportCode.length";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Post-condition: IATA airport codes should always be 3 characters!", (uint8_t *)&v7, 0x26u);
    }

LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  v3 = v3;
  v4 = v3;
LABEL_10:

  return v4;
}

- (id)arrivingAirportCode
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[MapsSuggestionsEntry hasEssentialFlightInfo](self, "hasEssentialFlightInfo"))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v9 = 1024;
      v10 = 403;
      v11 = 2082;
      v12 = "-[MapsSuggestionsEntry(Flight) arrivingAirportCode]";
      v13 = 2082;
      v14 = "! [self hasEssentialFlightInfo]";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This can only be called on an Flight Entry", (uint8_t *)&v7, 0x26u);
    }
    goto LABEL_9;
  }
  -[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsFlightArrivalAirportCodeKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject length](v3, "length") != 3)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      v9 = 1024;
      v10 = 405;
      v11 = 2082;
      v12 = "-[MapsSuggestionsEntry(Flight) arrivingAirportCode]";
      v13 = 2082;
      v14 = "3u != airportCode.length";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Post-condition: IATA airport codes should always be 3 characters!", (uint8_t *)&v7, 0x26u);
    }

LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  v3 = v3;
  v4 = v3;
LABEL_10:

  return v4;
}

- (BOOL)isLockedOrHidden
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MapsSuggestionsEntry setForKey:](self, "setForKey:", CFSTR("MapsSuggestionsAssociatedBundleIDsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((isExtensionHidden(v9) & 1) != 0 || (isExtensionLocked(v9) & 1) != 0)
          {
            v10 = 1;
            goto LABEL_16;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v10 = 0;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_16:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (MapsSuggestionsEntry)entryWithType:(int64_t)a3 title:(id)a4 subtitle:(id)a5 weight:(double)a6 expires:(id)a7 sourceSpecificInfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  MapsSuggestionsEntry *v17;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:]([MapsSuggestionsEntry alloc], "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", a3, v13, v14, v15, 0, v16, a6);

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)data
{
  void *v3;
  NSObject *v4;
  int v6;
  MapsSuggestionsEntry *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Error archiving entry %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

+ (MapsSuggestionsEntry)entryWithData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v5 || !v4)
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = (const char *)v5;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error decoding MapsSuggestionsEntry - %@", buf, 0xCu);
      }

      v6 = 0;
    }
    else
    {
      v6 = v4;
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v12 = 1024;
      v13 = 74;
      v14 = 2082;
      v15 = "+[MapsSuggestionsEntry entryWithData:]";
      v16 = 2082;
      v17 = "data == nil";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. data should not be nil", buf, 0x26u);
    }
    v6 = 0;
  }

  return (MapsSuggestionsEntry *)v6;
}

- (MapsSuggestionsEntry)initWithCoder:(id)a3
{
  id v4;
  MapsSuggestionsEntry *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *undecoratedTitle;
  uint64_t v12;
  NSString *undecoratedSubtitle;
  uint64_t v14;
  NSString *titleWhenLocked;
  uint64_t v16;
  NSString *subtitleWhenLocked;
  uint64_t v18;
  NSString *undecoratedTitleWhenLocked;
  uint64_t v20;
  NSString *undecoratedSubtitleWhenLocked;
  double v22;
  uint64_t v23;
  NSDate *expires;
  uint64_t v25;
  NSData *iconData;
  uint64_t v27;
  NSString *originatingSourceName;
  uint64_t v29;
  GEOMapItemStorage *geoMapItem;
  void *v31;
  uint64_t v32;
  NSMutableDictionary *sourceSpecificInfo;
  void *v34;
  uint64_t v35;
  NSMutableSet *typeHistory;

  v4 = a3;
  v5 = -[MapsSuggestionsEntry initWithType:title:](self, "initWithType:title:", 0, &stru_1E4BDFC28);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mseType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseSubtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseUndecoratedTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    undecoratedTitle = v5->_undecoratedTitle;
    v5->_undecoratedTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseUndecoratedSubtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    undecoratedSubtitle = v5->_undecoratedSubtitle;
    v5->_undecoratedSubtitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseTitleWhenLocked"));
    v14 = objc_claimAutoreleasedReturnValue();
    titleWhenLocked = v5->_titleWhenLocked;
    v5->_titleWhenLocked = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseSubtitleWhenLocked"));
    v16 = objc_claimAutoreleasedReturnValue();
    subtitleWhenLocked = v5->_subtitleWhenLocked;
    v5->_subtitleWhenLocked = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseUndecoratedTitleWhenLocked"));
    v18 = objc_claimAutoreleasedReturnValue();
    undecoratedTitleWhenLocked = v5->_undecoratedTitleWhenLocked;
    v5->_undecoratedTitleWhenLocked = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseUndecoratedSubtitleWhenLocked"));
    v20 = objc_claimAutoreleasedReturnValue();
    undecoratedSubtitleWhenLocked = v5->_undecoratedSubtitleWhenLocked;
    v5->_undecoratedSubtitleWhenLocked = (NSString *)v20;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mseWeight"));
    *(float *)&v22 = v22;
    v5->_weight = *(float *)&v22;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseExpires"));
    v23 = objc_claimAutoreleasedReturnValue();
    expires = v5->_expires;
    v5->_expires = (NSDate *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseIconData"));
    v25 = objc_claimAutoreleasedReturnValue();
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v25;

    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mseDeleted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseOriginatingSourceName"));
    v27 = objc_claimAutoreleasedReturnValue();
    originatingSourceName = v5->_originatingSourceName;
    v5->_originatingSourceName = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mseGEOMapItem"));
    v29 = objc_claimAutoreleasedReturnValue();
    geoMapItem = v5->_geoMapItem;
    v5->_geoMapItem = (GEOMapItemStorage *)v29;

    if (_MergedGlobals_39 != -1)
      dispatch_once(&_MergedGlobals_39, &__block_literal_global_16);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", qword_1ED22F000, CFSTR("mseSSI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "mutableCopy");
    sourceSpecificInfo = v5->_sourceSpecificInfo;
    v5->_sourceSpecificInfo = (NSMutableDictionary *)v32;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", qword_1ED22F008, CFSTR("mseTypeHistory"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "mutableCopy");
    typeHistory = v5->_typeHistory;
    v5->_typeHistory = (NSMutableSet *)v35;

  }
  return v5;
}

void __38__MapsSuggestionsEntry_initWithCoder___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_msgSend(v20, "initWithObjects:", v19, v18, v17, v16, v0, v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v10 = (void *)qword_1ED22F000;
  qword_1ED22F000 = v9;

  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
  v15 = (void *)qword_1ED22F008;
  qword_1ED22F008 = v14;

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MapsSuggestionsEntry *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "encodeInteger:forKey:", -[MapsSuggestionsEntry type](self, "type"), CFSTR("mseType"));
  -[MapsSuggestionsEntry title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v4, CFSTR("mseTitle"));

  -[MapsSuggestionsEntry subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v5, CFSTR("mseSubtitle"));

  -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v6, CFSTR("mseUndecoratedTitle"));

  -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v7, CFSTR("mseUndecoratedSubtitle"));

  -[MapsSuggestionsEntry titleWhenLocked](self, "titleWhenLocked");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v8, CFSTR("mseTitleWhenLocked"));

  -[MapsSuggestionsEntry subtitleWhenLocked](self, "subtitleWhenLocked");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v9, CFSTR("mseSubtitleWhenLocked"));

  -[MapsSuggestionsEntry undecoratedTitleWhenLocked](self, "undecoratedTitleWhenLocked");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v10, CFSTR("mseUndecoratedTitleWhenLocked"));

  -[MapsSuggestionsEntry undecoratedSubtitleWhenLocked](self, "undecoratedSubtitleWhenLocked");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v11, CFSTR("mseUndecoratedSubtitleWhenLocked"));

  -[MapsSuggestionsEntry weight](self, "weight");
  objc_msgSend(v19, "encodeDouble:forKey:", CFSTR("mseWeight"));
  -[MapsSuggestionsEntry expires](self, "expires");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v12, CFSTR("mseExpires"));

  -[MapsSuggestionsEntry iconData](self, "iconData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v13, CFSTR("mseIconData"));

  objc_msgSend(v19, "encodeBool:forKey:", -[MapsSuggestionsEntry deleted](self, "deleted"), CFSTR("mseDeleted"));
  -[MapsSuggestionsEntry originatingSourceName](self, "originatingSourceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v14, CFSTR("mseOriginatingSourceName"));

  -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v15, CFSTR("mseGEOMapItem"));

  v16 = self;
  objc_sync_enter(v16);
  v17 = (void *)-[NSMutableDictionary copy](v16->_sourceSpecificInfo, "copy");
  objc_msgSend(v19, "encodeObject:forKey:", v17, CFSTR("mseSSI"));

  v18 = (void *)-[NSMutableSet copy](v16->_typeHistory, "copy");
  objc_msgSend(v19, "encodeObject:forKey:", v18, CFSTR("mseTypeHistory"));

  objc_sync_exit(v16);
}

- (MapsSuggestionsEntry)initWithType:(int64_t)a3 title:(id)a4
{
  return -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](self, "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", a3, a4, 0, 0, 0, 0, 0.0);
}

- (MapsSuggestionsEntry)initWithType:(int64_t)a3 title:(id)a4 subtitle:(id)a5 weight:(double)a6 expires:(id)a7 geoMapItem:(id)a8 sourceSpecificInfo:(id)a9
{
  id v17;
  id v18;
  id v19;
  MapsSuggestionsEntry *v20;
  MapsSuggestionsEntry *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *sourceSpecificInfo;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MapsSuggestionsEntry;
  v20 = -[MapsSuggestionsEntry init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    -[MapsSuggestionsEntry _overrideType:](v20, "_overrideType:", a3, v25, v26);
    objc_storeStrong((id *)&v21->_undecoratedTitle, a4);
    objc_storeStrong((id *)&v21->_title, v21->_undecoratedTitle);
    objc_storeStrong((id *)&v21->_undecoratedSubtitle, a5);
    objc_storeStrong((id *)&v21->_subtitle, v21->_undecoratedSubtitle);
    v21->_weight = a6;
    objc_storeStrong((id *)&v21->_expires, a7);
    objc_storeStrong((id *)&v21->_geoMapItem, a8);
    if (v19)
      v22 = (NSMutableDictionary *)objc_msgSend(v19, "mutableCopy");
    else
      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sourceSpecificInfo = v21->_sourceSpecificInfo;
    v21->_sourceSpecificInfo = v22;

  }
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsSuggestionsEntry *v4;
  uint64_t v5;
  NSString *undecoratedTitle;
  uint64_t v7;
  NSString *undecoratedSubtitle;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *subtitle;
  MapsSuggestionsEntry *v13;
  uint64_t v14;
  NSString *originatingSourceName;
  uint64_t v16;
  NSMutableDictionary *sourceSpecificInfo;

  v4 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](+[MapsSuggestionsEntry allocWithZone:](MapsSuggestionsEntry, "allocWithZone:", a3), "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", self->_type, self->_title, self->_subtitle, self->_expires, self->_geoMapItem, 0, self->_weight);
  v5 = -[NSString copy](self->_undecoratedTitle, "copy");
  undecoratedTitle = v4->_undecoratedTitle;
  v4->_undecoratedTitle = (NSString *)v5;

  v7 = -[NSString copy](self->_undecoratedSubtitle, "copy");
  undecoratedSubtitle = v4->_undecoratedSubtitle;
  v4->_undecoratedSubtitle = (NSString *)v7;

  v9 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v9;

  v11 = -[NSString copy](self->_subtitle, "copy");
  subtitle = v4->_subtitle;
  v4->_subtitle = (NSString *)v11;

  v13 = self;
  objc_sync_enter(v13);
  v14 = -[NSString copy](v13->_originatingSourceName, "copy");
  originatingSourceName = v4->_originatingSourceName;
  v4->_originatingSourceName = (NSString *)v14;

  v16 = -[NSMutableDictionary mutableCopy](v13->_sourceSpecificInfo, "mutableCopy");
  sourceSpecificInfo = v4->_sourceSpecificInfo;
  v4->_sourceSpecificInfo = (NSMutableDictionary *)v16;

  objc_sync_exit(v13);
  return v4;
}

- (void)setUndecoratedTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_undecoratedTitle, a3);
  v5 = a3;
  -[MapsSuggestionsEntry setTitle:](self, "setTitle:", self->_undecoratedTitle);

}

- (void)setUndecoratedSubtitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_undecoratedSubtitle, a3);
  v5 = a3;
  -[MapsSuggestionsEntry setSubtitle:](self, "setSubtitle:", self->_undecoratedSubtitle);

}

- (void)setUndecoratedTitleWhenLocked:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_undecoratedTitleWhenLocked, a3);
  v5 = a3;
  -[MapsSuggestionsEntry setTitleWhenLocked:](self, "setTitleWhenLocked:", self->_undecoratedTitleWhenLocked);

}

- (void)setUndecoratedSubtitleWhenLocked:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_undecoratedSubtitleWhenLocked, a3);
  v5 = a3;
  -[MapsSuggestionsEntry setSubtitleWhenLocked:](self, "setSubtitleWhenLocked:", self->_undecoratedSubtitleWhenLocked);

}

- (void)setDeleted:(BOOL)a3
{
  id v4;

  self->_deleted = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry setExpires:](self, "setExpires:");

  }
}

- (BOOL)isEqual:(id)a3
{
  MapsSuggestionsEntry *v4;
  BOOL v5;

  v4 = (MapsSuggestionsEntry *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MapsSuggestionsEntry isEqualToEntry:](self, "isEqualToEntry:", v4);
  }

  return v5;
}

- (BOOL)isEqualToEntry:(id)a3
{
  MapsSuggestionsEntry *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  MapsSuggestionsEntry *v36;
  void *v37;
  id v38;
  id *v39;
  char v40;

  v4 = (MapsSuggestionsEntry *)a3;
  if (self == v4)
  {
    v40 = 1;
  }
  else
  {
    v5 = -[MapsSuggestionsEntry type](self, "type");
    if (v5 != -[MapsSuggestionsEntry type](v4, "type"))
      goto LABEL_18;
    -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry undecoratedTitle](v4, "undecoratedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry undecoratedTitle](v4, "undecoratedTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
        goto LABEL_18;
    }
    -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry undecoratedSubtitle](v4, "undecoratedSubtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry undecoratedSubtitle](v4, "undecoratedSubtitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v15 & 1) == 0)
        goto LABEL_18;
    }
    -[MapsSuggestionsEntry title](self, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry title](v4, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v17)
    {
      -[MapsSuggestionsEntry title](self, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry title](v4, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
        goto LABEL_18;
    }
    -[MapsSuggestionsEntry subtitle](self, "subtitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry subtitle](v4, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 != v22)
    {
      -[MapsSuggestionsEntry subtitle](self, "subtitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry subtitle](v4, "subtitle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if ((v25 & 1) == 0)
        goto LABEL_18;
    }
    -[MapsSuggestionsEntry expires](self, "expires");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry expires](v4, "expires");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 != v27)
    {
      -[MapsSuggestionsEntry expires](self, "expires");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MapsSuggestionsEntry expires](v4, "expires");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToDate:", v29);

      if ((v30 & 1) == 0)
        goto LABEL_18;
    }
    -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEntry geoMapItem](v4, "geoMapItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31 == v32
      || (-[MapsSuggestionsEntry geoMapItem](self, "geoMapItem"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          -[MapsSuggestionsEntry geoMapItem](v4, "geoMapItem"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = MapsSuggestionsMapItemsAreEqual(v33, v34, 1, 1, 1),
          v34,
          v33,
          (v35 & 1) != 0))
    {
      v36 = self;
      objc_sync_enter(v36);
      v37 = (void *)-[NSMutableDictionary copy](v36->_sourceSpecificInfo, "copy");
      objc_sync_exit(v36);

      v38 = v37;
      if (v4)
      {
        v39 = v4;
        objc_sync_enter(v39);
        v40 = objc_msgSend(v39[2], "isEqualToDictionary:", v38);
        objc_sync_exit(v39);

      }
      else
      {
        v40 = 0;
      }

    }
    else
    {
LABEL_18:
      v40 = 0;
    }
  }

  return v40;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[MapsSuggestionsEntry type](self, "type");
  -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[MapsSuggestionsEntry undecoratedSubtitle](self, "undecoratedSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v3 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (NSString)uniqueName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MapsSuggestionsEntry '%@' '%@'"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)uniqueIdentifier
{
  void *v3;
  uint64_t v4;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsPrimaryKey")))
    return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), self);
  -[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsPrimaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MapsSuggestionsEntry containsKey:](self, "containsKey:", v3))
  {
    -[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v10 = 1024;
      v11 = 334;
      v12 = 2082;
      v13 = "-[MapsSuggestionsEntry uniqueIdentifier]";
      v14 = 2082;
      v15 = "![self containsKey:primaryKey]";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Suggestion Entry requires primary key value", buf, 0x26u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), self);
  }
  v7 = (void *)v4;

  return (NSString *)v7;
}

- (id)sourceSpecificInfo
{
  MapsSuggestionsEntry *v2;
  NSMutableDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sourceSpecificInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSourceSpecificInfo:(id)a3
{
  MapsSuggestionsEntry *v4;
  uint64_t v5;
  NSMutableDictionary *sourceSpecificInfo;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v7);
  sourceSpecificInfo = v4->_sourceSpecificInfo;
  v4->_sourceSpecificInfo = (NSMutableDictionary *)v5;

  objc_sync_exit(v4);
}

- (void)_setValue:(void *)a3 forKey:(uint64_t)a4 class:
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (!a1)
    goto LABEL_14;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v15 = 1024;
      v16 = 355;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEntry _setValue:forKey:class:]";
      v19 = 2082;
      v20 = "nil == (key)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_8;
  }
  if (!a4)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v15 = 1024;
      v16 = 356;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEntry _setValue:forKey:class:]";
      v19 = 2082;
      v20 = "nil == (klass)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class", (uint8_t *)&v13, 0x26u);
    }
LABEL_8:

    goto LABEL_14;
  }
  v10 = a1;
  objc_sync_enter(v10);
  v11 = (void *)v10[2];
  if (v7)
    objc_msgSend(v11, "setObject:forKey:", v7, v9);
  else
    objc_msgSend(v11, "removeObjectForKey:", v9);
  objc_sync_exit(v10);

LABEL_14:
}

- (void)setSet:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setArray:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v6, v8, v7);

}

- (void)setBoolean:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v6, v8, v7);

}

- (void)setDate:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setURL:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setUUID:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setRouteRequestStorage:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);

}

- (void)setETA:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v11, v6, v7);
  if (v11)
  {
    MapsSuggestionsDestinationKey(self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, CFSTR("MapsSuggestionsDestinationForETAKey"), v9);

  }
  else
  {
    v10 = objc_opt_class();
    -[MapsSuggestionsEntry _setValue:forKey:class:](self, 0, CFSTR("MapsSuggestionsDestinationForETAKey"), v10);
  }

}

- (void)setMapItemHandleData:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v5, CFSTR("MapsSuggestionsMapItemHandleDataKey"), v4);

}

- (void)setContacts:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v5, CFSTR("MapsSuggestionsShortcutContactsKey"), v4);

}

- (void)setShareETAHandles:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v5, CFSTR("MapsSuggestionSharedETAHandlesFromFavorite"), v4);

}

- (BOOL)containsKey:(id)a3
{
  id v4;
  MapsSuggestionsEntry *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_sourceSpecificInfo, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

    objc_sync_exit(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v12 = 1024;
      v13 = 449;
      v14 = 2082;
      v15 = "-[MapsSuggestionsEntry containsKey:]";
      v16 = 2082;
      v17 = "nil == (key)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v10, 0x26u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_valueForKey:(uint64_t)a3 class:
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v8 = 0;
    goto LABEL_18;
  }
  if (v5)
  {
    if (a3)
    {
      v7 = a1;
      objc_sync_enter(v7);
      -[objc_class objectForKey:](v7[2].isa, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
        }
        else
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The class of key '%@' is not '%@'"), v6, a3);
          GEOFindOrCreateLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v16 = "-[MapsSuggestionsEntry _valueForKey:class:]";
            v17 = 2112;
            *(_QWORD *)v18 = v11;
            _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%s failure: %@", buf, 0x16u);
          }

          v13 = v8;
        }
      }

      objc_sync_exit(v7);
      goto LABEL_17;
    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v17 = 1024;
      *(_DWORD *)v18 = 459;
      *(_WORD *)&v18[4] = 2082;
      *(_QWORD *)&v18[6] = "-[MapsSuggestionsEntry _valueForKey:class:]";
      v19 = 2082;
      v20 = "nil == (klass)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
      goto LABEL_11;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v17 = 1024;
      *(_DWORD *)v18 = 458;
      *(_WORD *)&v18[4] = 2082;
      *(_QWORD *)&v18[6] = "-[MapsSuggestionsEntry _valueForKey:class:]";
      v19 = 2082;
      v20 = "nil == (key)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key";
LABEL_11:
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
    }
  }
  v8 = 0;
LABEL_17:

LABEL_18:
  return v8;
}

- (id)setForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)numberForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Defaulting to 0 instead of nil integer value for key '%@'"), v4);
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (unint64_t)uint64ForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedLongLongValue");
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Defaulting to 0 instead of nil integer value for key '%@'"), v4);
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)BOOLeanForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Defaulting to NO instead of nil BOOLean value for key '%@'"), v4);
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)BOOLeanForKey:(id)a3 is:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "BOOLValue") ^ v4 ^ 1;
  else
    LOBYTE(v10) = 0;

  return v10;
}

- (id)dateForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)UUIDForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)routeRequestStorageForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ETAForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapItemHandleData
{
  uint64_t v3;

  v3 = objc_opt_class();
  return -[MapsSuggestionsEntry _valueForKey:class:](self, CFSTR("MapsSuggestionsMapItemHandleDataKey"), v3);
}

- (id)contacts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return -[MapsSuggestionsEntry _valueForKey:class:](self, CFSTR("MapsSuggestionsShortcutContactsKey"), v3);
}

- (NSString)shortDescription
{
  MapsSuggestionsEntry *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MapsSuggestionsEntry title](v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry subtitle](v2, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromMapsSuggestionsEntryType(-[MapsSuggestionsEntry type](v2, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry uniqueIdentifier](v2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("'%@' / '%@' (%@) %@"), v4, v5, v6, v7);

  objc_sync_exit(v2);
  return (NSString *)v8;
}

- (NSString)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  MapsSuggestionsEntry *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  NSStringFromMapsSuggestionsEntryType(-[MapsSuggestionsEntry type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR("-- %@ --\n"), v3);

  objc_msgSend(v30, "appendFormat:", CFSTR(" pointer:   %p\n"), self);
  -[MapsSuggestionsEntry title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR(" title:    '%@'\n"), v4);

  -[MapsSuggestionsEntry subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR(" subtitle: '%@'\n"), v5);

  -[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR(" uniqueID:  %@\n"), v6);

  -[MapsSuggestionsEntry originatingSourceName](self, "originatingSourceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR(" origin:    %@\n"), v7);

  -[MapsSuggestionsEntry expires](self, "expires");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR(" expires:   %@\n"), v8);

  -[MapsSuggestionsEntry weight](self, "weight");
  *(float *)&v9 = v9;
  objc_msgSend(v30, "appendFormat:", CFSTR(" weight:    %.3f\n"), *(float *)&v9);
  -[MapsSuggestionsEntry geoMapItem](self, "geoMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromMapsSuggestionsMapItem(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR(" mapItem:   %@\n"), v11);

  v12 = self;
  objc_sync_enter(v12);
  objc_msgSend(v30, "appendFormat:", CFSTR(" specifics: %lu entries: {\n"), -[NSMutableDictionary count](v12->_sourceSpecificInfo, "count"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSMutableDictionary allKeys](v12->_sourceSpecificInfo, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(obj);
        v18 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v17);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v19 = objc_msgSend(&unk_1E4C09F60, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v36 != v20)
                objc_enumerationMutation(&unk_1E4C09F60);
              v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              if (objc_msgSend(v18, "hasPrefix:", v22))
              {
                objc_msgSend(v18, "substringFromIndex:", objc_msgSend(v22, "length"));
                v23 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_16;
              }
            }
            v19 = objc_msgSend(&unk_1E4C09F60, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
            if (v19)
              continue;
            break;
          }
        }
        v23 = v18;
LABEL_16:
        v24 = v23;

        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")))goto LABEL_20;
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (!s_verbose)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v12->_sourceSpecificInfo, "objectForKeyedSubscript:", v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "appendFormat:", CFSTR(" . %@ => %lu waypoints:\n"), v24, objc_msgSend(v25, "waypointsCount"));
        }
        else
        {
LABEL_20:
          -[NSMutableDictionary objectForKeyedSubscript:](v12->_sourceSpecificInfo, "objectForKeyedSubscript:", v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "appendFormat:", CFSTR(" . %@ => %@\n"), v24, v25);
        }

        ++v17;
      }
      while (v17 != v15);
      v14 = obj;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v15 = v26;
    }
    while (v26);
  }

  objc_msgSend(v30, "appendString:", CFSTR(" }"));
  objc_sync_exit(v12);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v30);
  return (NSString *)v27;
}

- (BOOL)hasExpired
{
  void *v3;
  void *v4;

  -[MapsSuggestionsEntry expires](self, "expires");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MapsSuggestionsEntry expires](self, "expires");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = MapsSuggestionsIsInThePast(v4);

  }
  return (char)v3;
}

- (int64_t)availableRemovalBehaviors
{
  return -[MapsSuggestionsEntry integerForKey:](self, "integerForKey:", CFSTR("MapsSuggestionsRemovalBehaviorKey"));
}

- (void)setAvailableRemovalBehavior:(int64_t)a3
{
  -[MapsSuggestionsEntry setInteger:forKey:](self, "setInteger:forKey:", -[MapsSuggestionsEntry availableRemovalBehaviors](self, "availableRemovalBehaviors") | a3, CFSTR("MapsSuggestionsRemovalBehaviorKey"));
}

- (void)resetAvailableRemovalBehavior:(int64_t)a3
{
  -[MapsSuggestionsEntry setInteger:forKey:](self, "setInteger:forKey:", -[MapsSuggestionsEntry availableRemovalBehaviors](self, "availableRemovalBehaviors") & ~a3, CFSTR("MapsSuggestionsRemovalBehaviorKey"));
}

- (void)setLocationCoordinateKeysFromLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;
  CLLocationCoordinate2D v21;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v14 = 1024;
      v15 = 667;
      v16 = 2082;
      v17 = "-[MapsSuggestionsEntry setLocationCoordinateKeysFromLocation:]";
      v18 = 2082;
      v19 = "nil == (location)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Location to set the keys cannot be nil", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "coordinate");
  if (!CLLocationCoordinate2DIsValid(v21))
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      v14 = 1024;
      v15 = 668;
      v16 = 2082;
      v17 = "-[MapsSuggestionsEntry setLocationCoordinateKeysFromLocation:]";
      v18 = 2082;
      v19 = "!CLLocationCoordinate2DIsValid(location.coordinate)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Coordinates are invalid", (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "coordinate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry setNumber:forKey:](self, "setNumber:forKey:", v7, CFSTR("MapsSuggestionsLatitudeKey"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "coordinate");
  objc_msgSend(v8, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEntry setNumber:forKey:](self, "setNumber:forKey:", v10, CFSTR("MapsSuggestionsLongitudeKey"));

LABEL_10:
}

- (NSString)serializedHexString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[MapsSuggestionsEntry data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v2, "_geo_hexString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@%@"), CFSTR("{16}"), v4);

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)serializedBase64String
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[MapsSuggestionsEntry data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@%@"), CFSTR("{64}"), v4);

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

+ (id)entryFromSerializedHexString:(id)a3 hasPrefix:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("{16}"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "entryFromSerializedHexString:hasPrefix:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "_geo_dataForHexString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v9 = 0;
      goto LABEL_6;
    }
    +[MapsSuggestionsEntry entryWithData:](MapsSuggestionsEntry, "entryWithData:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_6:

  return v9;
}

+ (id)entryFromSerializedBase64String:(id)a3 hasPrefix:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("{64}"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "entryFromSerializedBase64String:hasPrefix:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    if (!v7)
    {
      v9 = 0;
      goto LABEL_6;
    }
    +[MapsSuggestionsEntry entryWithData:](MapsSuggestionsEntry, "entryWithData:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_6:

  return v9;
}

+ (id)entryFromSerializedString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  __int16 v13;
  uint8_t buf[2];

  v4 = a3;
  v5 = MapsSuggestionsStringDataEncodingTypeOfString(v4);
  v6 = 0;
  switch(v5)
  {
    case 0:
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v13 = 0;
      v8 = "Cannot determine the encoding of this string";
      v9 = (uint8_t *)&v13;
      goto LABEL_10;
    case 1:
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v8 = "Cannot decode an empty string";
        v9 = buf;
LABEL_10:
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
      }
LABEL_11:

      goto LABEL_12;
    case 2:
      objc_msgSend(a1, "entryFromSerializedBase64String:hasPrefix:", v4, 1);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      v6 = 1;
      goto LABEL_6;
    case 4:
LABEL_6:
      objc_msgSend(a1, "entryFromSerializedHexString:hasPrefix:", v4, v6);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v10;
      break;
    default:
LABEL_12:
      v11 = 0;
      break;
  }

  return v11;
}

- (id)nameForJSON
{
  return CFSTR("entry");
}

- (id)objectForJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[6];
  _QWORD v22[8];

  v22[6] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("type");
  NSStringFromMapsSuggestionsEntryType(-[MapsSuggestionsEntry type](self, "type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("title");
  -[MapsSuggestionsEntry title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("subtitle");
  -[MapsSuggestionsEntry subtitle](self, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("location");
  -[MapsSuggestionsEntry numberForKey:](self, "numberForKey:", CFSTR("MapsSuggestionsLatitudeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  -[MapsSuggestionsEntry numberForKey:](self, "numberForKey:", CFSTR("MapsSuggestionsLongitudeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v7;
  v21[4] = CFSTR("address");
  -[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsDestinationAddressKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v9;
  v21[5] = CFSTR("eta");
  -[MapsSuggestionsEntry ETAForKey:](self, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_overrideType:(int64_t)a3
{
  NSMutableSet *typeHistory;
  uint64_t v5;
  NSMutableSet *v6;
  void *v7;
  MapsSuggestionsEntry *obj;

  self->_type = a3;
  obj = self;
  objc_sync_enter(obj);
  typeHistory = obj->_typeHistory;
  if (!typeHistory)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v6 = obj->_typeHistory;
    obj->_typeHistory = (NSMutableSet *)v5;

    typeHistory = obj->_typeHistory;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](typeHistory, "addObject:", v7);

  objc_sync_exit(obj);
}

- (BOOL)_wasEverOfType:(int64_t)a3
{
  MapsSuggestionsEntry *v4;
  NSMutableSet *typeHistory;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  typeHistory = v4->_typeHistory;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(typeHistory) = -[NSMutableSet containsObject:](typeHistory, "containsObject:", v6);

  objc_sync_exit(v4);
  return (char)typeHistory;
}

- (BOOL)_wasEverOneOfTypes:(id)a3
{
  MapsSuggestionsEntry *v4;
  id v5;
  char v6;

  v4 = self;
  v5 = a3;
  objc_sync_enter(v4);
  v6 = -[NSMutableSet intersectsSet:](v4->_typeHistory, "intersectsSet:", v5);

  objc_sync_exit(v4);
  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)titleWhenLocked
{
  return self->_titleWhenLocked;
}

- (void)setTitleWhenLocked:(id)a3
{
  objc_storeStrong((id *)&self->_titleWhenLocked, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)subtitleWhenLocked
{
  return self->_subtitleWhenLocked;
}

- (void)setSubtitleWhenLocked:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleWhenLocked, a3);
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
  objc_storeStrong((id *)&self->_iconData, a3);
}

- (NSString)undecoratedTitle
{
  return self->_undecoratedTitle;
}

- (NSString)undecoratedTitleWhenLocked
{
  return self->_undecoratedTitleWhenLocked;
}

- (NSString)undecoratedSubtitle
{
  return self->_undecoratedSubtitle;
}

- (NSString)undecoratedSubtitleWhenLocked
{
  return self->_undecoratedSubtitleWhenLocked;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (NSDate)expires
{
  return self->_expires;
}

- (void)setExpires:(id)a3
{
  objc_storeStrong((id *)&self->_expires, a3);
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (GEOMapItemStorage)geoMapItem
{
  return self->_geoMapItem;
}

- (void)setGeoMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_geoMapItem, a3);
}

- (NSString)originatingSourceName
{
  return self->_originatingSourceName;
}

- (void)setOriginatingSourceName:(id)a3
{
  objc_storeStrong((id *)&self->_originatingSourceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingSourceName, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_undecoratedSubtitleWhenLocked, 0);
  objc_storeStrong((id *)&self->_undecoratedSubtitle, 0);
  objc_storeStrong((id *)&self->_undecoratedTitleWhenLocked, 0);
  objc_storeStrong((id *)&self->_undecoratedTitle, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_subtitleWhenLocked, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleWhenLocked, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_typeHistory, 0);
}

- (BOOL)isPureShortcut
{
  return -[MapsSuggestionsEntry isShortcut](self, "isShortcut")
      && -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsShortcutOnlyKey"))
      && -[MapsSuggestionsEntry BOOLeanForKey:](self, "BOOLeanForKey:", CFSTR("MapsSuggestionsShortcutOnlyKey"));
}

- (BOOL)isShortcutForSetup
{
  return -[MapsSuggestionsEntry isShortcut](self, "isShortcut")
      && -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsShortcutSetupKey"))
      && -[MapsSuggestionsEntry BOOLeanForKey:](self, "BOOLeanForKey:", CFSTR("MapsSuggestionsShortcutSetupKey"));
}

- (NSString)shortcutIdentifier
{
  return (NSString *)-[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsUserPlacePK"));
}

- (BOOL)isMultiPointRoute
{
  void *v3;
  BOOL v4;

  if (-[MapsSuggestionsEntry type](self, "type") != 11
    || !-[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsResumeRouteWaypointIndex")))
  {
    return 0;
  }
  -[MapsSuggestionsEntry routeRequestStorageForKey:](self, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasMultipleWaypointsLeft
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  if (!-[MapsSuggestionsEntry isMultiPointRoute](self, "isMultiPointRoute"))
    return 0;
  -[MapsSuggestionsEntry routeRequestStorageForKey:](self, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waypoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MapsSuggestionsEntry uint64ForKey:](self, "uint64ForKey:", CFSTR("MapsSuggestionsResumeRouteWaypointIndex"));
  v6 = objc_msgSend(v4, "count");

  return v6 > v5 + 1;
}

@end
