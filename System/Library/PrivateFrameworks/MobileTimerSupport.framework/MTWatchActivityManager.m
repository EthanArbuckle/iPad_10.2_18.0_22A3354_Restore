@implementation MTWatchActivityManager

+ (_TtC18MobileTimerSupport22MTWatchActivityManager)shared
{
  if (qword_1EF1E0F48 != -1)
    swift_once();
  swift_beginAccess();
  return (_TtC18MobileTimerSupport22MTWatchActivityManager *)(id)qword_1EF1E3980;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EF1E0F48;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1EF1E3980;
  qword_1EF1E3980 = (uint64_t)v4;

}

- (void)startActivityWithAlarmID:(id)a3 firingDate:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v4 = sub_1B8DFD748();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B8DFD784();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8DFD76C();
  sub_1B8DFD718();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)endActivityWithAlarmID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1B8DFD784();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8DFD76C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC18MobileTimerSupport22MTWatchActivityManager)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  _TtC18MobileTimerSupport22MTWatchActivityManager *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC18MobileTimerSupport22MTWatchActivityManager_activityManager;
  v5 = qword_1EF1E0EF0;
  v6 = self;
  if (v5 != -1)
    swift_once();
  swift_beginAccess();
  *(Class *)((char *)&v6->super.isa + v4) = (Class)qword_1EF1E18B8;
  sub_1B8DFD22C();

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[MTWatchActivityManager init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
