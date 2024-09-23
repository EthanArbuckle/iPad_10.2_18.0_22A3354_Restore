@implementation CKConversationListCollectionViewRecoverableConversationCell

+ (id)reuseIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "reuseIdentifierForAXFontSize:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reuseIdentifierForAXFontSize:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reuseIdentifierForAXFontSize:(BOOL)a3
{
  objc_class *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@+%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)reuseIdentifier
{
  void *v3;
  uint64_t v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessibilityPreferredContentSizeCategory");

  return (id)objc_msgSend(a1, "reuseIdentifierForAXFontSize:", v4);
}

- (void)updateDateLabel:(id)a3 conversation:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  id v16;

  v6 = a3;
  v7 = -[CKConversationListCollectionViewRecoverableConversationCell _daysUntilDeletion:](self, "_daysUntilDeletion:", a4);
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("COUNT_DAYS"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

  if (v14 == 1)
    v15 = CFSTR("\u200F");
  else
    v15 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTextForOverride:", v16);
}

- (unint64_t)_daysUntilDeletion:(id)a3
{
  return 0;
}

- (BOOL)shouldAppearAsRecoverableConversation
{
  return 1;
}

- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3
{
  return 0;
}

- (BOOL)shouldAlwaysHideAvatar
{
  return 0;
}

@end
