@implementation NSAttributedString(MentionsHelper)

- (void)ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock:()MentionsHelper
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = *MEMORY[0x1E0D381D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__NSAttributedString_MentionsHelper__ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke;
  v8[3] = &unk_1E2750A70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 2, v8);

}

- (void)ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock:()MentionsHelper
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = *MEMORY[0x1E0D381D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__NSAttributedString_MentionsHelper__ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke;
  v8[3] = &unk_1E2750A70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 2, v8);

}

@end
