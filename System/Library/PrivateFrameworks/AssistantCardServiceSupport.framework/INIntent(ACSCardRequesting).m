@implementation INIntent(ACSCardRequesting)

- (uint64_t)acs_needsTitleCardSection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "extensionBundleId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.PassKit.PassKitIntentsExtension")) ^ 1;

  return v2;
}

- (void)requestCard:()ACSCardRequesting reply:
{
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BE15488];
  v14 = *MEMORY[0x24BDD0BA0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a4;
  objc_msgSend(a3, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Content %@ is incompatible with this service"), v10, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 400, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))a4)[2](v9, 0, v13);

}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 0;
}

@end
