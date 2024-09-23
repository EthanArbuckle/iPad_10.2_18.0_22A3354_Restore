@implementation NTKMoonPhaseComplication

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 1;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKMoonPhaseComplication;
  return -[NTKComplication snapshotContext:isStaleRelativeToContext:](&v5, sel_snapshotContext_isStaleRelativeToContext_, a3, a4);
}

@end
