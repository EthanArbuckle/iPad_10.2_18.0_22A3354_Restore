@implementation WFExitAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEC4270];
  v9 = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("User requested shortcut exit."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 4, v8);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

}

- (BOOL)legacyBehaviorIgnoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  return a3 == 0;
}

@end
