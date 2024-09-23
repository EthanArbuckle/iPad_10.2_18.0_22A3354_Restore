@implementation CNContainerNameDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF6318];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setName:", a3);
}

- (id)key
{
  return CFSTR("name");
}

- (BOOL)isWritable
{
  return 1;
}

- (BOOL)isNonnull
{
  return 1;
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "name");
}

@end
