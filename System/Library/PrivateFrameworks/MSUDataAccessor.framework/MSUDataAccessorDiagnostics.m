@implementation MSUDataAccessorDiagnostics

- (id)returnDirectoryIfExistsForPath:(id)a3
{
  id v3;
  id v4;
  int v5;
  BOOL v6;
  id v7;
  char v9;

  v3 = a3;
  v9 = 0;
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v9);

  if (v5)
    v6 = v9 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = 0;
  else
    v7 = v3;

  return v7;
}

- (id)specialCaseFDRPathForDiagnostics
{
  return -[MSUDataAccessorDiagnostics returnDirectoryIfExistsForPath:](self, "returnDirectoryIfExistsForPath:", CFSTR("/private/var/hardware/FactoryData/System/Library/Caches/Repair"));
}

- (id)copyPathForPersistentData:(int)a3 error:(id *)a4
{
  uint64_t v5;
  id result;
  objc_super v8;

  v5 = *(_QWORD *)&a3;
  if (a3 != 100
    || (result = -[MSUDataAccessorDiagnostics specialCaseFDRPathForDiagnostics](self, "specialCaseFDRPathForDiagnostics")) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)MSUDataAccessorDiagnostics;
    return -[MSUDataAccessor copyPathForPersistentData:error:](&v8, sel_copyPathForPersistentData_error_, v5, a4);
  }
  return result;
}

@end
