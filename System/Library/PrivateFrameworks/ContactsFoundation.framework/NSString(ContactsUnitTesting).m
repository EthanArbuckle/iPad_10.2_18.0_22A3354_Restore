@implementation NSString(ContactsUnitTesting)

+ (id)_cn_stringByRepeatingCharacter:()ContactsUnitTesting length:
{
  void *v6;

  v6 = malloc_type_malloc(size, 0x6C84F7F4uLL);
  memset(v6, a3, size);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, size, 1, 1);
}

@end
