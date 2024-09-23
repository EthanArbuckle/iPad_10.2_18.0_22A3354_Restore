@implementation ISIconFactory

- (ISIconFactory)initWithType:(id)a3
{
  id v4;
  ISTypeIcon *v5;
  void *v6;
  ISIconFactory *v7;
  __objc2_class *v8;

  v4 = a3;
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x1E0CA5B58]))
  {
    v8 = ISGenericFolderIcon;
LABEL_6:
    -[__objc2_class sharedInstance](v8, "sharedInstance");
    v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", *MEMORY[0x1E0CA5AB8]))
  {
    v8 = ISGenericApplicationIcon;
    goto LABEL_6;
  }
  v5 = -[ISTypeIcon initWithType:]([ISTypeIcon alloc], "initWithType:", v4);
  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (ISIconFactory)initWithResourceProxy:(id)a3
{
  id v4;
  void *v5;
  ISBundleIdentifierIcon *v6;
  ISBundleIdentifierIcon *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  ISBundleIdentifierIcon *v12;
  uint64_t v13;
  void *v14;
  ISTypeIcon *v15;
  void *v16;
  ISIconFactory *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  ISTagIcon *v24;
  void *v25;
  void *v26;
  ISTagIcon *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ISBundleIdentifierIcon initWithBundleIdentifier:]([ISBundleIdentifierIcon alloc], "initWithBundleIdentifier:", v5);

  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    v8 = v4;
    objc_msgSend(v8, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "URL");
      v12 = (ISBundleIdentifierIcon *)objc_claimAutoreleasedReturnValue();
      +[ISIconFactory _iconForURL:options:](ISIconFactory, "_iconForURL:options:", v12, 0);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "typeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(v8, "name");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          objc_msgSend(v8, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "pathExtension");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23)
          {
            v24 = [ISTagIcon alloc];
            objc_msgSend(v8, "name");
            v12 = (ISBundleIdentifierIcon *)objc_claimAutoreleasedReturnValue();
            -[ISBundleIdentifierIcon pathExtension](v12, "pathExtension");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[ISTagIcon initWithFileExtension:](v24, "initWithFileExtension:", v25);

            goto LABEL_13;
          }
        }
        objc_msgSend(v8, "MIMEType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = [ISTagIcon alloc];
          objc_msgSend(v8, "MIMEType");
          v12 = (ISBundleIdentifierIcon *)objc_claimAutoreleasedReturnValue();
          v13 = -[ISTagIcon initWithMIMEType:](v27, "initWithMIMEType:", v12);
          goto LABEL_12;
        }
        objc_msgSend(v8, "typeIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          +[ISIcon genericDocumentIcon](ISGenericDocumentIcon, "genericDocumentIcon");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        }
      }
      v15 = [ISTypeIcon alloc];
      objc_msgSend(v8, "typeIdentifier");
      v12 = (ISBundleIdentifierIcon *)objc_claimAutoreleasedReturnValue();
      v13 = -[ISTypeIcon initWithType:](v15, "initWithType:", v12);
    }
LABEL_12:
    v10 = v13;

LABEL_13:
    v6 = v12;
    goto LABEL_14;
  }
  v7 = [ISBundleIdentifierIcon alloc];
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[ISBundleIdentifierIcon initWithBundleIdentifier:](v7, "initWithBundleIdentifier:", v8);
LABEL_6:
  v10 = v9;
LABEL_14:

  v6 = (ISBundleIdentifierIcon *)v10;
