@implementation CRDisplayThemeData

- (CRDisplayThemeData)initWithCurrentLayoutID:(id)a3 paletteIDForLayout:(id)a4 wallpaperForLayout:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRDisplayThemeData *v11;
  uint64_t v12;
  NSString *currentLayoutID;
  uint64_t v14;
  NSDictionary *paletteIDForLayout;
  uint64_t v16;
  NSDictionary *wallpaperForLayout;
  void *v18;
  NSObject *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRDisplayThemeData;
  v11 = -[CRDisplayThemeData init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    currentLayoutID = v11->_currentLayoutID;
    v11->_currentLayoutID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    paletteIDForLayout = v11->_paletteIDForLayout;
    v11->_paletteIDForLayout = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    wallpaperForLayout = v11->_wallpaperForLayout;
    v11->_wallpaperForLayout = (NSDictionary *)v16;

    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      CarGeneralLogging();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[CRDisplayThemeData initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:].cold.1((uint64_t)v8, v10, v19);

    }
  }

  return v11;
}

- (CRDisplayThemeData)initWithDictionary:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  __objc2_class **v32;
  objc_class *v33;
  void *v34;
  char v35;
  objc_class *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  CRDisplayThemeData *v42;
  CRDisplayThemeData *v43;
  NSObject *v44;
  NSObject *v45;
  __CFString *v47;
  __CFString *v48;
  objc_class *v49;
  objc_class *v50;
  __CFString *v51;
  objc_class *v52;
  __CFString *v53;
  objc_class *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  __CFString *v73;
  __int16 v74;
  __CFString *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("currentLayoutID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("paletteIDForLayout"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("wallpaperForLayout"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v60 = v5;
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v68;
    while (2)
    {
      v14 = v9;
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_opt_class();
        v17 = v16;
        if (!v17 || (objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_54:
          CarGeneralLogging();
          v44 = objc_claimAutoreleasedReturnValue();
          v42 = self;
          v41 = v60;
          v9 = v14;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            if (v17)
            {
              v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v50 = (objc_class *)objc_opt_class();
              NSStringFromClass(v50);
              v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v47 = CFSTR("nil");
              v48 = CFSTR("nil");
            }
            *(_DWORD *)buf = 138412546;
            v73 = v47;
            v74 = 2112;
            v75 = v48;
            _os_log_error_impl(&dword_1A83A2000, v44, OS_LOG_TYPE_ERROR, "Invalid palette ID, expected strings, found: %@:%@", buf, 0x16u);
            if (v17)
            {

            }
          }

          v43 = 0;
          v20 = v10;
          goto LABEL_63;
        }
        objc_opt_class();
        objc_msgSend(v10, "objectForKey:", v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18 && (objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;

        if (!v19)
          goto LABEL_54;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      v9 = v14;
      if (v12)
        continue;
      break;
    }
  }

  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v21 = v9;
  v58 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v58)
  {
    v61 = *(_QWORD *)v64;
    v62 = v20;
    v55 = v9;
    v56 = v3;
    v57 = v21;
    while (2)
    {
      for (j = 0; j != v58; ++j)
      {
        if (*(_QWORD *)v64 != v61)
          objc_enumerationMutation(v21);
        v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKey:", v23, v55, v56);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v25 = v23;
        if (!v25 || (objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_57:
          CarGeneralLogging();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v42 = self;
            v20 = v62;
            if (v25)
            {
              v52 = (objc_class *)objc_opt_class();
              NSStringFromClass(v52);
              v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v51 = CFSTR("nil");
            }
            if (v24)
            {
              v54 = (objc_class *)objc_opt_class();
              NSStringFromClass(v54);
              v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v53 = CFSTR("nil");
            }
            *(_DWORD *)buf = 138412546;
            v73 = v51;
            v74 = 2112;
            v75 = v53;
            _os_log_error_impl(&dword_1A83A2000, v29, OS_LOG_TYPE_ERROR, "Invalid palette ID, expected string:dictionary, found: %@:%@", buf, 0x16u);
            if (v24)

            if (v25)
          }
          else
          {
            v42 = self;
            v20 = v62;
          }
LABEL_62:

          v43 = 0;
          v9 = v55;
          v3 = v56;
          v41 = v60;
          goto LABEL_63;
        }
        objc_opt_class();
        v26 = v24;
        if (v26 && (objc_opt_isKindOfClass() & 1) != 0)
          v27 = v26;
        else
          v27 = 0;

        if (!v27)
          goto LABEL_57;
        objc_opt_class();
        objc_msgSend(v26, "objectForKey:", CFSTR("type"));
        v28 = (id)objc_claimAutoreleasedReturnValue();
        if (v28 && (objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;

        objc_opt_class();
        objc_msgSend(v26, "objectForKey:", CFSTR("data"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
        if (v30 && (objc_opt_isKindOfClass() & 1) != 0)
          v31 = v30;
        else
          v31 = 0;

        v32 = off_1E54266F0;
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[NSObject isEqualToString:](v29, "isEqualToString:", v34);

        if ((v35 & 1) == 0
          && (v32 = off_1E5426738,
              v36 = (objc_class *)objc_opt_class(),
              NSStringFromClass(v36),
              v37 = (void *)objc_claimAutoreleasedReturnValue(),
              v38 = -[NSObject isEqualToString:](v29, "isEqualToString:", v37),
              v37,
              !v38)
          || (v39 = objc_msgSend(objc_alloc(*v32), "initWithDictionary:", v31)) == 0)
        {
          CarGeneralLogging();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            -[CRDisplayThemeData initWithDictionary:].cold.1((uint64_t)v25, (uint64_t)v31, v45);

          v42 = self;
          v20 = v62;
          v21 = v57;
          goto LABEL_62;
        }
        v40 = (void *)v39;
        v20 = v62;
        objc_msgSend(v62, "setObject:forKey:", v39, v25);

        v21 = v57;
      }
      v9 = v55;
      v3 = v56;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v58)
        continue;
      break;
    }
  }

  v41 = v60;
  v42 = -[CRDisplayThemeData initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:](self, "initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:", v60, v10, v20);
  v43 = v42;
LABEL_63:

  return v43;
}

- (id)asDictionary
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("currentLayoutID"));

    -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v3;
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("paletteIDForLayout"));

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
          -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "asDictionary");
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
          {

            v22 = 0;
            v3 = v24;
            goto LABEL_14;
          }
          v18 = (void *)v17;
          v30[0] = CFSTR("type");
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v30[1] = CFSTR("data");
          v31[0] = v20;
          v31[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v11)
          continue;
        break;
      }
    }

    v3 = v24;
    objc_msgSend(v24, "setObject:forKey:", v9, CFSTR("wallpaperForLayout"));
    v22 = (void *)objc_msgSend(v24, "copy");
