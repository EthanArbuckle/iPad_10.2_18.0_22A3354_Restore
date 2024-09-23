@implementation ASUITurnOnTransportsViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[ASUITurnOnTransportsViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (_TtC16AccessorySetupUI34ASUITurnOnTransportsViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_type] = 0;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_router];
  *((_QWORD *)v6 + 1) = 0;
  swift_unknownObjectWeakInit(v6, 0);
  v7 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 1;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_capabilities] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[ASUITurnOnTransportsViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_10000A0F8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_router], (uint64_t)a2);
  sub_10000A0A4(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext], *(_QWORD *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext], *(_QWORD *)&self->router[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext + 7], *(_QWORD *)&self->router[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext + 15], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext+ 7], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext+ 15], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext+ 23], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext+ 31]);
}

@end
