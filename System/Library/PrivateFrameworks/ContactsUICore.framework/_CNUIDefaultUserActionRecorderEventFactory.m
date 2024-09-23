@implementation _CNUIDefaultUserActionRecorderEventFactory

- (id)recentEventForAddress:(id)a3 kind:(id)a4 metadata:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0D18290];
  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v11, 0, v10, v12, 0, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
