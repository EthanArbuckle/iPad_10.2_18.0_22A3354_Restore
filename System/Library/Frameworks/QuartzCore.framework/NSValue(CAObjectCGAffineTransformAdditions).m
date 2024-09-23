@implementation NSValue(CAObjectCGAffineTransformAdditions)

- (const)CA_CGAffineTransformValue
{
  const char *result;
  uint64_t v5;
  __int128 v6;
  NSUInteger v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  result = NSGetSizeAndAlignment((const char *)objc_msgSend(a1, "objCType"), v7, 0);
  if (v7[0] > 0x2F)
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
    return (const char *)objc_msgSend(a1, "getValue:size:", a2, 48);
  }
  else
  {
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *a2 = *MEMORY[0x1E0C9BAA8];
    a2[1] = v6;
    a2[2] = *(_OWORD *)(v5 + 32);
  }
  return result;
}

@end
