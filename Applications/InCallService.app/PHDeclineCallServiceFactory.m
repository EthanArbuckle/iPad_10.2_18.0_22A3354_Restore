@implementation PHDeclineCallServiceFactory

- (id)makeWithCallCenter:(id)a3
{
  id v4;
  PHDeclineCallServiceFactory *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1001824A8(v4);

  return v6;
}

- (PHDeclineCallServiceFactory)init
{
  return (PHDeclineCallServiceFactory *)sub_10018252C();
}

@end
