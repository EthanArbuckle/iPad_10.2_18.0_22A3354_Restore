@implementation ASUINamingViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[ASUINamingViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (void)textFieldDidChange
{
  _TtC16AccessorySetupUI24ASUINamingViewController *v2;

  v2 = self;
  sub_1000219A8();

}

- (_TtC16AccessorySetupUI24ASUINamingViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC16AccessorySetupUI24ASUINamingViewController *v6;

  v4 = a3;
  v6 = (_TtC16AccessorySetupUI24ASUINamingViewController *)sub_100021DCC((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext];
  sub_10000A0A4(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext], v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
  sub_10000A0F8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_router], v4);

}

@end
