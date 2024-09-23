@implementation AXWatchRemoteScreenServiceAXUIService

- (_TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  return -[AXWatchRemoteScreenServiceAXUIService init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client));
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5;
  _TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService *v6;

  v5 = a3;
  v6 = self;
  sub_21DBF8158(a3);

}

@end
