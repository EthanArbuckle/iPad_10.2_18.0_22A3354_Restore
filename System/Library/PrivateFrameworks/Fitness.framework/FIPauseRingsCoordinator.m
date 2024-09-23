@implementation FIPauseRingsCoordinator

+ (NSString)activitySummaryCacheChangedNotification
{
  return (NSString *)(id)sub_2116BFBE0();
}

+ (NSString)didUpdatePauseStateNotification
{
  return (NSString *)(id)sub_2116BFBE0();
}

+ (NSString)initialPauseStateLoadedNotification
{
  return (NSString *)(id)sub_2116BFBE0();
}

+ (NSString)activitySummaryRangeNotificationKey
{
  return (NSString *)(id)sub_2116BFBE0();
}

- (FIPauseRingsCoordinator)initWithHealthStore:(id)a3
{
  FIPauseRingsCoordinator *result;

  sub_2116B57C0(a3);
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  FIPauseRingsCoordinator *v5;
  FIPauseRingsCoordinator *v6;
  objc_super v7;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FIPauseRingsCoordinator_query);
  if (v3)
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIPauseRingsCoordinator_healthStore);
    v5 = self;
    objc_msgSend(v4, sel_stopQuery_, v3);
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)FIPauseRingsCoordinator;
  -[FIPauseRingsCoordinator dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_2116BAFE4(*(id *)((char *)&self->super.isa + OBJC_IVAR___FIPauseRingsCoordinator_state));
}

- (BOOL)isPaused
{
  return -[FIPauseRingsCoordinator isPausedForActivitySummary:](self, sel_isPausedForActivitySummary_, 0);
}

- (BOOL)isPausedForActivitySummary:(id)a3
{
  id v3;
  id v5;
  FIPauseRingsCoordinator *v6;
  char v7;

  v3 = a3;
  v5 = a3;
  v6 = self;
  sub_2116B7134(v3);
  LOBYTE(v3) = v7;

  return v3 & 1;
}

- (BOOL)isPausedForActivitySummaryCacheIndex:(int64_t)a3
{
  FIPauseRingsCoordinator *v4;
  char v5;

  v4 = self;
  sub_2116B7730(a3);
  LOBYTE(a3) = v5;

  return a3 & 1;
}

- (BOOL)isPausedForActivitySummaryCacheIndexStart:(int64_t)a3 end:(int64_t)a4
{
  FIPauseRingsCoordinator *v6;
  char v7;

  v6 = self;
  sub_2116B796C(a3, a4);
  LOBYTE(a4) = v7;

  return a4 & 1;
}

- (void)pauseRingsUntilDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)();
  uint64_t v11;
  FIPauseRingsCoordinator *v12;
  uint64_t v13;

  v6 = sub_2116BFACC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t (*)())_Block_copy(a4);
  sub_2116BFAA8();
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_2116BE504;
  }
  else
  {
    v11 = 0;
  }
  v12 = self;
  sub_2116B7BC8(v9, (uint64_t)v10, v11);
  sub_2116BDC68((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)unpauseRingsWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(char, uint64_t);
  FIPauseRingsCoordinator *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_2116BDC78;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_2116B88B0((uint64_t)v7, v6);
  sub_2116BDC68((uint64_t)v7);

}

- (NSDate)resumeDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  FIPauseRingsCoordinator *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D8A1D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_2116B8C74((uint64_t)v5);

  v7 = sub_2116BFACC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_2116BFA90();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (id)formattedResumeDate
{
  FIPauseRingsCoordinator *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_2116B920C();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_2116BFBE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (FIPauseRingsCoordinator)init
{
  FIPauseRingsCoordinator *result;

  result = (FIPauseRingsCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
