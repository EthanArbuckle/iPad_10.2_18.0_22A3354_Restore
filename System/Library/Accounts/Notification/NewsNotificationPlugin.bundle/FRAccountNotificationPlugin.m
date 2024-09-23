@implementation FRAccountNotificationPlugin

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;

  v9 = a3;
  v10 = a5;
  if (a4 == 2)
  {
    v11 = *MEMORY[0x24BDB4600];
    v12 = objc_msgSend(a6, "isProvisionedForDataclass:", *MEMORY[0x24BDB4600]);
    v13 = objc_msgSend(v9, "isProvisionedForDataclass:", v11);
    v14 = 0;
    if ((v12 & 1) == 0 && v13)
    {
      v15 = objc_msgSend(v9, "isEnabledForDataclass:", v11);
      objc_msgSend(v9, "setEnabled:forDataclass:", 1, v11);
      objc_msgSend(v10, "dataclassActionsForAccountSave:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      v14 = v18 < 2;
      if (v18 >= 2)
        objc_msgSend(v9, "setEnabled:forDataclass:", v15, v11);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
