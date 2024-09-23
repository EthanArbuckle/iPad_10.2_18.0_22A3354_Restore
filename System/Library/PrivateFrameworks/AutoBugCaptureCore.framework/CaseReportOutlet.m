@implementation CaseReportOutlet

- (CaseReportOutlet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CaseReportOutlet;
  return -[CaseReportOutlet init](&v3, sel_init);
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DiagnosticReportOutlets.m"), 102, CFSTR("Subclasses must provide an impl for %s"), "-[CaseReportOutlet publishReportForCase:options:]");

  return 0;
}

@end
