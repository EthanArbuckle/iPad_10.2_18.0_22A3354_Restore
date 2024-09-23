@implementation _FEDebugIssueReportFormatter

- (_FEDebugIssueReportFormatter)init
{
  _FEDebugIssueReportFormatter *v2;
  _FEDebugIssueReportFormatter *v3;
  NSString *header;
  NSString *footer;
  NSString *noIssuesDescription;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_FEDebugIssueReportFormatter;
  v2 = -[_FEDebugReportFormatter init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    header = v2->_header;
    v2->_header = (NSString *)&stru_250D3AA90;

    footer = v3->_footer;
    v3->_footer = (NSString *)&stru_250D3AA90;

    noIssuesDescription = v3->_noIssuesDescription;
    v3->_noIssuesDescription = (NSString *)&stru_250D3AA90;

  }
  return v3;
}

- (NSString)defaultIssuePrefix
{
  NSString *defaultIssuePrefix;

  defaultIssuePrefix = self->_defaultIssuePrefix;
  if (!defaultIssuePrefix)
  {
    self->_defaultIssuePrefix = (NSString *)CFSTR(" - ISSUE: ");
    defaultIssuePrefix = self->_defaultIssuePrefix;
  }
  return defaultIssuePrefix;
}

- (id)_componentsFromReport:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _FEDebugReportComponents *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEDebugIssueReport.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("report"));

  }
  objc_msgSend(v5, "issues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__2;
    v21[4] = __Block_byref_object_dispose__2;
    v22 = 0;
    objc_msgSend(v5, "issues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __54___FEDebugIssueReportFormatter__componentsFromReport___block_invoke;
    v17[3] = &unk_250D3A558;
    v17[4] = self;
    v10 = v8;
    v18 = v10;
    v19 = v21;
    v20 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);

    v11 = objc_alloc_init(_FEDebugReportComponents);
    -[_FEDebugIssueReportFormatter header](self, "header");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEDebugReportComponents setHeader:](v11, "setHeader:", v12);

    -[_FEDebugIssueReportFormatter footer](self, "footer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEDebugReportComponents setFooter:](v11, "setFooter:", v13);

    -[_FEDebugReportComponents setBody:](v11, "setBody:", v10);
    _Block_object_dispose(v21, 8);

  }
  else
  {
    v11 = objc_alloc_init(_FEDebugReportComponents);
    -[_FEDebugIssueReportFormatter noIssuesDescription](self, "noIssuesDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEDebugReportComponents setBody:](v11, "setBody:", v14);

  }
  return v11;
}

- (id)stringFromReport:(id)a3
{
  void *v4;
  void *v5;

  -[_FEDebugIssueReportFormatter _componentsFromReport:](self, "_componentsFromReport:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEDebugReportFormatter stringFromReportComponents:](self, "stringFromReportComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)noIssuesDescription
{
  return self->_noIssuesDescription;
}

- (void)setNoIssuesDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDefaultIssuePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultIssuePrefix, 0);
  objc_storeStrong((id *)&self->_noIssuesDescription, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
