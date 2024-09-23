@implementation IMCloudKitSyncProgress

- (IMCloudKitSyncState)syncState
{
  return (IMCloudKitSyncState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___IMCloudKitSyncProgress_syncState));
}

- (IMCloudKitSyncStatistics)syncStatistics
{
  return (IMCloudKitSyncStatistics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___IMCloudKitSyncProgress_syncStatistics));
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncProgress_type);
}

- (double)progressBarValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncProgress_progressBarValue);
}

- (double)progressBarMax
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncProgress_progressBarMax);
}

- (BOOL)shouldShowProgressBar
{
  return self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 16];
}

- (BOOL)shouldShowIndeterminateProgress
{
  return self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 17];
}

- (BOOL)shouldShowUserMessageLabel
{
  return *(_QWORD *)&self->type[OBJC_IVAR___IMCloudKitSyncProgress_descriptor] != 0;
}

- (BOOL)shouldShowUserActionLabel
{
  return *(_QWORD *)&self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 8] != 0;
}

- (NSString)progressLabel
{
  return (NSString *)sub_1A21812A0(self, (uint64_t)a2, (void (*)(void))sub_1A2180E28);
}

- (NSString)userMessageLabel
{
  void *v2;

  if (*(_QWORD *)&self->type[OBJC_IVAR___IMCloudKitSyncProgress_descriptor])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A2199758();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)actionLabel
{
  void *v2;

  if (*(_QWORD *)&self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A2199758();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (double)broadcastDeferralOverride
{
  return *(double *)&self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 24];
}

- (BOOL)isHidden
{
  return (id)-[IMCloudKitSyncProgress type](self, sel_type) == (id)2;
}

- (double)percentComplete
{
  IMCloudKitSyncProgress *v2;
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = self;
  -[IMCloudKitSyncProgress progressBarMax](v2, sel_progressBarMax);
  if (v3 == 0.0)
  {

    return 1.0;
  }
  else
  {
    -[IMCloudKitSyncProgress progressBarValue](v2, sel_progressBarValue);
    v6 = v5;
    -[IMCloudKitSyncProgress progressBarMax](v2, sel_progressBarMax);
    v8 = v7;

    return v6 / v8;
  }
}

- (double)remainingItems
{
  IMCloudKitSyncProgress *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = self;
  -[IMCloudKitSyncProgress progressBarMax](v2, sel_progressBarMax);
  v4 = v3;
  -[IMCloudKitSyncProgress progressBarValue](v2, sel_progressBarValue);
  v6 = v5;

  return v4 - v6;
}

- (NSString)percentCompleteString
{
  IMCloudKitSyncProgress *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_1A200E71C(0, (unint64_t *)&qword_1EE65E760);
  v3 = self;
  MEMORY[0x1A8581B4C](-[IMCloudKitSyncProgress percentComplete](v3, sel_percentComplete));
  v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_1A2199758();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSArray)errors
{
  IMCloudKitSyncProgress *v2;
  IMCloudKitSyncState *v3;
  IMCloudKitSyncState *v4;
  NSArray *v5;
  void *v6;

  v2 = self;
  v3 = -[IMCloudKitSyncProgress syncState](v2, sel_syncState);
  if (v3
    && (v4 = v3,
        v5 = -[IMCloudKitSyncState errors](v3, sel_errors),
        v4,
        v5))
  {
    sub_1A1FFD920((uint64_t *)&unk_1EE65C0D8);
    sub_1A21997D0();

    v6 = (void *)sub_1A21997C4();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSArray *)v6;
}

- (NSString)description
{
  return (NSString *)sub_1A21812A0(self, (uint64_t)a2, (void (*)(void))IMCloudKitSyncProgress.description.getter);
}

- (IMCloudKitSyncProgress)init
{
  IMCloudKitSyncProgress *result;

  result = (IMCloudKitSyncProgress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (IMCloudKitSyncProgress)initWithType:(int64_t)a3 syncState:(id)a4 syncStatistics:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMCloudKitSyncProgress *v11;

  v8 = objc_allocWithZone((Class)IMCloudKitSyncProgress);
  v9 = a4;
  v10 = a5;
  v11 = (IMCloudKitSyncProgress *)sub_1A2181C14(a3, a4, a5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

@end
