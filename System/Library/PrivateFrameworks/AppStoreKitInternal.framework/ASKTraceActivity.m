@implementation ASKTraceActivity

+ (void)traceAccountViewControllerPullToRefresh:(id)a3
{
  _os_activity_initiate(&dword_1D8328000, "[jet] AccountViewController:pullToRefresh", OS_ACTIVITY_FLAG_DEFAULT, a3);
}

+ (void)traceAccountPresenterDidLoad:(id)a3
{
  _os_activity_initiate(&dword_1D8328000, "[jet] AccountPresenter:didLoad", OS_ACTIVITY_FLAG_DEFAULT, a3);
}

+ (void)traceAccountPresenterUpdate:(id)a3
{
  _os_activity_initiate(&dword_1D8328000, "[jet] AccountPresenter:update", OS_ACTIVITY_FLAG_DEFAULT, a3);
}

+ (void)traceAccountPresenterRefreshUpdates:(id)a3
{
  _os_activity_initiate(&dword_1D8328000, "[jet] AccountPresenter:refreshUpdates", OS_ACTIVITY_FLAG_DEFAULT, a3);
}

+ (void)traceUpdatesPresenterUpdateBadgeCount:(id)a3
{
  _os_activity_initiate(&dword_1D8328000, "[jet] UpdatesPresenter:updateBadgeCount", OS_ACTIVITY_FLAG_DEFAULT, a3);
}

+ (void)traceUpdatesPresenterUpdateStoreDidChange:(id)a3
{
  _os_activity_initiate(&dword_1D8328000, "[jet] UpdatesPresenter:storeDidChange", OS_ACTIVITY_FLAG_DEFAULT, a3);
}

@end