LABEL_15:
  if (v6)
  {
    +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "findOrRegisterIcon:", v6);
    v17 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ISUnknownIcon sharedInstance](ISUnknownIcon, "sharedInstance");
    v17 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (ISIconFactory)initWithBundleIdentifier:(id)a3
{
  id v4;
  ISBundleIdentifierIcon *v5;
  void *v6;
  ISIconFactory *v7;

  v4 = a3;
  v5 = -[ISBundleIdentifierIcon initWithBundleIdentifier:]([ISBundleIdentifierIcon alloc], "initWithBundleIdentifier:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_iconForURL:(id)a3
{
  return +[ISIconFactory _iconForURL:options:](ISIconFactory, "_iconForURL:options:", a3, 0);
}

+ (id)_iconForURL:(id)a3 options:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  int v29;
  void *v30;
  NSObject *v31;
  ISAliasIcon *v32;
  ISImageBagIcon *v33;
  void *v34;
  int v35;
  __CFString **v36;
  _BOOL4 v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  ISIconDecoration *v47;
  ISIconDecoration *v48;
  void *v49;
  NSObject *v50;
  ISDecoratedIcon *v51;
  NSObject *v52;
  NSObject *v54;
  ISTagIcon *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  ISTypeIcon *v60;
  NSObject *v61;
  NSObject *v62;
  os_signpost_id_t v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  os_signpost_id_t v69;
  NSObject *v70;
  _BOOL4 v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  ISTypeIcon *v78;
  unint64_t v79;
  char v80;
  void *v81;
  id v82;
  void *v83;
  _QWORD v84[2];
  _QWORD v85[2];
  uint8_t buf[4];
  id v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v79 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ISURLResourcePropertySpecification sharedInstance](ISURLResourcePropertySpecification, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconInitWithURLProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  objc_msgSend(v4, "__is_resourceValuesForKeys:error:", v6, &v82);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v82;

  v9 = (uint64_t *)MEMORY[0x1E0C99AA8];
  if (v7)
  {
    v10 = *MEMORY[0x1E0C99AA8];
  }
  else
  {
    _ISDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v87 = v4;
      v88 = 2112;
      v89 = v8;
      _os_log_impl(&dword_1AA928000, v11, OS_LOG_TYPE_DEFAULT, "Could not get resource properties for URL: %@ with error: %@", buf, 0x16u);
    }

    _ISURLCacheLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_make_with_pointer(v12, v4);

    if (v13)
    {
      _ISURLCacheLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_signpost_enabled(v14);

      if (v15)
      {
        _ISURLCacheLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13 != -1 && os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AA928000, v17, OS_SIGNPOST_EVENT, v13, "path", "resource property values are nil", buf, 2u);
        }

      }
    }
    v10 = *v9;
    v84[0] = *v9;
    objc_msgSend(v4, "path", v79);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = &stru_1E5801B98;
    if (v18)
      v20 = (const __CFString *)v18;
    v84[1] = *MEMORY[0x1E0C99A18];
    v85[0] = v20;
    v85[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "_IF_objectOfClass:forKey:", objc_opt_class(), v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    _ISURLCacheLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_signpost_id_make_with_pointer(v22, v4);

    if (v23)
    {
      _ISURLCacheLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_signpost_enabled(v24);

      if (v25)
      {
        _ISURLCacheLog();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v23 != -1 && os_signpost_enabled(v26))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AA928000, v27, OS_SIGNPOST_EVENT, v23, "path", "NSURLPathKey is nil", buf, 2u);
        }

      }
    }
    objc_msgSend(v4, "path", v79);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v81 = v8;
  v28 = objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C999D0], v79);
  v29 = objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C99A00]);
  objc_msgSend(v21, "pathExtension");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C999B8]) & 1) != 0
    || objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C99A28]))
  {
    _ISDefaultLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      +[ISIconFactory _iconForURL:options:].cold.3();

    v32 = -[ISAliasIcon initWithAliasURL:]([ISAliasIcon alloc], "initWithAliasURL:", v4);
    goto LABEL_27;
  }
  if ((objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C999C0]) & 1) != 0)
    goto LABEL_33;
  if (!v29)
  {
    v57 = objc_msgSend(v30, "length");
    v58 = *MEMORY[0x1E0C99A18];
    if (!v57
      && objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C99A18])
      && objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C999E8]))
    {
      _ISDefaultLog();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        +[ISIconFactory _iconForURL:options:].cold.7();

      v60 = [ISTypeIcon alloc];
      v32 = -[ISTypeIcon initWithType:](v60, "initWithType:", *MEMORY[0x1E0CA5CA8]);
      goto LABEL_27;
    }
    if (!objc_msgSend(v7, "_IF_BOOLForKey:", v58))
    {
      if (v28)
      {
        _ISURLCacheLog();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = os_signpost_id_make_with_pointer(v62, v4);

        if (v63)
        {
          _ISURLCacheLog();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = os_signpost_enabled(v64);

          if (v65)
          {
            _ISURLCacheLog();
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = v66;
            if (v63 != -1 && os_signpost_enabled(v66))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1AA928000, v67, OS_SIGNPOST_EVENT, v63, "isFileReferenceURL", "checking for file ref url", buf, 2u);
            }

          }
        }
        if (objc_msgSend(v4, "isFileReferenceURL"))
        {
          _ISURLCacheLog();
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = os_signpost_id_make_with_pointer(v68, v4);

          if (v69)
          {
            _ISURLCacheLog();
            v70 = objc_claimAutoreleasedReturnValue();
            v71 = os_signpost_enabled(v70);

            if (v71)
            {
              _ISURLCacheLog();
              v72 = objc_claimAutoreleasedReturnValue();
              v73 = v72;
              if (v69 != -1 && os_signpost_enabled(v72))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1AA928000, v73, OS_SIGNPOST_EVENT, v69, "filePathURL", "getting file path URL for debug level logging", buf, 2u);
              }

            }
          }
          _ISDefaultLog();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            +[ISIconFactory _iconForURL:options:].cold.10(v4, v74);
        }
        else
        {
          _ISDefaultLog();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            +[ISIconFactory _iconForURL:options:].cold.11();
        }

        +[ISCustomIconManager sharedInstance](ISCustomIconManager, "sharedInstance");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "specialFolderTypeForURL:", v4);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          _ISDefaultLog();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
            +[ISIconFactory _iconForURL:options:].cold.9();

          v78 = -[ISTypeIcon initWithType:]([ISTypeIcon alloc], "initWithType:", v76);
        }
        else
        {
          +[ISGenericFolderIcon sharedInstance](ISGenericFolderIcon, "sharedInstance");
          v78 = (ISTypeIcon *)objc_claimAutoreleasedReturnValue();
        }
        v33 = (ISImageBagIcon *)v78;

      }
      else
      {
        v33 = 0;
      }
      goto LABEL_28;
    }
    _ISDefaultLog();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      +[ISIconFactory _iconForURL:options:].cold.8();

    v55 = [ISTagIcon alloc];
    v56 = (_QWORD *)MEMORY[0x1E0CA5BA0];
