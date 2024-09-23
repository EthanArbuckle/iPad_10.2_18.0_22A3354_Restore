@implementation NSString(DoNotDisturb)

- (uint64_t)dnd_privacyObfuscatedString
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "hash");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lX"), v1);
}

@end
