id MSUserNotificationsLog()
{
  if (MSUserNotificationsLog_onceToken != -1)
    dispatch_once(&MSUserNotificationsLog_onceToken, &__block_literal_global_10);
  return (id)MSUserNotificationsLog_os_log;
}

void sub_1B9D1CCC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D1CEB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D1CFC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D1D064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D1D304(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id MSSharedContactStore()
{
  if (MSSharedContactStore_onceToken != -1)
    dispatch_once(&MSSharedContactStore_onceToken, &__block_literal_global_1);
  return (id)MSSharedContactStore_store;
}

id MSFetchNonUnifiedContactsForPredicate(void *a1, void *a2, void *a3, _QWORD *a4)
{
  fetchContactsForPredicate(a1, a2, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id fetchContactsForPredicate(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v11);
  objc_msgSend(v12, "setPredicate:", v10);
  objc_msgSend(v12, "setUnifyResults:", a4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __fetchContactsForPredicate_block_invoke;
  v24 = &unk_1E716DBA0;
  v14 = v13;
  v25 = v14;
  v15 = objc_msgSend(v9, "enumerateContactsWithFetchRequest:error:usingBlock:", v12, &v26, &v21);
  v16 = v26;
  if ((v15 & 1) != 0)
  {

    v17 = (void *)objc_msgSend(v14, "copy", v21, v22, v23, v24);
  }
  else
  {
    contactsUtilsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "ef_publicDescription", v21, v22, v23, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v10;
      v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_1B9D1A000, v18, OS_LOG_TYPE_DEFAULT, "Error fetching contact matching predicate %@, error: %{public}@", buf, 0x16u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v16);

    v17 = 0;
  }

  return v17;
}

void sub_1B9D1D5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

id MSCopyClosestMatchingExistingContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(a1, a2, a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id MSCopyClosestMatchingExistingContactUsingAddressesAndDisplayNameUnified(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(a1, a2, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (**v20)(uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  _MSCountableMatchesContext *v28;
  id v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[9];

  v47[7] = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v32 = a2;
  v12 = a3;
  v33 = a4;
  v34 = a5;
  v35 = v12;
  v13 = 0;
  if (!v11 || !v12)
    goto LABEL_23;
  v14 = *MEMORY[0x1E0C966D0];
  v47[0] = *MEMORY[0x1E0C96790];
  v47[1] = v14;
  v15 = *MEMORY[0x1E0C966C0];
  v47[2] = *MEMORY[0x1E0C96780];
  v47[3] = v15;
  v16 = *MEMORY[0x1E0C967B8];
  v47[4] = *MEMORY[0x1E0C96798];
  v47[5] = v16;
  v47[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v34)
  {
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:");
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  v36 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    v20 = (void (**)(uint64_t, uint64_t))&__block_literal_global_37;
LABEL_9:
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v21 = v32;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(v21);
          v20[2]((uint64_t)v20, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          fetchContactsForPredicate(v11, v25, v18, a6, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v36, "addObjectsFromArray:", v26);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v22);
    }

    goto LABEL_19;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    v20 = (void (**)(uint64_t, uint64_t))&__block_literal_global_38;
    goto LABEL_9;
  }
LABEL_19:
  if (objc_msgSend(v36, "count") == 1)
  {
    objc_msgSend(v36, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v33, "ea_personNameComponents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(_MSCountableMatchesContext);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4;
    v37[3] = &unk_1E716DC48;
    v38 = v36;
    v41 = &__block_literal_global_42;
    v29 = v27;
    v39 = v29;
    v40 = v33;
    -[_MSCountableMatchesContext countInstances:usingPredicate:](v28, "countInstances:usingPredicate:", v38, v37);
    -[_MSCountableMatchesContext highestMatches](v28, "highestMatches");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_23:

  return v13;
}

void sub_1B9D1DA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

id MSPreferredAbbreviatedNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  char v25;
  id v26;
  void *v27;
  void *v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  idealDisplayName(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v10, "length") && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    objc_msgSend(MEMORY[0x1E0CB3850], "descriptorForUsedKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v14;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v15;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v12);
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    v39 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v19, (void *)*MEMORY[0x1E0C966A8], v13, v17, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(v13, "ea_personNameComponents");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "givenName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {

      }
      else
      {
        objc_msgSend(v20, "familyName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29 == 0;

        if (v30)
        {
          v22 = v13;
          goto LABEL_22;
        }
      }
      v31 = objc_alloc_init(MEMORY[0x1E0C97360]);
      objc_msgSend(v20, "namePrefix");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setNamePrefix:", v32);

      objc_msgSend(v20, "givenName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setGivenName:", v33);

      objc_msgSend(v20, "middleName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setMiddleName:", v34);

      objc_msgSend(v20, "familyName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFamilyName:", v35);

      objc_msgSend(v20, "nameSuffix");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setNameSuffix:", v36);

      v37 = objc_msgSend(v31, "copy");
      v20 = (id)v37;
      if (!v37)
      {
        v22 = v13;
        goto LABEL_23;
      }
    }
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v20, 1000);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38
      || (objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v20, 0),
          (v38 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = v38;

      if (!a5)
      {
LABEL_22:

LABEL_23:
        goto LABEL_10;
      }
    }
    else
    {
      v22 = v13;
      if (!a5)
        goto LABEL_22;
    }
    v20 = objc_retainAutorelease(v20);
    *a5 = v20;
    goto LABEL_22;
  }
  v22 = v13;
LABEL_10:
  v23 = v10;
  if (v22
    && (v24 = objc_msgSend(v22, "containsString:", CFSTR("@")), v23 = v22, v24)
    && (v25 = objc_msgSend(v22, "isEqualToString:", v10), v23 = v22, (v25 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v22, v10);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v23;
  }
  v27 = v26;

  return v27;
}

void sub_1B9D1DEB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id idealDisplayName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  int v7;
  _BOOL8 v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    if (v6 >= 3 && objc_msgSend(v5, "characterAtIndex:", 0) == 60)
    {
      v7 = objc_msgSend(v5, "characterAtIndex:", v6 - 1);
      v8 = v7 == 62;
      if (v7 == 62)
        v6 -= 2;
    }
    else
    {
      v8 = 0;
    }
    if (!objc_msgSend(v5, "compare:options:range:", v3, 9, v8, v6))
    {

      v5 = 0;
    }
  }

  return v5;
}

void sub_1B9D1E04C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id MSPreferredCompositeNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  char v25;
  id v26;
  void *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  idealDisplayName(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v10, "length") && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    MSDescriptorForRequiredKeysForCompositeName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
    {
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v12);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    v29[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v17, (void *)*MEMORY[0x1E0C966A8], v13, v15, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      preferredCompositeNameForUnifiedContact(v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (void *)v19;
      else
        v21 = v13;
      v22 = v21;

      if (a5)
        *a5 = objc_retainAutorelease(v18);
    }
    else
    {
      v22 = v13;
    }

  }
  else
  {
    v22 = v13;
  }
  v23 = v10;
  if (v22
    && (v24 = objc_msgSend(v22, "containsString:", CFSTR("@")), v23 = v22, v24)
    && (v25 = objc_msgSend(v22, "isEqualToString:", v10), v23 = v22, (v25 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v22, v10);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v23;
  }
  v27 = v26;

  return v27;
}

void sub_1B9D1E27C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id MSDescriptorForRequiredKeysForCompositeName()
{
  void *v0;
  void *v1;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0C967A0];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1B9D1E374(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id preferredCompositeNameForUnifiedContact(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shortNameFormatPrefersNicknames"))
  {
    objc_msgSend(v1, "nickname");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v1, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }

  return v3;
}

void sub_1B9D1E42C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MSPreferredCompositeNameForContact(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[32];
  void *v35;
  _QWORD v36[13];

  v36[11] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v4)
  {
    MSDescriptorForRequiredKeysForCompositeName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateForContactsWithIdentifiers:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      fetchContactsForPredicate(v3, v9, v5, 1, &v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v30;
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        contactsUtilsLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "ef_publicDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          MSPreferredCompositeNameForContact_cold_1((uint64_t)v4, v14, buf, v13);
        }

      }
    }
    else
    {
      v12 = 0;
    }
    if (v12)
      v16 = v12;
    else
      v16 = v4;
    v17 = v16;
    if ((objc_msgSend(v17, "areKeysAvailable:", v5) & 1) == 0)
    {
      v18 = v17;
      v19 = *MEMORY[0x1E0C966D0];
      v36[0] = *MEMORY[0x1E0C96790];
      v36[1] = v19;
      v20 = *MEMORY[0x1E0C966C0];
      v36[2] = *MEMORY[0x1E0C96780];
      v36[3] = v20;
      v21 = *MEMORY[0x1E0C967D8];
      v36[4] = *MEMORY[0x1E0C96798];
      v36[5] = v21;
      v22 = *MEMORY[0x1E0C967D0];
      v36[6] = *MEMORY[0x1E0C967E0];
      v36[7] = v22;
      v23 = *MEMORY[0x1E0C967B8];
      v36[8] = *MEMORY[0x1E0C967A0];
      v36[9] = v23;
      v36[10] = *MEMORY[0x1E0C966A8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0C97360]);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __fallbackContactForMissingContactRequiringKeys_block_invoke;
      v31[3] = &unk_1E716DC90;
      v26 = v18;
      v32 = v26;
      v27 = v25;
      v33 = v27;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v31);
      v28 = v33;
      v17 = v27;

    }
    preferredCompositeNameForUnifiedContact(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_1B9D1E758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id contactsUtilsLog()
{
  if (contactsUtilsLog_onceToken != -1)
    dispatch_once(&contactsUtilsLog_onceToken, &__block_literal_global_44);
  return (id)contactsUtilsLog_log;
}

void sub_1B9D1E8E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D1EADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t __fetchContactsForPredicate_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForContactsMatchingPhoneNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1B9D1EC10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if (v5)
    v6 = objc_msgSend(v4, "hasPrefix:", v5);
  else
    v6 = 0;

  return v6;
}

