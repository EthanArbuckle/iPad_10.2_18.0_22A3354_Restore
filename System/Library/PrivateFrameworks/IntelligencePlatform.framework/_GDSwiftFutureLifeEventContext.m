@implementation _GDSwiftFutureLifeEventContext

- (id)initAndReturnError:(id *)a3
{
  return (id)_GDSwiftFutureLifeEventContext.init()();
}

- (id)earliestFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE694904);
}

- (id)latestFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE69492C);
}

- (BOOL)enumerateFutureActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1AE693590(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1AE69535C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1AE694B04);
}

- (id)earliestEntryForFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE694B80);
}

- (id)latestEntryForFutureActivityEventAndReturnError:(id *)a3
{
  return sub_1AE692B94(self, (uint64_t)a2, (uint64_t)a3, sub_1AE694BA4);
}

- (BOOL)enumerateEntriesForFutureActivityEventsWithAscending:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  return sub_1AE693590(self, (int)a2, a3, (int)a4, a5, (uint64_t)sub_1AE6914E0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1AE694E30);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
