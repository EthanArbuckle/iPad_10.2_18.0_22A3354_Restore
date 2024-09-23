@implementation _FEFocusUpdateReportFormatter

- (id)_componentsFromReport:(id)a3
{
  id v5;
  _FEDebugReportComponents *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateReport.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("report"));

  }
  v6 = objc_alloc_init(_FEDebugReportComponents);
  -[_FEFocusUpdateReportFormatter _headerForReport:](self, "_headerForReport:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEDebugReportComponents setHeader:](v6, "setHeader:", v7);

  -[_FEFocusUpdateReportFormatter _bodyForReport:](self, "_bodyForReport:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEDebugReportComponents setBody:](v6, "setBody:", v8);

  return v6;
}

- (id)stringFromReport:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateReport.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("report"));

  }
  -[_FEFocusUpdateReportFormatter _componentsFromReport:](self, "_componentsFromReport:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEDebugReportFormatter stringFromReportComponents:](self, "stringFromReportComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_headerForReport:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = a3;
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_focusMovement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "_isValidInFocusSystem:", v6);
  v10 = CFSTR("Moving focus");
  if (!v8)
    v10 = CFSTR("Updating focus");
  v11 = CFSTR("Focus failed to update");
  if (v8)
    v11 = CFSTR("Focus failed to move");
  if (v9)
    v12 = v10;
  else
    v12 = v11;
  objc_msgSend(v5, "appendString:", v12);
  objc_msgSend(v7, "previouslyFocusedItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendFormat:", CFSTR(" from %@"), v17);
  }
  else if (v8)
  {
    objc_msgSend(v5, "appendString:", CFSTR(" from offscreen"));
  }
  objc_msgSend(v7, "nextFocusedItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendFormat:", CFSTR(" to %@"), v22);
  }
  if (v6)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = v6;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendFormat:", CFSTR(" in focus system %@"), v27);
  }
  objc_msgSend(v5, "appendString:", CFSTR("."));

  return v5;
}

- (id)_bodyForReport:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 1;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __48___FEFocusUpdateReportFormatter__bodyForReport___block_invoke;
  v22[3] = &unk_250D3A620;
  v5 = v4;
  v23 = v5;
  v24 = v25;
  v6 = (void (**)(_QWORD))MEMORY[0x2426205A4](v22);
  objc_msgSend(v3, "focusSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_validationReport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "_isValidInFocusSystem:", v7);
  if (v9)
    v11 = v10;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "issues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      +[_FEDebugReportFormatter defaultFormatter](_FEDebugIssueReportFormatter, "defaultFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHeader:", CFSTR("The following issues were found that prevented this update from occurring:"));
      v6[2](v6);
      objc_msgSend(v14, "stringFromReport:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v15);

    }
  }
  objc_msgSend(v8, "_preferredFocusReport");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && objc_msgSend(v16, "messageCount"))
  {
    +[_FEDebugReportFormatter defaultFormatter](_FEDebugLogReportFormatter, "defaultFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIndentLevel:", 1);
    objc_msgSend(v18, "setIndentString:", CFSTR("|\t"));
    v6[2](v6);
    objc_msgSend(v18, "stringFromReport:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("The result of the focus update was determined from the following preferred focus search:\n|\n%@\n|"), v19);

  }
  v20 = v5;

  _Block_object_dispose(v25, 8);
  return v20;
}

@end
