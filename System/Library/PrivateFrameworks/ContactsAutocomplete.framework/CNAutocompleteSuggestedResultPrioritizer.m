@implementation CNAutocompleteSuggestedResultPrioritizer

+ (id)peopleSuggesterPrioritizer
{
  return objc_alloc_init(_CNAPeopleSuggesterResultPrioritizer);
}

+ (id)passthroughPrioritizer
{
  return objc_alloc_init(_CNAPassthroughResultPrioritizer);
}

@end
