@implementation DEFilter

- (DEFilter)initWithInclude:(id)a3 exclude:(id)a4
{
  id v7;
  id v8;
  DEFilter *v9;
  DEFilter *v10;
  DEFilter *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DEFilter;
  v9 = -[DEFilter init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_include, a3);
    objc_storeStrong((id *)&v10->_exclude, a4);
    v11 = v10;
  }

  return v10;
}

- (DEFilter)init
{
  return -[DEFilter initWithInclude:exclude:](self, "initWithInclude:exclude:", 0, 0);
}

- (BOOL)allows:(id)a3
{
  id v4;
  DEMatchCriteria *include;
  DEMatchCriteria *exclude;
  BOOL v7;

  v4 = a3;
  include = self->_include;
  v7 = 0;
  if (!include || -[DEMatchCriteria all:](include, "all:", v4))
  {
    exclude = self->_exclude;
    if (!exclude || !-[DEMatchCriteria any:](exclude, "any:", v4))
      v7 = 1;
  }

  return v7;
}

- (BOOL)apply:(id)a3 to:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  id v26;
  unsigned int (**v27)(id, void *, void *);
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  char v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v27 = (unsigned int (**)(id, void *, void *))a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v26 = v5;
    v44 = 0;
    objc_msgSend(v29, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v26, "fileExistsAtPath:isDirectory:", v6, &v44);
    if (v44)
      v8 = v7;
    else
      v8 = 0;

    if ((v8 & 1) != 0)
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0;
      v31 = *MEMORY[0x1E0C99A18];
      v46[0] = *MEMORY[0x1E0C99A18];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __21__DEFilter_apply_to___block_invoke;
      v39[3] = &unk_1E7930F70;
      v39[4] = &v40;
      objc_msgSend(v26, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v29, v9, 0, v39);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        obj = v25;
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v11)
        {
          v32 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v36 != v32)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              if (v13)
              {
                v33 = 0;
                v34 = 0;
                v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v34, v31, &v33);
                v15 = v34;
                v16 = v33;

                if (v15)
                  v17 = v14;
                else
                  v17 = 0;
                if (v17 == 1 && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
                {
                  objc_msgSend(v13, "URLByStandardizingPath");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "absoluteString");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "URLByStandardizingPath");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "absoluteString");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "substringFromIndex:", objc_msgSend(v21, "length"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (-[DEFilter allows:](self, "allows:", v22) && !v27[2](v27, v22, v13))
                  {

                    goto LABEL_31;
                  }

                }
                else if (v16)
                {
                  +[DELogging error:](DELogging, "error:", CFSTR("Failed to determine if file at URL \"%@\" is regular: %@"), v13, v16);
                }

                v10 = v16;
              }
            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            if (v11)
              continue;
            break;
          }
        }

        v23 = *((_BYTE *)v41 + 24) == 0;
        v16 = v10;
      }
      else
      {
        v16 = 0;
LABEL_31:
        v23 = 0;
      }

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed find source directory at \"%@\"), v29);
      v16 = 0;
      v23 = 0;
    }
    v5 = v26;
  }
  else
  {
    v16 = 0;
    v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  DEFilter *v4;
  DEFilter *v5;
  DEMatchCriteria *include;
  void *v7;
  DEMatchCriteria *exclude;
  void *v9;
  _BOOL4 v10;
  DEMatchCriteria *v11;
  void *v12;
  BOOL v13;
  DEMatchCriteria *v14;
  void *v15;
  char v16;

  v4 = (DEFilter *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      include = self->_include;
      -[DEFilter include](v5, "include");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(include) = (include != 0) ^ (v7 == 0);

      if ((include & 1) == 0)
        goto LABEL_11;
      exclude = self->_exclude;
      -[DEFilter exclude](v5, "exclude");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if ((exclude != 0) == v10
        || (v11 = self->_include) != 0
        && (-[DEFilter include](v5, "include"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = -[DEMatchCriteria isEqual:](v11, "isEqual:", v12),
            v12,
            !v13))
      {
LABEL_11:
        v16 = 0;
      }
      else
      {
        v14 = self->_exclude;
        if (v14)
        {
          -[DEFilter exclude](v5, "exclude");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[DEMatchCriteria isEqual:](v14, "isEqual:", v15);

        }
        else
        {
          v16 = 1;
        }
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (DEMatchCriteria)include
{
  return self->_include;
}

- (void)setInclude:(id)a3
{
  objc_storeStrong((id *)&self->_include, a3);
}

- (DEMatchCriteria)exclude
{
  return self->_exclude;
}

- (void)setExclude:(id)a3
{
  objc_storeStrong((id *)&self->_exclude, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclude, 0);
  objc_storeStrong((id *)&self->_include, 0);
}

uint64_t __21__DEFilter_apply_to___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to enumerate file at URL \"%@\": %@"), v5, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

  return 0;
}

+ (id)filterFromPb:(const void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DEFilter *v8;

  if (*((_QWORD *)a3 + 3))
    v4 = (void *)*((_QWORD *)a3 + 3);
  else
    v4 = &siri::dialogengine::CatUpdater::_MatchCriteria_default_instance_;
  +[DEMatchCriteria matchCriteriaFromPb:](DEMatchCriteria, "matchCriteriaFromPb:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_QWORD *)a3 + 4))
    v6 = (void *)*((_QWORD *)a3 + 4);
  else
    v6 = &siri::dialogengine::CatUpdater::_MatchCriteria_default_instance_;
  +[DEMatchCriteria matchCriteriaFromPb:](DEMatchCriteria, "matchCriteriaFromPb:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DEFilter initWithInclude:exclude:]([DEFilter alloc], "initWithInclude:exclude:", v5, v7);

  return v8;
}

+ (void)filterToPb:(id)a3 filterPb:(void *)a4
{
  void *v5;
  siri::dialogengine::CatUpdater::MatchCriteria *matched;
  void *v7;
  void *v8;
  siri::dialogengine::CatUpdater::MatchCriteria *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "include");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *((_DWORD *)a4 + 4) |= 1u;
    matched = (siri::dialogengine::CatUpdater::MatchCriteria *)*((_QWORD *)a4 + 3);
    if (!matched)
    {
      matched = google::protobuf::Arena::CreateMaybeMessage<siri::dialogengine::CatUpdater::MatchCriteria>(0);
      *((_QWORD *)a4 + 3) = matched;
    }
    objc_msgSend(v11, "include");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEMatchCriteria matchCriteriaToPb:matchCriteriaPb:](DEMatchCriteria, "matchCriteriaToPb:matchCriteriaPb:", v7, matched);

  }
  objc_msgSend(v11, "exclude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *((_DWORD *)a4 + 4) |= 2u;
    v9 = (siri::dialogengine::CatUpdater::MatchCriteria *)*((_QWORD *)a4 + 4);
    if (!v9)
    {
      v9 = google::protobuf::Arena::CreateMaybeMessage<siri::dialogengine::CatUpdater::MatchCriteria>(0);
      *((_QWORD *)a4 + 4) = v9;
    }
    objc_msgSend(v11, "exclude");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEMatchCriteria matchCriteriaToPb:matchCriteriaPb:](DEMatchCriteria, "matchCriteriaToPb:matchCriteriaPb:", v10, v9);

  }
}

