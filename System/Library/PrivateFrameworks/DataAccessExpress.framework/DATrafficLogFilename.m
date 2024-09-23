@implementation DATrafficLogFilename

+ (id)filenameWithBasename:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filenameWithBasename:bundle:processInfo:uid:", v5, v6, v7, getuid());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)filenameWithBasename:(id)a3 bundle:(id)a4 processInfo:(id)a5 uid:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = *(_QWORD *)&a6;
  v9 = a3;
  v10 = a5;
  objc_msgSend(a4, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v10, "processName");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%u"), v9, v13, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
