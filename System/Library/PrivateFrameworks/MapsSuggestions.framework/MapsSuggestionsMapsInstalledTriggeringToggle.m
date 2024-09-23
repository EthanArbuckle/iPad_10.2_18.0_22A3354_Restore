@implementation MapsSuggestionsMapsInstalledTriggeringToggle

- (void)didAddFirstObserver
{
  NSObject *v3;
  id v4;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)didRemoveLastObserver
{
  NSObject *v3;
  id v4;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (BOOL)isTrue
{
  objc_super v4;

  if (!-[MapsSuggestionsTriggeringToggle timesUpdated](self, "timesUpdated"))
    -[MapsSuggestionsTriggeringToggle setState:](self, "setState:", MapsSuggestionsMapsAppIsInstalled());
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsMapsInstalledTriggeringToggle;
  return -[MapsSuggestionsTriggeringToggle isTrue](&v4, sel_isTrue);
}

- (void)applicationsDidInstall:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[MapsSuggestionsMapsInstalledTriggeringToggle applicationsDidInstall:]";
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[MapsSuggestionsTriggeringToggle setState:](self, "setState:", MapsSuggestionsMapsAppIsInstalled());
}

- (void)applicationsDidUninstall:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[MapsSuggestionsMapsInstalledTriggeringToggle applicationsDidUninstall:]";
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[MapsSuggestionsTriggeringToggle setState:](self, "setState:", MapsSuggestionsMapsAppIsInstalled());
}

@end
