@implementation MGGroup(RemoteQuery)

- (void)rq_setSourcedRemotely:()RemoteQuery
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_rq_sourcedRemotely, v2, (void *)1);

}

- (uint64_t)rq_sourcedRemotely
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_rq_sourcedRemotely);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (uint64_t)rq_predicateForLocal
{
  return objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.rq_sourcedRemotely == NO"));
}

+ (id)rq_predicateForRestrictedTypes
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BE64BF0], "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  objc_msgSend(MEMORY[0x24BE64BD8], "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  objc_msgSend(MEMORY[0x24BE64BC8], "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v3;
  objc_msgSend(MEMORY[0x24BE64B80], "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  objc_msgSend(MEMORY[0x24BE64C00], "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "predicateWithFormat:", CFSTR("SELF.type IN %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)rq_predicateForHaveCurrentHome
{
  return objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($CURRENT_HOME != nil)"));
}

+ (id)rq_predicateForInCurrentHome
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$CONTAINMENT_MAP[SELF.identifier] != nil"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SUBQUERY($CONTAINMENT_MAP[SELF.identifier], $container, $CURRENT_HOME.identifier in $container)[SIZE] > 0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "andPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
