@implementation CarPlaySceneDelegate

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13InCallService20CarPlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100143C40();

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC13InCallService20CarPlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100143CA8(v4);

}

- (_TtC13InCallService20CarPlaySceneDelegate)init
{
  return (_TtC13InCallService20CarPlaySceneDelegate *)sub_100143E24();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService20CarPlaySceneDelegate_hardwareControlsBroadcaster));
}

@end
