@implementation NSAttributedString(CKMessageEntryRichTextViewHelper)

- (void)ck_enumerateAllMentionAnimationIdentifiersUsingBlock:()CKMessageEntryRichTextViewHelper
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = *MEMORY[0x1E0D381C8];
  v6 = objc_msgSend(a1, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__NSAttributedString_CKMessageEntryRichTextViewHelper__ck_enumerateAllMentionAnimationIdentifiersUsingBlock___block_invoke;
  v8[3] = &unk_1E2750A70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 2, v8);

}

@end
