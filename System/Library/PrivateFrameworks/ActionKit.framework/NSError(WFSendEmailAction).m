@implementation NSError(WFSendEmailAction)

+ (id)wf_mailComposerUnavailableError
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v1 = *MEMORY[0x24BDD0B88];
  v6 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Cannot send emails. Mail may not be set up."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", v1, 3328, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
