@implementation ANManagedNotificationAction

- (void)takeValuesFromNotificationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedNotificationAction setUrl:](self, "setUrl:", v6);

  objc_msgSend(v4, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANManagedNotificationAction setOptions:](self, "setOptions:", v7);

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v4, "isInternalURL");

  objc_msgSend(v8, "numberWithBool:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ANManagedNotificationAction setIsInternal:](self, "setIsInternal:", v10);

}

@end
