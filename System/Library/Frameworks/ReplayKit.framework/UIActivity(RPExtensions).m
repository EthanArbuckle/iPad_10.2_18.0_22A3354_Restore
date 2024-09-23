@implementation UIActivity(RPExtensions)

+ (void)streamActivitiesWithCompletion:()RPExtensions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1550];
  v9 = *MEMORY[0x24BDD0C48];
  v10[0] = CFSTR("com.apple.share-services");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__UIActivity_RPExtensions__streamActivitiesWithCompletion___block_invoke;
  v7[3] = &unk_24D15D530;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "extensionsWithMatchingAttributes:completion:", v5, v7);

}

@end
