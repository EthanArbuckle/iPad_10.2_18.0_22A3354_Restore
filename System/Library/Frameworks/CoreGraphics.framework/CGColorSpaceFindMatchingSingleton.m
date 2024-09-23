@implementation CGColorSpaceFindMatchingSingleton

CGColorSpaceRef __CGColorSpaceFindMatchingSingleton_block_invoke_2()
{
  uint64_t i;
  CGColorSpaceRef result;

  for (i = 0; i != 14; ++i)
  {
    result = CGColorSpaceCreateWithName(CGColorSpaceFindMatchingSingleton_names[i]);
    CGColorSpaceFindMatchingSingleton_spaces_115[i] = (uint64_t)result;
  }
  return result;
}

CGColorSpaceRef __CGColorSpaceFindMatchingSingleton_block_invoke()
{
  uint64_t i;
  CGColorSpaceRef result;

  for (i = 0; i != 3; ++i)
  {
    result = CGColorSpaceCreateWithName(off_1E1645420[i]);
    CGColorSpaceFindMatchingSingleton_spaces[i] = (uint64_t)result;
  }
  return result;
}

CGColorSpaceRef __CGColorSpaceFindMatchingSingleton_block_invoke_3()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName(CFSTR("kCGColorSpaceGenericCMYK"));
  CGColorSpaceFindMatchingSingleton_spaces_119_0 = (uint64_t)result;
  return result;
}

@end
