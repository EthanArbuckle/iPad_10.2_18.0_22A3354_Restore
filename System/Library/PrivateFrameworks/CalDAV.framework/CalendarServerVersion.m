@implementation CalendarServerVersion

- (CalendarServerVersion)init
{
  CalendarServerVersion *v2;
  void *v3;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalendarServerVersion;
  v2 = -[CalDAVServerVersion init](&v6, sel_init);
  if (v2)
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("TwistedCalDAV/(\\?|[0-9]+\\.[0-9]+)"), 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVConcreteServerVersion setRegularExpression:](v2, "setRegularExpression:", v3);

  }
  return v2;
}

- (id)type
{
  return CFSTR("CalendarServer");
}

- (BOOL)supportsTimeRangeFilterWithoutEndDate
{
  double v3;
  double v4;
  double v6;

  -[CalDAVServerVersion version](self, "version");
  if (v3 > 1.3)
  {
    -[CalDAVServerVersion version](self, "version");
    if (v4 < 2.0)
      return 1;
  }
  -[CalDAVServerVersion version](self, "version");
  return v6 > 2.0;
}

@end
