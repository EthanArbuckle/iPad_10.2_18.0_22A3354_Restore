@implementation DOCAnalyticsManager

- (_TtC26DocumentManagerExecutables19DOCAnalyticsManager)init
{
  return (_TtC26DocumentManagerExecutables19DOCAnalyticsManager *)sub_21EA63B74();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables19DOCAnalyticsManager_eventsQueue));
}

- (void)tagsDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC26DocumentManagerExecutables19DOCAnalyticsManager *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  *(_QWORD *)&v7 = 0xD00000000000002ELL;
  *((_QWORD *)&v7 + 1) = 0x800000021EB0EBF0;
  v8 = 0;
  v9 = 0;
  v10 = 2;
  v4 = qword_2540A6550;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  sub_21EA93558(&v7, (void *)static DOCAnalyticsManager.shared);

}

@end
