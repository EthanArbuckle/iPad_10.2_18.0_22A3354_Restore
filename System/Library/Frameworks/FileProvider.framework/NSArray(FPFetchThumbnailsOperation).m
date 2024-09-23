@implementation NSArray(FPFetchThumbnailsOperation)

- (id)fp_shortDescriptionExpandingAtMost:()FPFetchThumbnailsOperation
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("[%@]"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@, (+%lu more)]"), v7, objc_msgSend(a1, "count") - a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
