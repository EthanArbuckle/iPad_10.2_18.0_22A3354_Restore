@implementation EKCalendarNotification(CUIKDescription)

- (uint64_t)supportsDisplay
{
  return 0;
}

- (uint64_t)senderStringWithOptions:()CUIKDescription
{
  return 0;
}

- (uint64_t)allDescriptionStringsWithOptions:()CUIKDescription
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)descriptionStrings:()CUIKDescription
{
  return MEMORY[0x1E0C9AA70];
}

- (uint64_t)_identityStringWithOptions:()CUIKDescription
{
  return objc_msgSend(a1, "_identityStringForIdentity:withOptions:", a1, a3);
}

- (id)_identityStringForIdentity:()CUIKDescription withOptions:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  id v20;

  v6 = a3;
  if ((a4 & 2) != 0)
  {
    v20 = 0;
    +[CUIKAttendeeDescriptionGenerator displayNameForIdentity:outFirstName:outLastName:](CUIKAttendeeDescriptionGenerator, "displayNameForIdentity:outFirstName:outLastName:", v6, &v20, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
  }
  else
  {
    +[CUIKAttendeeDescriptionGenerator displayNameForIdentity:outFirstName:outLastName:](CUIKAttendeeDescriptionGenerator, "displayNameForIdentity:outFirstName:outLastName:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  if (objc_msgSend(a1, "couldBeJunk"))
  {
    objc_msgSend(a1, "emailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1, "emailAddress");
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
      v14 = v10;
      goto LABEL_24;
    }
  }
  if (objc_msgSend(a1, "couldBeJunk"))
  {
    objc_msgSend(a1, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[CUIKPhoneNumberDescriptionGenerator sharedGenerator](CUIKPhoneNumberDescriptionGenerator, "sharedGenerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "phoneNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "formattedStringForPhoneNumber:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
  if ((a4 & 2) != 0)
  {
    if (v8)
    {
      v10 = v8;
      goto LABEL_23;
    }
    objc_msgSend(a1, "firstName");
    v17 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v17;
    if (v17)
      v18 = (void *)v17;
    else
      v18 = v7;
    v14 = v18;

LABEL_20:
    v7 = v12;
LABEL_24:

    v7 = v14;
    goto LABEL_25;
  }
  if (!v7)
  {
    CUIKBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if ((a4 & 1) != 0)
      v16 = CFSTR("Somebody");
    else
      v16 = CFSTR("somebody");
    objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_1E6EBAE30, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_25:

  return v7;
}

- (id)timeSensitiveDescriptionString
{
  void *v1;

  if (objc_msgSend(a1, "cuik_isTimeSensitive"))
  {
    +[CUIKNotificationDescriptionGenerator timeSensitiveString](CUIKNotificationDescriptionGenerator, "timeSensitiveString");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

@end
