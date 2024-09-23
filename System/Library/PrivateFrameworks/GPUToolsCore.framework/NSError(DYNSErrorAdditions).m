@implementation NSError(DYNSErrorAdditions)

- (uint64_t)dy_errorSignature
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%llu)"), objc_msgSend(a1, "domain"), objc_msgSend(a1, "code"));
}

@end
