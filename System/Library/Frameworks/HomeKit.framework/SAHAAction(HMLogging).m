@implementation SAHAAction(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D87F18];
  objc_msgSend(a1, "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v3, v4);

  v5 = (void *)*MEMORY[0x1E0D88708];
  objc_msgSend(a1, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v5, v6);

  v7 = (void *)*MEMORY[0x1E0D88710];
  objc_msgSend(a1, "attribute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v7, v8);

  objc_msgSend(v2, "appendString:", CFSTR("  "));
  v9 = (void *)*MEMORY[0x1E0D88848];
  objc_msgSend(a1, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hm_shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v9, v11);

  return v2;
}

@end
