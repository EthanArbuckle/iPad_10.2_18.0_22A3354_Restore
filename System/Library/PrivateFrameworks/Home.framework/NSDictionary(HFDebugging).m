@implementation NSDictionary(HFDebugging)

- (id)hf_prettyDescription
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__NSDictionary_HFDebugging__hf_prettyDescription__block_invoke;
  v6[3] = &unk_1EA72B4C0;
  v6[4] = a1;
  objc_msgSend(v2, "na_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_prettyExpensiveDescription
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NSDictionary_HFDebugging__hf_prettyExpensiveDescription__block_invoke;
  v6[3] = &unk_1EA72B4C0;
  v6[4] = a1;
  objc_msgSend(v2, "na_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_prettyFullDescription
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__NSDictionary_HFDebugging__hf_prettyFullDescription__block_invoke;
  v6[3] = &unk_1EA72B4C0;
  v6[4] = a1;
  objc_msgSend(v2, "na_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
