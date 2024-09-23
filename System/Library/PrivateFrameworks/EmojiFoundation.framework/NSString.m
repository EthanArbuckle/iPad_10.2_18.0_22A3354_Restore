@implementation NSString

void __63__NSString_EMFEmojiExtras___enumerateEmojiTokensInRange_block___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    +[EMFEmojiToken emojiTokenWithCEMEmojiToken:](EMFEmojiToken, "emojiTokenWithCEMEmojiToken:", a2);
    a2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
