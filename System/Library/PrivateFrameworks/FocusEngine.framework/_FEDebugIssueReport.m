@implementation _FEDebugIssueReport

- (_FEDebugIssueReport)init
{
  _FEDebugIssueReport *v2;
  NSMutableArray *v3;
  NSMutableArray *mutableIssues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_FEDebugIssueReport;
  v2 = -[_FEDebugIssueReport init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableIssues = v2->_mutableIssues;
    v2->_mutableIssues = v3;

  }
  return v2;
}

- (NSArray)issues
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableIssues, "copy");
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugIssueReport.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("issue"));

    v5 = 0;
  }
  -[NSMutableArray addObject:](self->_mutableIssues, "addObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableIssues, 0);
}

@end
