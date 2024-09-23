@implementation OracleBeehiveCalDAVServerVersion

- (OracleBeehiveCalDAVServerVersion)init
{
  OracleBeehiveCalDAVServerVersion *v2;
  void *v3;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OracleBeehiveCalDAVServerVersion;
  v2 = -[CalDAVServerVersion init](&v6, sel_init);
  if (v2)
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("Oracle-Application-Server"), 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVConcreteServerVersion setRegularExpression:](v2, "setRegularExpression:", v3);

    -[CalDAVServerVersion setAlwaysSupportsFreebusyOnOutbox:](v2, "setAlwaysSupportsFreebusyOnOutbox:", 1);
    -[CalDAVServerVersion setSupportsChecksumming:](v2, "setSupportsChecksumming:", 0);
  }
  return v2;
}

- (id)type
{
  return CFSTR("Oracle Beehive");
}

@end
