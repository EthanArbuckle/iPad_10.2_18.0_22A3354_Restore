@implementation _LSStringsFileContent

- (id)initWithStringsFile:(id)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_LSStringsFileContent;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v4;

      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v6;

      *((_BYTE *)a1 + 32) = 0;
    }
  }

  return a1;
}

- (_QWORD)uncheckedObjectsForKeys:(void *)a3 forLocaleCode:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    -[_LSStringsFileContent stringsFileContentFromBundle:forLocaleCode:cacheLocalizations:](a1, a4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (v12 == (void *)a1[3])
      {
        -[_LSStringsFileContent subscriptLoctableWithLocale:]((uint64_t)a1, v10);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = (void *)MEMORY[0x1E0C9AA70];
        if (v14)
          v16 = (void *)v14;
        a1 = v16;

      }
      else
      {
        if (v9)
          objc_msgSend(v12, "uncheckedObjectsForKeys:", v9);
        else
          -[_LSLazyPropertyList propertyList](v12);
        a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (id)stringForString:(void *)a3 forLocale:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    -[_LSStringsFileContent stringsFileContentFromBundle:forLocaleCode:cacheLocalizations:](a1, a4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isRegionChina")
        || (objc_msgSend(v9, "stringByAppendingString:", CFSTR("#CH")),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            -[_LSStringsFileContent _queryLoadedPlist:forRawKey:locale:]((uint64_t)a1, v12, v13, v10),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            !v14))
      {
        -[_LSStringsFileContent _queryLoadedPlist:forRawKey:locale:]((uint64_t)a1, v12, v9, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)IOQueue
{
  if (+[_LSStringsFileContent IOQueue]::once != -1)
    dispatch_once(&+[_LSStringsFileContent IOQueue]::once, &__block_literal_global_142_0);
  return (id)+[_LSStringsFileContent IOQueue]::result;
}

- (id)debugDescription
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__45;
  v17 = __Block_byref_object_dispose__45;
  v18 = 0;
  objc_msgSend((id)objc_opt_class(), "IOQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___LSStringsFileContent_debugDescription__block_invoke;
  block[3] = &unk_1E1041FF8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v3, block);

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v14[5], "count");
  objc_msgSend((id)v14[5], "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> { %lu localizations loaded: %@ }"), v6, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)loadLoctableIfNecessaryFromBundle:(uint64_t)a1
{
  uint64_t v3;
  void *v4;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 32) & 1) == 0)
    {
      -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:](a1, a2, 0, CFSTR("loctable"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v3;

      *(_BYTE *)(a1 + 32) |= 1u;
    }
  }
}

- (id)getStringsFileContentInBundle:(void *)a3 forLocale:(const __CFString *)a4 withExtension:
{
  __CFString *v7;
  CFURLRef v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    v8 = CFBundleCopyResourceURLForLocalization(a2, *(CFStringRef *)(a1 + 8), a4, 0, v7);
    if (v8)
    {
      _LSDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[__CFURL lastPathComponent](v8, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:].cold.1(v10, (uint64_t)v7, v13, v9);
      }

      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:]((uint64_t)_LSLazyPropertyList, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)getStringsFileContentAfterLocTableLoadedInBundle:(void *)a3 forLocale:
{
  id v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = v5;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_7;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("LSStringLocalizer.mm"), 1158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle != NULL"));

    if (v6)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("LSStringLocalizer.mm"), 1159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeCode != nil"));

    goto LABEL_4;
  }
  if (!v5)
    goto LABEL_9;
