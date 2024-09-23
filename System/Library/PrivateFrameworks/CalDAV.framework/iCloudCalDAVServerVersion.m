@implementation iCloudCalDAVServerVersion

- (iCloudCalDAVServerVersion)init
{
  iCloudCalDAVServerVersion *v2;
  void *v3;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)iCloudCalDAVServerVersion;
  v2 = -[CalDAVServerVersion init](&v6, sel_init);
  if (v2)
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("iCloudCalendarServer"), 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVConcreteServerVersion setRegularExpression:](v2, "setRegularExpression:", v3);

    -[CalDAVServerVersion setSupportsTimeRangeFilterOnInbox:](v2, "setSupportsTimeRangeFilterOnInbox:", 0);
    -[CalDAVServerVersion setSupportsCheckForValidEmail:](v2, "setSupportsCheckForValidEmail:", 1);
    -[CalDAVServerVersion setSupportsChecksumming:](v2, "setSupportsChecksumming:", 0);
  }
  return v2;
}

- (id)type
{
  return CFSTR("iCloud");
}

@end