LABEL_77:
    v32 = -[ISTagIcon initWithFileExtension:baseType:](v55, "initWithFileExtension:baseType:", v30, *v56);
LABEL_27:
    v33 = (ISImageBagIcon *)v32;
    goto LABEL_28;
  }
  if (!objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E0C999E8])
    || !objc_msgSend(v4, "__is_hasFileExtension:", CFSTR("appex")))
  {
    _ISDefaultLog();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      +[ISIconFactory _iconForURL:options:].cold.6();

    v55 = [ISTagIcon alloc];
    v56 = (_QWORD *)MEMORY[0x1E0CA5C18];
    goto LABEL_77;
  }
LABEL_33:
  v37 = _ISGenerateInProcess(v4);
  _ISDefaultLog();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
  if (!v37)
  {
    if (v39)
      +[ISIconFactory _iconForURL:options:].cold.5();

    v32 = -[ISBundleIcon initWithBundleURL:]([ISBundleIcon alloc], "initWithBundleURL:", v4);
    goto LABEL_27;
  }
  if (v39)
    +[ISIconFactory _iconForURL:options:].cold.4();

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v4);
  objc_msgSend(v40, "iconDictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_IF_arrayForKey:", CFSTR("CFBundleIconFiles"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v42, "count"))
  {
    objc_msgSend(v40, "iconDictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_IF_stringForKey:", CFSTR("CFBundleIconFile"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v83 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
      v45 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)v45;
    }

  }
  objc_msgSend(MEMORY[0x1E0D3A7C8], "imageBagWithResourcesNames:fromBundle:", v42, v40);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46)
  {
    objc_msgSend(MEMORY[0x1E0D3A7C8], "defaultAppIconAssetsBag");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = -[ISImageBagIcon initWithImageBag:]([ISImageBagIcon alloc], "initWithImageBag:", v46);

LABEL_28:
  v34 = (void *)objc_opt_new();
  if (((v28 ^ 1 | v29) & 1) != 0)
    goto LABEL_45;
  v35 = objc_msgSend(v4, "__is_accessFlags");
  if (v35)
  {
    if (v35 != 2)
      goto LABEL_45;
    v36 = kISIconDecorationDropFolderBadgeType;
  }
  else
  {
    v36 = kISIconDecorationPrivateFolderBadgeType;
  }
  v47 = -[ISIconDecoration initWithType:]([ISIconDecoration alloc], "initWithType:", *v36);
  objc_msgSend(v34, "addObject:", v47);

LABEL_45:
  if (objc_msgSend(v4, "__is_locked"))
  {
    v48 = -[ISIconDecoration initWithType:]([ISIconDecoration alloc], "initWithType:", CFSTR("com.apple.icon-decoration.badge.locked"));
    objc_msgSend(v34, "addObject:", v48);

  }
  if (objc_msgSend(v34, "count"))
  {
    if ((v80 & 2) != 0)
    {
      _ISDefaultLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        +[ISIconFactory _iconForURL:options:].cold.2();
    }
    else
    {
      -[ISImageBagIcon decorations](v33, "decorations");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v34);
      v50 = objc_claimAutoreleasedReturnValue();

      v51 = -[ISDecoratedIcon initWithIcon:decorations:]([ISDecoratedIcon alloc], "initWithIcon:decorations:", v33, v50);
      v33 = (ISImageBagIcon *)v51;
    }

  }
  if (!v33)
  {
    _ISDefaultLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      +[ISIconFactory _iconForURL:options:].cold.1();

    +[ISUnknownIcon sharedInstance](ISUnknownIcon, "sharedInstance");
    v33 = (ISImageBagIcon *)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

- (id)_init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ISIcon.m"), 536, CFSTR("Unexpected call of -[ISIconFactory _init]"));

  return 0;
}

