@implementation HMDataSetting(HFDebugging)

- (__CFString)hf_debugValueForData:()HFDebugging
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;

  objc_msgSend(a1, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1EA741FF8;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  return v9;
}

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&off_1F0457000;
  objc_msgSendSuper2(&v7, sel_hf_stateDumpBuilderWithContext_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(a1, "hf_debugValueForData:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("decoded property list object"));

  NSStringFromNSPropertyListFormat(v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("decoded property list format"));

  return v2;
}

@end
