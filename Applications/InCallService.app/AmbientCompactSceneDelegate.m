@implementation AmbientCompactSceneDelegate

- (UIWindow)window
{
  id v2;

  sub_100184164();
  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5;
  _TtC13InCallService27AmbientCompactSceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_1001841D4((uint64_t)a3);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13InCallService27AmbientCompactSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1001841E8(v8);

}

- (_TtC13InCallService27AmbientCompactSceneDelegate)init
{
  return (_TtC13InCallService27AmbientCompactSceneDelegate *)sub_1001844BC();
}

- (void).cxx_destruct
{

}

@end
