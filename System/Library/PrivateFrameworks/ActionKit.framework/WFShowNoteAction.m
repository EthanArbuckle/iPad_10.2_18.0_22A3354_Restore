@implementation WFShowNoteAction

- (id)serializationKeysByParameter
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEC4490];
  v4[0] = *MEMORY[0x24BEC4498];
  v4[1] = v2;
  v5[0] = CFSTR("WFInput");
  v5[1] = CFSTR("WFInput");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)entityName
{
  return CFSTR("Note");
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("show|apple"), CFSTR("show|apple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
