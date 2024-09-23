@implementation _GDSwiftAppleMusicEventContext

- (id)initAndReturnError:(id *)a3
{
  return (id)_GDSwiftAppleMusicEventContext.init()();
}

- (id)earliestSongEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE692A00);
}

- (id)latestSongEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE692A24);
}

- (BOOL)enumerateSongEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE6933D4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, uint64_t, _BYTE *))sub_1AE692CB0);
}

- (BOOL)enumerateSongEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE6933D4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, uint64_t, _BYTE *))sub_1AE692D5C);
}

- (BOOL)enumerateSongEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE6933D4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, uint64_t, _BYTE *))sub_1AE692DEC);
}

- (BOOL)enumerateSongEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1AE693590(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1AE692E7C);
}

- (id)earliestEntryForSongEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE692EF8);
}

- (id)latestEntryForSongEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE692F1C);
}

- (BOOL)enumerateEntriesForSongEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE6933D4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, uint64_t, _BYTE *))sub_1AE6931CC);
}

- (BOOL)enumerateEntriesForSongEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE6933D4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, uint64_t, _BYTE *))sub_1AE69328C);
}

- (BOOL)enumerateEntriesForSongEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE6933D4(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, uint64_t, _BYTE *))sub_1AE693330);
}

- (BOOL)enumerateEntriesForSongEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1AE693590(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1AE6914E0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1AE6934F0);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
