@implementation StringEscapingSpecialCharactersForLikePredicate

void ___StringEscapingSpecialCharactersForLikePredicate_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  const __CFString *v4;
  __CFString *v5;

  v5 = a2;
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("~")))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("~"));
    v3 = *(void **)(a1 + 32);
    v4 = CFSTR("~");
  }
  else
  {
    if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("%")) & 1) != 0
      || -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("_")))
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("~"));
    }
    v3 = *(void **)(a1 + 32);
    v4 = v5;
  }
  objc_msgSend(v3, "appendString:", v4);

}

@end
