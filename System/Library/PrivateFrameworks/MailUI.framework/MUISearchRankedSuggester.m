@implementation MUISearchRankedSuggester

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MUISearchRankedSuggester_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (OS_os_log *)(id)log_log_8;
}

void __31__MUISearchRankedSuggester_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;

}

+ (id)suggesterWithBundleID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleID:", v4);

  return v5;
}

- (MUISearchRankedSuggester)initWithBundleID:(id)a3
{
  id v4;
  MUISearchRankedSuggester *v5;
  uint64_t v6;
  NSString *bundleID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUISearchRankedSuggester;
  v5 = -[MUISearchRankedSuggester init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

  }
  return v5;
}

- (BOOL)shouldQueryForAsYouType
{
  return 1;
}

- (NSString)logIdentifier
{
  return (NSString *)CFSTR("Ranked");
}

- (NSArray)categories
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  +[MUISearchSuggestionCategory contactCategory](MUISearchSuggestionCategory, "contactCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[MUISearchSuggestionCategory genericCategory](MUISearchSuggestionCategory, "genericCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id *v8;

  v6 = a4;
  v7 = a3;
  v8 = (id *)-[MUISearchRankedSuggesterQuery initWithPhraseManager:handler:suggester:]((uint64_t)[MUISearchRankedSuggesterQuery alloc], v7, v6, self);

  if (v8)
    objc_msgSend(v8[4], "start");
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
