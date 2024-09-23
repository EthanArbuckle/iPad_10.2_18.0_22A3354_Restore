@implementation EMFBiomeEmojiUsageRecorder

- (EMFBiomeEmojiUsageRecorder)initWithEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  EMFBiomeEmojiUsageRecorder *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *localeIdentifier;
  uint64_t v25;
  NSLocale *locale;
  uint64_t v27;
  NSString *replacementContext;
  uint64_t v29;
  NSString *searchQuery;
  uint64_t v31;
  NSNumber *resultPosition;
  uint64_t v33;
  NSNumber *numberSearchQueriesRun;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  BMSource *biomeStream;
  objc_super v41;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v41.receiver = self;
  v41.super_class = (Class)EMFBiomeEmojiUsageRecorder;
  v20 = -[EMFDPRecorder initWithEmoji:](&v41, sel_initWithEmoji_, v15);
  if (v20)
  {
    objc_msgSend(v15, "localeData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    localeIdentifier = v20->_localeIdentifier;
    v20->_localeIdentifier = (NSString *)v23;

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v20->_localeIdentifier);
    v25 = objc_claimAutoreleasedReturnValue();
    locale = v20->_locale;
    v20->_locale = (NSLocale *)v25;

    v20->_usageSource = a4;
    v27 = objc_msgSend(v16, "copy");
    replacementContext = v20->_replacementContext;
    v20->_replacementContext = (NSString *)v27;

    v29 = objc_msgSend(v17, "copy");
    searchQuery = v20->_searchQuery;
    v20->_searchQuery = (NSString *)v29;

    v31 = objc_msgSend(v18, "copy");
    resultPosition = v20->_resultPosition;
    v20->_resultPosition = (NSNumber *)v31;

    v33 = objc_msgSend(v19, "copy");
    numberSearchQueriesRun = v20->_numberSearchQueriesRun;
    v20->_numberSearchQueriesRun = (NSNumber *)v33;

    v20->_wasPositiveEngagement = a9;
    BiomeLibrary();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "Emoji");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "Engagement");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "source");
    v38 = objc_claimAutoreleasedReturnValue();
    biomeStream = v20->_biomeStream;
    v20->_biomeStream = (BMSource *)v38;

  }
  return v20;
}

- (id)recordingKey
{
  return CFSTR("Emoji.Engagement");
}

- (id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMFBiomeEmojiUsageRecorder;
  -[EMFDPRecorder delegate](&v3, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)report
{
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[EMFBiomeEmojiUsageRecorder localeIdentifier](self, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EMFBiomeEmojiUsageRecorder biomeStream](self, "biomeStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      emf_logging_get_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[EMFBiomeEmojiUsageRecorder report].cold.1(v5);
      v6 = 0;
      goto LABEL_16;
    }
    -[EMFBiomeEmojiUsageRecorder _createEngagementEvent](self, "_createEngagementEvent");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;
    emf_logging_get_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[EMFBiomeEmojiUsageRecorder report].cold.2(v5, v8);

      -[EMFBiomeEmojiUsageRecorder biomeStream](self, "biomeStream");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendEvent:", v5);

      -[EMFBiomeEmojiUsageRecorder delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v6 = 1;
        goto LABEL_16;
      }
      -[EMFBiomeEmojiUsageRecorder delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject emoji](v5, "emoji");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject record:](v8, "record:", v12);

    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[EMFBiomeEmojiUsageRecorder report].cold.3(self, v8);
    }

LABEL_16:
    return v6;
  }
  return 0;
}

- (id)_createEngagementEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[EMFDPRecorder emoji](self, "emoji");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
    v6 = 1;
    switch(-[EMFBiomeEmojiUsageRecorder usageSource](self, "usageSource"))
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_15;
      case 2uLL:
        v6 = 2;
        goto LABEL_15;
      case 3uLL:
        v6 = 3;
        goto LABEL_15;
      case 4uLL:
        v6 = 4;
        goto LABEL_15;
      case 5uLL:
        v6 = 5;
        goto LABEL_15;
      case 6uLL:
        v6 = 6;
        goto LABEL_15;
      case 7uLL:
        v6 = 7;
        goto LABEL_15;
      case 8uLL:
        v6 = 8;
        goto LABEL_15;
      case 9uLL:
        v6 = 9;
        goto LABEL_15;
      case 10uLL:
        v6 = 10;
LABEL_15:
        v8 = objc_alloc(MEMORY[0x1E0D02000]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EMFBiomeEmojiUsageRecorder wasPositiveEngagement](self, "wasPositiveEngagement"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMFBiomeEmojiUsageRecorder localeIdentifier](self, "localeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMFBiomeEmojiUsageRecorder replacementContext](self, "replacementContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMFBiomeEmojiUsageRecorder resultPosition](self, "resultPosition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMFBiomeEmojiUsageRecorder numberSearchQueriesRun](self, "numberSearchQueriesRun");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMFBiomeEmojiUsageRecorder searchQuery](self, "searchQuery");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v8, "initWithEmoji:wasPositiveEngagement:localeIdentifier:inputMode:replacementContext:resultPosition:numberSearchQueriesRun:finalSearchQuery:", v4, v9, v10, v6, v11, v12, v13, v14);

        break;
      default:
        -[EMFBiomeEmojiUsageRecorder _createEngagementEvent].cold.2();
    }
  }
  else
  {
    emf_logging_get_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EMFBiomeEmojiUsageRecorder _createEngagementEvent].cold.1(self, v7);

    v5 = 0;
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (unint64_t)usageSource
{
  return self->_usageSource;
}

- (NSString)replacementContext
{
  return self->_replacementContext;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (NSNumber)resultPosition
{
  return self->_resultPosition;
}

- (NSNumber)numberSearchQueriesRun
{
  return self->_numberSearchQueriesRun;
}

- (BOOL)wasPositiveEngagement
{
  return self->_wasPositiveEngagement;
}

- (BMSource)biomeStream
{
  return (BMSource *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBiomeStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStream, 0);
  objc_storeStrong((id *)&self->_numberSearchQueriesRun, 0);
  objc_storeStrong((id *)&self->_resultPosition, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_replacementContext, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)report
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "emoji");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1B3DE1000, a2, OS_LOG_TYPE_ERROR, "Failed to donate emoji engagement to Biome: '%{public}@'", (uint8_t *)&v5, 0xCu);

}

- (void)_createEngagementEvent
{
  __assert_rtn("_biomeInputModeForUsageSource", "EMFBiomeEmojiUsageRecorder.m", 47, "false && \"An unrecognized EMFEmojiUsageSource could not be converted into a known Biome Emoji engagment input mode.\");
}

@end
