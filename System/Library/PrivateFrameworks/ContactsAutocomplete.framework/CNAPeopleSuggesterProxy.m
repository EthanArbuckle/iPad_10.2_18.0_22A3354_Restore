@implementation CNAPeopleSuggesterProxy

+ (id)peopleSuggesterProxy
{
  return objc_alloc_init(_CNAPeopleSuggesterFacade);
}

+ (CNAPeopleSuggesterFacade)emptyProxy
{
  return (CNAPeopleSuggesterFacade *)objc_alloc_init(_CNAPeopleSuggesterFacadeTestDouble);
}

@end
