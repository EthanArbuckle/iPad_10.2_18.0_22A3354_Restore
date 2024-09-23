@implementation IMSharedChatSummaries

+ (id)unreadSummaryWithUnreadCount:(int64_t)a3 withParticipants:(id)a4 withGroupChatName:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  v8 = objc_msgSend(a4, "count");
  if (a3 == 1)
    v9 = objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("1 unread"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
  else
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("%@ unread"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities")), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3));
  v10 = (void *)v9;
  if (!a5)
  {
    switch(v8)
    {
      case 0:
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("Empty chat (%@)"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
        v24 = v10;
        goto LABEL_6;
      case 1:
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
        v24 = (id)objc_msgSend(a4, "objectAtIndex:", 0);
        v25 = (uint64_t)v10;
        goto LABEL_14;
      case 2:
        v19 = (void *)MEMORY[0x1E0CB3940];
        v21 = (void *)IMSharedUtilitiesFrameworkBundle();
        v22 = CFSTR("%@, %@ (%@)");
        goto LABEL_13;
      case 3:
        v19 = (void *)MEMORY[0x1E0CB3940];
        v21 = (void *)IMSharedUtilitiesFrameworkBundle();
        v22 = CFSTR("%@, %@ and 1 other person (%@)");
LABEL_13:
        v20 = objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
        v23 = objc_msgSend(a4, "objectAtIndex:", 0);
        v25 = objc_msgSend(a4, "objectAtIndex:", 1);
        v26 = v10;
        v24 = (id)v23;
LABEL_14:
        v13 = v19;
        v12 = v20;
        return (id)objc_msgSend(v13, "stringWithFormat:", v12, v24, v25, v26, v27);
      default:
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("%@, %@ and %@ other people (%@)"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
        v16 = objc_msgSend(a4, "objectAtIndex:", 0);
        v17 = objc_msgSend(a4, "objectAtIndex:", 1);
        return (id)objc_msgSend(v14, "stringWithFormat:", v15, v16, v17, objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v8 - 2), 0), v10);
    }
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
  v24 = a5;
  v25 = (uint64_t)v10;
LABEL_6:
  v13 = v11;
  return (id)objc_msgSend(v13, "stringWithFormat:", v12, v24, v25, v26, v27);
}

@end
