@implementation NSError(CPSafeDescription)

- (id)CPSafeDescription
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<NSError %p>(domain: %@, code: %ld)"), a1, v3, objc_msgSend(a1, "code"));

  return v4;
}

@end
