@implementation PlatformAlertController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlatformAlertController();
  v4 = (char *)v7.receiver;
  -[PlatformAlertController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction];
  if (v5)
  {
    v6 = swift_retain();
    v5(v6);
    outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v5);
  }

}

- (_TtC7SwiftUI23PlatformAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  id v13;
  _TtC7SwiftUI23PlatformAlertController *v14;
  objc_super v16;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction);
    *v9 = 0;
    v9[1] = 0;
    v10 = a4;
    v11 = (void *)MEMORY[0x18D75CC88](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction);
    *v12 = 0;
    v12[1] = 0;
    v13 = a4;
    v11 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for PlatformAlertController();
  v14 = -[PlatformAlertController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, v11, a4);

  return v14;
}

- (_TtC7SwiftUI23PlatformAlertController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction);
  v6 = (objc_class *)type metadata accessor for PlatformAlertController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[PlatformAlertController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction));
}

@end
