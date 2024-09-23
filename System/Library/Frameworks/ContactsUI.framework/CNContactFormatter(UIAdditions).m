@implementation CNContactFormatter(UIAdditions)

+ (id)sharedFullNameFormatterWithFallBacks
{
  if (sharedFullNameFormatterWithFallBacks_cn_once_token_1 != -1)
    dispatch_once(&sharedFullNameFormatterWithFallBacks_cn_once_token_1, &__block_literal_global_30743);
  return (id)sharedFullNameFormatterWithFallBacks_cn_once_object_1;
}

+ (id)sharedFullNameFormatter
{
  if (sharedFullNameFormatter_cn_once_token_2 != -1)
    dispatch_once(&sharedFullNameFormatter_cn_once_token_2, &__block_literal_global_1);
  return (id)sharedFullNameFormatter_cn_once_object_2;
}

- (id)stringFromGroupIdentity:()UIAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v23;

  v4 = a3;
  v5 = *MEMORY[0x1E0D13848];
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v4, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "numberOfContacts") <= 1)
      {
        objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v9, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v10 = v18;
          v8 = v10;
        }
        else
        {
          objc_msgSend(a1, "stringFromContact:", v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 0;
        }
      }
      else
      {
        objc_msgSend(a1, "stringFromContact:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "numberOfContacts");
        v12 = *MEMORY[0x1E0D13850];
        if (v11 == 2 && (*(unsigned int (**)(_QWORD, id))(v12 + 16))(*MEMORY[0x1E0D13850], v10))
        {
          objc_msgSend(v7, "lastObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "stringFromContact:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)MEMORY[0x1E0CB3940];
          CNContactsUIBundle();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("GROUP_IDENTITY_HEADER_TWO_CONTACTS_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringWithFormat:", v17, v10, v14);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = (*(uint64_t (**)(uint64_t, id))(v12 + 16))(v12, v10);
          v20 = (void *)MEMORY[0x1E0CB3940];
          CNContactsUIBundle();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v21;
          if (v19)
          {
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("GROUP_HEADER_CONTACT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedStringWithFormat:", v16, v10, objc_msgSend(v4, "numberOfContacts") - 1);
          }
          else
          {
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("GROUP_HEADER_CONTACT_NO_NAME_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "localizedStringWithFormat:", v16, objc_msgSend(v4, "numberOfContacts"), v23);
          }
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
    }

  }
  else
  {
    objc_msgSend(v4, "groupName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
