@implementation MissingPermissionABCIssue

- (MissingPermissionABCIssue)initWithPermission:(int)a3 client:(id)a4 forReporter:(id)a5
{
  uint64_t v5;
  MissingPermissionABCIssue *v6;
  MissingPermissionABCIssue *v7;
  objc_super v9;

  v5 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)MissingPermissionABCIssue;
  v6 = -[EntitlementABCIssue initWithClient:forReporter:](&v9, sel_initWithClient_forReporter_, a4, a5);
  v7 = v6;
  if (v6)
    -[MissingPermissionABCIssue setPermission:](v6, "setPermission:", v5);
  return v7;
}

+ (void)reportPermission:(int)a3 client:(id)a4 forReporter:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  MissingPermissionABCIssue *v10;
  id v11;

  v6 = *(_QWORD *)&a3;
  v11 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MissingPermissionABCIssue/%@/%d"), v11, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "issueForTag:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = -[MissingPermissionABCIssue initWithPermission:client:forReporter:]([MissingPermissionABCIssue alloc], "initWithPermission:client:forReporter:", v6, v11, v7);
    objc_msgSend(v7, "addIssue:", v10);
    -[EntitlementABCIssue report](v10, "report");
    objc_msgSend(v7, "rescheduleTimer");

  }
}

- (id)tag
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[EntitlementABCIssue clientName](self, "clientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MissingPermissionABCIssue/%@/%d"), v4, -[MissingPermissionABCIssue permission](self, "permission"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)abcReason
{
  return 4101;
}

- (id)context
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[EntitlementABCIssue clientName](self, "clientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("clientName=%@,permission=%d"), v4, -[MissingPermissionABCIssue permission](self, "permission"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)permission
{
  return self->_permission;
}

- (void)setPermission:(int)a3
{
  self->_permission = a3;
}

@end
