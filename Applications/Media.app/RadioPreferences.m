@implementation RadioPreferences

- (_TtC5Media16RadioPreferences)init
{
  return (_TtC5Media16RadioPreferences *)sub_10005C0B0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Media16RadioPreferences__favoriteStations;
  v4 = sub_1000061A8(&qword_1000A1F18);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Media16RadioPreferences_nowPlayingObserver);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media16RadioPreferences_cancelSet));
}

@end
