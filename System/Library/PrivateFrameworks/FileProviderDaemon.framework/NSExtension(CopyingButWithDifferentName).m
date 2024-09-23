@implementation NSExtension(CopyingButWithDifferentName)

- (id)_freshCopy
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB35D8]);
  objc_msgSend(a1, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithPKPlugin:", v3);

  return v4;
}

@end
