@implementation EKCalendarSharedCalendarNotification(CUIKDescription)

- (BOOL)supportsDisplay
{
  return objc_msgSend(a1, "type") == 8;
}

- (id)titleStringWithOptions:()CUIKDescription
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_1EF1FDE78;
  objc_msgSendSuper2(&v2, sel_titleStringWithOptions_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_actionStringWithOptions:()CUIKDescription
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = objc_msgSend(a1, "allowedEntityTypes");
  objc_msgSend(a1, "_identityStringWithOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 2) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Invitation to share a reminders list with %@.");
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((a3 & 0x20) != 0)
      v10 = CFSTR("%@ invited you to a shared calendar.");
    else
      v10 = CFSTR("Invitation to share a calendar with %@.");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E6EBAE30, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_actionStringWithOptions:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)descriptionStrings:()CUIKDescription
{
  void *v3;
  void *v4;
  void **v5;
  const __CFString **v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x20) != 0)
  {
    v11 = CFSTR("Person");
    objc_msgSend(a1, "_actionStringWithOptions:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = (void **)v12;
    v6 = &v11;
  }
  else
  {
    v9 = CFSTR("Action");
    objc_msgSend(a1, "_actionStringWithOptions:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = &v10;
    v6 = &v9;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
