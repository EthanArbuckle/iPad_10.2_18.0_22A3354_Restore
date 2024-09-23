@implementation CNEnvironment

CNAPeopleSuggesterFacade *__46__CNEnvironment_Autocomplete__peopleSuggester__block_invoke()
{
  return +[CNAPeopleSuggesterProxy bestAvailableProxy](CNAPeopleSuggesterProxy, "bestAvailableProxy");
}

CNACDPeopleSuggesterFacade *__48__CNEnvironment_Autocomplete__cdPeopleSuggester__block_invoke()
{
  return +[CNACDPeopleSuggesterProxy bestAvailableProxy](CNACDPeopleSuggesterProxy, "bestAvailableProxy");
}

id __60__CNEnvironment_Autocomplete__suggestedResultPrioritization__block_invoke()
{
  return +[CNAutocompleteSuggestedResultPrioritizer bestAvailablePrioritizer](CNAutocompleteSuggestedResultPrioritizer, "bestAvailablePrioritizer");
}

CNACTStewieFacade *__37__CNEnvironment_Autocomplete__stewie__block_invoke()
{
  CNACTStewieFacade *v0;

  v0 = objc_alloc_init(CNACTStewieFacade);
  -[CNACTStewieFacade startMonitoring](v0, "startMonitoring");
  return v0;
}

uint64_t __51__CNEnvironment_Autocomplete__dataAccessConnection__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
}

@end
