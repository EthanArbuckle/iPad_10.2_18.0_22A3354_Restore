@implementation CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock

void __CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock_block_invoke(uint64_t a1, uint64_t **a2)
{
  __CFArray *Wrappers;

  Wrappers = CEM::EmojiToken::createWrappers(a2, *(const void **)(a1 + 40));
  if (Wrappers)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease(Wrappers);
  }
}

@end