LABEL_4:
  -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:](a1, a2, v6, CFSTR("strings"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = *(id *)(a1 + 24);
    if (!v7)
    {
      _LSLazyPropertyListGetSharedEmptyPropertyList();
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_7:

  return v7;
}

- (_QWORD)stringsFileContentFromBundle:(void *)a3 forLocaleCode:(void *)a4 cacheLocalizations:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  _QWORD block[5];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__45;
    v35 = __Block_byref_object_dispose__45;
    v36 = 0;
    objc_msgSend((id)objc_opt_class(), "IOQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke;
    block[3] = &unk_1E10422F0;
    v30 = &v31;
    block[4] = a1;
    v11 = v7;
    v29 = v11;
    dispatch_sync(v9, block);

    v12 = (void *)v32[5];
    if (!v12)
    {
      v21 = v10;
      v22 = 3221225472;
      v23 = __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke_2;
      v24 = &unk_1E10455D8;
      v25 = a1;
      v27 = a2;
      v13 = v11;
      v26 = v13;
      v14 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](&v21);
      if (objc_msgSend(v8, "containsObject:", v13, v21, v22, v23, v24, v25))
      {
        v15 = (void *)a1[2];
        objc_msgSend((id)objc_opt_class(), "IOQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _LSLazyLoadObjectForKey(v15, v13, v16, v14);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v32[5];
        v32[5] = v17;

      }
      else
      {
        v14[2](v14);
        v19 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v32[5];
        v32[5] = v19;
      }

      v12 = (void *)v32[5];
    }
    a1 = v12;

    _Block_object_dispose(&v31, 8);
  }

  return a1;
}

- (void)prewarmAllLocalizationsWithBundle:(void *)a3 forLocalizations:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  unint64_t i;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  __CFBundle *v19;

  v5 = a3;
  if (a1 && a2)
  {
    -[_LSStringsFileContent loadLoctableIfNecessaryFromBundle:](a1, a2);
    objc_msgSend((id)objc_opt_class(), "IOQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke;
    v15 = &unk_1E1045600;
    v7 = v5;
    v16 = v7;
    v17 = a1;
    v19 = a2;
    v8 = v6;
    v18 = v8;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x186DAE9BC](&v12);
    v10 = *(void **)(a1 + 24);
    if (v10)
    {
      objc_msgSend(v10, "prewarm", v12, v13, v14, v15, v16, v17);
    }
    else if (_LSContextIsCurrentThreadInitializing() || _LSDatabaseGetNoServerLock())
    {
      for (i = 0; i < objc_msgSend(v7, "count", v12, v13, v14, v15, v16, v17); ++i)
        v9[2](v9, i);
    }
    else
    {
      dispatch_apply(objc_msgSend(v7, "count", v12, v13, v14, v15, v16, v17), 0, v9);
    }

  }
}

- (id)subscriptLoctableWithLocale:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFAllocator *v6;
  CFStringRef v7;
  CFStringRef v8;
  CFStringRef v9;
  uint64_t v10;
  void *v11;
  CFStringRef cf;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = _LSGetProductNameSuffix();
    v5 = _LSGetPlatformNameSuffix();
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
    cf = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, CFSTR("%@%@%@"), v3, v4, v5);
    v7 = CFStringCreateWithFormat(v6, 0, CFSTR("%@%@%@"), v3, v5, v4);
    v8 = CFStringCreateWithFormat(v6, 0, CFSTR("%@%@"), v3, v5);
    v9 = CFStringCreateWithFormat(v6, 0, CFSTR("%@%@"), v3, v4);
    v10 = 0;
    v15[0] = cf;
    v15[1] = v7;
    v15[2] = v8;
    v15[3] = v9;
    v15[4] = v3;
    do
    {
      objc_msgSend(*(id *)(a1 + 24), "objectForKey:ofClass:", v15[v10], objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        break;
    }
    while (v10++ != 4);
    if (v9)
      CFRelease(v9);
    if (v8)
      CFRelease(v8);
    if (v7)
      CFRelease(v7);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_queryLoadedPlist:(void *)a3 forRawKey:(void *)a4 locale:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (*(id *)(a1 + 24) == v7)
    {
      -[_LSStringsFileContent subscriptLoctableWithLocale:](a1, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_class();
      objc_msgSend(v11, "objectForKey:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v13;
      if (v12 && v13 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        v10 = 0;
      }

    }
    else
    {
      objc_msgSend(v7, "objectForKey:ofClass:", v8, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loctable, 0);
  objc_storeStrong((id *)&self->_stringsFileContent, 0);
  objc_storeStrong((id *)&self->_stringsFile, 0);
}

- (void)getStringsFileContentInBundle:(uint8_t *)buf forLocale:(os_log_t)log withExtension:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "reading %@ for %@", buf, 0x16u);

}

@end
