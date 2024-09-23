@implementation TransitionViewModel

+ (_TtC10CoreAuthUI19TransitionViewModel)shared
{
  if (qword_1000924E0 != -1)
    swift_once(&qword_1000924E0, sub_10003031C);
  return (_TtC10CoreAuthUI19TransitionViewModel *)(id)qword_100093B40;
}

- (id)delegates
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates, v4, 0, 0);
  return *v2;
}

- (void)setDelegates:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC10CoreAuthUI19TransitionViewModel)init
{
  return (_TtC10CoreAuthUI19TransitionViewModel *)sub_10003094C();
}

- (id)childControllerFor:(int64_t)a3 type:(int64_t)a4 allowsLandscape:(BOOL)a5
{
  _TtC10CoreAuthUI19TransitionViewModel *v8;
  char *v9;

  v8 = self;
  v9 = sub_100030DD4(a3, a4, a5);

  return v9;
}

- (void)setupConnection
{
  _TtC10CoreAuthUI19TransitionViewModel *v2;

  v2 = self;
  sub_100032B98();

}

- (void)suspendConnection
{
  _TtC10CoreAuthUI19TransitionViewModel *v2;

  v2 = self;
  sub_100033254();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;

  v3 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__connection;
  v4 = sub_100025D1C(&qword_100091110);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__remoteUIHost;
  v6 = sub_100025D1C(&qword_100091118);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__mechanism;
  v8 = sub_100025D1C(&qword_100091120);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__backoffCounter;
  v10 = sub_100025D1C(&qword_100091128);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__internalInfo;
  v12 = sub_100025D1C(&qword_100091130);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__controllerToShow;
  v14 = sub_100025D1C(&qword_100091138);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__completionHandler;
  v16 = sub_100025D1C((uint64_t *)&unk_100091140);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag));
  v17 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_log;
  v18 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
}

- (void)mechanismEvent:(int64_t)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC10CoreAuthUI19TransitionViewModel *v8;
  _OWORD v9[2];

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10007B1F0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10003547C;
  }
  else
  {
    v7 = 0;
  }
  memset(v9, 0, sizeof(v9));
  v8 = self;
  sub_10003355C(a3, (uint64_t)v9, (uint64_t)v6, v7);
  sub_10002BD8C((uint64_t)v9, &qword_1000914C0);
  sub_100027EB8((uint64_t)v6, v7);

}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  void *v8;
  _TtC10CoreAuthUI19TransitionViewModel *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC10CoreAuthUI19TransitionViewModel *v12;
  _OWORD v13[2];

  v8 = _Block_copy(a5);
  if (!a4)
  {
    memset(v13, 0, sizeof(v13));
    v12 = self;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v9 = self;
  v10 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v13, v10);
  swift_unknownObjectRelease(a4);
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v11 = swift_allocObject(&unk_10007B1C8, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v8 = sub_10003547C;
LABEL_6:
  sub_10003355C(a3, (uint64_t)v13, (uint64_t)v8, v11);
  sub_100027EB8((uint64_t)v8, v11);

  sub_10002BD8C((uint64_t)v13, &qword_1000914C0);
}

- (void)dismissRemoteUIWasInvalidated:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC10CoreAuthUI19TransitionViewModel *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10007B1A0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100027EEC;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_100033990(a3, (uint64_t)v6, v7);
  sub_100027EB8((uint64_t)v6, v7);

}

- (void)transitionToController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  _TtC10CoreAuthUI19TransitionViewModel *v10;

  v8 = _Block_copy(a5);
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (v8)
  {
    v9 = swift_allocObject(&unk_10007B178, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_10003501C;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  sub_100033C2C(a3, (uint64_t)a4, (uint64_t)v8, v9);
  sub_100027EB8((uint64_t)v8, v9);

  swift_bridgeObjectRelease(a4);
}

@end
