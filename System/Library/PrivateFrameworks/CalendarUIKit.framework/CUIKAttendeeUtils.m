@implementation CUIKAttendeeUtils

+ (id)contactForIdentity:(id)a3 keys:(id)a4 provider:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "phoneNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateForContactsMatchingPhoneNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_3;
LABEL_7:
    v16 = 0;
    goto LABEL_9;
  }
  if (!v11)
  {
    v16 = 0;
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_7;
LABEL_3:
  objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:", v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v15, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v17;
}

+ (id)_contactForIdentity:(id)a3 keys:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D0C298];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactForIdentity:keys:provider:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_displayStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8 useShortName:(BOOL)a9
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  _BOOL4 v41;
  id v43;
  id v44[2];
  id v45;
  id v46;
  _QWORD v47[4];

  v41 = a4;
  v47[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void *)EKWeakLinkClass();
  v14 = v13;
  if (a9)
    v15 = 1000;
  else
    v15 = 0;
  objc_msgSend(v13, "descriptorForRequiredKeysForStyle:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v16;
  EKWeakLinkStringConstant();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v17;
  EKWeakLinkStringConstant();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_contactForIdentity:keys:", v12, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = a6;
  if (v20)
  {
    objc_msgSend(v14, "stringFromContact:style:", v20, v15);
    v22 = objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      objc_msgSend(v20, "givenName");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a7)
    {
      objc_msgSend(v20, "familyName");
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      objc_msgSend(v20, "identifier");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v22)
    {
LABEL_31:
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByTrimmingCharactersInSet:](v22, "stringByTrimmingCharactersInSet:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqual:", &stru_1E6EBAE30);

      if (!v34 || !v41)
        goto LABEL_42;
      goto LABEL_35;
    }
  }
  objc_msgSend(v12, "name");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSObject length](v22, "length"))
  {
LABEL_17:
    v27 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v23, "length") || !objc_msgSend(v24, "length"))
  {
    if ((-[NSObject cal_isPhoneNumber](v22, "cal_isPhoneNumber") & 1) == 0)
    {
      v43 = v24;
      v44[0] = v23;
      CUIKDecomposedAttendeeName((uint64_t)v22, (uint64_t)v44, (uint64_t)&v43);
      v28 = v44[0];

      v29 = v43;
      v27 = 0;
      v24 = v29;
      v21 = a6;
      v23 = v28;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v45 = 0;
  v46 = 0;
  v44[1] = 0;
  CUIKDecomposedAttendeeName((uint64_t)v22, (uint64_t)&v46, (uint64_t)&v45);
  v25 = v46;
  v26 = v45;

  v27 = 0;
  v21 = a6;
LABEL_19:
  if (objc_msgSend(v23, "length") && objc_msgSend(v24, "length"))
  {
    v30 = objc_alloc_init((Class)EKWeakLinkClass());
    objc_msgSend(v30, "setGivenName:", v23);
    objc_msgSend(v30, "setFamilyName:", v24);
    if (objc_msgSend(v27, "length"))
      objc_msgSend(v30, "setDepartmentName:", v27);
    objc_msgSend((id)EKWeakLinkClass(), "stringFromContact:style:", v30, v15);
    v31 = objc_claimAutoreleasedReturnValue();

    if (v21)
      *v21 = objc_retainAutorelease(v23);
    if (a7)
      *a7 = objc_retainAutorelease(v24);
    if (a8)
      *a8 = objc_retainAutorelease(v27);

    v22 = v31;
  }

  if (v22)
    goto LABEL_31;
  if (!v41)
    goto LABEL_42;
LABEL_35:
  objc_msgSend(v12, "emailAddress");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "phoneNumber");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "length"))
  {
    v37 = v22;
    v22 = v35;
  }
  else if (objc_msgSend(v36, "length"))
  {
    +[CUIKPhoneNumberDescriptionGenerator sharedGenerator](CUIKPhoneNumberDescriptionGenerator, "sharedGenerator");
    v37 = objc_claimAutoreleasedReturnValue();
    -[NSObject formattedStringForPhoneNumber:](v37, "formattedStringForPhoneNumber:", v36);
    v38 = objc_claimAutoreleasedReturnValue();

    v22 = v38;
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      +[CUIKAttendeeUtils _displayStringForIdentityWithDecomposedName:useAddressAsFallback:contactIdentifier:outFirstName:outLastName:outDepartment:useShortName:].cold.1((uint64_t)v12, v37);
  }

