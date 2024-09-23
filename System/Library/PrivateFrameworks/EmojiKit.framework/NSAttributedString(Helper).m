@implementation NSAttributedString(Helper)

- (void)_enumerateTokenListsInReverse:()Helper handler_emk:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  if (a3)
    v8 = 2;
  else
    v8 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__NSAttributedString_Helper___enumerateTokenListsInReverse_handler_emk___block_invoke;
  v10[3] = &unk_1EA258938;
  v11 = v6;
  v9 = v6;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("EMKEmojiTokenList"), 0, v7, v8, v10);

}

- (void)_enumerateTokenListsInRange:()Helper usingBlock_emk:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  objc_msgSend(a1, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__NSAttributedString_Helper___enumerateTokenListsInRange_usingBlock_emk___block_invoke;
  v10[3] = &unk_1EA258938;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("EMKEmojiTokenList"), a3, a4, 0, v10);

}

@end
