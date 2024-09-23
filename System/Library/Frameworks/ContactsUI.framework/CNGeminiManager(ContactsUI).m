@implementation CNGeminiManager(ContactsUI)

+ (id)badgeForSubscription:()ContactsUI
{
  objc_class *v3;
  id v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C97310];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "badgeLabelForSubscription:error:", v4, 0);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("?");
  if (v6)
    v7 = v6;
  v8 = v7;

  +[CNGeminiBadge geminiBadgeWithText:](CNGeminiBadge, "geminiBadgeWithText:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)badgeForSenderIdentity:()ContactsUI
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "localizedShortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v4))
  {
    objc_msgSend(v3, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) & 1) != 0)
    {
      v7 = CFSTR("?");
    }
    else
    {
      objc_msgSend(v6, "_cn_take:", 1);
      v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    v4 = (void *)v7;
  }
  +[CNGeminiBadge geminiBadgeWithText:](CNGeminiBadge, "geminiBadgeWithText:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (CNGeminiBadge)badgeForText:()ContactsUI
{
  return +[CNGeminiBadge geminiBadgeWithText:](CNGeminiBadge, "geminiBadgeWithText:");
}

@end
