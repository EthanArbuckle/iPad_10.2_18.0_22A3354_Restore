@implementation IMBJITAppKitViewController

- (_TtC8Business26IMBJITAppKitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10006BE94();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IMBJITAppKitViewController();
  v4 = v5.receiver;
  -[IMBJITAppKitViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_viewDidAppearFired] = 1;
  sub_10006946C();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8Business26IMBJITAppKitViewController *v4;

  v4 = self;
  sub_10006935C(a3);

}

- (void)composeResponseWithNotification:(id)a3
{
  id v4;
  _TtC8Business26IMBJITAppKitViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10006A92C(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_rawDictionary));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_loadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_jitAppViewController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.conversation[OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_bundleVersion]);
}

- (id)newErrorViewController:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8Business26IMBJITAppKitViewController *v6;
  char *v7;
  char *v8;

  v4 = type metadata accessor for IMBJITAppKitErrorViewController();
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
  v6 = self;
  v7 = (char *)objc_msgSend(v5, "init");
  v8 = &v7[OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate];
  *((_QWORD *)v8 + 1) = &off_1000D9558;
  swift_unknownObjectWeakAssign(v8, v6);

  return v7;
}

- (void)applicationControllerError:(id)a3
{
  id v4;
  _TtC8Business26IMBJITAppKitViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10006B580((uint64_t)v5);

}

@end
