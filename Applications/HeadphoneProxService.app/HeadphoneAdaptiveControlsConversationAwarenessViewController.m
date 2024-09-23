@implementation HeadphoneAdaptiveControlsConversationAwarenessViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService60HeadphoneAdaptiveControlsConversationAwarenessViewController *v3;

  v3 = self;
  sub_100017E8C((uint64_t)v3, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v7.receiver;
  -[HeadphoneAdaptiveControlsConversationAwarenessViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20HeadphoneProxService60HeadphoneAdaptiveControlsConversationAwarenessViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_1000761A4(v4[OBJC_IVAR____TtC20HeadphoneProxService60HeadphoneAdaptiveControlsConversationAwarenessViewController_type]);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService60HeadphoneAdaptiveControlsConversationAwarenessViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService60HeadphoneAdaptiveControlsConversationAwarenessViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService60HeadphoneAdaptiveControlsConversationAwarenessViewController_type] = 11;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneAdaptiveControlsConversationAwarenessViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService60HeadphoneAdaptiveControlsConversationAwarenessViewController_presenter]);
}

@end
