@implementation PendingReminderTracker

- (_TtC21CalendarUIKitInternal22PendingReminderTracker)initWithEventStore:(id)a3
{
  return (_TtC21CalendarUIKitInternal22PendingReminderTracker *)PendingReminderTracker.init(eventStore:)(a3);
}

- (void)addPendingWithEvent:(id)a3 sequenceNumber:(int)a4
{
  id v6;
  _TtC21CalendarUIKitInternal22PendingReminderTracker *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v6 = a3;
  v7 = self;
  sub_2376ED9DC(v6, a4, 1, (uint64_t)v7);
  v8 = objc_msgSend(v6, sel_objectID);
  if (v8)
  {
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2376F38D0;
    *(_QWORD *)(v10 + 32) = v9;
    v12 = v10;
    sub_2376F2C28();
    v11 = v9;
    sub_2376EF230(v12);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)setOptimisticReminderWithEvent:(id)a3 sequenceNumber:(int)a4 optimisticReminder:(id)a5
{
  id v8;
  id v9;
  _TtC21CalendarUIKitInternal22PendingReminderTracker *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  sub_2376F1744(v8, a4, 1, (uint64_t)v10, v8, v9);

}

- (id)optimisticReminderFor:(id)a3
{
  id v4;
  _TtC21CalendarUIKitInternal22PendingReminderTracker *v5;
  __int128 v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v4 = a3;
  v5 = self;
  sub_2376EE4AC(v4, 0, 0, (uint64_t)v5, (uint64_t)&v9);
  v6 = v9;
  v7 = (void *)*((_QWORD *)&v10 + 1);

  if ((_QWORD)v6)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)revertPendingWithEvent:(id)a3 sendNotification:(BOOL)a4
{
  id v6;
  _TtC21CalendarUIKitInternal22PendingReminderTracker *v7;

  v6 = a3;
  v7 = self;
  sub_2376ED43C(v6, a4);

}

- (void)eventStoreDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC21CalendarUIKitInternal22PendingReminderTracker *v8;
  uint64_t v9;

  v4 = sub_2376F27A8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376F2790();
  v8 = self;
  sub_2376EF484();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC21CalendarUIKitInternal22PendingReminderTracker)init
{
  _TtC21CalendarUIKitInternal22PendingReminderTracker *result;

  result = (_TtC21CalendarUIKitInternal22PendingReminderTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore));
  swift_bridgeObjectRelease();
}

@end
