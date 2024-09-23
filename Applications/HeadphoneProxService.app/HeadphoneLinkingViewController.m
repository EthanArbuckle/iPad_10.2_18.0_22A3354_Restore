@implementation HeadphoneLinkingViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneLinkingViewController();
  v2 = v3.receiver;
  -[HeadphoneLinkingViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService30HeadphoneLinkingViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  objc_super v8;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_appleIDInfo];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_presenter];
  *((_QWORD *)v6 + 1) = 0;
  swift_unknownObjectWeakInit(v6, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_type] = 26;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HeadphoneLinkingViewController();
  return -[HeadphoneLinkingViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)&self->appleIDInfo[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_appleIDInfo
                                  + 8];
  v4 = *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_appleIDInfo
                                   + 24];
  swift_bridgeObjectRelease(*(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_appleIDInfo]);

  swift_bridgeObjectRelease(v4);
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_presenter]);
}

@end
