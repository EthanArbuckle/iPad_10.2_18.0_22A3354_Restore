@implementation _MXVersion

- (_MXVersion)init
{
  _MXVersion *result;

  result = (_MXVersion *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_MXVersion)initWithComponents:(id)a3
{
  id v4;
  _MXVersion *v5;
  uint64_t v6;
  NSArray *components;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MXVersion;
  v5 = -[_MXVersion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    components = v5->_components;
    v5->_components = (NSArray *)v6;

  }
  return v5;
}

- (_MXVersion)initWithVersionString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _MXVersion *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "integerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[_MXVersion initWithComponents:](self, "initWithComponents:", v5);
  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;

  v4 = a3;
  -[_MXVersion components](self, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 <= objc_msgSend(v6, "count"))
    v8 = v6;
  else
    v8 = v5;
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      v12 = &unk_1E2158C38;
      if (v11 < objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = &unk_1E2158C38;
      if (v11 < objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = objc_msgSend(v12, "compare:", v13);

      if (v14)
        break;
      if (v10 == ++v11)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v14 = 0;
  }

  return v14;
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

@end
