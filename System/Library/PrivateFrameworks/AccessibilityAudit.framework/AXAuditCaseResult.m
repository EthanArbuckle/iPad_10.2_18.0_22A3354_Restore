@implementation AXAuditCaseResult

- (AXAuditCaseResult)init
{
  AXAuditCaseResult *v2;
  uint64_t v3;
  NSMutableArray *mutableIssues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXAuditCaseResult;
  v2 = -[AXAuditCaseResult init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mutableIssues = v2->__mutableIssues;
    v2->__mutableIssues = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSArray)auditIssues
{
  void *v2;
  void *v3;

  -[AXAuditCaseResult _mutableIssues](self, "_mutableIssues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)setAuditIssues:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[AXAuditCaseResult set_mutableIssues:](self, "set_mutableIssues:", v4);

}

- (void)addAuditIssue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    v6 = objc_msgSend(v4, "issueClassification");
    v5 = v10;
    if (v6)
    {
      -[AXAuditCaseResult result](self, "result");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "foundLogMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendLog:", v8);

      -[AXAuditCaseResult _mutableIssues](self, "_mutableIssues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      v5 = v10;
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAuditCaseResult;
  -[AXAuditCaseResult description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditCaseResult auditIssues](self, "auditIssues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("AuditIssues:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)caseTitle
{
  return self->_caseTitle;
}

- (void)setCaseTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AXAuditCategoryResult)result
{
  return (AXAuditCategoryResult *)objc_loadWeakRetained((id *)&self->_result);
}

- (void)setResult:(id)a3
{
  objc_storeWeak((id *)&self->_result, a3);
}

- (NSMutableArray)_mutableIssues
{
  return self->__mutableIssues;
}

- (void)set_mutableIssues:(id)a3
{
  objc_storeStrong((id *)&self->__mutableIssues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableIssues, 0);
  objc_destroyWeak((id *)&self->_result);
  objc_storeStrong((id *)&self->_caseTitle, 0);
}

@end
