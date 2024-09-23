@implementation NSUserDefaults

- (BOOL)forceKillProximitycontrold
{
  return sub_10002E38C(self);
}

- (void)setForceKillProximitycontrold:(BOOL)a3
{
  sub_10002E40C(self, (uint64_t)a2, a3);
}

- (BOOL)forceKillPCViewService
{
  return sub_10002E38C(self);
}

- (void)setForceKillPCViewService:(BOOL)a3
{
  sub_10002E40C(self, (uint64_t)a2, a3);
}

- (BOOL)transferToHomePod
{
  return sub_10002E38C(self);
}

- (void)setTransferToHomePod:(BOOL)a3
{
  sub_10002E40C(self, (uint64_t)a2, a3);
}

- (double)executeDistanceDefault
{
  return sub_10002E4CC(self);
}

- (void)setExecuteDistanceDefault:(double)a3
{
  sub_10002E554(self, a3);
}

- (double)executeDistanceLarge
{
  return sub_10002E4CC(self);
}

- (void)setExecuteDistanceLarge:(double)a3
{
  sub_10002E554(self, a3);
}

- (int64_t)updateRateBluetoothWatch
{
  return (int64_t)sub_10002E61C(self);
}

- (void)setUpdateRateBluetoothWatch:(int64_t)a3
{
  sub_10002E69C(self, (uint64_t)a2, a3);
}

- (int64_t)updateRateExecuteWatch
{
  return (int64_t)sub_10002E61C(self);
}

- (void)setUpdateRateExecuteWatch:(int64_t)a3
{
  sub_10002E69C(self, (uint64_t)a2, a3);
}

@end