LABEL_42:
  return v22;
}

+ (id)_filteredAttendeeName:(id)a3 parenthesizedPart:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("("));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
  }
  else
  {
    v8 = v6;
    v9 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR(")"), 0, v8, objc_msgSend(v5, "length") - v8);
    v10 = v5;
    v11 = v10;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v10;
    }
    else
    {
      v12 = objc_msgSend(v10, "length");
      objc_msgSend(v11, "substringToIndex:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 + 1 == v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v11;
      }
      else
      {
        objc_msgSend(v11, "substringFromIndex:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", CFSTR(" "));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", v14);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (a4 && v9 + ~v8)
      {
        objc_msgSend(v11, "substringWithRange:", v8 + 1, v9 + ~v8);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v7;
}

+ (id)displayStringForIdentity:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5
{
  return (id)objc_msgSend(a1, "displayStringForIdentityWithDecomposedName:useAddressAsFallback:contactIdentifier:outFirstName:outLastName:outDepartment:", a3, a4, a5, 0, 0, 0);
}

+ (id)displayShortStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return (id)objc_msgSend(a1, "_displayStringForIdentityWithDecomposedName:useAddressAsFallback:contactIdentifier:outFirstName:outLastName:outDepartment:useShortName:", a3, a4, a5, a6, a7, a8, v9);
}

+ (id)displayStringForIdentityWithDecomposedName:(id)a3 useAddressAsFallback:(BOOL)a4 contactIdentifier:(id *)a5 outFirstName:(id *)a6 outLastName:(id *)a7 outDepartment:(id *)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return (id)objc_msgSend(a1, "_displayStringForIdentityWithDecomposedName:useAddressAsFallback:contactIdentifier:outFirstName:outLastName:outDepartment:useShortName:", a3, a4, a5, a6, a7, a8, v9);
}

+ (id)sortedEKParticipantsForSortingIgnoringNonHumans:(id)a3 event:(id)a4 includeOrganizer:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  BOOL v21;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3880];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __92__CUIKAttendeeUtils_sortedEKParticipantsForSortingIgnoringNonHumans_event_includeOrganizer___block_invoke;
  v19 = &unk_1E6EB73B0;
  v21 = a5;
  v9 = v7;
  v20 = v9;
  v10 = a3;
  objc_msgSend(v8, "predicateWithBlock:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v11, v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CAA0E8], "participantsForSortingWithEKParticipants:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v14, "sortUsingSelector:", sel_compare_);

  return v14;
}

uint64_t __92__CUIKAttendeeUtils_sortedEKParticipantsForSortingIgnoringNonHumans_event_includeOrganizer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  int v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "participantType");
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "length") == 0;

  }
  if (*(_BYTE *)(a1 + 40))
  {
    v9 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 2 || v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "organizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "isEqualToParticipant:", v10);
    v12 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 2 || v6;
    if ((v11 & 1) != 0)
      v9 = 1;
    else
      v9 = v12;

  }
  return v9 ^ 1u;
}

+ (id)sortedEKParticipantsForSortingIgnoringNonHumans:(id)a3 event:(id)a4
{
  return (id)objc_msgSend(a1, "sortedEKParticipantsForSortingIgnoringNonHumans:event:includeOrganizer:", a3, a4, 0);
}

+ (id)sortEKParticipantsIgnoringNonHumans:(id)a3 event:(id)a4 includeOrganizer:(BOOL)a5
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sortedEKParticipantsForSortingIgnoringNonHumans:event:includeOrganizer:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "participant", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)sortEKParticipantsIgnoringNonHumans:(id)a3 event:(id)a4
{
  return (id)objc_msgSend(a1, "sortEKParticipantsIgnoringNonHumans:event:includeOrganizer:", a3, a4, 0);
}

+ (void)_displayStringForIdentityWithDecomposedName:(uint64_t)a1 useAddressAsFallback:(NSObject *)a2 contactIdentifier:outFirstName:outLastName:outDepartment:useShortName:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Unable to get fallback for display string. Identity: %@.", (uint8_t *)&v2, 0xCu);
}

@end
