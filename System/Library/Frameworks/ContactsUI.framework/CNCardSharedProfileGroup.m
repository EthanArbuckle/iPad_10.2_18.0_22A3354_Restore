@implementation CNCardSharedProfileGroup

- (BOOL)isMultiValue
{
  return 0;
}

- (id)editingItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
