@implementation ConnectionAssistantViewController

- (_TtC8SOSBuddy33ConnectionAssistantViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10006A888();
}

- (void)viewDidLoad
{
  _TtC8SOSBuddy33ConnectionAssistantViewController *v2;

  v2 = self;
  sub_100067AA0();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1000684CC(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_addToRunLoop_forMode_);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8SOSBuddy33ConnectionAssistantViewController *v4;

  v4 = self;
  sub_1000680D8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ConnectionAssistantViewController();
  v4 = (char *)v6.receiver;
  -[ConnectionAssistantViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__locationAssertion];
  *(_QWORD *)&v4[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__locationAssertion] = 0;

  swift_release(v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1000684CC(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_removeFromRunLoop_forMode_);
}

- (void)viewWillLayoutSubviews
{
  _TtC8SOSBuddy33ConnectionAssistantViewController *v2;

  v2 = self;
  sub_1000685A0();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8SOSBuddy33ConnectionAssistantViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8SOSBuddy33ConnectionAssistantViewController *result;

  v4 = a4;
  result = (_TtC8SOSBuddy33ConnectionAssistantViewController *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.ConnectionAssistantViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__displayMetrics));
  v3 = *(_QWORD *)&self->_metrics[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__guidanceState + 16];
  v4 = *(_QWORD *)&self->_metrics[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__guidanceState + 32];
  v5 = *(_QWORD *)&self->_metrics[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__guidanceState + 48];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_displayMetrics[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__guidanceState]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__earthViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__connectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__innerShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__displayLink));
  swift_release(*(_QWORD *)&self->_displayMetrics[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__locationAssertionProducer]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__locationAssertion));
  swift_release(*(_QWORD *)&self->_displayMetrics[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__viewDidLoadCallback]);
}

@end
