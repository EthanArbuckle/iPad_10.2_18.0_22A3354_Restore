@implementation EKCalendarInviteReplyNotification(CUIKDescription)

- (BOOL)supportsDisplay
{
  return objc_msgSend(a1, "type") == 9 || objc_msgSend(a1, "type") == 10;
}

- (id)titleStringWithOptions:()CUIKDescription
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_1EF1FEAC8;
  objc_msgSendSuper2(&v6, sel_titleStringWithOptions_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    CUIKBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Shared Calendar"), &stru_1E6EBAE30, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_actionWithOptions:()CUIKDescription
{
  _BOOL4 v5;
  char v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;

  if ((objc_msgSend(a1, "allowedEntityTypes") & 2) != 0)
  {
    v6 = objc_msgSend(a1, "allowedEntityTypes");
    v5 = (v6 & 1) == 0;
    if (objc_msgSend(a1, "type") != 10)
      goto LABEL_7;
    if ((v6 & 1) == 0)
    {
      CUIKBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("This reminders list is no longer shared.");
LABEL_13:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E6EBAE30, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_12:
    CUIKBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("This calendar is no longer shared.");
    goto LABEL_13;
  }
  if (objc_msgSend(a1, "type") == 10)
    goto LABEL_12;
  v5 = 0;
LABEL_7:
  if (objc_msgSend(a1, "type") != 9)
    return 0;
  objc_msgSend(a1, "_identityStringWithOptions:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "status") == 2)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v5)
      v13 = CFSTR("%@ declined your shared reminders list.");
    else
      v13 = CFSTR("%@ declined your shared calendar.");
  }
  else
  {
    v16 = objc_msgSend(a1, "status");
    v10 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v16 == 1)
    {
      v17 = CFSTR("%@ joined your shared calendar.");
      v18 = CFSTR("%@ joined your shared reminders list.");
    }
    else
    {
      v17 = CFSTR("%@ is pending on this shared calendar invitation.");
      v18 = CFSTR("%@ is pending on this shared reminders list invitation.");
    }
    if (v5)
      v13 = v18;
    else
      v13 = v17;
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E6EBAE30, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v19, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v14;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_actionWithOptions:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (id)descriptionStrings:()CUIKDescription
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_actionWithOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Action"));

  objc_msgSend(a1, "timeSensitiveDescriptionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("TimeSensitive"));

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

@end
