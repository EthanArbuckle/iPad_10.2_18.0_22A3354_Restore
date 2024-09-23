@implementation HKEADFFileParser(DemoData)

- (uint64_t)initWithDataFileName:()DemoData
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKEADFFileParser+DemoData.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileName != nil"));

  }
  HDHealthDaemonFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("eadf"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKEADFFileParser+DemoData.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

  }
  v9 = objc_msgSend(a1, "initWithData:", v8);

  return v9;
}

@end
