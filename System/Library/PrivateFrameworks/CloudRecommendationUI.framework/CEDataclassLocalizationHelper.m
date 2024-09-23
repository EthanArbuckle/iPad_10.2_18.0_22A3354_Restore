@implementation CEDataclassLocalizationHelper

+ (id)localizedTextForDataclass:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3DE0]))
  {
    v4 = (id)*MEMORY[0x24BDB3E40];

  }
  v5 = (void *)MEMORY[0x24BE00EF8];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
