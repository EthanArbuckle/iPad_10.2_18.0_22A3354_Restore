@implementation FCSportsEventRecordSource

- (id)recordIDPrefixes
{
  return +[FCSportsEventRecordSource recordIDPrefixes](FCSportsEventRecordSource, "recordIDPrefixes");
}

+ (id)recordIDPrefixes
{
  return &unk_1E470C870;
}

- (id)recordType
{
  return CFSTR("SportsEvent");
}

- (int)pbRecordType
{
  return 14;
}

- (unint64_t)storeVersion
{
  return 1;
}

- (id)storeFilename
{
  return CFSTR("sports-event-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 8000000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = (objc_class *)MEMORY[0x1E0D62830];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setBase:", v7);

  -[FCRecordSource localizedLanguageSpecificKeysByOriginalKey](self, "localizedLanguageSpecificKeysByOriginalKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:](self, "valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:", v8, CFSTR("superfeedConfigResourceID"), v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSuperfeedConfigResourceID:", v12);

  -[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:](self, "valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:", v8, CFSTR("eventArticleListID"), v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEventArticleListID:", v13);

  -[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:](self, "valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:", v8, CFSTR("highlightsArticleListID"), v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHighlightsArticleListID:", v14);

  -[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:](self, "valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:", v8, CFSTR("eventCompetitorTagIDs"), v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEventCompetitorTagIDs:", v15);

  -[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:](self, "valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:", v8, CFSTR("eventLeagueTagID"), v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEventLeagueTagID:", v16);

  -[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:](self, "valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:", v8, CFSTR("sportsData"), v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSportsData:", v17);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minNewsVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v18));

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sportsTheme"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSportsTheme:", v19);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isDeprecated"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsDeprecated:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v8, "objectForKey:", CFSTR("blockedStorefrontIDs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  objc_msgSend(v9, "setBlockedStorefrontIDs:", v22);

  objc_msgSend(v8, "objectForKey:", CFSTR("allowedStorefrontIDs"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(v23, "mutableCopy");
  objc_msgSend(v9, "setAllowedStorefrontIDs:", v24);

  return v9;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 4000000;
}

+ (BOOL)recognizesRecordID:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  +[FCSportsEventRecordSource recordIDPrefixes](FCSportsEventRecordSource, "recordIDPrefixes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[FCRecordSource recognizesRecordID:inRecordIDPrefixes:](FCRecordSource, "recognizesRecordID:inRecordIDPrefixes:", v3, v4);

  return v5;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F8880 != -1)
    dispatch_once(&qword_1ED0F8880, &__block_literal_global_8_4);
  return (id)_MergedGlobals_218;
}

void __47__FCSportsEventRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("minNewsVersion"), CFSTR("sportsTheme"), CFSTR("isDeprecated"), CFSTR("blockedStorefrontIDs"), CFSTR("allowedStorefrontIDs"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_218;
  _MergedGlobals_218 = v0;

}

- (id)localizableKeys
{
  if (qword_1ED0F8890 != -1)
    dispatch_once(&qword_1ED0F8890, &__block_literal_global_11_2);
  return (id)qword_1ED0F8888;
}

void __44__FCSportsEventRecordSource_localizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("superfeedConfigResourceID"), CFSTR("eventCompetitorTagIDs"), CFSTR("eventLeagueTagID"), CFSTR("sportsData"), CFSTR("highlightsArticleListID"), CFSTR("eventArticleListID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8888;
  qword_1ED0F8888 = v0;

}

- (id)localizableLanguageSpecificKeys
{
  if (qword_1ED0F88A0 != -1)
    dispatch_once(&qword_1ED0F88A0, &__block_literal_global_13_2);
  return (id)qword_1ED0F8898;
}

void __60__FCSportsEventRecordSource_localizableLanguageSpecificKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("superfeedConfigResourceID"), CFSTR("eventCompetitorTagIDs"), CFSTR("eventLeagueTagID"), CFSTR("sportsData"), CFSTR("highlightsArticleListID"), CFSTR("eventArticleListID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8898;
  qword_1ED0F8898 = v0;

}

+ (id)defaultCachePolicy
{
  if (qword_1ED0F88B0 != -1)
    dispatch_once(&qword_1ED0F88B0, &__block_literal_global_14_8);
  return (id)qword_1ED0F88A8;
}

uint64_t __47__FCSportsEventRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0F88A8;
  qword_1ED0F88A8 = v0;

  objc_msgSend((id)qword_1ED0F88A8, "setCachePolicy:", 4);
  return objc_msgSend((id)qword_1ED0F88A8, "setMaximumCachedAge:", 1500.0);
}

@end
