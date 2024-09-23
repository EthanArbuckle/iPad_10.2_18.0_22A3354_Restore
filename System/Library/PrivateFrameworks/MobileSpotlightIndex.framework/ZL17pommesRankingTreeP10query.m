@implementation ZL17pommesRankingTreeP10query

_QWORD *___ZL17pommesRankingTreeP10query_nodePK10__CFStringPK20__CFAttributedStringPK14__CFDictionaryP9PRContext_block_invoke_20(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  _QWORD v5[5];

  result = a2;
  if (a2 && a3 && a4)
  {
    *a2 = a3;
    a2[1] = a4;
  }
  else if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 0x40000000;
    v5[2] = __db_query_tree_apply_block_block_invoke;
    v5[3] = &unk_1E6E377F8;
    v5[4] = &__block_literal_global_143;
    db_query_tree_apply_block_with_meta(a2, (uint64_t)v5, 0);
    return 0;
  }
  return result;
}

@end
