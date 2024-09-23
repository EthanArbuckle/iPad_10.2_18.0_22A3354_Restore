@implementation NSDateComponents(CLSNSDateComponentsExtensions)

- (id)description
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
