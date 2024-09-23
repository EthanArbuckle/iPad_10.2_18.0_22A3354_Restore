@implementation ASUIConnectionErrorViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType(self, a2);
  -[ASUIConnectionErrorViewController viewDidLoad](&v2, "viewDidLoad");
}

- (_TtC16AccessorySetupUI33ASUIConnectionErrorViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_type] = 11;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_router];
  *((_QWORD *)v6 + 1) = 0;
  swift_unknownObjectWeakInit(v6, 0);
  v7 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 1;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[ASUIConnectionErrorViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_10000A0F8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_router], (uint64_t)a2);
  sub_10000A0A4(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext], *(_QWORD *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext], *(_QWORD *)&self->router[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext + 7], *(_QWORD *)&self->router[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext + 15], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext+ 7], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext+ 15], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext+ 23], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext+ 31]);
}

@end
