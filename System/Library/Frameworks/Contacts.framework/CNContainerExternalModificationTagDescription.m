@implementation CNContainerExternalModificationTagDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF62F0];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setExternalModificationTag:", a3);
}

- (id)key
{
  return CFSTR("externalModificationTag");
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "externalModificationTag");
}

@end
