@implementation OSLogEnumeratorCatalog

uint64_t __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke(_QWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  _OSLogEnumeratorCatalogSubchunk *v5;
  uint64_t v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) || *a2 != 24589)
    return 1;
  v5 = -[_OSLogEnumeratorCatalogSubchunk initWithCatalog:subchunk:range:]([_OSLogEnumeratorCatalogSubchunk alloc], "initWithCatalog:subchunk:range:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), a3, a4);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = **(_QWORD **)(*(_QWORD *)(a1[6] + 8) + 24);
  v6 = (*(uint64_t (**)(void))(a1[5] + 16))();

  return v6;
}

uint64_t __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke_2(NSRange a1, NSRange a2)
{
  NSUInteger length;
  _QWORD *location;
  uint64_t v4;

  if (*(_DWORD *)a1.length >> 1 == 12294)
  {
    length = a1.length;
    location = (_QWORD *)a1.location;
    v4 = *(_QWORD *)(*(_QWORD *)(a1.location + 32) + 8);
    a1.location = *(_QWORD *)(v4 + 32);
    if (a1.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      a1.length = *(_QWORD *)(v4 + 40);
      a2 = NSUnionRange(a1, a2);
      v4 = *(_QWORD *)(location[4] + 8);
    }
    *(NSRange *)(v4 + 32) = a2;
    enumerateOldChunkTracepointLimits(length, (unint64_t *)(*(_QWORD *)(location[5] + 8) + 24), (unint64_t *)(*(_QWORD *)(location[6] + 8) + 24));
  }
  return 1;
}

@end