void sub_1B9D1EC7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v3);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "namePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "namePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);

  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "middleName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "middleName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

  v14 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "familyName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "familyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);

  v17 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "nameSuffix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "nameSuffix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = (*(uint64_t (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v19);

  v20 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "organizationName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v21, *(_QWORD *)(a1 + 48));

  return v4
       + v5
       + v8
       + v11
       + v14
       + v17
       + a1;
}

void sub_1B9D1EE88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __contactsUtilsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MSContactsUtils");
  v1 = (void *)contactsUtilsLog_log;
  contactsUtilsLog_log = (uint64_t)v0;

}

void __fallbackContactForMissingContactRequiringKeys_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:"))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, v5);

  }
}

void sub_1B9D1EFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D1F104(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D1F1B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D1F220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D1F344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D1F3D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D1F490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D1F598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B9D1F78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D1F8E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D1FA20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D1FAC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D1FCD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D1FD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D1FEA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D1FF80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D1FFE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D200BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D201A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D203E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B9D20490(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D204F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D208A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B9D20A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1B9D20B18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D20BBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D20C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D20DE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D20FA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D2113C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B9D21478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Unwind_Resume(a1);
}

void sub_1B9D21824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B9D21A6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D21E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D21F04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D21F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D22010(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MSMailComposeWindowTargetContentIdentifierWithIdentifier(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.mail.compose"), a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B9D220F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D22168(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D222A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D22380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D22458(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D227A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D2291C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D22B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1B9D22C6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D22D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D22E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D23164(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D232B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D23628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D23878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B9D23974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D23A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B9D23B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B9D23C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D23CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D23DC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D23EE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1B9D23FA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2402C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D2411C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9D241F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D242CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D244F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void __getPARSessionConfigurationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreParsecLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PARSessionConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPARSessionConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPARSessionConfigurationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MSParsecSearchSession.m"), 27, CFSTR("Unable to find class %s"), "PARSessionConfiguration");

    __break(1u);
  }
}

