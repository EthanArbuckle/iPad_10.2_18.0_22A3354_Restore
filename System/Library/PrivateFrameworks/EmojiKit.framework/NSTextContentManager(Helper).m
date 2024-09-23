@implementation NSTextContentManager(Helper)

- (uint64_t)_rangeFromTextRange_emk:()Helper
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "offsetFromLocation:toLocation:", v6, v7);

  objc_msgSend(v4, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "offsetFromLocation:toLocation:", v9, v10);
  return v8;
}

@end
