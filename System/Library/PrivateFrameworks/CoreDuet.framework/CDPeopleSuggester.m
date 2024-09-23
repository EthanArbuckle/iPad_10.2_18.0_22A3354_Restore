@implementation CDPeopleSuggester

void __38___CDPeopleSuggester_initWithAdvisor___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSettings");

}

void __57___CDPeopleSuggester_suggestPeopleWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[8];
  id v7;

  v2 = *(void **)(a1 + 32);
  v7 = 0;
  objc_msgSend(v2, "suggestPeopleWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  +[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SuggestPeopleAsync", (const char *)&unk_18DF6D5CF, v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
