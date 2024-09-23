@implementation ScrubberView.DisplayLink

- (void)handleLink:(id)a3
{
  void (*v3)(_TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink *);
  id v5;
  _TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink *v6;

  v3 = *(void (**)(_TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink *))((char *)&self->super.isa + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_linkFired);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    sub_1D93D6BE8((uint64_t)v3);
    v3(v6);
    sub_1D93D6F38((uint64_t)v3);

  }
}

- (_TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_linkFired);
  *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_link) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ScrubberView.DisplayLink();
  return -[ScrubberView.DisplayLink init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_linkFired));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_link));
}

@end