- (ISIconFactory)initWithURL:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  ISIconFactory *v19;
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a3;
  _ISURLCacheLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v6);

  if (v8)
  {
    _ISURLCacheLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 != -1 && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AA928000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "accessing URL", "-[ISIcon initWithURL:options:]", buf, 2u);
    }

  }
  +[ISIconFactory _iconForURL:options:](ISIconFactory, "_iconForURL:options:", v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ISURLCacheLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, v6);

  if (v13)
  {
    _ISURLCacheLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_enabled(v14);

    if (v15)
    {
      _ISURLCacheLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v13 != -1 && os_signpost_enabled(v16))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AA928000, v17, OS_SIGNPOST_INTERVAL_END, v13, "accessing URL", "-[ISIcon initWithURL:options:]", v21, 2u);
      }

    }
  }
  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "findOrRegisterIcon:", v11);
  v19 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (ISIconFactory)initWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  ISIconFactory *v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = a3;
  _ISURLCacheLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);

  if (v6)
  {
    _ISURLCacheLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 != -1 && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AA928000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "accessing URL", "-[ISIcon initWithURL:]", buf, 2u);
    }

  }
  +[ISIconFactory _iconForURL:options:](ISIconFactory, "_iconForURL:options:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ISURLCacheLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, v4);

  if (v11)
  {
    _ISURLCacheLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_enabled(v12);

    if (v13)
    {
      _ISURLCacheLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v11 != -1 && os_signpost_enabled(v14))
      {
        *(_WORD *)v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AA928000, v15, OS_SIGNPOST_INTERVAL_END, v11, "accessing URL", "-[ISIcon initWithURL:]", v19, 2u);
      }

    }
  }
  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "findOrRegisterIcon:", v9);
  v17 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (ISIconFactory)initWithApplicationIdentity:(id)a3
{
  id v4;
  ISApplicationIdentityIcon *v5;
  void *v6;
  ISIconFactory *v7;

  v4 = a3;
  v5 = -[ISApplicationIdentityIcon initWithApplicationIdentity:]([ISApplicationIdentityIcon alloc], "initWithApplicationIdentity:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ISIconFactory)initWithApplicationBundleIdentifier:(id)a3
{
  id v4;
  ISBundleIdentifierIcon *v5;
  void *v6;
  ISIconFactory *v7;

  v4 = a3;
  v5 = -[ISBundleIdentifierIcon initWithBundleIdentifier:]([ISBundleIdentifierIcon alloc], "initWithBundleIdentifier:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ISIconFactory)initWithApplicationExtensionBundleIdentifier:(id)a3
{
  id v4;
  ISBundleIdentifierIcon *v5;
  void *v6;
  ISIconFactory *v7;

  v4 = a3;
  v5 = -[ISBundleIdentifierIcon initWithBundleIdentifier:]([ISBundleIdentifierIcon alloc], "initWithBundleIdentifier:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ISIconFactory)initWithBundleURL:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  ISBundleIcon *v8;
  void *v9;
  ISIconFactory *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[ISBundleIcon initWithBundleURL:type:]([ISBundleIcon alloc], "initWithBundleURL:type:", v7, v6);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "findOrRegisterIcon:", v8);
  v10 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (ISIconFactory)initWithBundleURL:(id)a3 fileExtension:(id)a4
{
  id v6;
  id v7;
  ISBundleIcon *v8;
  void *v9;
  ISIconFactory *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[ISBundleIcon initWithBundleURL:fileExtension:]([ISBundleIcon alloc], "initWithBundleURL:fileExtension:", v7, v6);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "findOrRegisterIcon:", v8);
  v10 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (ISIconFactory)initWithImages:(id)a3
{
  id v4;
  ISImageBagIcon *v5;

  v4 = a3;
  v5 = -[ISImageBagIcon initWithImages:]([ISImageBagIcon alloc], "initWithImages:", v4);

  return (ISIconFactory *)v5;
}

- (ISIconFactory)initWithFileExtension:(id)a3
{
  id v4;
  ISTagIcon *v5;
  void *v6;
  ISIconFactory *v7;

  v4 = a3;
  v5 = -[ISTagIcon initWithFileExtension:]([ISTagIcon alloc], "initWithFileExtension:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ISIconFactory)initWithModelCode:(id)a3
{
  id v4;
  void *v5;
  ISIconFactory *v6;
  ISTagIcon *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E0CA5A68] == v4 || objc_msgSend(v4, "isEqualToString:"))
  {
    +[ISCurrentDeviceIcon sharedInstance](ISCurrentDeviceIcon, "sharedInstance");
    v6 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[ISTagIcon initWithModelCode:]([ISTagIcon alloc], "initWithModelCode:", v5);
    +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "findOrRegisterIcon:", v7);
    v6 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (ISIconFactory)initWithMIMEType:(id)a3
{
  id v4;
  ISTagIcon *v5;
  void *v6;
  ISIconFactory *v7;

  v4 = a3;
  v5 = -[ISTagIcon initWithMIMEType:]([ISTagIcon alloc], "initWithMIMEType:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ISIconFactory)initWithSymbolName:(id)a3
{
  id v4;
  ISSymbolIcon *v5;
  void *v6;
  ISIconFactory *v7;

  v4 = a3;
  v5 = -[ISSymbolIcon initWithSymbolName:]([ISSymbolIcon alloc], "initWithSymbolName:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ISIconFactory)initWithSymbolName:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  ISSymbolIcon *v8;
  void *v9;
  ISIconFactory *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[ISSymbolIcon initWithSymbolName:configuration:]([ISSymbolIcon alloc], "initWithSymbolName:configuration:", v7, v6);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "findOrRegisterIcon:", v8);
  v10 = (ISIconFactory *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)_iconForURL:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating kUnknownFSObjectIcon icon for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1AA928000, v0, (uint64_t)v0, "Ignoring decorations %@ for URL: %@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating Bundle Alias icon for Bookmark icon for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating icon for placeholder bundle at URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating Bundle icon for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating File Extension icon for package URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating executable icon for file URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating File Extension icon for file URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:options:.cold.9()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1AA928000, v0, (uint64_t)v0, "Identified custom folder type %@ for URL: %@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForURL:(void *)a1 options:(NSObject *)a2 .cold.10(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filePathURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_3(&dword_1AA928000, a2, v5, "Creating Folder icon for URL: %@ (%@)", (uint8_t *)&v6);

}

+ (void)_iconForURL:options:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Creating Folder icon for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
