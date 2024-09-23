@implementation SettingsAppSceneDelegate

- (_TtC11SettingsApp24SettingsAppSceneDelegate)init
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_class *KeyPath;
  objc_class *v8;
  _TtC11SettingsApp24SettingsAppSceneDelegate *v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC11SettingsApp24SettingsAppSceneDelegate *v12;
  uint64_t v13;
  objc_super v15;

  v3 = sub_100004FC8(&qword_10015C5A0);
  __chkstk_darwin(v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate__selectedQuickActionSubject;
  KeyPath = (objc_class *)swift_getKeyPath(&unk_10011B840);
  *(Class *)((char *)&self->super.isa + v6) = KeyPath;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate__shortcutItemForInitialLaunch) = 0;
  ObservationRegistrar.init()(KeyPath);
  v8 = (objc_class *)type metadata accessor for SettingsAppSceneDelegate(0);
  v15.receiver = self;
  v15.super_class = v8;
  v9 = -[SettingsAppSceneDelegate init](&v15, "init");
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10014E3E8, 40, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v9;
  v12 = v9;
  v13 = sub_1000F1E18((uint64_t)v5, (uint64_t)&unk_10015CED0, (uint64_t)v11);
  swift_release(v13);
  return v12;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC11SettingsApp24SettingsAppSceneDelegate *v11;
  id v12;
  uint64_t KeyPath;
  uint64_t v14;
  _QWORD v15[5];
  _TtC11SettingsApp24SettingsAppSceneDelegate *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v10, "shortcutItem");
  KeyPath = swift_getKeyPath(&unk_10011B818);
  v15[2] = v11;
  v15[3] = v12;
  v16 = v11;
  v14 = sub_100007828((unint64_t *)&unk_10015CE70, type metadata accessor for SettingsAppSceneDelegate, (uint64_t)&unk_10011B7F8);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v16, KeyPath, sub_10010D8A8, v15, (char *)&type metadata for () + 8, v14);

  swift_release(KeyPath);
}

- (void)sceneDidBecomeActive:(id)a3
{
  _TtC11SettingsApp24SettingsAppSceneDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_10010E1DC();

}

- (void)windowScene:(UIWindowScene *)a3 performActionForShortcutItem:(UIApplicationShortcutItem *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  UIWindowScene *v17;
  UIApplicationShortcutItem *v18;
  _TtC11SettingsApp24SettingsAppSceneDelegate *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100004FC8(&qword_10015C5A0);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10014E348, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10014E370, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10015CE88;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10014E398, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10015CE98;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_10010DB48((uint64_t)v11, (uint64_t)&unk_10015CEA8, (uint64_t)v16);
  swift_release(v20);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate__selectedQuickActionSubject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate__shortcutItemForInitialLaunch));
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate___observationRegistrar;
  v4 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
