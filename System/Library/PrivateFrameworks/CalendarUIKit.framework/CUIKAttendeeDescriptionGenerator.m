@implementation CUIKAttendeeDescriptionGenerator

+ (id)sharedGenerator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CUIKAttendeeDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_1 != -1)
    dispatch_once(&sharedGenerator_onceToken_1, block);
  return (id)sharedGenerator___sharedInstance_1;
}

void __51__CUIKAttendeeDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_1;
  sharedGenerator___sharedInstance_1 = (uint64_t)v1;

}

+ (id)displayNameForParticipant:(id)a3 event:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "displayNameForIdentity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v9, "organizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToParticipant:", v11);

    if (v12)
    {
      if (objc_msgSend(v9, "couldBeJunk"))
      {
        objc_msgSend(v8, "emailAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v8, "emailAddress");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v8, "phoneNumber");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            +[CUIKPhoneNumberDescriptionGenerator sharedGenerator](CUIKPhoneNumberDescriptionGenerator, "sharedGenerator");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "phoneNumber");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "formattedStringForPhoneNumber:", v21);
            v14 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v8, "URL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "resourceSpecifier");
            v14 = objc_claimAutoreleasedReturnValue();

          }
          v10 = v20;
        }

        v10 = (void *)v14;
      }
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("%@ (organizer)");
      goto LABEL_14;
    }
    if (objc_msgSend(v8, "participantRole") == 2)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("%@ (optional)");
LABEL_14:
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E6EBAE30, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v22, v10);
      v23 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v23;
    }
  }

  return v10;
}

+ (id)displayNameForIdentity:(id)a3
{
  return (id)objc_msgSend(a1, "displayNameForIdentity:outFirstName:outLastName:", a3, 0, 0);
}

+ (id)displayNameForIdentity:(id)a3 outFirstName:(id *)a4 outLastName:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;

  v7 = a3;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("unknownorganizer@calendar.google.com"));

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Google Calendar"), &stru_1E6EBAE30, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  v13 = objc_msgSend(v8, "length");
  if (!a5 && !a4 && v13)
  {
    v12 = v8;
    goto LABEL_31;
  }
  objc_msgSend(v7, "phoneNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "phoneNumber");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "cal_isPhoneNumber");
  }
  else
  {
    objc_msgSend(v7, "emailAddress");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = CFStringFind(v15, CFSTR("@"), 0).location != -1;
    else
      v17 = 0;
  }

  if (-[__CFString length](v15, "length"))
  {
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v7, "phoneNumber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "cal_isPhoneNumber");

      objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v7, "phoneNumber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "unifiedContactWithPhoneNumber:", v21);
      }
      else
      {
        objc_msgSend(v7, "emailAddress");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "unifiedContactWithEmailAddress:", v21);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        objc_msgSend(v22, "givenName");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a5)
      {
        objc_msgSend(v22, "familyName");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "CalDisplayName");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_24;
    }
    else
    {

      v15 = 0;
    }
  }
  v23 = v8;
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v25, "length") && -[__CFString length](v15, "length"))
  {
    if (-[__CFString cal_isPhoneNumber](v15, "cal_isPhoneNumber"))
    {
      +[CUIKPhoneNumberDescriptionGenerator sharedGenerator](CUIKPhoneNumberDescriptionGenerator, "sharedGenerator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "formattedStringForPhoneNumber:", v15);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v25 = v26;
    }
    else
    {
      v27 = v15;
    }

    v25 = v27;
  }
  v12 = v25;

LABEL_31:
  return v12;
}

@end