LABEL_14:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (CRDisplayThemeData)themeDataWithCurrentLayoutID:(id)a3
{
  id v4;
  CRDisplayThemeData *v5;
  void *v6;
  void *v7;
  CRDisplayThemeData *v8;

  v4 = a3;
  v5 = [CRDisplayThemeData alloc];
  -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CRDisplayThemeData initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:](v5, "initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:", v4, v6, v7);

  return v8;
}

- (CRDisplayThemeData)themeDataWithCurrentPaletteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRDisplayThemeData *v8;
  void *v9;
  void *v10;
  CRDisplayThemeData *v11;

  v4 = a3;
  -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  v8 = [CRDisplayThemeData alloc];
  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRDisplayThemeData initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:](v8, "initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:", v9, v6, v10);

  return v11;
}

- (CRDisplayThemeData)themeDataWithCurrentWallpaper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRDisplayThemeData *v8;
  void *v9;
  void *v10;
  CRDisplayThemeData *v11;

  v4 = a3;
  -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  v8 = [CRDisplayThemeData alloc];
  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRDisplayThemeData initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:](v8, "initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:", v9, v10, v6);

  return v11;
}

- (NSString)currentPaletteID
{
  void *v3;
  void *v4;
  void *v5;

  -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[CRDisplayThemeData currentPaletteID].cold.1();
  return (NSString *)v5;
}

- (CRWallpaperData)currentWallpaper
{
  void *v3;
  void *v4;
  void *v5;

  -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[CRDisplayThemeData currentWallpaper].cold.1();
  return (CRWallpaperData *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentLayoutID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paletteIDForLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToDictionary:", v9))
      {
        -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "wallpaperForLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToDictionary:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CRDisplayThemeData;
  -[CRDisplayThemeData description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {currentLayoutID: %@ paletteIDForLayout: %@ wallpaperForLayout: %@}"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CRDisplayThemeData currentLayoutID](self, "currentLayoutID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("currentLayoutID"));

  -[CRDisplayThemeData paletteIDForLayout](self, "paletteIDForLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("paletteIDForLayout"));

  -[CRDisplayThemeData wallpaperForLayout](self, "wallpaperForLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("wallpaperForLayout"));

}

- (CRDisplayThemeData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CRDisplayThemeData *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentLayoutID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("paletteIDForLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v8, v11, CFSTR("wallpaperForLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v5 && v7 && v12)
  {
    self = -[CRDisplayThemeData initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:](self, "initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:", v5, v7, v12);
    v13 = self;
  }

  return v13;
}

- (NSString)currentLayoutID
{
  return self->_currentLayoutID;
}

- (NSDictionary)paletteIDForLayout
{
  return self->_paletteIDForLayout;
}

- (NSDictionary)wallpaperForLayout
{
  return self->_wallpaperForLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperForLayout, 0);
  objc_storeStrong((id *)&self->_paletteIDForLayout, 0);
  objc_storeStrong((id *)&self->_currentLayoutID, 0);
}

- (void)initWithCurrentLayoutID:(uint64_t)a1 paletteIDForLayout:(void *)a2 wallpaperForLayout:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1A83A2000, a3, OS_LOG_TYPE_FAULT, "Unknown wallpaper for layout: %@. Wallpapers are available for layouts: %@", (uint8_t *)&v6, 0x16u);

}

- (void)initWithDictionary:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "Failed to initialize wallpaper, %@, from data: %@", (uint8_t *)&v3, 0x16u);
}

- (void)currentPaletteID
{
  __assert_rtn("-[CRDisplayThemeData currentPaletteID]", "CRDisplayThemeData.m", 142, "paletteID");
}

- (void)currentWallpaper
{
  __assert_rtn("-[CRDisplayThemeData currentWallpaper]", "CRDisplayThemeData.m", 148, "wallpaper");
}

@end
