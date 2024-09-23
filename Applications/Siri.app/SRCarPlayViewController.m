@implementation SRCarPlayViewController

- (_TtC4Siri23SRCarPlayViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  sub_10008FB34((uint64_t)v3, v4, v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SRCarPlayViewController();
  v4 = (char *)v11.receiver;
  -[SRCarPlayViewController viewDidAppear:](&v11, "viewDidAppear:", v3);
  v5 = &v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate], v6);
  if (Strong)
  {
    v8 = Strong;
    v9 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 8))(v4, ObjectType, v9);

    swift_unknownObjectRelease(v8);
  }
  else
  {

  }
}

- (void)loadView
{
  uint64_t v2;
  _TtC4Siri23SRCarPlayViewController *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  _BYTE *v7;
  _TtC4Siri23SRCarPlayViewController *v8;
  uint64_t v9;
  char *v10;

  v2 = qword_10014ECE0;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10014ECE0, sub_100098388);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_1000760E8(v4, (uint64_t)qword_100150068);
  v6 = static os_log_type_t.info.getter(v5);
  sub_10009973C(v6, 0x10uLL, 0x7765695664616F6CLL, 0xEA00000000002928, 0, 0);
  v7 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayView());
  v8 = v3;
  v10 = sub_10008ED94(v8, v7, v9);
  -[SRCarPlayViewController setView:](v8, "setView:", v10);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t Strong;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for SRCarPlayViewController();
  v6 = a3;
  v7 = a4;
  v8 = (char *)v15.receiver;
  -[SRCarPlayViewController didUpdateFocusInContext:withAnimationCoordinator:](&v15, "didUpdateFocusInContext:withAnimationCoordinator:", v6, v7);
  v9 = &v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate], v10);
  if (Strong)
  {
    v12 = Strong;
    v13 = *((_QWORD *)v9 + 1);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 24))(v8, ObjectType, v13);

    swift_unknownObjectRelease(v12);
  }
  else
  {

  }
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _TtC4Siri23SRCarPlayViewController *v6;
  id v7;
  Class isa;

  v3 = sub_100076100((uint64_t *)&unk_10014FB20);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1000C1710;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v5)
    v6 = *(_TtC4Siri23SRCarPlayViewController **)((char *)&self->super.super.super.isa
                                                + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  else
    v6 = self;
  *(_QWORD *)(v4 + 32) = v6;
  specialized Array._endMutation()(v6);
  v7 = v5;
  sub_100076100(&qword_10014FD40);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (_TtC4Siri23SRCarPlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Siri23SRCarPlayViewController *result;

  v4 = a4;
  result = (_TtC4Siri23SRCarPlayViewController *)_swift_stdlib_reportUnimplementedInitializer("Siri.SRCarPlayViewController", 28, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
  sub_1000769B8((uint64_t)self + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands));
}

- (void)clearSnippet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  _TtC4Siri23SRCarPlayViewController *v6;

  v2 = qword_10014ECE0;
  v6 = self;
  if (v2 != -1)
    swift_once(&qword_10014ECE0, sub_100098388);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_1000760E8(v3, (uint64_t)qword_100150068);
  v5 = static os_log_type_t.info.getter(v4);
  sub_10009973C(v5, 0x10uLL, 0x696E537261656C63, 0xEE00292874657070, 0xD00000000000004DLL, 0x80000001000E14D0);
  sub_10008D5B8(0, 0, 1);

}

@end