void sub_1B9D24710(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CoreParsecLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!CoreParsecLibraryCore_frameworkLibrary)
    CoreParsecLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreParsecLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreParsecLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("MSParsecSearchSession.m"), 26, CFSTR("%s"), 0);

    __break(1u);
    free(v1);
  }
}

void sub_1B9D24830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void __getPARSessionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreParsecLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PARSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPARSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPARSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MSParsecSearchSession.m"), 28, CFSTR("Unable to find class %s"), "PARSession");

    __break(1u);
  }
}

void sub_1B9D24918(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D24A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D24AFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B9D24C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D24DF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D257E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1B9D26170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v40 = v39;

  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B9D26438(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D26538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D2659C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D2661C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2671C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D267B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D26964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v19 = v16;

  _Unwind_Resume(a1);
}

void sub_1B9D26A84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D26B64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D26E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B9D26F88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D26FF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D270B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D271C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B9D27298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D27340(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D273DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D27490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D27548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D27640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D27710(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D277E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D27884(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2799C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D27A1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D27AB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D27BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D27DE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D27EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D27F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D28004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D281B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B9D282D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

Class initUIAlertController()
{
  Class result;

  if (LoadUIKit_loadPredicate != -1)
    dispatch_once(&LoadUIKit_loadPredicate, &__block_literal_global_73);
  result = objc_getClass("UIAlertController");
  classUIAlertController = (uint64_t)result;
  getUIAlertControllerClass[0] = (uint64_t (*)())UIAlertControllerFunction;
  return result;
}

id UIAlertControllerFunction()
{
  return (id)classUIAlertController;
}

Class initUIAlertAction()
{
  Class result;

  if (LoadUIKit_loadPredicate != -1)
    dispatch_once(&LoadUIKit_loadPredicate, &__block_literal_global_73);
  result = objc_getClass("UIAlertAction");
  classUIAlertAction = (uint64_t)result;
  getUIAlertActionClass[0] = (uint64_t (*)())UIAlertActionFunction;
  return result;
}

id UIAlertActionFunction()
{
  return (id)classUIAlertAction;
}

Class initUIApplication()
{
  Class result;

  if (LoadUIKit_loadPredicate != -1)
    dispatch_once(&LoadUIKit_loadPredicate, &__block_literal_global_73);
  result = objc_getClass("UIApplication");
  classUIApplication = (uint64_t)result;
  getUIApplicationClass[0] = (uint64_t (*)())UIApplicationFunction;
  return result;
}

id UIApplicationFunction()
{
  return (id)classUIApplication;
}

void sub_1B9D28660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B9D288D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D28928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D28E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B9D290B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Class initUIApplication_0()
{
  Class result;

  if (LoadUIKit_loadPredicate_0 != -1)
    dispatch_once(&LoadUIKit_loadPredicate_0, &__block_literal_global_8);
  result = objc_getClass("UIApplication");
  classUIApplication_0 = (uint64_t)result;
  getUIApplicationClass_0 = (uint64_t (*)())UIApplicationFunction_0;
  return result;
}

id UIApplicationFunction_0()
{
  return (id)classUIApplication_0;
}

void sub_1B9D29324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D293E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D294DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2955C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D295BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D29678(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D29734(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D2995C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B9D29DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, id a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B9D29FEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D2A054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D2A308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B9D2A3A8()
{
  JUMPOUT(0x1B9D2A394);
}

void sub_1B9D2A414(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D2A654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2A76C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D2A8C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B9D2AB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  _Unwind_Resume(a1);
}

void sub_1B9D2ABB4()
{
  JUMPOUT(0x1B9D2AB9CLL);
}

void sub_1B9D2ABBC()
{
  JUMPOUT(0x1B9D2ABA4);
}

void sub_1B9D2AC9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B9D2AD60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2AEE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D2B02C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2B138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D2B330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t SGAppCanShowSiriSuggestions(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", v1) ^ 1;

  return v3;
}

void sub_1B9D2B3AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

const __CFString *NSStringFromMSDeleteOrArchive(unint64_t a1)
{
  if (a1 > 2)
    return &stru_1E7171180;
  else
    return off_1E716E418[a1];
}

uint64_t _MSSourceTypeIsValid(unint64_t a1)
{
  if (a1 > 0x19)
    return 0;
  if (((1 << a1) & 0x28081FF) != 0)
    return 1;
  if (((1 << a1) & 0x7F0000) != 0)
    return objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 9);
  else
    return 0;
}

void sub_1B9D2B54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D2B66C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D2B794(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D2B8F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D2B9B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9D2BA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B9D2BCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B9D2BDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9D2BF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1B9D2C134(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2C218(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t MSTriageChangeActionTypeAllowsGroupedSender(unint64_t a1)
{
  return (a1 < 0xA) & (0x304u >> a1);
}

BOOL MSTriageChangeActionTypeAllowsGroupedSenderBulkAction(uint64_t a1)
{
  return a1 == 2;
}

void sub_1B9D2C3D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9D2C490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9D2C680(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9D2C798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const char *MailFeatureFlag.domain.getter()
{
  return "Mail";
}

uint64_t MailFeatureFlag.feature.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_1B9D2C7F0 + 4 * byte_1B9D34D70[*v0]))("Shoji", 5);
}

const char *sub_1B9D2C7F0()
{
  return "BlackPearl";
}

const char *sub_1B9D2C858()
{
  return "CatchUp";
}

const char *sub_1B9D2C86C()
{
  return "CatchUpManualSummarization";
}

uint64_t MailFeatureFlag.isEnabled.getter()
{
  char *v0;
  char v1;
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *v0;
  v5 = &type metadata for MailFeatureFlag;
  v6 = sub_1B9D2C8D4();
  v4[0] = v1;
  v2 = sub_1B9D2CFEC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_1B9D2C8D4()
{
  unint64_t result;

  result = qword_1ED37D500;
  if (!qword_1ED37D500)
  {
    result = MEMORY[0x1BCCCD0FC](&protocol conformance descriptor for MailFeatureFlag, &type metadata for MailFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_1ED37D500);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t MailFeatureFlag.isGenerativeFeatureAvailable.getter()
{
  return sub_1B9D2C950(MEMORY[0x1E0D1DC60]);
}

uint64_t MailFeatureFlag.isGenerativeFeatureEnabled.getter()
{
  return sub_1B9D2C950(MEMORY[0x1E0D1DC68]);
}

uint64_t sub_1B9D2C950(uint64_t (*a1)(uint64_t))
{
  char *v1;
  char v3;
  char v4;
  uint64_t v5;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;

  v3 = *v1;
  v8 = &type metadata for MailFeatureFlag;
  v9 = sub_1B9D2C8D4();
  v7[0] = v3;
  v4 = sub_1B9D2CFEC();
  v5 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if ((v4 & 1) != 0)
    return a1(v5);
  else
    return 0;
}

BOOL static MailFeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MailFeatureFlag.hash(into:)()
{
  return sub_1B9D2D004();
}

uint64_t MailFeatureFlag.hashValue.getter()
{
  sub_1B9D2CFF8();
  sub_1B9D2D004();
  return sub_1B9D2D010();
}

BOOL sub_1B9D2CA34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B9D2CA48()
{
  sub_1B9D2CFF8();
  sub_1B9D2D004();
  return sub_1B9D2D010();
}

uint64_t sub_1B9D2CA8C()
{
  return sub_1B9D2D004();
}

uint64_t sub_1B9D2CAB4()
{
  sub_1B9D2CFF8();
  sub_1B9D2D004();
  return sub_1B9D2D010();
}

unint64_t sub_1B9D2CAF8()
{
  unint64_t result;

  result = qword_1EF240970;
  if (!qword_1EF240970)
  {
    result = MEMORY[0x1BCCCD0FC](&protocol conformance descriptor for MailFeatureFlag, &type metadata for MailFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_1EF240970);
  }
  return result;
}

const char *sub_1B9D2CB3C()
{
  return "Mail";
}

uint64_t sub_1B9D2CB50()
{
  return MailFeatureFlag.feature.getter();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MailFeatureFlag(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MailFeatureFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_1B9D2CC54 + 4 * byte_1B9D34D7E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1B9D2CC88 + 4 * byte_1B9D34D79[v4]))();
}

uint64_t sub_1B9D2CC88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9D2CC90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B9D2CC98);
  return result;
}

uint64_t sub_1B9D2CCA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9D2CCACLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1B9D2CCB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9D2CCB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9D2CCC4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B9D2CCD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MailFeatureFlag()
{
  return &type metadata for MailFeatureFlag;
}

void MSPreferredCompositeNameForContact_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B9D1A000, log, OS_LOG_TYPE_ERROR, "Error re-fetching contact matching contact %@, error: %{public}@", buf, 0x16u);

}

uint64_t sub_1B9D2CFEC()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1B9D2CFF8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B9D2D004()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B9D2D010()
{
  return MEMORY[0x1E0DEDF40]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995C8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1E0D1EDC8]();
}

uint64_t EFStringsAreEqual()
{
  return MEMORY[0x1E0D1EE48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1E0D1F0A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

