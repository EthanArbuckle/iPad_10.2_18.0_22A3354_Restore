@implementation NSError(MTLIOAccelErrors)

- (uint64_t)initWithIOAccelError:()MTLIOAccelErrors
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 > 0x12)
  {
    v4 = "Internal Error";
    v6 = 1;
    v5 = "Internal Error";
  }
  else
  {
    v4 = off_1E0FE4B10[a3];
    v5 = off_1E0FE4BA8[a3];
    v6 = qword_18281B2B0[a3];
  }
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (%08x:%s)"), v5, a3, v4);
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", CFSTR("MTLCommandBufferErrorDomain"), v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0CB2D50]));
}

@end
