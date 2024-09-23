@implementation EKAutocompleteSearch

+ (id)searchWithEventStore:(id)a3 searchString:(id)a4 maximumResultCount:(unint64_t)a5 ignoreScheduledEvents:(BOOL)a6 initialEvent:(id)a7 pasteboardItemProvider:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  EKAutocompletePendingSearch *v20;

  v11 = a6;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a4;
  v19 = a3;
  v20 = -[EKAutocompletePendingSearch initWithEventStore:searchString:maximumResultCount:ignoreScheduledEvents:initialEvent:pasteboardItemProvider:completionHandler:]([EKAutocompletePendingSearch alloc], "initWithEventStore:searchString:maximumResultCount:ignoreScheduledEvents:initialEvent:pasteboardItemProvider:completionHandler:", v19, v18, a5, v11, v17, v16, v15);

  return v20;
}

- (unint64_t)maximumResultCount
{
  return self->_maximumResultCount;
}

- (void)setMaximumResultCount:(unint64_t)a3
{
  self->_maximumResultCount = a3;
}

@end
