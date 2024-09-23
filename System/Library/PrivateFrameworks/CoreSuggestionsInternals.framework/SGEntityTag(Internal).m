@implementation SGEntityTag(Internal)

+ (id)identity:()Internal
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D197F0];
  objc_msgSend(a3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tagForLabel:value:", CFSTR("ID"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)messageWithEmailKey:()Internal
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "messageId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "messageWithMessageId:fromSource:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
