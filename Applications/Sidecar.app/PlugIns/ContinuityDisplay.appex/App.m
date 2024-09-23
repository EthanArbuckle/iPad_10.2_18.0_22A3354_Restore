@implementation App

- (void)sendEvent:(id)a3
{
  id v4;
  App *v5;

  v4 = a3;
  v5 = self;
  sub_100004FC0(v4);

}

- (App)init
{
  return (App *)sub_100005078();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___App_touchController, a2);
}

@end
