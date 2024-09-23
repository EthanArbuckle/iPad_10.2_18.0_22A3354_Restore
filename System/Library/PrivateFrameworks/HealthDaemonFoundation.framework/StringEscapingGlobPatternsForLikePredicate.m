@implementation StringEscapingGlobPatternsForLikePredicate

void ___StringEscapingGlobPatternsForLikePredicate_block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;
  int v6;
  __CFString *v7;

  v3 = a2;
  v7 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("\\")))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_20;
    }
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("*")))
      goto LABEL_9;
    if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("?")))
    {
      if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("~")))
      {
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("~"));
        v4 = *(void **)(a1 + 32);
        v5 = CFSTR("~");
        goto LABEL_19;
      }
      if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("%")))
      {
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("~"));
LABEL_9:
        v4 = *(void **)(a1 + 32);
        v5 = CFSTR("%");
LABEL_19:
        objc_msgSend(v4, "appendString:", v5);
        goto LABEL_20;
      }
      v6 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("_"));
      v4 = *(void **)(a1 + 32);
      if (!v6)
      {
        v5 = v7;
        goto LABEL_19;
      }
      objc_msgSend(v4, "appendString:", CFSTR("~"));
    }
    v4 = *(void **)(a1 + 32);
    v5 = CFSTR("_");
    goto LABEL_19;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("%")) & 1) != 0
    || -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("_")))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("~"));
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_20:

}

@end
