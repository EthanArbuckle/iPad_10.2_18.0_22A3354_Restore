@implementation DAEUpdateGrantedDelegatePermissionContext

- (DAEUpdateGrantedDelegatePermissionContext)initWithResultsBlock:(id)a3
{
  id v4;
  DAEUpdateGrantedDelegatePermissionContext *v5;
  void *v6;
  id resultsBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAEUpdateGrantedDelegatePermissionContext;
  v5 = -[DAEUpdateGrantedDelegatePermissionContext init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    resultsBlock = v5->_resultsBlock;
    v5->_resultsBlock = v6;

  }
  return v5;
}

- (void)finishedWithError:(id)a3
{
  DAEUpdateGrantedDelegatePermissionContext *v4;
  void (**resultsBlock)(id, id);
  id v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  resultsBlock = (void (**)(id, id))v4->_resultsBlock;
  if (resultsBlock)
  {
    resultsBlock[2](resultsBlock, v7);
    v6 = v4->_resultsBlock;
    v4->_resultsBlock = 0;

  }
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsBlock, 0);
}

@end
