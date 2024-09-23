@implementation NSKnownKeysDictionary2

+ (id)newInstanceWithSearchStrategy:(id)a3 inData:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id result;

  v6 = objc_msgSend(a3, "length");
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  result = _PFAllocateObject((Class)a1, 8 * v7);
  *((_QWORD *)result + 2) = a3;
  *((_DWORD *)result + 3) = -1;
  return result;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 0;
}

@end
