@implementation DAEGrantedDelegatesListContext

- (DAEGrantedDelegatesListContext)initWithResultsBlock:(id)a3
{
  id v4;
  DAEGrantedDelegatesListContext *v5;
  void *v6;
  id resultsBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAEGrantedDelegatesListContext;
  v5 = -[DAEGrantedDelegatesListContext init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    resultsBlock = v5->_resultsBlock;
    v5->_resultsBlock = v6;

  }
  return v5;
}

- (void)finishedWithResults:(id)a3 error:(id)a4
{
  id v6;
  DAEGrantedDelegatesListContext *v7;
  void (**resultsBlock)(id, id, id);
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  resultsBlock = (void (**)(id, id, id))v7->_resultsBlock;
  if (resultsBlock)
  {
    resultsBlock[2](resultsBlock, v10, v6);
    v9 = v7->_resultsBlock;
    v7->_resultsBlock = 0;

  }
  objc_sync_exit(v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsBlock, 0);
}

@end
