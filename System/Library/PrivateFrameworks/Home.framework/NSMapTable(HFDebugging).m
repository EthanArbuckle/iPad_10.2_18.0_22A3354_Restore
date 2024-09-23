@implementation NSMapTable(HFDebugging)

- (id)hf_prettyDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__NSMapTable_HFDebugging__hf_prettyDescription__block_invoke;
  v7[3] = &unk_1EA72B4C0;
  v7[4] = a1;
  objc_msgSend(v3, "na_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_prettyExpensiveDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__NSMapTable_HFDebugging__hf_prettyExpensiveDescription__block_invoke;
  v7[3] = &unk_1EA72B4C0;
  v7[4] = a1;
  objc_msgSend(v3, "na_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_prettyFullDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__NSMapTable_HFDebugging__hf_prettyFullDescription__block_invoke;
  v7[3] = &unk_1EA72B4C0;
  v7[4] = a1;
  objc_msgSend(v3, "na_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
