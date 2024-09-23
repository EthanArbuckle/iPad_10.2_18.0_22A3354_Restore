@implementation NNMKStandaloneAccountHelper

+ (void)saveLocalAccountProperties:(id)a3 withCompletion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)MEMORY[0x24BE66358];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "localId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithUniqueId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistentAccount");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "emailAddressToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccountProperty:forKey:", v10, CFSTR("NNMKEmailAddressTokenKey"));

  objc_msgSend(v7, "pccEmailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAccountProperty:forKey:", v11, CFSTR("NNMKPCCEmailAddressKey"));
  objc_msgSend(MEMORY[0x24BE662D0], "sharedAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistentStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "saveAccount:withCompletionHandler:", v14, v6);

}

@end
