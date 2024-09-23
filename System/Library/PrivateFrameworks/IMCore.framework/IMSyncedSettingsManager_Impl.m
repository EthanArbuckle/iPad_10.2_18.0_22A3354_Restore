@implementation IMSyncedSettingsManager_Impl

- (IMSyncedSettingsManager_Impl)initWithDaemonController:(id)a3 connection:(id)a4 notificationCenter:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (IMSyncedSettingsManager_Impl *)SyncedSettingsManager.init(daemonController:connection:notificationCenter:)((uint64_t)a3, (uint64_t)a4, a5);
}

- (void)didUpdateSettingsKeys:(id)a3
{
  uint64_t v4;
  IMSyncedSettingsManager_Impl *v5;

  v4 = sub_1A21997D0();
  v5 = self;
  sub_1A217FE9C(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  void *v2;
  IMSyncedSettingsManager_Impl *v3;
  id v4;
  objc_super v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMSyncedSettingsManager_Impl_daemonController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_listener);
  objc_msgSend(v4, sel_removeHandler_, v3);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SyncedSettingsManager();
  -[IMSyncedSettingsManager_Impl dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)settingValueForKey:(int64_t)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  IMSyncedSettingsManager_Impl *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_1A218036C(a3, (uint64_t)sub_1A2180D5C, v7);

  swift_release();
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  IMSyncedSettingsManager_Impl *v6;
  _QWORD v7[4];

  swift_unknownObjectRetain();
  v6 = self;
  sub_1A219998C();
  swift_unknownObjectRelease();
  sub_1A2180644(v7, a4);

  sub_1A200A548((uint64_t)v7);
}

- (void)addObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5
{
  IMSyncedSettingsManager_Impl *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  swift_unknownObjectRetain();
  v7 = self;
  sub_1A219998C();
  swift_unknownObjectRelease();
  v8 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR___IMSyncedSettingsManager_Impl_notificationCenter);
  sub_1A200A4E0(v11, v11[3]);
  v9 = sub_1A2199B3C();
  v10 = (void *)sub_1A2199944();
  objc_msgSend(v8, sel_addObserver_selector_name_object_, v9, a4, v10, 0);

  swift_unknownObjectRelease();
  sub_1A200A548((uint64_t)v11);
}

- (void)removeObserver:(id)a3 key:(int64_t)a4
{
  IMSyncedSettingsManager_Impl *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A219998C();
  swift_unknownObjectRelease();
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR___IMSyncedSettingsManager_Impl_notificationCenter);
  sub_1A200A4E0(v9, v9[3]);
  v7 = sub_1A2199B3C();
  v8 = (void *)sub_1A2199944();
  objc_msgSend(v6, sel_removeObserver_name_object_, v7, v8, 0);

  swift_unknownObjectRelease();
  sub_1A200A548((uint64_t)v9);
}

- (IMSyncedSettingsManager_Impl)init
{
  IMSyncedSettingsManager_Impl *result;

  result = (IMSyncedSettingsManager_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
