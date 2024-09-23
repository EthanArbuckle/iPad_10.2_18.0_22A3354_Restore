@implementation LegacyEntitlementABCIssue

+ (void)reportClient:(id)a3 forReporter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  LegacyEntitlementABCIssue *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LegacyEntitlement/%@"), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issueForTag:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[EntitlementABCIssue initWithClient:forReporter:]([LegacyEntitlementABCIssue alloc], "initWithClient:forReporter:", v9, v5);
    objc_msgSend(v5, "addIssue:", v8);
    -[EntitlementABCIssue report](v8, "report");
    objc_msgSend(v5, "rescheduleTimer");

  }
}

- (id)tag
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[EntitlementABCIssue clientName](self, "clientName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("LegacyEntitlement/%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)abcReason
{
  return 4100;
}

- (id)context
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[EntitlementABCIssue clientName](self, "clientName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("clientName=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
