@implementation HMAudioControl(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "isMuted"), CFSTR("muted"));
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "volume");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%.2f"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("volume"));

  objc_msgSend(a1, "mediaSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);

  objc_msgSend(v5, "appendObject:withName:context:", v9, CFSTR("mediaSession"), v10);
  return v5;
}

@end
