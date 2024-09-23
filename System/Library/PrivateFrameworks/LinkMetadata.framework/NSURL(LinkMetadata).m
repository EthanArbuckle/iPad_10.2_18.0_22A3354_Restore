@implementation NSURL(LinkMetadata)

- (id)ln_linkedFrameworksWithError:()LinkMetadata
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

  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LNLinkedFrameworksAtPath(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".preview.dylib"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LNLinkedFrameworksAtPath(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".debug.dylib"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LNLinkedFrameworksAtPath(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
