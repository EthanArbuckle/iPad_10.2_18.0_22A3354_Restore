@implementation ASUINumericComparisonViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[ASUINumericComparisonViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (_TtC16AccessorySetupUI35ASUINumericComparisonViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_type] = 6;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  v7 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_router];
  *((_QWORD *)v7 + 1) = 0;
  swift_unknownObjectWeakInit(v7, 0);
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[ASUINumericComparisonViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext];
  sub_10000A0A4(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext], v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
  sub_10000A0F8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_router], v4);
}

@end
