@implementation CommunicationManager

- (void)serviceProxyDidConnect:(id)a3
{
  id v4;
  _TtC13SharedWithYou20CommunicationManager *v5;

  v4 = a3;
  v5 = self;
  sub_18EADD018();

}

- (_TtC13SharedWithYou20CommunicationManager)init
{
  _QWORD *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy) = 0;
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier);
  *v2 = 0;
  v2[1] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CommunicationManager();
  return -[CommunicationManager init](&v4, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController));
}

@end
