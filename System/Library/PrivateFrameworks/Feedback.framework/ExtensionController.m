@implementation ExtensionController

- (void)loadView
{
  ExtensionController *v2;

  v2 = self;
  sub_22DDC89B8();

}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  ExtensionController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_22DDC8C74(v4);

  return self & 1;
}

- (ExtensionController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  ExtensionController *v9;
  objc_super v11;

  if (a3)
  {
    sub_22DE1F2B0();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_xpcConnection) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_contentViewController) = 0;
    v6 = a4;
    v7 = (void *)sub_22DE1F28C();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_xpcConnection) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_contentViewController) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ExtensionController();
  v9 = -[ExtensionController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (ExtensionController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_xpcConnection) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_contentViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExtensionController();
  return -[ExtensionController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

}

@end
