@implementation FCHeadlineExperimentalTitleProvider

- (id)headlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (+[FCHeadlineExperimentalTitleProvider isDebugModeEnabled](FCHeadlineExperimentalTitleProvider, "isDebugModeEnabled"))
  {
    -[FCHeadlineExperimentalTitleProvider _debugHeadlineMetadataFromTitle:fromExperimentalTitles:forArticleID:](self, "_debugHeadlineMetadataFromTitle:fromExperimentalTitles:forArticleID:", v10, v9, v8);
  }
  else
  {
    -[FCHeadlineExperimentalTitleProvider _headlineMetadataFromTitle:fromExperimentalTitles:forArticleID:](self, "_headlineMetadataFromTitle:fromExperimentalTitles:forArticleID:", v10, v9, v8);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)isDebugModeEnabled
{
  if (qword_1ED0F8820 != -1)
    dispatch_once(&qword_1ED0F8820, &__block_literal_global_168);
  return _MergedGlobals_213;
}

- (id)_headlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  FCHeadlineExperimentalTitleMetadata *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[FCHeadlineExperimentalTitleProvider shouldShowAlternateHeadlines](self, "shouldShowAlternateHeadlines"))
  {
    if (objc_msgSend(v9, "count"))
    {
      -[FCHeadlineExperimentalTitleProvider feldsparID](self, "feldsparID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v8;
        v13 = objc_msgSend(v9, "count");
        if (v13 == 1)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v18 = objc_claimAutoreleasedReturnValue();

          v17 = 0;
          if (objc_msgSend(v12, "isEqualToString:", v18))
            v19 = 5;
          else
            v19 = 6;
        }
        else
        {
          if ((unint64_t)objc_msgSend(v9, "count") < 2)
          {
            -[FCHeadlineExperimentalTitleProvider metadataForDefaultHeadlineWithTitle:](self, "metadataForDefaultHeadlineWithTitle:", v12);
            v22 = (FCHeadlineExperimentalTitleMetadata *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
          -[FCHeadlineExperimentalTitleProvider feldsparID](self, "feldsparID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "hash");
          v16 = objc_msgSend(v10, "hash") ^ v15;
          v17 = v16 % objc_msgSend(v9, "count");

          objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v19 = 3;
        }
        v12 = (id)v18;
        v22 = -[FCHeadlineExperimentalTitleMetadata initWithChosenTitle:isTitleExperimental:arrayIndexUsedforTitle:treatmentState:]([FCHeadlineExperimentalTitleMetadata alloc], "initWithChosenTitle:isTitleExperimental:arrayIndexUsedforTitle:treatmentState:", v18, v13 != 1, v17, v19);
LABEL_14:
        v20 = v22;

        goto LABEL_8;
      }
    }
  }
  -[FCHeadlineExperimentalTitleProvider metadataForDefaultHeadlineWithTitle:](self, "metadataForDefaultHeadlineWithTitle:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v20;
}

- (BOOL)shouldShowAlternateHeadlines
{
  return self->_shouldShowAlternateHeadlines;
}

- (id)metadataForDefaultHeadlineWithTitle:(id)a3
{
  id v3;
  FCHeadlineExperimentalTitleMetadata *v4;

  v3 = a3;
  v4 = -[FCHeadlineExperimentalTitleMetadata initWithChosenTitle:isTitleExperimental:arrayIndexUsedforTitle:treatmentState:]([FCHeadlineExperimentalTitleMetadata alloc], "initWithChosenTitle:isTitleExperimental:arrayIndexUsedforTitle:treatmentState:", v3, 0, 0, 1);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feldsparID, 0);
}

- (FCHeadlineExperimentalTitleProvider)initWithShouldShowAlternateHeadlines:(BOOL)a3
{
  FCHeadlineExperimentalTitleProvider *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *feldsparID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FCHeadlineExperimentalTitleProvider;
  v4 = -[FCHeadlineExperimentalTitleProvider init](&v10, sel_init);
  if (v4)
  {
    +[FCFeldsparIDProvider sharedInstance](FCFeldsparIDProvider, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feldsparID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    feldsparID = v4->_feldsparID;
    v4->_feldsparID = (NSString *)v7;

    v4->_shouldShowAlternateHeadlines = +[FCHeadlineExperimentalTitleProvider isDebugModeEnabled](FCHeadlineExperimentalTitleProvider, "isDebugModeEnabled")|| a3;
  }
  return v4;
}

void __57__FCHeadlineExperimentalTitleProvider_isDebugModeEnabled__block_invoke()
{
  id v0;

  if ((NFInternalBuild() & 1) != 0)
  {
    NewsCoreUserDefaults();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_213 = objc_msgSend(v0, "BOOLForKey:", CFSTR("debug_alternate_headline_preference_key"));

  }
  else
  {
    _MergedGlobals_213 = 0;
  }
}

- (id)_debugHeadlineMetadataFromTitle:(id)a3 fromExperimentalTitles:(id)a4 forArticleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  FCHeadlineExperimentalTitleProvider *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9)
  {
    v22 = v10;
    v23 = self;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*%@"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    v10 = v22;
    self = v23;
  }
  else
  {
    v18 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d %@"), v18, v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v19);

      v18 = (v18 + 1);
    }
    while ((_DWORD)v18 != 8);
  }
  -[FCHeadlineExperimentalTitleProvider _headlineMetadataFromTitle:fromExperimentalTitles:forArticleID:](self, "_headlineMetadataFromTitle:fromExperimentalTitles:forArticleID:", v8, v11, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)feldsparID
{
  return self->_feldsparID;
}

- (void)setShouldShowAlternateHeadlines:(BOOL)a3
{
  self->_shouldShowAlternateHeadlines = a3;
}

@end
