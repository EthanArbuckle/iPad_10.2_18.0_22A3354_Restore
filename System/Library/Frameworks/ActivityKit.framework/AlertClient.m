@implementation AlertClient

- (_TtC11ActivityKit11AlertClient)init
{
  return (_TtC11ActivityKit11AlertClient *)AlertClient.init()();
}

- (void).cxx_destruct
{

  sub_232DFADC4((uint64_t)self + OBJC_IVAR____TtC11ActivityKit11AlertClient_delegate);
}

- (void)presentAlertWithActivityIdentifier:(id)a3 payload:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC11ActivityKit11AlertClient *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v9 = _Block_copy(a6);
  v10 = sub_232E6F1EC();
  v12 = v11;
  v13 = a4;
  v14 = a5;
  v15 = self;
  v16 = sub_232E6EE44();
  v18 = v17;

  v19 = sub_232E6EE44();
  v21 = v20;

  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v9;
  AlertClient.presentAlert(withActivityIdentifier:payload:options:completion:)(v10, v12, v16, v18, v19, v21, (uint64_t)sub_232DF4D9C, v22);
  swift_release();
  sub_232DE8D98(v19, v21);
  sub_232DE8D98(v16, v18);

  swift_bridgeObjectRelease();
}

- (void)dismissAlertWithActivityIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC11ActivityKit11AlertClient *v11;

  v4 = sub_232E6F1EC();
  v6 = v5;
  v7 = (char *)self + OBJC_IVAR____TtC11ActivityKit11AlertClient_delegate;
  swift_beginAccess();
  if (MEMORY[0x23492A28C](v7))
  {
    v8 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
    v11 = self;
    v10(v4, v6, ObjectType, v8);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end
