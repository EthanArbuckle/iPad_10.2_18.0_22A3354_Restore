@implementation CNAutocompleteObservableBuilderBatchingHelperFactory

+ (id)batchingHelperForSearchType:(unint64_t)a3
{
  if (a3 == 3)
    objc_msgSend(a1, "calendarBatchingHelper");
  else
    objc_msgSend(a1, "standardBatchingHelper");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)standardBatchingHelper
{
  return objc_alloc_init(_CNAutocompleteStandardObservableBuilderBatchingHelper);
}

+ (id)calendarBatchingHelper
{
  return objc_alloc_init(_CNAutocompleteCalendarObservableBuilderBatchingHelper);
}

@end
