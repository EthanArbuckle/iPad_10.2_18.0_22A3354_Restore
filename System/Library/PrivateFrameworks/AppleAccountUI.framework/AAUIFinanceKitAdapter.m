@implementation AAUIFinanceKitAdapter

- (BOOL)hasOrders
{
  AAUIFinanceKitAdapter *v2;

  v2 = self;
  sub_1DB5A1204();

  return sub_1DB62EFF0() & 1;
}

- (AAUIFinanceKitAdapter)init
{
  return (AAUIFinanceKitAdapter *)FinanceKitAdapter.init()();
}

@end
