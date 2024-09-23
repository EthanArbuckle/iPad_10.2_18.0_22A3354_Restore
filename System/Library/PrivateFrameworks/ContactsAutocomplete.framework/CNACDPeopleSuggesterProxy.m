@implementation CNACDPeopleSuggesterProxy

+ (id)coreDuetProxy
{
  return objc_alloc_init(_CNACDPeopleSuggesterFacade);
}

+ (CNACDPeopleSuggesterFacade)emptyProxy
{
  return (CNACDPeopleSuggesterFacade *)objc_alloc_init(_CNACDPeopleSuggesterFacadeTestDouble);
}

@end
