@implementation BRCApplyJobIdentifier

- (BRCApplyJobIdentifier)initWithItemDBRowID:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRCApplyJobIdentifier;
  return -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:](&v4, sel_initWithItemDBRowID_, a3);
}

- (int64_t)rank
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCApplyJobIdentifier;
  return -[BRCItemDBRowIDJobIdentifier itemDBRowID](&v3, sel_itemDBRowID);
}

- (int64_t)rejectedRowID
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCApplyJobIdentifier;
  if ((-[BRCItemDBRowIDJobIdentifier itemDBRowID](&v5, sel_itemDBRowID) & 0x8000000000000000) == 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)BRCApplyJobIdentifier;
  return --[BRCItemDBRowIDJobIdentifier itemDBRowID](&v4, sel_itemDBRowID);
}

- (int64_t)serverItemRank
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCApplyJobIdentifier;
  if (-[BRCItemDBRowIDJobIdentifier itemDBRowID](&v5, sel_itemDBRowID) < 1)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)BRCApplyJobIdentifier;
  return -[BRCItemDBRowIDJobIdentifier itemDBRowID](&v4, sel_itemDBRowID);
}

@end
