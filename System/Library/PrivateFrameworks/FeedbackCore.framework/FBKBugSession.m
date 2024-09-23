@implementation FBKBugSession

- (id)deviceFromManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FBKBugSession deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  deviceWithIdentifier(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasNumberOfBytesToUpload
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FBKBugSession bytesToUpload](self, "bytesToUpload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FBKBugSession bytesToUpload](self, "bytesToUpload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue") > 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)bugSessionWithDEDBugSession:(id)a3 inContext:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x24BDBB658];
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v11);

  objc_msgSend(v8, "deviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDeviceIdentifier:", v12);
  objc_msgSend(v10, "setState:", 0);
  return v10;
}

+ (id)entityName
{
  return CFSTR("BugSession");
}

@end
