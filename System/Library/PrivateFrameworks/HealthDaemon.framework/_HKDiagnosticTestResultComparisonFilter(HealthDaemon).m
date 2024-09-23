@implementation _HKDiagnosticTestResultComparisonFilter(HealthDaemon)

- (__CFString)propertyForKeyPath
{
  void *v4;
  int v5;
  __CFString **v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;

  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB4CA8]);

  if (v5)
  {
    v6 = HDDiagnosticTestResultEntityPropertyCategory;
  }
  else
  {
    objc_msgSend(a1, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4CD8]);

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKDiagnosticTestResultComparisonFilter+HealthDaemon.m"), 32, CFSTR("Unreachable code has been executed"));

      v9 = &stru_1E6D11BB8;
      return v9;
    }
    v6 = HDDiagnosticTestResultEntityPropertyReferenceRangeStatus;
  }
  v9 = *v6;
  return v9;
}

@end
