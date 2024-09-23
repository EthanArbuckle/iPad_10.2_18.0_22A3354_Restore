@implementation FCVanityURLMapper

- (FCVanityURLMapper)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCVanityURLMapper init]";
    v9 = 2080;
    v10 = "FCVanityURLMapper.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCVanityURLMapper init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCVanityURLMapper)initWithVanityURLMapping:(id)a3
{
  id v4;
  FCVanityURLMapper *v5;
  uint64_t v6;
  NTPBVanityURLMapping *vanityURLMapping;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "vanityURLMapping");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCVanityURLMapper initWithVanityURLMapping:]";
    v13 = 2080;
    v14 = "FCVanityURLMapper.m";
    v15 = 1024;
    v16 = 31;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCVanityURLMapper;
  v5 = -[FCVanityURLMapper init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    vanityURLMapping = v5->_vanityURLMapping;
    v5->_vanityURLMapping = (NTPBVanityURLMapping *)v6;

  }
  return v5;
}

- (id)URLForVanityURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _BYTE *v18;
  _BYTE buf[24];
  __int128 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "vanityURL");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCVanityURLMapper URLForVanityURL:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCVanityURLMapper.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v20) = 43;
    WORD2(v20) = 2114;
    *(_QWORD *)((char *)&v20 + 6) = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v20 = __Block_byref_object_copy__85;
  *((_QWORD *)&v20 + 1) = __Block_byref_object_dispose__85;
  v21 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCVanityURLMapper _standardizedInputPathWithPath:](self, "_standardizedInputPathWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCVanityURLMapper vanityURLMapping](self, "vanityURLMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__FCVanityURLMapper_URLForVanityURL___block_invoke;
  v15[3] = &unk_1E464B118;
  v15[4] = self;
  v10 = v7;
  v16 = v10;
  v11 = v5;
  v17 = v11;
  v18 = buf;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  v12 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __37__FCVanityURLMapper_URLForVanityURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "sourcePath");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v26, "destinationPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v26, "sourcePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_standardizedMappingPathWithPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(void **)(a1 + 32);
      objc_msgSend(v26, "destinationPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_standardizedMappingPathWithPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(*(id *)(a1 + 40), "rangeOfString:options:", v11, 9);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = v15;
        v18 = v16;
        v19 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
        objc_msgSend(v19, "replaceCharactersInRange:withString:", v17, v18, v14);
        objc_msgSend(*(id *)(a1 + 32), "_standardizeResultPath:", v19);
        objc_msgSend(*(id *)(a1 + 48), "setPath:", v19);
        v20 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v26, "destinationParameters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_setParametersIfNeededWithComponents:parameters:", v21, v22);

        objc_msgSend(*(id *)(a1 + 48), "URL");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v25 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = v23;

        *a4 = 1;
      }

    }
  }

}

- (id)_standardizedInputPathWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "path");
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCVanityURLMapper _standardizedInputPathWithPath:]";
    v10 = 2080;
    v11 = "FCVanityURLMapper.m";
    v12 = 1024;
    v13 = 79;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCVanityURLMapper _pathWithTrailingForwardSlashWithPath:](self, "_pathWithTrailingForwardSlashWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_standardizedMappingPathWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "path");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCVanityURLMapper _standardizedMappingPathWithPath:]";
    v11 = 2080;
    v12 = "FCVanityURLMapper.m";
    v13 = 1024;
    v14 = 89;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCVanityURLMapper _pathWithTrailingForwardSlashWithPath:](self, "_pathWithTrailingForwardSlashWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_pathWithTrailingForwardSlashWithPath:(id)a3
{
  id v3;
  void *v4;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "path");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCVanityURLMapper _pathWithTrailingForwardSlashWithPath:]";
    v9 = 2080;
    v10 = "FCVanityURLMapper.m";
    v11 = 1024;
    v12 = 100;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v3, "fc_stringByAppendingStringIfNeeded:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_standardizeResultPath:(id)a3
{
  id v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "path");
    *(_DWORD *)buf = 136315906;
    v6 = "-[FCVanityURLMapper _standardizeResultPath:]";
    v7 = 2080;
    v8 = "FCVanityURLMapper.m";
    v9 = 1024;
    v10 = 107;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  while (objc_msgSend(v3, "length")
       && objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1) == 47)
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);

}

- (void)_setParametersIfNeededWithComponents:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "substringToIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("?"));

    if (v8)
    {
      objc_msgSend(v14, "query");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCVanityURLMapper _standardizedQueryWithParameters:query:](self, "_standardizedQueryWithParameters:query:", v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setPercentEncodedQuery:", v10);
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v6, "substringToIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("#"));

    if (v12)
    {
      objc_msgSend(v14, "fragment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCVanityURLMapper _standardizedFragmentWithParameters:fragment:](self, "_standardizedFragmentWithParameters:fragment:", v6, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setFragment:", v10);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (id)_standardizedQueryWithParameters:(id)a3 query:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "parameters");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCVanityURLMapper _standardizedQueryWithParameters:query:]";
    v15 = 2080;
    v16 = "FCVanityURLMapper.m";
    v17 = 1024;
    v18 = 136;
    v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_4;
LABEL_6:
    v8 = &stru_1E464BC40;
    v7 = &stru_1E464BC40;
    goto LABEL_7;
  }
  if (!v6)
    goto LABEL_6;
LABEL_4:
  v7 = (__CFString *)v6;
  v8 = CFSTR("&");
LABEL_7:
  objc_msgSend(v5, "fc_stringByReplacingPrefix:withString:", CFSTR("?"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_standardizedFragmentWithParameters:(id)a3 fragment:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "parameters");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCVanityURLMapper _standardizedFragmentWithParameters:fragment:]";
    v15 = 2080;
    v16 = "FCVanityURLMapper.m";
    v17 = 1024;
    v18 = 155;
    v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_4;
LABEL_6:
    v8 = &stru_1E464BC40;
    v7 = &stru_1E464BC40;
    goto LABEL_7;
  }
  if (!v6)
    goto LABEL_6;
LABEL_4:
  v7 = (__CFString *)v6;
  v8 = CFSTR("&");
LABEL_7:
  objc_msgSend(v5, "fc_stringByReplacingPrefix:withString:", CFSTR("#"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NTPBVanityURLMapping)vanityURLMapping
{
  return self->_vanityURLMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vanityURLMapping, 0);
}

@end
