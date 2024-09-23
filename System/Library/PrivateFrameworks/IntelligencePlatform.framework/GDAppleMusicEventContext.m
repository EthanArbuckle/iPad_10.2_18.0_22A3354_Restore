@implementation GDAppleMusicEventContext

- (id)context
{
  return self->gdSwiftContext;
}

- (GDAppleMusicEventContext)initWithGDSwiftContext:(id)a3
{
  id v5;
  GDAppleMusicEventContext *v6;
  GDAppleMusicEventContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAppleMusicEventContext;
  v6 = -[GDAppleMusicEventContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->gdSwiftContext, a3);

  return v7;
}

- (id)initAndReturnError:(id *)a3
{
  _TtC20IntelligencePlatform30_GDSwiftAppleMusicEventContext *v5;
  const char *v6;
  const char *v7;
  void *v8;
  GDAppleMusicEventContext *v9;

  v5 = [_TtC20IntelligencePlatform30_GDSwiftAppleMusicEventContext alloc];
  v8 = (void *)objc_msgSend_initAndReturnError_(v5, v6, (uint64_t)a3);
  if (v8)
  {
    self = (GDAppleMusicEventContext *)(id)objc_msgSend_initWithGDSwiftContext_(self, v7, (uint64_t)v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)earliestSongEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_earliestSongEventAndReturnError_, a3);
}

- (id)latestSongEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_latestSongEventAndReturnError_, a3);
}

- (BOOL)enumerateSongEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateSongEventsThatOverlapWith_ascending_error_block_, a3);
}

- (BOOL)enumerateSongEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateSongEventsWhoseStartDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateSongEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateSongEventsWhoseEndDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateSongEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateSongEventsWithAscending_error_block_, a3);
}

- (id)entryForEarliestSongEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_earliestEntryForSongEventAndReturnError_, a3);
}

- (id)entryForLatestSongEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_latestEntryForSongEventAndReturnError_, a3);
}

- (BOOL)enumerateEntriesForSongEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForSongEventsThatOverlapWith_ascending_error_block_, a3);
}

- (BOOL)enumerateEntriesForSongEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForSongEventsWhoseStartDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateEntriesForSongEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForSongEventsWhoseEndDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateEntriesForSongEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForSongEventsWithAscending_error_block_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->gdSwiftContext, 0);
}

@end
