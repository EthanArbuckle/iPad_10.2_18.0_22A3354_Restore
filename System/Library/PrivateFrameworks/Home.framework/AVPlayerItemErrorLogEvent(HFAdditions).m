@implementation AVPlayerItemErrorLogEvent(HFAdditions)

- (id)hf_prettyDescription
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("date"));

  objc_msgSend(a1, "URI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "appendObject:withName:", v5, CFSTR("URI"));

  objc_msgSend(a1, "errorComment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v2, "appendObject:withName:", v7, CFSTR("error"));

  objc_msgSend(v2, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
