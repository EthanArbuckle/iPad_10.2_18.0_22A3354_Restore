@implementation HMPerson(HMI)

- (uint64_t)initWithHMIPerson:()HMI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(a1, "initWithUUID:", v5);
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setName:", v8);
  v9 = objc_msgSend(v7, "copy");

  return v9;
}

- (id)createHMIPerson
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BE4D200]);
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithUUID:name:", v3, v4);

  return v5;
}

@end