+ (id)filterThroughPb:(id)a3
{
  id v3;
  void *v4;
  _BYTE v6[40];

  v3 = a3;
  siri::dialogengine::CatUpdater::Filter::Filter((siri::dialogengine::CatUpdater::Filter *)v6);
  +[DEFilter filterToPb:filterPb:](DEFilter, "filterToPb:filterPb:", v3, v6);
  +[DEFilter filterFromPb:](DEFilter, "filterFromPb:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  siri::dialogengine::CatUpdater::Filter::~Filter((siri::dialogengine::CatUpdater::Filter *)v6);

  return v4;
}

+ (id)catUpdates:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  DEFilter *v14;
  void *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E7944740);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v16;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = v5;
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v8 = v20;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v22 != v10)
                  objc_enumerationMutation(v8);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v12);

              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v9);
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v5);
    }

    v20 = v4;
  }
  objc_msgSend(v20, "addObjectsFromArray:", &unk_1E7944728);
  v13 = (void *)objc_msgSend((id)objc_opt_new(), "initWithPrefixes:suffixes:", &unk_1E7944758, v20);
  v14 = -[DEFilter initWithInclude:exclude:]([DEFilter alloc], "initWithInclude:exclude:", v13, 0);

  return v14;
}

+ (id)catUpdates
{
  return +[DEFilter catUpdates:](DEFilter, "catUpdates:", 0);
}

+ (id)deprecatedCatSummary
{
  void *v2;
  DEFilter *v3;

  v2 = (void *)objc_msgSend((id)objc_opt_new(), "initWithPrefixes:suffixes:", &unk_1E7944770, &unk_1E7944788);
  v3 = -[DEFilter initWithInclude:exclude:]([DEFilter alloc], "initWithInclude:exclude:", v2, 0);

  return v3;
}

@end
