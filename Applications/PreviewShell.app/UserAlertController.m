@implementation UserAlertController

- (_TtC12PreviewShell19UserAlertController)init
{
  return (_TtC12PreviewShell19UserAlertController *)sub_10001BD68();
}

- (void)alertService:(id)a3 wantsPresentationForAlert:(id)a4 preferredPresentationStyle:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC12PreviewShell19UserAlertController *v13;
  id v14;
  _TtC12PreviewShell19UserAlertController *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  type metadata accessor for MainActor(0);
  v12 = a4;
  v13 = self;
  v14 = v12;
  v15 = v13;
  v16 = a3;
  v17 = static MainActor.shared.getter();
  v18 = (_QWORD *)swift_allocObject(&unk_100052CA8, 48, 7);
  v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = v14;
  v18[5] = v15;
  v19 = sub_1000273B0((uint64_t)v10, (uint64_t)&unk_10005FCF8, (uint64_t)v18);

  swift_release(v19);
}

- (void)alertService:(id)a3 wantsDismissalForAlert:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC12PreviewShell19UserAlertController *v12;
  id v13;
  _TtC12PreviewShell19UserAlertController *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_100006658(&qword_10005FB38);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  type metadata accessor for MainActor(0);
  v11 = a4;
  v12 = self;
  v13 = v11;
  v14 = v12;
  v15 = a3;
  v16 = static MainActor.shared.getter();
  v17 = (_QWORD *)swift_allocObject(&unk_100052C80, 48, 7);
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v13;
  v17[5] = v14;
  v18 = sub_1000273B0((uint64_t)v9, (uint64_t)&unk_10005FCE8, (uint64_t)v17);

  swift_release(v18);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12PreviewShell19UserAlertController_pendingAlerts));

}

@end
