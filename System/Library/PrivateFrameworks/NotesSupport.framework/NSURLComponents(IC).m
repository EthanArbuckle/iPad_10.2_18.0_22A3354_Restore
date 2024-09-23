@implementation NSURLComponents(IC)

- (id)ic_queryItemWithKey:()IC
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__NSURLComponents_IC__ic_queryItemWithKey___block_invoke;
  v9[3] = &unk_1EA8250D8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ic_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ic_stringValueForQueryItemWithKey:()IC
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ic_queryItemWithKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)ic_BOOLValueForQueryItemWithKey:()IC
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ic_stringValueForQueryItemWithKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
