@implementation LNValueType(CATSupport)

- (void)cat_value:()CATSupport
{
  id v3;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[LNValueType valueForCAT:] must be overridden"));
  __break(1u);
}

- (uint64_t)cat_keyPath
{
  return 0;
}

@end
