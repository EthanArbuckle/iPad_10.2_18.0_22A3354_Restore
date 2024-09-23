@implementation _GDSwiftLifeEventContext

- (id)initAndReturnError:(id *)a3
{
  return (id)_GDSwiftLifeEventContext.init()();
}

- (id)earliestActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE699AC4);
}

- (id)latestActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE699AEC);
}

- (BOOL)enumerateActivityEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE69A328(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(char *, uint64_t, uint64_t, _BYTE *))sub_1AE699C34);
}

- (BOOL)enumerateActivityEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE69A328(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(char *, uint64_t, uint64_t, _BYTE *))sub_1AE699CD8);
}

- (BOOL)enumerateActivityEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE69A328(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(char *, uint64_t, uint64_t, _BYTE *))sub_1AE699D64);
}

- (BOOL)enumerateActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1AE693590(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1AE691538, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1AE699DF0);
}

- (id)earliestEntryForActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE699E6C);
}

- (id)latestEntryForActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE699E90);
}

- (BOOL)enumerateEntriesForActivityEventsThatOverlapWith:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE69A328(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(char *, uint64_t, uint64_t, _BYTE *))sub_1AE69A118);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseStartDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE69A328(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(char *, uint64_t, uint64_t, _BYTE *))sub_1AE69A1D8);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseEndDatesAreIn:(id)a3 ascending:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  return sub_1AE69A328(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, (uint64_t)sub_1AE691538, (void (*)(char *, uint64_t, uint64_t, _BYTE *))sub_1AE69A280);
}

- (BOOL)enumerateEntriesForActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1AE693590(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1AE6914E0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1AE69A454);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
