@implementation IMAssistantAccountDefaultDataSource

- (BOOL)hasMessagingAccount
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__im_assistant_bestMessagingAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)imHandleWithID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE50288];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__im_assistant_bestMessagingAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imHandleWithID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)countryCode
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__im_assistant_bestMessagingAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EDAE8B0;
  block[3] = &unk_24E3960E0;
  block[4] = a1;
  if (qword_25548BA08 != -1)
    dispatch_once(&qword_25548BA08, block);
  return (id)qword_25548BA00;
}

@end
