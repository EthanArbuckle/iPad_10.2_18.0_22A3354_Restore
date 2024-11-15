@implementation NTKSunriseComplication

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 1;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return objc_msgSend(a3, "localeMatchesContext:", a4) ^ 1;
}

@end
