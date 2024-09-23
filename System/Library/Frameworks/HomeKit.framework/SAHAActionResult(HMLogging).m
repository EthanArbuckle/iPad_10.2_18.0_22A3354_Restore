@implementation SAHAActionResult(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D887D0];
  objc_msgSend(a1, "outcome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v3, v4);

  v5 = *MEMORY[0x1E0D887C8];
  objc_msgSend(a1, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hm_shortDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
    objc_msgSend(v2, "appendFormat:", CFSTR("  %@:%@;"), v5, v7);

  objc_msgSend(v2, "appendString:", CFSTR("  "));
  v10 = (void *)*MEMORY[0x1E0D887E0];
  objc_msgSend(a1, "resultAttribute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v10, v11);

  objc_msgSend(v2, "appendString:", CFSTR("  "));
  v12 = (void *)*MEMORY[0x1E0D887E8];
  objc_msgSend(a1, "resultValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hm_shortDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v12, v14);

  objc_msgSend(v2, "appendString:", CFSTR("  "));
  v15 = (void *)*MEMORY[0x1E0D887D8];
  objc_msgSend(a1, "requestActionId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v15, v16);

  return v2;
}

@end
