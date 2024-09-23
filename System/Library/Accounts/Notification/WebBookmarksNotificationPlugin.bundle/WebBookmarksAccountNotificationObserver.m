@implementation WebBookmarksAccountNotificationObserver

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  id v20;

  v20 = a3;
  v8 = a6;
  if (v20)
    v9 = v20;
  else
    v9 = v8;
  v10 = v9;
  v11 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  objc_msgSend(v10, "accountType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  if (v14)
    v15 = v11 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    v16 = *MEMORY[0x24BDB4560];
    v17 = objc_msgSend(v20, "isEnabledForDataclass:", *MEMORY[0x24BDB4560]);
    v18 = objc_msgSend(v8, "isEnabledForDataclass:", v16);
    if (a4 == 1 && (v17 & 1) != 0)
    {
      v17 = 1;
LABEL_18:
      objc_msgSend(MEMORY[0x24BEC2720], "didToggleCloudTabs:", v17);
      goto LABEL_19;
    }
    if (a4 == 2 && ((v17 ^ v18) & 1) != 0)
      goto LABEL_18;
    if (a4 == 3)
      v19 = v18;
    else
      v19 = 0;
    if (v19 == 1)
    {
      v17 = 0;
      goto LABEL_18;
    }
  }
LABEL_19:

}

@end
