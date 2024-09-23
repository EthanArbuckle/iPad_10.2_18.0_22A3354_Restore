@implementation NotificationSuppressionSystem

- (void)scheduler:(id)a3 performActivityWithName:(id)a4 completion:(id)a5
{
  void *v6;
  id v7;

  v6 = _Block_copy(a5);
  v7 = a3;
  swift_retain();
  sub_1CC37FF3C();
  _Block_release(v6);

  swift_release();
}

@end
