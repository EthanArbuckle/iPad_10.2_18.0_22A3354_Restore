@implementation NSURLSessionTask(FCOperationIdentifyingSupport)

- (id)longOperationDescription
{
  void *v2;
  void *v3;
  float v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "priority");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<NSURLSessionTask %@, priority=%.2f>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)shortOperationDescription
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("<NSURLSessionTask %@>"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
