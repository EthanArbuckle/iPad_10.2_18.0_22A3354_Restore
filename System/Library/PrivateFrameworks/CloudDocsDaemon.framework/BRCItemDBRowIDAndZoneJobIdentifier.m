@implementation BRCItemDBRowIDAndZoneJobIdentifier

- (BRCItemDBRowIDAndZoneJobIdentifier)initWithItemDBRowID:(int64_t)a3 zoneRowID:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCItemDBRowIDAndZoneJobIdentifier;
  return -[BRCIntAndZoneJobIdentifier initWithIntID:zoneRowID:](&v5, sel_initWithIntID_zoneRowID_, a3, a4);
}

@end
