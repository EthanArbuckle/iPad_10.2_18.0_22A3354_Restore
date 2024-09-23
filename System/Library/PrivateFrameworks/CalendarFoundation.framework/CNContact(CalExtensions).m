@implementation CNContact(CalExtensions)

- (id)CalDisplayName
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v2, "stringFromContact:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)CalDefaultBirthdayString
{
  void *v0;
  void *v1;

  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Birthday"), &stru_1E2A86598, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)CalEmailAddresses
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "emailAddresses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKeyPath:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)CalPhoneNumbers
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "phoneNumbers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKeyPath:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)CalBirthdayStringForDate:()CalExtensions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_msgSend(a1, "CalDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "birthday");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(a1, "nonGregorianBirthday");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
  }
  objc_msgSend(a1, "nonGregorianBirthday");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(a1, "birthday");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(a1, "nonGregorianBirthday");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  objc_msgSend(a1, "birthday");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v13 = (void *)v12,
        objc_msgSend(a1, "nonGregorianBirthday"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v14))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "CalDefaultBirthdayString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v4)
    goto LABEL_12;
  objc_msgSend(a1, "birthday");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "components:fromDate:", 30, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_12:
    objc_msgSend(a1, "birthday");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v26 = (void *)v24;
    goto LABEL_16;
  }
  v18 = objc_msgSend(v17, "day");
  objc_msgSend(a1, "birthday");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 != objc_msgSend(v19, "day"))
  {

    goto LABEL_23;
  }
  v20 = objc_msgSend(v17, "month");
  objc_msgSend(a1, "birthday");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "month");

  if (v20 != v22)
  {
LABEL_23:
    objc_msgSend(a1, "nonGregorianBirthday");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(a1, "birthday");
  v23 = objc_claimAutoreleasedReturnValue();
LABEL_24:
  v26 = (void *)v23;

LABEL_16:
  objc_msgSend(v26, "calendar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "calendarIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v5, "length");
  if (v26 && v29)
  {
    objc_msgSend(v26, "calendar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTimeZone:", v31);

    objc_msgSend(v30, "dateFromComponents:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalContactsProvider birthdayStringForContactName:eventDate:birthDate:lunarCalendar:](CalContactsProvider, "birthdayStringForContactName:eventDate:birthDate:lunarCalendar:", v5, v4, v32, v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97200], "CalDefaultBirthdayString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:
  return v25;
}

- (id)CalFirstValueForKey:()CalExtensions
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "valueForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)CalValueForKey:()CalExtensions withLabel:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "valueForKey:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "label", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)CalKeys
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C966A8];
  v6[0] = v0;
  v6[1] = v1;
  v2 = *MEMORY[0x1E0C968A0];
  v6[2] = *MEMORY[0x1E0C967C0];
  v6[3] = v2;
  v3 = *MEMORY[0x1E0C96670];
  v6[4] = *MEMORY[0x1E0C96678];
  v6[5] = v3;
  v6[6] = *MEMORY[0x1E0C967A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
