@implementation ESECalendarDirectorySearchContext

- (ESECalendarDirectorySearchContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  ESECalendarDirectorySearchContext *v8;
  uint64_t v9;
  id resultsBlock;
  uint64_t v11;
  id completionBlock;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ESECalendarDirectorySearchContext;
  v8 = -[ESECalendarDirectorySearchContext init](&v14, sel_init);
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
  ESECalendarDirectorySearchContext *v4;
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

- (void)finishedWithError:(id)a3 exceededResultLimit:(BOOL)a4
{
  _BOOL8 v4;
  ESECalendarDirectorySearchContext *v6;
  void (**completionBlock)(id, id, _BOOL8);
  id v8;
  id resultsBlock;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = self;
  objc_sync_enter(v6);
  completionBlock = (void (**)(id, id, _BOOL8))v6->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, v10, v4);
    v8 = v6->_completionBlock;
    v6->_completionBlock = 0;

    resultsBlock = v6->_resultsBlock;
    v6->_resultsBlock = 0;

  }
  objc_sync_exit(v6);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
}

@end
