@implementation CUIKInviteeDescriptionGenerator

+ (id)inviteeStringForEvent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inviteeStringForAttendees:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)inviteeStringForAttendees:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isCurrentUser") & 1) == 0)
        {
          objc_msgSend(v10, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "name");
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
          objc_msgSend(v10, "emailAddress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "emailAddress");
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
            v14 = (__CFString *)v12;
          }
          else
          {
            objc_msgSend(v10, "phoneNumber");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              +[CUIKPhoneNumberDescriptionGenerator sharedGenerator](CUIKPhoneNumberDescriptionGenerator, "sharedGenerator");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "phoneNumber");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "formattedStringForPhoneNumber:", v17);
              v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v14 = &stru_1E6EBAE30;
            }
          }
          objc_msgSend(v4, "addObject:", v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v7 = v18;
    }
    while (v18);
  }

  if (objc_msgSend(v4, "count"))
  {
    v19 = objc_msgSend(v4, "count");
    v20 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v19 == 1)
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Invitees: %@"), &stru_1E6EBAE30, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%lu Invitees"), &stru_1E6EBAE30, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v23, objc_msgSend(v4, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end
