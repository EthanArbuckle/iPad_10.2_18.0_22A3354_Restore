@implementation _FEDebugIssue

- (_FEDebugIssue)init
{
  _FEDebugIssue *v2;
  _FEDebugIssue *v3;
  NSString *description;
  _FEDebugIssueReport *v5;
  _FEDebugIssueReport *subissueReport;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_FEDebugIssue;
  v2 = -[_FEDebugIssue init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    description = v2->_description;
    v2->_description = (NSString *)&stru_250D3AA90;

    v5 = objc_alloc_init(_FEDebugIssueReport);
    subissueReport = v3->_subissueReport;
    v3->_subissueReport = v5;

  }
  return v3;
}

+ (id)issueWithDescription:(id)a3
{
  id v5;
  _FEDebugIssue *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEDebugIssueReport.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description"));

  }
  v6 = objc_alloc_init(_FEDebugIssue);
  -[_FEDebugIssue setDescription:](v6, "setDescription:", v5);

  return v6;
}

+ (id)issueWithFormat:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEDebugIssueReport.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptionFormat"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v5, &v10);
  objc_msgSend(a1, "issueWithDescription:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)subissues
{
  return -[_FEDebugIssueReport issues](self->_subissueReport, "issues");
}

- (void)addIssue:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugIssueReport.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("issue"));

    v5 = 0;
  }
  -[_FEDebugIssueReport addIssue:](self->_subissueReport, "addIssue:", v5);

}

- (NSString)description
{
  return self->_description;
}

- (void)setDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_FEDebugIssueReport)_subissueReport
{
  return self->_subissueReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subissueReport, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
