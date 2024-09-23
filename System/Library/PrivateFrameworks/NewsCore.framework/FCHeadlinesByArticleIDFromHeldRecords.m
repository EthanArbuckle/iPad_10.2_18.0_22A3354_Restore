@implementation FCHeadlinesByArticleIDFromHeldRecords

FCArticleHeadline *__FCHeadlinesByArticleIDFromHeldRecords_block_invoke(uint64_t a1, void *a2)
{
  return FCHeadlineWithHeldRecords(*(void **)(a1 + 32), *(void **)(a1 + 40), a2, *(void **)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 80) != 0, *(void **)(a1 + 64), *(void **)(a1 + 72));
}

@end
