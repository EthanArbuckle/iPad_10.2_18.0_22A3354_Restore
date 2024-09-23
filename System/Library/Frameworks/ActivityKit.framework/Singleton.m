@implementation Singleton

- (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton)init
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  _TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254238440);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v5 + 104))(v4, *MEMORY[0x24BE854F0]);
  v6 = objc_allocWithZone((Class)type metadata accessor for Singleton());
  v7 = (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton *)sub_232DE65A8((uint64_t)v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (_TtC11ActivityKitP33_D074D31B035C9B27F4F7807A7D21110D9Singleton)init
{
  return (_TtC11ActivityKitP33_D074D31B035C9B27F4F7807A7D21110D9Singleton *)sub_232DE743C();
}

+ (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton)shared
{
  if (qword_2542385E0 != -1)
    swift_once();
  return (_TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton *)(id)qword_2542384C8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)activitiesChanged:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC11ActivityKitP33_1602B0B984EDF6E52CE840E80AB3FBCA9Singleton *v15;
  uint64_t v16;

  v6 = _Block_copy(a4);
  v7 = a3;
  v15 = self;
  v8 = sub_232E6EE44();
  v10 = v9;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v6;
  v12 = (void *)sub_232E6EE2C();
  sub_232E13838((uint64_t)v12, &v16);

  v13 = v16;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_232DF4D9C;
  *(_QWORD *)(v14 + 24) = v11;
  v16 = v13;
  swift_retain();
  sub_232DE4FA0(&v16, 1, (uint64_t)sub_232DE068C, v14);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_232DE8D98(v8, v10);

}

+ (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton)shared
{
  if (qword_255FFC928 != -1)
    swift_once();
  return (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton *)(id)qword_255FFD4C8;
}

- (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton)init
{
  return (_TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton *)sub_232DFB354();
}

- (id)listenForActivityPresentationWithActivityIdentifier:(id)a3 presenterBundleIdentifier:(id)a4 handler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton *v14;
  id v15;

  v6 = _Block_copy(a5);
  v7 = sub_232E6F1EC();
  v9 = v8;
  v10 = sub_232E6F1EC();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  v14 = self;
  v15 = sub_232DFC9EC(v7, v9, v10, v12, (uint64_t)sub_232DFD874, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v15;
}

- (void)activityPresentationsDidChange:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC11ActivityKitP33_37102ADAD4FB4DA90D1EB342A548B6909Singleton *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = sub_232E6EE44();
  v10 = v9;

  _Block_copy(v6);
  sub_232DFD604(v8, v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_232DE8D98(v8, v10);

}

+ (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton)shared
{
  if (qword_255FFB348 != -1)
    swift_once();
  return (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton *)(id)qword_255FFB410;
}

- (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton)init
{
  return (_TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton *)sub_232E09BB0();
}

- (id)listenForActivityProminenceWithActivityIdentifier:(id)a3 handler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton *v10;
  id v11;

  v5 = _Block_copy(a4);
  v6 = sub_232E6F1EC();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  v11 = sub_232E0B19C(v6, v8, (uint64_t)sub_232E0C240, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v11;
}

- (void)activityProminenceDidChange:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC11ActivityKitP33_53EEA475F928A92791709C064B1A8B959Singleton *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = sub_232E6EE44();
  v10 = v9;

  _Block_copy(v6);
  sub_232E0C014(v8, v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_232DE8D98(v8, v10);

}

- (void)activityDidExceedReducedPushBudgetForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11ActivityKitP33_D074D31B035C9B27F4F7807A7D21110D9Singleton *v7;

  v4 = sub_232E6F1EC();
  v6 = v5;
  v7 = self;
  sub_232E17418(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)activityDidUnsubscribeForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11ActivityKitP33_D074D31B035C9B27F4F7807A7D21110D9Singleton *v7;
  uint64_t (*v8)();
  _QWORD *v9;
  _BYTE v10[32];

  v4 = sub_232E6F1EC();
  v6 = v5;
  v7 = self;
  v8 = sub_232E17300();
  if (*v9)
  {
    sub_232E18210(v4, v6);
    ((void (*)(_BYTE *, _QWORD))v8)(v10, 0);

    swift_bridgeObjectRelease();
  }
  else
  {
    ((void (*)(_BYTE *, _QWORD))v8)(v10, 0);

  }
  swift_bridgeObjectRelease();
}

+ (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton)shared
{
  if (qword_255FFC948 != -1)
    swift_once();
  return (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton *)(id)qword_255FFE7A8;
}

- (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton)init
{
  return (_TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton *)sub_232E5C4C4();
}

- (id)listenForActivityQoSWithActivityIdentifier:(id)a3 handler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton *v10;
  id v11;

  v5 = _Block_copy(a4);
  v6 = sub_232E6F1EC();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  v11 = sub_232E5DAAC(v6, v8, (uint64_t)sub_232DFD874, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v11;
}

- (void)activityQoSDidChange:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = sub_232E6EE44();
  v10 = v9;

  _Block_copy(v6);
  sub_232E5EC9C(v8, v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_232DE8D98(v8, v10);

}

@end
