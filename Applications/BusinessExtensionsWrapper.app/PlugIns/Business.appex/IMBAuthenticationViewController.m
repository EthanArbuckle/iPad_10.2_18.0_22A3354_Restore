@implementation IMBAuthenticationViewController

- (_TtC8Business31IMBAuthenticationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10004B7E8();
}

- (void)viewDidLoad
{
  _TtC8Business31IMBAuthenticationViewController *v2;

  v2 = self;
  sub_100048E2C();

}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id result;

  result = *(Class *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_aswasWindow);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IMBAuthenticationViewController();
  v4 = v5.receiver;
  -[IMBAuthenticationViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  if ((v4[OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_didShowAuth] & 1) == 0)
  {
    v4[OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_didShowAuth] = 1;
    sub_100048F78();
  }

}

- (BOOL)shouldHandleRedirectURI:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC8Business31IMBAuthenticationViewController *v10;
  uint64_t v12;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  LOBYTE(a3) = sub_10004A518();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return a3 & 1;
}

- (void)didReceiveCallbackRequest:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC8Business31IMBAuthenticationViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for URLRequest(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_10004A664();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)didChangeSecureStatus:(BOOL)a3
{
  void *v3;
  _TtC8Business31IMBAuthenticationViewController *v4;
  id v5;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_webViewController);
  v4 = self;
  v5 = v3;
  sub_1000739B8();

}

- (void)didChangeNavigationURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _TtC8Business31IMBAuthenticationViewController *v11;
  id v12;
  uint64_t v13;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = *(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_webViewController);
  v11 = self;
  v12 = v10;
  sub_1000739B8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)dismiss
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(_TtC8Business31IMBAuthenticationViewController *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  _TtC8Business31IMBAuthenticationViewController *v11;

  v3 = (char *)self + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate);
  v11 = self;
  swift_unknownObjectRelease(Strong);
  if (Strong)
  {
    v5 = swift_unknownObjectWeakLoadStrong(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *((_QWORD *)v3 + 1);
      ObjectType = swift_getObjectType(v5);
      v9 = *(void (**)(_TtC8Business31IMBAuthenticationViewController *, uint64_t, uint64_t, uint64_t))(v7 + 16);
      v10 = type metadata accessor for IMBAuthenticationViewController();
      v9(v11, v10, ObjectType, v7);

      swift_unknownObjectRelease(v6);
    }
    else
    {

    }
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_authenticationManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_webViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_session));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_aswasWindow));
}

@end
