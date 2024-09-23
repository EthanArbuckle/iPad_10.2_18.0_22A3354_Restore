@implementation ESECalendarAvailabilityContext

- (ESECalendarAvailabilityContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  ESECalendarAvailabilityContext *v8;
  uint64_t v9;
  id resultsBlock;
  uint64_t v11;
  id completionBlock;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ESECalendarAvailabilityContext;
  v8 = -[ESECalendarAvailabilityContext init](&v14, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x227688EF0](v6);
    resultsBlock = v8->_resultsBlock;
    v8->_resultsBlock = (id)v9;

    v11 = MEMORY[0x227688EF0](v7);
    completionBlock = v8->_completionBlock;
    v8->_completionBlock = (id)v11;

  }
  return v8;
}

- (void)resultsReturned:(id)a3
{
  ESECalendarAvailabilityContext *v4;
  void (**resultsBlock)(id, id);
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  resultsBlock = (void (**)(id, id))v4->_resultsBlock;
  if (resultsBlock)
    resultsBlock[2](resultsBlock, v6);
  objc_sync_exit(v4);

}

- (void)finishedWithError:(id)a3
{
  ESECalendarAvailabilityContext *v4;
  void (**completionBlock)(id, id);
  id v6;
  id resultsBlock;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  completionBlock = (void (**)(id, id))v4->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, v8);
    v6 = v4->_completionBlock;
    v4->_completionBlock = 0;

    resultsBlock = v4->_resultsBlock;
    v4->_resultsBlock = 0;

  }
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
}

@end
