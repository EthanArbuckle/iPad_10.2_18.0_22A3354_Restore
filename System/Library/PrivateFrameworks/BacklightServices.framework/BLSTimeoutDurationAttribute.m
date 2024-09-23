@implementation BLSTimeoutDurationAttribute

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  BOOL v8;

  v6 = a3;
  -[BLSDurationAttribute duration](self, "duration");
  v8 = v7 <= 600.0
    || -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", v6, 0x1E621D0F8, a4);

  return v8;
}

@end
