id MFPreferredCompositeNameForPerson(const void *a1)
{
  return _MFPreferredCompositeNameForPerson(a1, 0);
}

void sub_1AB96D9EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __bundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bundle_bundle;
  bundle_bundle = v0;

}

void sub_1AB96DCF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB96DE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB96DF20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id MFPreferredCompositeNameForAddressAndDisplayName(const void *a1, void *a2, void *a3, CFTypeRef *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  char v19;
  id v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  _idealDisplayName(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a1)
    goto LABEL_9;
  if (!objc_msgSend(v7, "length"))
    goto LABEL_9;
  objc_msgSend(v7, "emailAddressValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(a1, v11, *MEMORY[0x1E0CF5F98], v9);

  if (v12)
  {
    _MFPreferredCompositeNameForPerson(v12, a4);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v9;
    v16 = v15;

    CFRelease(v12);
  }
  else
  {
LABEL_9:
    v16 = v9;
  }
  v17 = v7;
  if (v16
    && (v18 = objc_msgSend(v16, "containsString:", CFSTR("@")), v17 = v16, v18)
    && (v19 = objc_msgSend(v16, "isEqualToString:", v7), v17 = v16, (v19 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v16, v7);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v17;
  }
  v21 = v20;

  return v21;
}

void sub_1AB96E1A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _MFPreferredCompositeNameForPerson(const void *a1, CFTypeRef *a2)
{
  const void *v4;
  uint64_t v5;
  void *v6;

  v4 = (const void *)ABPersonCopyPreferredLinkedPersonForName();
  if (!v4)
    v4 = CFRetain(a1);
  if (ABPersonGetShortNamePreferNicknames()
    && (v5 = (uint64_t)ABRecordCopyValue(v4, *MEMORY[0x1E0CF6120])) != 0
    || (v5 = ABPersonCopyCompositeName()) != 0)
  {
    v6 = (void *)v5;
    if (!a2)
      goto LABEL_10;
    goto LABEL_9;
  }
  v6 = 0;
  if (a2)
LABEL_9:
    *a2 = CFRetain(v4);
LABEL_10:
  CFRelease(v4);
  return v6;
}

void sub_1AB96E280(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB96E3B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB96E854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
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

void sub_1AB96E9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB96EA64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB96EC5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB96EF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

double MFIntegralRectToViewScale(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  UIRoundToViewScale();
  v3 = v2;
  UIRoundToViewScale();

  return v3;
}

void sub_1AB96EFEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB96F0C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB96F1D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB96F20C()
{
  JUMPOUT(0x1AB96F200);
}

void sub_1AB96F2A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB96F4C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB96F64C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

NSString *MFUIContentSizeCategoryMin(void *a1, void *a2)
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v3 = a1;
  v4 = a2;
  if (UIContentSizeCategoryCompareToCategory(v3, v4) == NSOrderedAscending)
    v5 = v3;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

void sub_1AB96F6D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id MFPreferredAbbreviatedNameForAddressAndDisplayName(const void *a1, void *a2, void *a3, CFTypeRef *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  char v26;
  id v27;
  void *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  _idealDisplayName(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1)
  {
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v7, "emailAddressValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v30[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(a1, v11, *MEMORY[0x1E0CF5F98], v9);

        if (v12)
          goto LABEL_9;
        objc_msgSend(v9, "ec_personNameComponents");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "givenName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else
        {
          objc_msgSend(v13, "familyName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (v16)
          {

            goto LABEL_17;
          }
        }
        v12 = ABPersonCreate();
        objc_msgSend(v13, "namePrefix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ABRecordSetValue(v12, *MEMORY[0x1E0CF61D8], v17, 0);

        objc_msgSend(v13, "givenName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        ABRecordSetValue(v12, *MEMORY[0x1E0CF5FD8], v18, 0);

        objc_msgSend(v13, "middleName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ABRecordSetValue(v12, *MEMORY[0x1E0CF6108], v19, 0);

        objc_msgSend(v13, "familyName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ABRecordSetValue(v12, *MEMORY[0x1E0CF60D0], v20, 0);

        objc_msgSend(v13, "nameSuffix");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ABRecordSetValue(v12, *MEMORY[0x1E0CF6280], v21, 0);

        if (v12)
        {
LABEL_9:
          v22 = (const void *)ABPersonCopyPreferredLinkedPersonForName();
          if (!v22)
            v22 = CFRetain(v12);
          v23 = ABPersonCopyShortName();
          if (v23 || (v23 = ABPersonCopyCompositeName()) != 0)
          {

            v9 = (void *)v23;
          }
          if (a4)
            *a4 = CFRetain(v22);
          CFRelease(v12);
          CFRelease(v22);
        }
      }
    }
  }
LABEL_17:
  v24 = v7;
  if (v9
    && (v25 = objc_msgSend(v9, "containsString:", CFSTR("@")), v24 = v9, v25)
    && (v26 = objc_msgSend(v9, "isEqualToString:", v7), v24 = v9, (v26 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v9, v7);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = v24;
  }
  v28 = v27;

  return v28;
}

void sub_1AB96FA10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _idealDisplayName(void *a1, void *a2)
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

void sub_1AB96FB48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(const void *a1, void *a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  const __CFArray *v12;
  CFIndex Count;
  CFIndex j;
  ABRecordID ValueAtIndex;
  ABRecordRef PersonWithRecordID;
  uint64_t v17;
  void *v18;
  _MFCountableMatchesContext *v19;
  id v20;
  void *v21;
  id v23;
  id v24;
  int v25;
  id obj;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  CFTypeRef v31;
  CFTypeRef cf;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v23 = a4;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_27;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v24;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v8)
    goto LABEL_20;
  v9 = *(_QWORD *)v34;
  v10 = *MEMORY[0x1E0CF5F98];
  v25 = *MEMORY[0x1E0CF61A0];
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(obj);
      if (v10 == a3)
      {
        v31 = 0;
        cf = 0;
        v12 = (const __CFArray *)ABAddressBookCopyArrayOfUIDsMatchingEmailAddress();
        if (!v12)
          continue;
      }
      else
      {
        if (v25 != a3)
          continue;
        v12 = (const __CFArray *)ABAddressBookCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint();
        if (!v12)
          continue;
      }
      Count = CFArrayGetCount(v12);
      if (Count >= 1)
      {
        for (j = 0; j != Count; ++j)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v12, j);
          PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a1, ValueAtIndex);
          if (PersonWithRecordID)
            objc_msgSend(v7, "addObject:", PersonWithRecordID);
        }
      }
      CFRelease(v12);
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v8);
LABEL_20:

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "anyObject");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v23, "ec_personNameComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(_MFCountableMatchesContext);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName_block_invoke;
    v27[3] = &unk_1E5A654C8;
    v28 = v7;
    v20 = v18;
    v29 = v20;
    v30 = v23;
    -[_MFCountableMatchesContext countInstances:usingPredicate:](v19, "countInstances:usingPredicate:", v28, v27);
    -[_MFCountableMatchesContext highestMatches](v19, "highestMatches");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "anyObject");
    v17 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

LABEL_27:
  return v17;
}

void sub_1AB96FE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1AB96FFB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB970014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_MFCountableMatchesContext;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9701CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB970380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _personPropertyHasPrefix(const void *a1, ABPropertyID a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)ABRecordCopyValue(a1, a2);
    v7 = objc_msgSend(v6, "hasPrefix:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1AB970408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9704B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void MFInitializeAddressBookConstants()
{
  if (MFInitializeAddressBookConstants_onceToken != -1)
    dispatch_once(&MFInitializeAddressBookConstants_onceToken, &__block_literal_global);
}

void sub_1AB9705D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9706AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB970780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB97093C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9709E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB970B74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB970C24(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1AB970C78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB970CCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB970D48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB970DF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB970EFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB970F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFComposeActivityHandoffOperation;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9712B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97132C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB971568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB971634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9716AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9717F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB971B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB971C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB971F2C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1AB972074(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9720D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB972154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9723A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1AB9728A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9729BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB972A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB972AD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB972C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFAddressBookManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

uint64_t _AddressBookEventHandler(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_handleAddressBookChangeNotification");
}

uint64_t _addressBookPreferencesChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleAddressBookPrefsChangeNotification");
}

void sub_1AB972DF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB972F04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB972F70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB973078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB97313C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB973228(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB973270(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB973474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9736B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9738D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB973B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1AB973DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB973FD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB974190(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9742BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB974450(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9744FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1AB974584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97466C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97471C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB974780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9747D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB974824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB974B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB974CAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB974D14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB974E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB974EE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB974F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFAlertOverlayController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB97510C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9751F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB975254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9752C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB975468(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB975600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9757C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1AB975988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB975D60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB975E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFAtomTextView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB976028(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB976198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB976264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97638C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB976404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB976574(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB976634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB976838(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9769A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB976A0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB976C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,uint64_t a25,char a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1AB976D38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB976E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9770DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB977198(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB977348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB977508(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB977640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9777DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB977884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB977930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB977B10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB977C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB977D70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB977E2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB977F2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97812C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB978578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB978760(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9789B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB978B38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB978EE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB978FB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9790AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB979120(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9792D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97940C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB979514(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9795A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97988C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB979AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB97A0E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

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

void sub_1AB97A378(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97A50C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97A5E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97A718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB97A7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97A964(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97AB44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97ABF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97ACE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97AFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1AB97B234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB97B39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97B5A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB97B818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1AB97B954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1AB97BAC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB97BEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB97C0D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97C194(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97C234(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97C364(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97C774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB97C80C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97C858(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97C900(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97CA0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97CABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB97CB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AB97CC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB97CE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1AB97CF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97D244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB97D35C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97D3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97D598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97D61C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97D6FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97D74C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97D798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97D7F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97DA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1AB97DCAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97DD54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97DE1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97DF34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97E03C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB97E0EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _MFShowAttachmentMarkup(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<div style=\"border:1px solid black;\">%@<div style=\"background:yellow;\"><xmp>%@</xmp></div></div>"),
    a1,
    a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t MFContentTypeIsPlainText(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC610]))
    v2 = objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC518]) ^ 1;
  else
    v2 = 0;

  return v2;
}

void sub_1AB97E1B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97E2A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97E390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97E468(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97E51C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97E670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB97E7C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97E8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB97EA64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97EB9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97ED1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97ED90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97EF90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97F050(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97F094(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97F194(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97F200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97F330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB97F484(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97F648(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97F6A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB97F700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB97F7D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB97FF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1AB9803C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB980498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB980508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB980558(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB980620(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB980698(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB980764(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9807C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB980940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB980AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB980D44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB980F34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v7;

  _Unwind_Resume(a1);
}

void sub_1AB98128C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB981828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB981AA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB981B68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB981C54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB981CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFWebKitMainThread;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB981D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB981E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

id initQLTypeCopyUTIForURLAndMimeType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a1;
  v4 = a2;
  if (LoadQuickLook_loadPredicate != -1)
    dispatch_once(&LoadQuickLook_loadPredicate, &__block_literal_global_272);
  softLinkQLTypeCopyUTIForURLAndMimeType = (uint64_t (*)())dlsym((void *)LoadQuickLook_frameworkLibrary, "QLTypeCopyUTIForURLAndMimeType");
  ((void (*)(id, id))softLinkQLTypeCopyUTIForURLAndMimeType)(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1AB981F40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t initQLPreviewControllerSupportsContentType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (LoadQuickLook_loadPredicate != -1)
    dispatch_once(&LoadQuickLook_loadPredicate, &__block_literal_global_272);
  softLinkQLPreviewControllerSupportsContentType = (uint64_t (*)())dlsym((void *)LoadQuickLook_frameworkLibrary, "QLPreviewControllerSupportsContentType");
  v2 = ((uint64_t (*)(id))softLinkQLPreviewControllerSupportsContentType)(v1);

  return v2;
}

void sub_1AB982008(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _DataConsumerPutBytesCallback(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0);
  v7 = objc_msgSend(v5, "appendData:", v6);
  v8 = v7 & ~(v7 >> 63);

  return v8;
}

void sub_1AB982084(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

Class initPKPass()
{
  Class result;

  if (LoadPassKit_loadPredicate != -1)
    dispatch_once(&LoadPassKit_loadPredicate, &__block_literal_global_281);
  result = objc_getClass("PKPass");
  classPKPass = (uint64_t)result;
  getPKPassClass[0] = (uint64_t (*)())PKPassFunction;
  return result;
}

id PKPassFunction()
{
  return (id)classPKPass;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_1AB982230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB982358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9825A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB982958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB982A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB982AB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB982B50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB982BEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB982D30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Class initPKPassView()
{
  Class result;

  if (LoadPassKitUI_loadPredicate != -1)
    dispatch_once(&LoadPassKitUI_loadPredicate, &__block_literal_global_4);
  result = objc_getClass("PKPassView");
  classPKPassView = (uint64_t)result;
  getPKPassViewClass[0] = (uint64_t (*)())PKPassViewFunction;
  return result;
}

id PKPassViewFunction()
{
  return (id)classPKPassView;
}

void sub_1AB982F54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB983010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  if (v10)

  _Unwind_Resume(a1);
}

void sub_1AB9830DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  if (v10)

  _Unwind_Resume(a1);
}

void sub_1AB98316C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB983218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB98331C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB983570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB983650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB983798(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9838B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9839D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB983AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB983C00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB983C68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB983E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB983F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1AB983F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB98400C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9840E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98417C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB984398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB98448C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFAutocompleteResultsTableViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB984578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB984678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB984930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB984C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB984E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1AB984EC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB984FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB985110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9851B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB985214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB985378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB985428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9854F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB98555C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB985670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  uint64_t v10;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 64), 8);

  _Unwind_Resume(a1);
}

void sub_1AB985724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9857B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB985888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9859F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB985ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB985B50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB985E78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB985F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB985FE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB986034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9861D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9862DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB986368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9865B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB986670(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB986898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB986940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9869B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB986B3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB986D14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB986DA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB986E60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB986F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB986FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB987028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98709C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB987110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB987184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98754C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t i;

  for (i = 32; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AB9875F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB987988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15)
{

  _Unwind_Resume(a1);
}

void sub_1AB987B10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB987B94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB987C1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB987C7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB987CDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB987D64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB987DC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB987E3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB987EFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB988094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB988340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB988514(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9885C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9886D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB988718()
{
  JUMPOUT(0x1AB98870CLL);
}

void sub_1AB9888E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB988CA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB988D78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB988F98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB98903C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB989198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

uint64_t MFFloatToCSSPixelString(double a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), *(_QWORD *)&a1);
}

id MFCSSLinkColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MFCSSColorFromUIColor(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1AB9892C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MFCSSColorFromUIColor(void *a1)
{
  id v1;
  void *v2;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  v1 = a1;
  v6 = NAN;
  v7 = NAN;
  v4 = -1;
  v5 = NAN;
  objc_msgSend(v1, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%d,%d,%d,%f)"), (int)(v7 * 255.0), (int)(v6 * 255.0), (int)(v5 * 255.0), v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1AB989378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MFUserStyleSheetDictionary(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t block;
  uint64_t v66;
  void (*v67)(void **);
  void *v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[4];
  _QWORD v75[4];
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  _QWORD v80[5];
  _QWORD v81[5];
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelOne");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelTwo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailQuoteColorLevelThree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    block = MEMORY[0x1E0C809B0];
    v66 = 3221225472;
    v67 = __QuotingColorList_block_invoke;
    v68 = &unk_1E5A65BD8;
    v69 = v1;
    v70 = v2;
    v71 = v3;
    if (QuotingColorList_onceToken != -1)
      dispatch_once(&QuotingColorList_onceToken, &block);
    v4 = &QuotingColorList_darkerQuotingColorCSS;
  }
  else
  {
    block = MEMORY[0x1E0C809B0];
    v66 = 3221225472;
    v67 = __QuotingColorList_block_invoke_2;
    v68 = &unk_1E5A65BD8;
    v69 = v1;
    v70 = v2;
    v71 = v3;
    if (QuotingColorList_onceToken_383 != -1)
      dispatch_once(&QuotingColorList_onceToken_383, &block);
    v4 = &QuotingColorList_defaultQuotingColorCSS;
  }
  v5 = (id)*v4;

  v57 = v5;
  v55 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      do
      {
        objc_msgSend(v56, "appendString:", CFSTR("BLOCKQUOTE "));
        --v8;
      }
      while (v8);
      objc_msgSend(v59, "setObject:forKeyedSubscript:", &unk_1E5A9FA58, v56);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v9 = objc_msgSend(&unk_1E5A9FF80, "countByEnumeratingWithState:objects:count:", &v61, v88, 16);
      if (v9)
      {
        v58 = *(_QWORD *)v62;
        do
        {
          v60 = v9;
          for (i = 0; i != v60; ++i)
          {
            if (*(_QWORD *)v62 != v58)
              objc_enumerationMutation(&unk_1E5A9FF80);
            v11 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = 0;
            do
            {
              if (v13 >= v6)
                objc_msgSend(v12, "appendFormat:", CFSTR("BLOCKQUOTE[%@] "), v11);
              else
                objc_msgSend(v12, "appendString:", CFSTR("BLOCKQUOTE "));
              ++v13;
            }
            while (v7 != v13);
            objc_msgSend(v57, "objectAtIndex:", v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1.0px solid %@ !important"), v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ !important"), v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v86[0] = CFSTR("color");
            v86[1] = CFSTR("border-left");
            v87[0] = v16;
            v87[1] = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v17, v12);

          }
          v9 = objc_msgSend(&unk_1E5A9FF80, "countByEnumeratingWithState:objects:count:", &v61, v88, 16);
        }
        while (v9);
      }

      ++v6;
      ++v7;
    }
    while (v6 != v55);
  }
  objc_msgSend(v54, "addEntriesFromDictionary:", v59);
  objc_msgSend(v53, "addEntriesFromDictionary:", &unk_1E5A9FBC0);
  objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FBE8, CFSTR("HTML"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FC10, CFSTR("._AppleShowQuotedContentButton"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FC38, CFSTR("._AppleShowQuotedContentButton .button"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a1)
  {
    case 0:
    case 4:
      v84 = CFSTR("color-scheme");
      v85 = CFSTR("light dark");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v21, CFSTR(":root:not(.testing-dark-mode)"));

      v82 = CFSTR("background-color");
      v83 = CFSTR("-apple-system-secondary-grouped-background");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v22, CFSTR(":root"));

      objc_msgSend(v20, "_bodyLeading");
      v24 = v23;
      objc_msgSend(v20, "lineHeight");
      v26 = v25;
      objc_msgSend(v20, "leading");
      v81[0] = CFSTR("0");
      v80[0] = CFSTR("margin");
      v80[1] = CFSTR("padding-top");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), round(-(v26 - v27 - v24 * 1.45454545)));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = v28;
      v80[2] = CFSTR("padding-left");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), 0x4030000000000000);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v81[2] = v29;
      v80[3] = CFSTR("padding-right");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), 0x4030000000000000);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v81[3] = v30;
      v80[4] = CFSTR("padding-bottom");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), 0x4035000000000000);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v81[4] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addEntriesFromDictionary:", v32);
      v33 = *MEMORY[0x1E0D1DC98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), *MEMORY[0x1E0D1DC98]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FC88, v34);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BLOCKQUOTE .%@"), v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FCB0, v35);
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FCD8, CFSTR(".x-apple-edge-to-edge"));
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FD00, CFSTR(".x-apple-edge-to-edge + .x-apple-edge-to-edge"));
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FD28, CFSTR(".x-apple-wide-margin-edge-to-edge"));
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FD50, CFSTR(".x-apple-wide-margin-edge-to-edge + .x-apple-wide-margin-edge-to-edge"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("3px"), CFSTR("margin"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("inline-block"), CFSTR("display"));
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v36, CFSTR("*"));
      objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("initial !important"), CFSTR("-webkit-user-modify"));
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = UIContentSizeCategoryIsAccessibilityCategory(v37);

      if ((_DWORD)v31)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("initial !important"), CFSTR("-webkit-text-size-adjust"));

      goto LABEL_39;
    case 1:
    case 2:
      if (a1 == 2)
      {
        v78 = CFSTR("color-scheme");
        v79 = CFSTR("light dark");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v38, CFSTR(":root:not(.testing-dark-mode)"));

        v76 = CFSTR("background-color");
        v77 = CFSTR("-apple-system-secondary-grouped-background");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v39, CFSTR(":root"));

      }
      else
      {
        objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FD78, CFSTR(":root"));
      }
      objc_msgSend(v53, "addEntriesFromDictionary:", &unk_1E5A9FDF0);
      v40 = 0.0;
      v41 = 0.0;
      v42 = 0.0;
      if (a1 != 2)
      {
        v43 = objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad", 0.0);
        v40 = 6.0;
        if (v43)
        {
          v40 = 10.0;
          v42 = 20.0;
        }
        else
        {
          v42 = 16.0;
        }
        v41 = 5.0;
      }
      v74[0] = CFSTR("padding-top");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), *(_QWORD *)&v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v44;
      v74[1] = CFSTR("padding-left");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), *(_QWORD *)&v42);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v45;
      v74[2] = CFSTR("padding-right");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), *(_QWORD *)&v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v46;
      v74[3] = CFSTR("padding-bottom");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fpx"), *(_QWORD *)&v41);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addEntriesFromDictionary:", v32);
      objc_msgSend(v18, "addEntriesFromDictionary:", &unk_1E5A9FE18);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IMG.%@, img:-apple-has-attachment"), 0x1E5A6A6E8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FE40, v34);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), CFSTR("x-apple-drop-placeholder"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FE68, v35);
LABEL_39:

      break;
    case 3:
      objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FC60, CFSTR("*"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("8px 0 0 0"), CFSTR("padding"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("margin"));
      break;
    default:
      break;
  }
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("@media (prefers-color-scheme: dark)"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("break-word"), CFSTR("word-wrap"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("break-word"), CFSTR("word-break"));
  if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
    v48 = CFSTR("-apple-system-tall-body");
  else
    v48 = CFSTR("-apple-system-body");
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v48, CFSTR("font"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v18, CFSTR("BODY"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v19, CFSTR("ATTACHMENT"));
  v72[0] = CFSTR("color");
  MFCSSLinkColor();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = CFSTR("word-break");
  v73[0] = v49;
  v73[1] = CFSTR("break-word");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v50, CFSTR("A"));

  if (a1 != 1)
  {
    objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FE90, CFSTR(":root.apple-mail-light-only:not(.testing-dark-mode)"));
    objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FEB8, CFSTR(":root.apple-mail-implicit-dark-support:not(.testing-dark-mode)"));
    objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FEE0, CFSTR("HTML, BODY"));
  }
  objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FF08, CFSTR("TABLE"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5A9FF30, CFSTR("PRE"));

  return v54;
}

void sub_1AB98A064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

id MFUserStyleSheetCSS(uint64_t a1)
{
  void *v1;
  void *v2;

  MFUserStyleSheetDictionary(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MFCSSStringFromDictionary(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1AB98A2F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MFCSSStringFromDictionary(void *a1)
{
  id v1;
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __MFCSSStringFromDictionary_block_invoke;
  v5[3] = &unk_1E5A65BB0;
  v3 = v2;
  v6 = v3;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

void sub_1AB98A394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB98A4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB98A5CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id RGBColorCSSStringFromUIColor(void *a1)
{
  id v1;
  const CGFloat *Components;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v1 = objc_retainAutorelease(a1);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v1, "CGColor"));
  v3 = "";
  LODWORD(v3) = llround(*Components * 255.0);
  LODWORD(v4) = llround(Components[1] * 255.0);
  LODWORD(v5) = llround(Components[2] * 255.0);
  LODWORD(v6) = llround(Components[3] * 255.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%hhu, %hhu, %hhu, %hhu)"), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_1AB98A690(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98A76C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB98AAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  void *v15;
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

void sub_1AB98AC38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98AC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98AD0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98AE60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB98AFB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98B06C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98B150(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98B614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1AB98B958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98B9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98BA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB98BC50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98BD14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98BDD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98BF70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB98C05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB98C308(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98C41C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98C478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98C68C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB98C898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB98CA4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98CB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98CC28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB98CE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
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

void sub_1AB98D018(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98D150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB98D204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98D2B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98D35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB98D3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB98D454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98D50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AB98D5B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98D668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AB98D70C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98D788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98D8A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98D988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  _Unwind_Resume(a1);
}

void sub_1AB98DA1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98DADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB98DC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98DCAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98DD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB98DE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB98DEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB98DFA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98E0A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98E114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98E1B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98E2C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB98E344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98E3E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98E438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98E680(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98E81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98ED14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98EDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98EE58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98EF38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98F028(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98F134(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98F1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98F254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB98F2F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98F450(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB98F5A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98F740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB98F8A4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  if (v2)

  _Unwind_Resume(a1);
}

void sub_1AB98FB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1AB98FD7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB98FE6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB990204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB990378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9903F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9904A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9904F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9905E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB990664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9906AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9906F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB990808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB990890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9909A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB990A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB990B48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB990BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB990CB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB990F54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9910F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB991240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB991384(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9914A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB991554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AB991628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9916B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB991724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB991A9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB991BE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB991D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB991DE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB991EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

id _ef_log_MFComposePhotoPickerController()
{
  if (_ef_log_MFComposePhotoPickerController_onceToken != -1)
    dispatch_once(&_ef_log_MFComposePhotoPickerController_onceToken, &__block_literal_global_9);
  return (id)_ef_log_MFComposePhotoPickerController_log;
}

void sub_1AB992140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB992374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1AB992684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB99278C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99291C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB992B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB992C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  v24 = v23;

  _Unwind_Resume(a1);
}

void sub_1AB992D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1AB992EBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB993084(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB993344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1AB993528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB99380C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v24 = v23;

  _Unwind_Resume(a1);
}

void sub_1AB99398C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __getPHPickerConfigurationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHPickerConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPickerConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPHPickerConfigurationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MFComposePhotoPickerController.m"), 24, CFSTR("Unable to find class %s"), "PHPickerConfiguration");

    __break(1u);
  }
}

void sub_1AB993B3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void PhotosUILibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotosUILibraryCore_frameworkLibrary)
    PhotosUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotosUILibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("MFComposePhotoPickerController.m"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v1);
  }
}

void sub_1AB993C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void __getPHPickerViewControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHPickerViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPHPickerViewControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MFComposePhotoPickerController.m"), 23, CFSTR("Unable to find class %s"), "PHPickerViewController");

    __break(1u);
  }
}

void sub_1AB993D44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AB993ED8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB993FF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB99424C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB994338(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9943B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB994730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB994920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB994C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB994F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
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

void sub_1AB9950DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB995278(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99537C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB995548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99572C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9958C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t _fastCountOfCompleteMatches(void *a1, void *a2, _QWORD *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = a2;
  v26 = v4;
  v29 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v24;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v30)
    {
      v28 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v32 = v29;
          v8 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v35;
LABEL_9:
            v10 = 0;
            while (1)
            {
              if (*(_QWORD *)v35 != v9)
                objc_enumerationMutation(v32);
              v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
              if (objc_msgSend(v33, "count", v24) == 1)
                break;
              objc_msgSend(v11, "address");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "displayString");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "ea_personNameComponents");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "givenName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v14, "givenName");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "rangeOfString:options:", v7, 1);

                if (!v17)
                  goto LABEL_19;
              }
              if ((objc_msgSend(v14, "familyName"),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    v18,
                    v18)
                && (objc_msgSend(v14, "familyName"),
                    v19 = (void *)objc_claimAutoreleasedReturnValue(),
                    v20 = objc_msgSend(v19, "rangeOfString:options:", v7, 1),
                    v19,
                    !v20)
                || v12 && !objc_msgSend(v12, "rangeOfString:options:", v7, 1))
              {
LABEL_19:
                objc_msgSend(v33, "addObject:", v11);
              }

              if (v8 == ++v10)
              {
                v8 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
                if (v8)
                  goto LABEL_9;
                break;
              }
            }
          }

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v30);
    }

    v21 = objc_retainAutorelease(v33);
    *a3 = v21;
    v22 = objc_msgSend(v21, "count");

  }
  else
  {
    v22 = objc_msgSend(v5, "count");
  }

  return v22;
}

void sub_1AB995C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1AB995E44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _sortedArrayByRelevancy(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  id v46;
  id v47;
  void *v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  char v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  _QWORD *v58;
  void *v60;
  id v61;
  char *__base;
  void *v63;
  unint64_t v64;
  void *v65;
  id obj;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  char v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t *v85;
  _QWORD *v86;
  _QWORD v87[4];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  _BYTE v92[128];
  uint64_t v93;

  v58 = a4;
  v93 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v60 = v5;
  v65 = v6;
  if (!objc_msgSend(v5, "length"))
  {
    v46 = objc_retainAutorelease(v6);
    *a3 = v46;
    *v58 = MEMORY[0x1E0C9AA60];
    v47 = v46;
    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CA6AB8];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = ___sortedArrayByRelevancy_block_invoke;
  v78[3] = &unk_1E5A65FB0;
  v61 = v7;
  v79 = v61;
  objc_msgSend(v8, "enumerateTokensForString:locale:options:withHandler:", v5, 0, 0, v78);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  __base = (char *)malloc_type_calloc(0x18uLL, objc_msgSend(v6, "count"), 0xD6B67E75uLL);
  v9 = 0;
LABEL_3:
  if (v9 < objc_msgSend(v6, "count", v58))
  {
    objc_msgSend(v6, "objectAtIndex:", v9);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "displayString");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "address");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v61;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    v64 = v9;
    if (!v10)
    {
      v73 = 0;
      v11 = -1;
      goto LABEL_47;
    }
    v73 = 0;
    v67 = *(_QWORD *)v75;
    v11 = -1;
    while (1)
    {
      v12 = 0;
      v70 = v10;
      do
      {
        if (*(_QWORD *)v75 != v67)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v12);
        v14 = v69;
        v15 = v13;
        if (!v69)
        {
          v18 = 0;
LABEL_15:

          v72 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_16;
        }
        v17 = objc_msgSend(v14, "rangeOfString:options:", v15, 385);
        v18 = v17 == 0;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_15;
        v19 = v16;

        v72 = 0x7FFFFFFFFFFFFFFFLL;
        if (v17 - v19 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_17;
        v72 = v17 - v19 + 15;
        if (v17)
        {
          v18 = 0;
          v73 |= v17 == 0;
          goto LABEL_17;
        }
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
        objc_msgSend(v14, "addAttribute:value:range:", CFSTR("MFComposeRecipientStringMatchType"), CFSTR("MFComposeRecipientStringMatchAddress"), 0, v19);
        objc_msgSend(v71, "addObject:", v14);
        v18 = 1;
        v73 = 1;
LABEL_16:

LABEL_17:
        v20 = v68;
        v21 = v15;
        if (objc_msgSend(v21, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = 0;
          v89 = &v88;
          v90 = 0x2020000000;
          v91 = 0;
          v87[0] = 0;
          v87[1] = v87;
          v87[2] = 0x2020000000;
          v87[3] = 0;
          v24 = (void *)MEMORY[0x1E0CA6AB8];
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = ___getDisplayNameMatches_block_invoke;
          v80[3] = &unk_1E5A65FF0;
          v81 = v21;
          v25 = v22;
          v82 = v25;
          v85 = &v88;
          v86 = v87;
          v26 = v20;
          v83 = v26;
          v27 = v23;
          v84 = v27;
          objc_msgSend(v24, "enumerateTokensForString:locale:options:withHandler:", v26, 0, 0, v80);
          v18 = *((unsigned __int8 *)v89 + 24);
          v28 = objc_retainAutorelease(v25);
          v29 = v84;
          v30 = v27;

          _Block_object_dispose(v87, 8);
          _Block_object_dispose(&v88, 8);

        }
        else
        {
          v30 = (id)MEMORY[0x1E0C9AA60];
          v28 = (id)MEMORY[0x1E0C9AA60];
        }

        v31 = v28;
        objc_msgSend(v71, "addObjectsFromArray:", v30);
        v73 = (v18 | v73 & 1) != 0;
        v32 = objc_msgSend(v31, "count");
        if (v32
          && (objc_msgSend(v31, "objectAtIndex:", 0),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              v34 = objc_msgSend(v33, "integerValue"),
              v33,
              v34 != 0x7FFFFFFFFFFFFFFFLL))
        {
          v35 = v34 + 5;
        }
        else
        {
          v35 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v32 < 2)
        {
          v36 = 0;
        }
        else if (v32 - 2 < 2)
        {
          v36 = 10;
        }
        else
        {
          v36 = 0;
          v37 = 3;
          do
          {
            objc_msgSend(v31, "objectAtIndex:", v37 - 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "integerValue");

            v36 += v39;
            ++v37;
          }
          while (v32 != v37);
          if (v36 != 0x7FFFFFFFFFFFFFFFLL)
            v36 += 10;
        }
        objc_msgSend(v31, "lastObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "integerValue");

        if (v35 >= v36)
          v42 = v36;
        else
          v42 = v35;
        if (v42 >= v41)
          v42 = v41;
        if (v42 >= v72)
          v43 = v72;
        else
          v43 = v42;

        v11 += v43;
        ++v12;
      }
      while (v12 != v70);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
      v10 = v44;
      if (!v44)
      {
LABEL_47:

        v45 = &__base[24 * v64];
        *(_QWORD *)v45 = v11;
        *((_QWORD *)v45 + 1) = v64;
        v45[16] = v73;

        v6 = v65;
        v9 = v64 + 1;
        goto LABEL_3;
      }
    }
  }
  qsort(__base, objc_msgSend(v6, "count"), 0x18uLL, (int (__cdecl *)(const void *, const void *))_relevancyComparator);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = __base + 16;
  while (v49 < objc_msgSend(v6, "count"))
  {
    v51 = *((_QWORD *)v50 - 1);
    v52 = *v50;
    objc_msgSend(v65, "objectAtIndex:", v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:atIndexedSubscript:", v53, v49);

    if ((v52 & 1) != 0)
    {
      objc_msgSend(v65, "objectAtIndex:", v51);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObject:", v54);

    }
    ++v49;
    v50 += 24;
    v6 = v65;
  }
  free(__base);
  v55 = objc_retainAutorelease(v48);
  *a3 = v55;
  v56 = objc_retainAutorelease(v71);
  *v58 = v56;

  v6 = v65;
LABEL_55:

  return v47;
}

void sub_1AB9965A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38)
{

  _Unwind_Resume(a1);
}

void sub_1AB9967D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB996840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB996980(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB996AA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB996B6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB996C44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB996D50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB996E48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB996F00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB996FB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9972C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB997390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB997498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1AB997570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9976CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9977EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB997990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB997BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB997C58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB997CDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB997EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB998018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB998208(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9982F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9983BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB998538(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB998604(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9986D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB998794(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB998808(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9988F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99896C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9989E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___sortedArrayByRelevancy_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");

}

void sub_1AB998A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t _relevancyComparator(_QWORD *a1, _QWORD *a2)
{
  unsigned int v2;

  if (*a1 >= *a2)
    v2 = 0;
  else
    v2 = -1;
  if (*a1 > *a2)
    return 1;
  else
    return v2;
}

void ___getDisplayNameMatches_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  __int128 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v21 = xmmword_1E5A65FD0;
  v22 = CFSTR("MFComposeRecipientStringMatchLastName");
  v8 = *(void **)(a1 + 32);
  v9 = v7;
  v10 = v8;
  if (v9)
  {
    v11 = objc_msgSend(v9, "rangeOfString:options:", v10, 385, v21, v22, v23);
    v13 = v11;
    v14 = v12;
    v15 = v11 == 0;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v16 = v11 - v12;
  }
  else
  {
    v15 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = 0xAAAAAAAAAAAAAAAALL;
    v13 = 0xAAAAAAAAAAAAAAAALL;
  }

  v17 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= v15;
  if (v15)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
      && a3 + a4 >= (unint64_t)objc_msgSend(*(id *)(a1 + 48), "length"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 2;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v9);
    objc_msgSend(v19, "addAttribute:value:range:", CFSTR("MFComposeRecipientStringMatchType"), *((_QWORD *)&v21 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)), v13, v14);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

  }
  for (i = 16; i != -8; i -= 8)

}

void sub_1AB998C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  uint64_t i;

  for (i = 16; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AB998D38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB998DAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB998E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFComposeRecipientTextView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB998FE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9993D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99962C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB999944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AB999B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB999C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB999D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB999D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_1AB999E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB999ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB999F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB99A22C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB99A478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB99A5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB99A740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB99A7E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99A8F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99A968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99AA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB99AAC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99AB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99ABE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99AC34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99AD8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99AF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB99AFD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99B110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99B278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB99B338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99B3D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99B480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99B650(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB99B6F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99B75C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99B864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99BACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB99BCB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99BDA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99BEA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99BF20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99C000(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99C158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB99C2A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99C34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB99C450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB99C594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99C674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB99C714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99C7CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99C860(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99C9A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99CB0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99CBE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99CE8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99CF70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99D2A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99D4C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99D63C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99D6E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99D74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99D7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99D824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99D8C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99D9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB99DA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99DAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99DC28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99DD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB99DE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1AB99DED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99E0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB99E174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99E2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB99E418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB99E524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB99E6AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99E7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB99E880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99EC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,void *a27)
{
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1AB99EFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1AB99F20C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99F288(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99F338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99F3D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99F52C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB99F618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB99F6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB99F96C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1AB99FB4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB99FD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB99FE68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A0144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A02D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1AB9A0394(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9A0404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A0510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A0574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A05DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A0644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A06C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A09F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A0A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A0B3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9A0C24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A0DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9A0E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9A0F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A1020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9A10E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A11C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9A1290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A1368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A140C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A1498(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A1588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9A17B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A18B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A19B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A1A4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A1B5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A1EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9A2430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;

  for (i = 8; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AB9A25A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A2708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9A278C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A2B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,_Unwind_Exception *exception_object)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_1AB9A2BC4()
{
  JUMPOUT(0x1AB9A2BA8);
}

void sub_1AB9A2BD0()
{
  JUMPOUT(0x1AB9A2BB0);
}

void sub_1AB9A2BDC()
{
  void *v0;

  JUMPOUT(0x1AB9A2BB8);
}

void sub_1AB9A2BE8()
{
  JUMPOUT(0x1AB9A2BB8);
}

void sub_1AB9A2C9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A2EB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9A32C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9A3364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFComposeRecipientView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9A340C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A34A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A3544(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A3664(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A36E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A39F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9A3C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9A3D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A4078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9A4180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A421C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A42D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A43D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A44B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A451C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A459C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A4684(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A46FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A4758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A48A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A4A50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A4D74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A5074(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A5208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A53C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A5440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A5538(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A55C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A5674(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A56D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A5738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A57A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A580C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A586C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A58E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A5A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9A5AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A5B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A5BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A5CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A5D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AB9A5E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9A5FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A608C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A6104(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A61F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A630C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A63F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A6D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1AB9A6F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A7000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9A70A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A71E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A76E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A7994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;

  for (i = 8; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AB9A7AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A7B80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A7CB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A7D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A7DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A7E20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A7E9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A8150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9A8268(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9A8330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9A8434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A857C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A8C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9A909C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A9204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1AB9A938C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A9444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A9608(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A97C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9A9850(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A98D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A997C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9A9A20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9A9B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A9C00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9A9DFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9A9F80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AA0AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AA1D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AA5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1AB9AA880(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AA9D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9AAB08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AAC24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AAD60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9AAE88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AAFB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AB05C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AB188(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9AB38C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AB43C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AB538(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9AB608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9AB6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9AB710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9AB9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9ABACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9ABB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9ABC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9ABD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9ABEB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9AC244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9AC348(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AC3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9AC458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9AC528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9AC850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_1AB9ACA24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9ACCFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9ACD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AB9AD40C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AD4A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AD53C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id cleanupSubjectString(void *a1, BOOL *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4);
  v6 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }
  if (a2)
    *a2 = v6;

  return v3;
}

void sub_1AB9AD5F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AD6D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9AD924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AD9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFComposeSubjectView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9ADBE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9ADD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9ADD90()
{
  void *v0;

  JUMPOUT(0x1AB9ADD80);
}

void sub_1AB9ADDA0()
{
  JUMPOUT(0x1AB9ADD80);
}

void sub_1AB9ADE20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9ADE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9ADEDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9ADF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9ADFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9AE008(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AE10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AB9AE1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9AE228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9AE2C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AE4FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AE6B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AEAC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9AEB84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AEDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void sub_1AB9AEEEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AEFC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AF0D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9AF164(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9AF1D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AF268(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9AF888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  _Unwind_Resume(a1);
}

void sub_1AB9AFB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9AFC40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9AFDEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B001C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B0160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9B0214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B02B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B038C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9B0EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,void *a26,uint64_t a27,void *a28,void *a29,uint64_t a30,uint64_t a31,void *a32,void *a33,uint64_t a34,void *a35,_Unwind_Exception *exception_object)
{
  void *v36;

  _Unwind_Resume(a1);
}

void sub_1AB9B17F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1AB9B1A18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B2098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9B2BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1AB9B2E10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B2F30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9B320C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9B342C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1AB9B3508(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B3598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B3628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B3E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_1AB9B4028()
{
  void *v0;

  JUMPOUT(0x1AB9B4038);
}

void sub_1AB9B40DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B416C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B4204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _subjectWithPrefix(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0D1E7B0], "subjectWithoutPrefixForSubject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "hasPrefix:", v4))
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_1E5A6A588, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void sub_1AB9B434C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1AB9B4468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B4700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9B4820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B4C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void *a12, void *a13, id a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9B4D88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B4DF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B4E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9B527C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9B5468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9B54FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B5650(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9B5748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9B5904(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9B5B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1AB9B6094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9B63E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9B64BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B6568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9B6630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B6890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;
  void *v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9B6940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9B6A50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B6B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9B6DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1AB9B6ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B6FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9B7048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B711C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9B72FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B7370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9B742C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9B76C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1AB9B77DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B7CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1AB9B7EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B7F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9B8008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B8574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  void *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  id *v18;

  v18 = v11;
  objc_destroyWeak(v16);
  objc_destroyWeak(v18);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v17 - 144));

  _Unwind_Resume(a1);
}

void sub_1AB9B86A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B870C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B876C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B87CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B8838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B88A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9B897C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B8A20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B8A98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B8B04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B8C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9B8D7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9B8DEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B938C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9B95B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B9600(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B96C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B97DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9B9920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9B9A30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BA020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  _Unwind_Resume(a1);
}

void sub_1AB9BA230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BA358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9BA628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9BA748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9BA868(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BA940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9BAA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9BAB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9BABBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9BAC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BAC5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BACE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BAD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BAE24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9BAFC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9BB0B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9BB2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BB4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9BB5D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9BB80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BB95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9BBC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

id plainTextDocumentFromStringsAndQuoteLevels(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = objc_alloc_init(MEMORY[0x1E0D4D5E0]);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v11;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count") == 2)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (!a2 || (int)objc_msgSend(v9, "intValue") <= 0))
              objc_msgSend(v12, "appendString:withQuoteLevel:", v8, objc_msgSend(v9, "intValue"));
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return v12;
}

void sub_1AB9BBEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BBF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BC014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9BC1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1AB9BC398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9BC428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BC488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BC6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BC7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BCA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9BCB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9BCC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9BCD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9BD0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1AB9BD2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1AB9BD414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1AB9BD67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);

  _Unwind_Resume(a1);
}

void sub_1AB9BD7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BD93C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9BD9B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BDA10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BDB80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9BDC54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9BDD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9BDE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9BDF80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9BDFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BE104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9BE1CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BE2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9BE3E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BE448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BE54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BE674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BE6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BE7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1AB9BE86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BE8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BE908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BE968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BEA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9BED24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9BEE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9BEF30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9BF754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  objc_destroyWeak(v28);
  objc_destroyWeak(location);

  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v32 - 144));

  _Unwind_Resume(a1);
}

void sub_1AB9BF9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BF9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BFA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BFAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BFBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9BFCC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9BFE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9BFE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9BFF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9C009C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C01B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C0290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C06C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
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

void sub_1AB9C0940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;

  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9C0A34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9C0B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9C0C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9C0F70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9C1100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9C11B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9C1224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C1270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C12BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C1308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C1354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C13D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C1448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C14F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C157C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C15CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C1624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C167C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C1790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9C17E0()
{
  JUMPOUT(0x1AB9C17D0);
}

void sub_1AB9C182C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C1880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C191C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C1A74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C1B70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C1CAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C1D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C1DE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C1E9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C21FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1AB9C2328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C2408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C2648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9C2848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9C2A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9C2B14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C2BF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C2CA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C2D04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C2D90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C2E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C2EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C2FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C31C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1AB9C32A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C3418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9C34A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C3520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C35D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C3790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C3888(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C3970(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C400C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_1AB9C41AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C41FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C4284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C4370(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C43EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C44A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C4584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C465C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C46D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C4AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9C4DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9C4ECC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C4F34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C5350(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AB9C5444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C56D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9C5774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C580C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C5918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9C597C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C5BC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C5C4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C5D44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9C5EA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C5F6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C6550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1AB9C670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C688C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9C6938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C6BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9C6CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C6F3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9C70A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C71F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9C72B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C7370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9C7464(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C7640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9C784C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9C7938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9C7A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9C7B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9C7C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9C7C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFContactsSearchManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9C7F04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFArray *_CopySortedArrayWithValues(CFComparisonResult (__cdecl *a1)(const void *, const void *, void *), const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __CFArray *Mutable;
  const void **v12;
  const void **v14;
  CFRange v15;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v14 = (const void **)&a9;
  if (a2)
  {
    do
    {
      CFArrayAppendValue(Mutable, a2);
      v12 = v14++;
      a2 = *v12;
    }
    while (*v12);
  }
  if (a1)
  {
    v15.length = CFArrayGetCount(Mutable);
    v15.location = 0;
    CFArraySortValues(Mutable, v15, a1, 0);
  }
  return Mutable;
}

void sub_1AB9C8028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFContactsSearchResultsModel;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9C82D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id _filterOutExistingRecipientsFromResults(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  id v24;
  id v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v24 = a1;
  v26 = a2;
  if (objc_msgSend(v26, "count"))
  {
    v25 = (id)objc_msgSend(v24, "mutableCopy");
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v24;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v37 != v4)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v6, "isGroup", v24))
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v7 = v26;
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            if (v8)
            {
              v9 = *(_QWORD *)v33;
              while (2)
              {
                for (j = 0; j != v8; ++j)
                {
                  if (*(_QWORD *)v33 != v9)
                    objc_enumerationMutation(v7);
                  v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
                  objc_msgSend(v6, "children");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v11) = objc_msgSend(v12, "containsObject:", v11);

                  if ((v11 & 1) == 0)
                  {

                    objc_msgSend(v25, "removeObject:", v6);
                    goto LABEL_18;
                  }
                }
                v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
                if (v8)
                  continue;
                break;
              }
            }

LABEL_18:
            objc_msgSend(v6, "children");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "count");
            v15 = v14 - objc_msgSend(v7, "count") == 1;

            if (v15)
            {
              objc_msgSend(v6, "children");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(v16, "mutableCopy");

              v30 = 0u;
              v31 = 0u;
              v28 = 0u;
              v29 = 0u;
              v18 = v7;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
              if (v19)
              {
                v20 = *(_QWORD *)v29;
                do
                {
                  for (k = 0; k != v19; ++k)
                  {
                    if (*(_QWORD *)v29 != v20)
                      objc_enumerationMutation(v18);
                    objc_msgSend(v17, "removeObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k));
                  }
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
                }
                while (v19);
              }

              if (objc_msgSend(v17, "count") == 1)
              {
                objc_msgSend(v25, "removeObject:", v6);
                objc_msgSend(v17, "objectAtIndex:", 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "wasCompleteMatch"))
                  objc_msgSend(v25, "insertObject:atIndex:", v22, 0);

              }
            }
          }
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v3);
    }

  }
  else
  {
    v25 = v24;
  }

  return v25;
}

void sub_1AB9C8628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void addEntriesForRecipientsIfNotInDictionary(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isGroup", (_QWORD)v16))
          objc_msgSend(v12, "address");
        else
          objc_msgSend(v12, "normalizedAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          __assert_rtn("addEntriesForRecipientsIfNotInDictionary", "MFContactsSearchResultsModel.m", 165, "address != nil");
        objc_msgSend(v6, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
          objc_msgSend(v7, "setObject:forKey:", v12, v13);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

void sub_1AB9C8898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9C8920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C8A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C8B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C8D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9C8EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9C9110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9C91A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C930C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _shouldCancel(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v4, "_isResetting") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "isCancelled");

  return v5;
}

void sub_1AB9C93D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C94C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C9618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9C97DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9C98A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9C9998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9C9BB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AB9C9D44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AB9C9DC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C9E2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C9E7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9C9EDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9CA038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9CA0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9CA20C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9CA3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9CA554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9CA694(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9CA778(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9CA7FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9CA94C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9CAA58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9CAC60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9CAD04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9CADA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9CB274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, id a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1AB9CB560(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9CB770(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9CB8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9CB9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9CBB30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9CC49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id *a21,id *location,id *a23,id *a24,id *a25,id *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59,void *a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a65;
  void *a70;
  void *a71;
  void *a72;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;

  objc_destroyWeak(a21);
  objc_destroyWeak(location);

  objc_destroyWeak(a23);
  objc_destroyWeak(a24);

  objc_destroyWeak(a25);
  objc_destroyWeak(a26);
  objc_destroyWeak((id *)(v78 - 184));

  _Unwind_Resume(a1);
}

void sub_1AB9CC8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9CC9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9CCAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9CCC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9CCD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AB9CCDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9CCE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9CCFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9CD138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9CD1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9CD27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9CD2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9CD374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9CD454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9CD520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9CD760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1AB9CD878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9CD9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1AB9CDAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9CDBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1AB9CDC44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9CDEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1AB9CDFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9CE278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1AB9CE3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9CE444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9CE724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1AB9CE8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9CEA18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AB9CEB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9CEC8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9CED74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9CEF00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v10 = v6;

  _Unwind_Resume(a1);
}

void sub_1AB9CF628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9CF764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9CF8BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9CFB18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v5;

  _Unwind_Resume(a1);
}

void sub_1AB9CFC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9CFCA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9CFD24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9CFDA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9CFF24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9CFFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D00EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D01A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D0204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D02FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D03B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D0430(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D04F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AB9D05C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D06A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9D0784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D08E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D09A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D0C00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D0C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFEMMessageStore;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9D0D38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D0FC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9D10CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D14DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9D1A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D1F40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1AB9D20B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D2254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D2624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1AB9D277C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D27C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1AB9D2AD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D2C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9D2D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9D2DB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D2F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D3090(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D30D8()
{
  JUMPOUT(0x1AB9D30CCLL);
}

void sub_1AB9D3198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D3248(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D32C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D3354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D33D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D3634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D371C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D39B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9D3AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D3B20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D3C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D3D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9D3F10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D3F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFHardwareJPEGScaler;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9D400C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D4098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D43C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D4888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D4A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D4AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D4B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D4C04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D4D98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D4F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9D4FA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D5014(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D507C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D511C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D5184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D5B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9D5F40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _serverSocketConnectCallback(uint64_t a1, uint64_t a2, uint64_t a3, CFSocketNativeHandle *a4, uint64_t a5)
{
  CFSocketNativeHandle v6;
  NSObject *v7;
  uint8_t v8[16];
  CFWriteStreamRef writeStream;
  CFReadStreamRef readStream;

  v6 = *a4;
  writeStream = (CFWriteStreamRef)0xAAAAAAAAAAAAAAAALL;
  readStream = (CFReadStreamRef)0xAAAAAAAAAAAAAAAALL;
  CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, &readStream, &writeStream);
  v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_INFO, "#Hand-Off [LAN] LAN server connection established", v8, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a5 + 32) + 16))();
  CFRelease(readStream);
  CFRelease(writeStream);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1AB9D6798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D6828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D6880(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6930(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D69E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6A3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6A90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6AE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6B38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6C00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D6CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_MFMailAccountProxySource;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9D6F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void sub_1AB9D711C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D71E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D7358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _AccountsChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_resetAccountsChanged:", 1);
}

void sub_1AB9D73CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D745C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D7524(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D7710(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D7B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1AB9D7C94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D7E10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D7F7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D8040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D80E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D8154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D82A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D8374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D84D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9D85D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D872C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9D88DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9D8960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D8A24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D8AFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D8B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D8C08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9D8D38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D8E64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AB9D8F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AB9D904C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D9198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9D92C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D946C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9D9608(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D97DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
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

void sub_1AB9D9A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9D9A60()
{
  JUMPOUT(0x1AB9D9A50);
}

void sub_1AB9D9AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9D9B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D9C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9D9C68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D9CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D9DBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9D9E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D9E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9D9EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DA044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9DA170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DA620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9DA6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DA800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;

  v11 = v10;

  a9.super_class = (Class)MFMailComposeController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1AB9DA940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DA9C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DAA94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DAAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DABC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9DAC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DAED0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9DAF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DB120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9DB228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9DB3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DB4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AB9DB6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9DB88C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9DBAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9DBD2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9DBE64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9DBFC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9DC050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9DC0F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DC190(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DC3B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9DC650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9DC75C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9DC898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DC91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DCA1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DCB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DCC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9DD66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v39 - 144));

  _Unwind_Resume(a1);
}

void sub_1AB9DD930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DDA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9DDBD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9DDD30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DE004(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9DE110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9DE1F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DE310(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9DEA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9DED58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9DEF5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DF058(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9DF0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9DF354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9DF424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9DF57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9DF6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9DF7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9DFDB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9E0710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9E0888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E0910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E0A6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E0AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E0B2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E0B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E0C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E0D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E0E00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9E0EC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E1120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E1204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E1264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E12DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E1340(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E13EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E14A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E164C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9E1744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E1854(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E18C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E1988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E2064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E2244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E24D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1AB9E2588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E2664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E26B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E2974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9E2A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E2EC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9E301C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E3094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E3174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E325C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E33D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E366C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E3818(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E3A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  void *v15;
  void *v16;

  v16 = v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9E3B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9E3DC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9E3FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  void *v16;
  id *v17;

  objc_destroyWeak(v17);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9E403C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E40E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9E4178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E41E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E4250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E42C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E45AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E466C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E47AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E4874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9E491C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E4A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E4AAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E4AF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E4B50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E4BB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E4BFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E4CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E4FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E5024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E51A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9E5274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9E5324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9E5468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9E54BC()
{
  JUMPOUT(0x1AB9E54ACLL);
}

void sub_1AB9E5534(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E55F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E5744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E5894(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E5A04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E5B88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E5BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E5C50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E5D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E5E90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E6130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E61FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E648C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AB9E6634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E6730(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E6A68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_1AB9E6DF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9E6EF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E6F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E7034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E7088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E7170(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E7284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E730C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E746C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E75F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E7704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E781C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E7918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E79C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9E7A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E7BB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E7D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E7E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AB9E7F30(_Unwind_Exception *exception_object)
{
  void *v1;
  uint64_t v2;

  if (v2)

  _Unwind_Resume(exception_object);
}

void sub_1AB9E8260(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9E8308(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E8378(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E841C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E8528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9E8594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E866C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E8714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E8900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E89A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E8A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E8BE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E8EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E90F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E9200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E9254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E92F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9E93A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9E948C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9E94F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9E966C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E971C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _MFAutosaveLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  MFLogGeneral();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v9, &a9);
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_INFO, "** [AutoSave] %@", buf, 0xCu);
    }

  }
}

void sub_1AB9E9954(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9E9B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9E9BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9E9C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9E9D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9E9EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9EA048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9EA110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9EA334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  _Block_object_dispose((const void *)(v25 - 176), 8);
  _Block_object_dispose((const void *)(v25 - 128), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1AB9EA514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9EA68C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9EA818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9EA8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9EAA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;

  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AB9EAAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9EAE00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9EAF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9EB034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9EB0FC(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1AB9EB294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9EB3F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9EB5B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9EB658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9EB6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9EBC68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9EBE78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9EBFCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9EC12C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9EC380(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9EC49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9EC598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9EC67C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9EC8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1AB9ECC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1AB9ED0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9ED424(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9ED6AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9ED7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  uint64_t v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9ED8F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9EDCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  void *v23;
  void *v24;
  void *v25;

  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1AB9EE8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, id location)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9EEDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,id location)
{
  void *v21;
  void *v22;
  void *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9EF408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9EFA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9EFF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9F0248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9F0574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9F07C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9F08EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9F0CA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9F0E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9F1828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,id a62)
{
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  _Block_object_dispose(&a57, 8);

  _Unwind_Resume(a1);
}

void sub_1AB9F1C30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9F1CA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F1CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F1E14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F1E78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F22D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  void *v28;
  void *v29;
  uint64_t v30;

  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9F275C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1AB9F2888(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F2974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F2D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1AB9F356C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9F3814(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F395C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1AB9F3AB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F3B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9F44A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  _Unwind_Resume(a1);
}

void sub_1AB9F47A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F4978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F4B0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F4DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9F4F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1AB9F5014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1AB9F5930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9F5C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9F5CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9F5D74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F5E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9F5F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9F5FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9F6404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1AB9F6610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AB9F66E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F6804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F6918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F6AF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F6CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  void *v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1AB9F6FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9F7160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F72B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F7898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34)
{
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  _Unwind_Resume(a1);
}

void sub_1AB9F7BA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F7C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9F7DB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F7E80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F7FE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9F8078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9F8180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9F8258(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F82B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F8690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9F8744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9F8934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F8A18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F8BE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F8D08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F8E80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F8F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9F9110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F93F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F9524(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9F9768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9F9850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9F9930(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F99F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9F9B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9F9BDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9F9D04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9F9E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AB9F9E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9F9F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FA064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FA24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9FA33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1AB9FA5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9FA83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9FA904(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FA968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FAC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9FAD60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FAEB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FAEFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FB00C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9FB19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1AB9FB238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FB410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9FB52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1AB9FB7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9FB8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FB958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FB9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FBA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9FBAFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FBB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FBC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FBCC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FBD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FBECC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9FBFA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9FC368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
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

void sub_1AB9FC564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9FC830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1AB9FC954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FC9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AB9FCA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FCAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FCBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9FD04C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9FD230(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FD454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1AB9FD584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FD600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FD67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FD704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FD778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FD99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9FDA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FDBF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9FDDB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1AB9FDEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1AB9FE078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AB9FE13C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FE198(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FE1F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FE234(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FE278(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FE2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FE304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FE34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FE394(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FE528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AB9FE7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1AB9FE898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FE928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FE9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FEA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FEB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FEC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FED44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FF258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FF370(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FF468(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1AB9FF4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FF770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AB9FFB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1AB9FFD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1AB9FFE2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABA002C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA00464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABA004CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA00650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA008CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA00CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1ABA00DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA00EC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA00FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABA0102C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0110C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0128C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0139C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0166C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1ABA01994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA01BEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA01E48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA01FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1ABA020C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1ABA02224(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA02304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA02440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1ABA02568(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA02784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA02900(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA02A50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA02B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA02C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA02D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA02E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA02FE4(_Unwind_Exception *a1)
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

void sub_1ABA032B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA03360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA033D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA03734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1ABA03888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABA039F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA03A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA03EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  void *v33;
  void *v34;
  id *v35;
  void *v36;
  void *v37;

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA04058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA04190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v14;

  _Unwind_Resume(a1);
}

void sub_1ABA041EC()
{
  JUMPOUT(0x1ABA041D8);
}

void sub_1ABA04264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0430C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA043B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA046E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA04804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA048C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0498C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA04AE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA04C30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABA04D54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA04E70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA04F7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA05054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA050F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0518C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA051F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA05494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1ABA055D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA05668(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA056D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0574C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA05848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA058D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA05964(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA05B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA05CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  id *v16;

  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_1ABA05D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA05FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1ABA06134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;

  v21 = v20;

  objc_destroyWeak(v18);
  _Unwind_Resume(a1);
}

void sub_1ABA06360(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA06480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v15 - 40));

  _Unwind_Resume(a1);
}

void sub_1ABA06660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1ABA068C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA06988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA06A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0797C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA07D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

Class initQLItem()
{
  Class result;

  if (LoadQuickLook_loadPredicate_0 != -1)
    dispatch_once(&LoadQuickLook_loadPredicate_0, &__block_literal_global_2177);
  result = objc_getClass("QLItem");
  classQLItem = (uint64_t)result;
  getQLItemClass[0] = (uint64_t (*)())QLItemFunction;
  return result;
}

id QLItemFunction()
{
  return (id)classQLItem;
}

Class initQLPreviewController()
{
  Class result;

  if (LoadQuickLook_loadPredicate_0 != -1)
    dispatch_once(&LoadQuickLook_loadPredicate_0, &__block_literal_global_2177);
  result = objc_getClass("QLPreviewController");
  classQLPreviewController = (uint64_t)result;
  getQLPreviewControllerClass[0] = (uint64_t (*)())QLPreviewControllerFunction;
  return result;
}

id QLPreviewControllerFunction()
{
  return (id)classQLPreviewController;
}

Class initQLDismissAction()
{
  Class result;

  if (LoadQuickLook_loadPredicate_0 != -1)
    dispatch_once(&LoadQuickLook_loadPredicate_0, &__block_literal_global_2177);
  result = objc_getClass("QLDismissAction");
  classQLDismissAction = (uint64_t)result;
  getQLDismissActionClass[0] = (uint64_t (*)())QLDismissActionFunction;
  return result;
}

id QLDismissActionFunction()
{
  return (id)classQLDismissAction;
}

Class initCloudSharing()
{
  Class result;

  if (LoadCloudSharing_loadPredicate != -1)
    dispatch_once(&LoadCloudSharing_loadPredicate, &__block_literal_global_2184);
  result = objc_getClass("CloudSharing");
  classCloudSharing = (uint64_t)result;
  getCloudSharingClass[0] = (uint64_t (*)())CloudSharingFunction;
  return result;
}

id CloudSharingFunction()
{
  return (id)classCloudSharing;
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_1ABA080D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0819C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA08294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA082F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0844C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1ABA08500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFMailComposeInternalViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA0889C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA08938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA08C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA08E10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA08E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA08EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA08F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0906C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA091F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA09330(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA09514(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA09660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1ABA096EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA097F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1ABA09880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0A310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{

  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA0A66C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0A784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA0A914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0AA28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0AB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0AC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1ABA0AD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0AF38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0B080(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0B178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA0B20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0B280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0B3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0B4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0B614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0B6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0B828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0BA10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA0BB68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA0BC70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0BFA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABA0C11C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0C230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1ABA0C2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0C384(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0C4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0C580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0C77C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0C870(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0CA54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0CB68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA0CD70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0CE64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0CF58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0D358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0D400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0D5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA0D730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABA0DA90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0DE40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0DFFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0E0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0E14C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0E1AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0E20C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0E2FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0E390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0E3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0E698(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0E8F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0E994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFMailComposeRecipientTextView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA0EA50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0EAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0EB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0EC7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0ECFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0EDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA0EE5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0EED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0EFC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0F054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA0F160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA0F1F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0F338(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0F3E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0F47C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA0F4D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA0F744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA0F950(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0FB0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA0FE1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA101BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1ABA10314(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA103C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA10440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA10568(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA10630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA106CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA107F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1087C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA10918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABA10994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA10A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMailComposeToField;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA10B60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA10C54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA10CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA10D48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA10F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA11000(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA11170(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA11428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA118FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA11AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABA11B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA11C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFMailComposeView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA11EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA12118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA121D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA12268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA122B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1239C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA12500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA126EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA127A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA12A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA13344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA1360C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA136B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA13730(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA13A40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA13B6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA13DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _layoutField(void *a1, void *a2, double *a3, double a4, CGFloat Height)
{
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  v8 = a1;
  v9 = a2;
  v13 = v8;
  objc_msgSend(v13, "alpha");
  if (v10 == 0.0)
  {

  }
  else
  {
    objc_msgSend(v13, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v13;
      if (v9 != v13)
      {
        objc_msgSend(v13, "frame");
        Height = CGRectGetHeight(v14);
        v12 = v13;
      }
      a3[3] = Height;
      objc_msgSend(v12, "setFrame:", *a3, a3[1], a3[2], Height);
      objc_msgSend(v13, "frame");
      a3[1] = CGRectGetMaxY(v15);
    }
  }

}

void sub_1ABA13EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA14200(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA14678(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA14710(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA147DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA14880(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA14A14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA14DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1528C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA154C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA155F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA15A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA15D74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA16064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA161C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA1625C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA16374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA16440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA164F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA166E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,void *a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  _Block_object_dispose((const void *)(v30 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA16B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1ABA16D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1ABA16E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA16F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA1701C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA170F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA17228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1ABA172A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1734C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA17574(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1765C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA176E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA17950(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA17B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA17BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA17D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA17E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA17F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA18030(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA18128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA181E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA182B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA183B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA185B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1875C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1ABA187D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA18928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1ABA18A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA18B64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA18BE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA18C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA18D68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA18E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA18FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA190D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA19174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA19268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA193B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA19538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA195DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA19640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA196A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA196EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA19858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA19910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA19AD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA19B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA19CA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA19E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA19EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA19F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA19FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1A04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1A0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1A12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1A1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

unint64_t MFMailComposeResultMake(unint64_t result)
{
  if (result >= 3)
    return 3;
  return result;
}

void sub_1ABA1A6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1A838(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1AA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1AA74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1AAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1AB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1AD48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA1ADF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1AE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABA1AF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABA1AFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABA1B15C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1B1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B224(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1B280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B2D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1B334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B38C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1B3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1B49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B4F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1B550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1B5A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1B624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA1B6CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA1B744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1B7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA1B82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1B87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1B8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1B938(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1B9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1BA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1BA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1BAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1BB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1BBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1BC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA1BCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA1BD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1BDE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1BE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1BF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA1BF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1C038(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1C080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _ArrayContainsKindOfObjects(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[5];

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ___ArrayContainsKindOfObjects_block_invoke;
    v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v6[4] = a2;
    v4 = objc_msgSend(v3, "ef_all:", v6);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1ABA1C174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1C278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1C3B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABA1C988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABA1CB54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1CBE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1CC74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1CD80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA1CEA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1D058(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1ABA1D1FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABA1D444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1ABA1D6D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_1ABA1D8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,id location)
{
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  id *v27;

  objc_destroyWeak(v27);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA1DABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA1DBFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1DEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  uint64_t v30;

  objc_destroyWeak(v22);
  objc_destroyWeak(v28);
  objc_destroyWeak((id *)(v30 - 104));

  _Unwind_Resume(a1);
}

void sub_1ABA1E288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA1E3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1E464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1E4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1E610(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA1E6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1EB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA1EC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)_MFMailCompositionContext;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA1ECF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1ED64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1EDC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1EE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1EF38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA1F008(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA1F088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1F100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1F164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1F204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1F320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v14;

  _Unwind_Resume(a1);
}

void sub_1ABA1F5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA1F898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA1F990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA1FA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FA74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FB28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FBDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FC90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FD40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA1FDD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FE8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FF40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA1FF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA1FFF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA200A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA200F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA20138(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA201CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA20260(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA202AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA202F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA203AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA204BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20514(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA205C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA2067C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA206D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20730(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2078C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA207E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2082C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA20878(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA208D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA209BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA20A50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA20AE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20B98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA20C30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20CE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20E48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA20EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA20F94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA20FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA21048(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA210A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA210F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA21144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2118C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA211D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA21264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2134C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v10;

  _Unwind_Resume(a1);
}

void sub_1ABA2152C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA21620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA216E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1ABA219FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2210C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA228CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA22A6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA233AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2397C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA23F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA240DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA24354(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA246C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1ABA24958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1ABA24AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA24BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA24C40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA24CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA24D2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA24DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA24E38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA252BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA257D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA25AC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABA25C70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA25D24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA26040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1ABA26188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA261E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA262E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA263F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA26578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2670C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABA268AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA26A3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA26BD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA26C7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA26D00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA26EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFMailPopoverManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA27044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA27348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1ABA27554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v16 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABA27630(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA27948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA27B4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA27BE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA27C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA27D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA27D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABA27DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA27E60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA27EE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA27FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2848C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1ABA2866C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA287D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1ABA2882C()
{
  JUMPOUT(0x1ABA28820);
}

void sub_1ABA28978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA28A84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA28DD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA28F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA29134(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2926C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA29558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1ABA29660(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1ABA299C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___imageConversionScheduler_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.Mail.MFMediaExporter.imageConversionScheduler"), 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_imageConversionScheduler_sInstance;
  _imageConversionScheduler_sInstance = v0;

}

void sub_1ABA29B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA29C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1ABA29E18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA29EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1ABA2A054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t _SMSCapabilityChanged()
{
  return +[MFMessageComposeViewController _updateServiceAvailability](MFMessageComposeViewController, "_updateServiceAvailability");
}

void sub_1ABA2A10C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A188(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A1E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A238(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A46C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA2A5EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2A6A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2A734(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A7CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A818(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2A8F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2AA10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABA2AB30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA2AC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1ABA2ACB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2AF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1ABA2B0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2B23C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2B2D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2B3E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2B480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA2B534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA2B6E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1ABA2BADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA2C2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  _Block_object_dispose((const void *)(v20 - 192), 8);
  _Block_object_dispose((const void *)(v20 - 160), 8);

  _Unwind_Resume(a1);
}

void sub_1ABA2C58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2C838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2C900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2CA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2CBC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2CD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2CEA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2D004(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2D1A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2D294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA2D3FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2D470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2D508(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2D67C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2D760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2D7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2D848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFMessageComposeViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA2D958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2DB98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2DC2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2DC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2DD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2DDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2DEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA2DF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2DFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2E088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA2E0FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2E148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2E1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2E278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA2E324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2E3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  uint64_t v16;

  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA2E4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA2E57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2EA98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _MFMessageSentCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  _QWORD v12[4];
  id v13;
  char v14;

  v5 = a5;
  getIMMessageSentDistributedNotificationUserInfoMessageGUIDKey[0]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getIMMessageSentDistributedNotificationUserInfoSucessKey[0]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___MFMessageSentCallback_block_invoke;
  v12[3] = &unk_1E5A65D00;
  v13 = v7;
  v14 = v10;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void sub_1ABA2EBB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA2EC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA2ECD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA2ED44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA2EDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2EE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t initIMSPIShareSheetCanSendMedia(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (LoadIMCore_loadPredicate != -1)
    dispatch_once(&LoadIMCore_loadPredicate, &__block_literal_global_392);
  softLinkIMSPIShareSheetCanSendMedia[0] = (uint64_t (*)())dlsym((void *)LoadIMCore_frameworkLibrary, "IMSPIShareSheetCanSendMedia");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkIMSPIShareSheetCanSendMedia[0])(a1, a2, a3);
}

id initSWCopyRepresentationTypeIdentifier()
{
  id *v0;

  if (LoadSharedWithYouCore_loadPredicate != -1)
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_397);
  v0 = (id *)dlsym((void *)LoadSharedWithYouCore_frameworkLibrary, "SWCopyRepresentationTypeIdentifier");
  objc_storeStrong((id *)&constantSWCopyRepresentationTypeIdentifier, *v0);
  getSWCopyRepresentationTypeIdentifier[0] = (uint64_t (*)())SWCopyRepresentationTypeIdentifierFunction;
  return (id)constantSWCopyRepresentationTypeIdentifier;
}

id SWCopyRepresentationTypeIdentifierFunction()
{
  return (id)constantSWCopyRepresentationTypeIdentifier;
}

Class init_SWPendingCollaboration()
{
  Class result;

  if (LoadSharedWithYouCore_loadPredicate != -1)
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_397);
  result = objc_getClass("_SWPendingCollaboration");
  class_SWPendingCollaboration = (uint64_t)result;
  get_SWPendingCollaborationClass[0] = (uint64_t (*)())_SWPendingCollaborationFunction;
  return result;
}

id _SWPendingCollaborationFunction()
{
  return (id)class_SWPendingCollaboration;
}

Class init_SWCollaborationShareOptions()
{
  Class result;

  if (LoadSharedWithYouCore_loadPredicate != -1)
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_397);
  result = objc_getClass("_SWCollaborationShareOptions");
  class_SWCollaborationShareOptions = (uint64_t)result;
  get_SWCollaborationShareOptionsClass[0] = (uint64_t (*)())_SWCollaborationShareOptionsFunction;
  return result;
}

id _SWCollaborationShareOptionsFunction()
{
  return (id)class_SWCollaborationShareOptions;
}

Class init_SWCollaborationMetadata()
{
  Class result;

  if (LoadSharedWithYouCore_loadPredicate != -1)
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_397);
  result = objc_getClass("_SWCollaborationMetadata");
  class_SWCollaborationMetadata = (uint64_t)result;
  get_SWCollaborationMetadataClass[0] = (uint64_t (*)())_SWCollaborationMetadataFunction;
  return result;
}

id _SWCollaborationMetadataFunction()
{
  return (id)class_SWCollaborationMetadata;
}

id initIMMessageSentDistributedNotificationUserInfoMessageGUIDKey()
{
  id *v0;

  if (LoadIMSharedUtilities_loadPredicate != -1)
    dispatch_once(&LoadIMSharedUtilities_loadPredicate, &__block_literal_global_405);
  v0 = (id *)dlsym((void *)LoadIMSharedUtilities_frameworkLibrary, "IMMessageSentDistributedNotificationUserInfoMessageGUIDKey");
  objc_storeStrong((id *)&constantIMMessageSentDistributedNotificationUserInfoMessageGUIDKey, *v0);
  getIMMessageSentDistributedNotificationUserInfoMessageGUIDKey[0] = (uint64_t (*)())IMMessageSentDistributedNotificationUserInfoMessageGUIDKeyFunction;
  return (id)constantIMMessageSentDistributedNotificationUserInfoMessageGUIDKey;
}

id IMMessageSentDistributedNotificationUserInfoMessageGUIDKeyFunction()
{
  return (id)constantIMMessageSentDistributedNotificationUserInfoMessageGUIDKey;
}

id initIMMessageSentDistributedNotificationUserInfoSucessKey()
{
  id *v0;

  if (LoadIMSharedUtilities_loadPredicate != -1)
    dispatch_once(&LoadIMSharedUtilities_loadPredicate, &__block_literal_global_405);
  v0 = (id *)dlsym((void *)LoadIMSharedUtilities_frameworkLibrary, "IMMessageSentDistributedNotificationUserInfoSucessKey");
  objc_storeStrong((id *)&constantIMMessageSentDistributedNotificationUserInfoSucessKey, *v0);
  getIMMessageSentDistributedNotificationUserInfoSucessKey[0] = (uint64_t (*)())IMMessageSentDistributedNotificationUserInfoSucessKeyFunction;
  return (id)constantIMMessageSentDistributedNotificationUserInfoSucessKey;
}

id IMMessageSentDistributedNotificationUserInfoSucessKeyFunction()
{
  return (id)constantIMMessageSentDistributedNotificationUserInfoSucessKey;
}

id initIMMessageSentDistributedNotification()
{
  id *v0;

  if (LoadIMSharedUtilities_loadPredicate != -1)
    dispatch_once(&LoadIMSharedUtilities_loadPredicate, &__block_literal_global_405);
  v0 = (id *)dlsym((void *)LoadIMSharedUtilities_frameworkLibrary, "IMMessageSentDistributedNotification");
  objc_storeStrong((id *)&constantIMMessageSentDistributedNotification, *v0);
  getIMMessageSentDistributedNotification[0] = (uint64_t (*)())IMMessageSentDistributedNotificationFunction;
  return (id)constantIMMessageSentDistributedNotification;
}

id IMMessageSentDistributedNotificationFunction()
{
  return (id)constantIMMessageSentDistributedNotification;
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1ABA2F380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageContentLoadingView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA2F464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2F4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA2F56C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2F91C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA2F9A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2FBE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA2FE60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA2FEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageContentProgressLayer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA301B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA302A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA30350(_Unwind_Exception *a1)
{
  void *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1ABA3044C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA30500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA30578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA30670(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3076C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABA307B0()
{
  JUMPOUT(0x1ABA307A4);
}

void sub_1ABA30804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageURLProtocol;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA30A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  id *v26;
  void *v27;

  v27 = v25;
  objc_destroyWeak(v26);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA30B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA30C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA30E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA31428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id *v41;

  objc_destroyWeak(v41);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA31658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3173C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1ABA31834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA31900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABA31AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA31C10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA31DB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA31E90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA320B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA3230C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA323D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA325A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA32794(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA329F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA32A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA32B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFModernAddressAtom;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA32D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA32E78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA33060(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA330C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA33180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA33250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA33474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA336C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1ABA337C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA33864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA3396C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA33A00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA33A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA33BAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double _drawingOffsetForPresentationOption(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = 0;
  result = *MEMORY[0x1E0C9D538];
  while (_predefinedAtomIconDrawingOffsets[v2] != a1 || _predefinedAtomIconDrawingOffsets[v2 + 3] > a2)
  {
    v2 += 4;
    if (v2 == 12)
      return result;
  }
  return 0.0;
}

id MFAtomViewIconImageForPresentationOption(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  const CGFloat *Components;
  id v16;
  size_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  MFAtomIcon *v24;
  uint64_t v25;
  double v26;
  MFAtomIcon *v27;
  uint64_t v28;
  double v29;
  double v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  void *v36;

  v7 = a2;
  v35 = v7;
  if (!MFAtomViewIconImageForPresentationOption_accessoryIconCache)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)MFAtomViewIconImageForPresentationOption_accessoryIconCache;
    MFAtomViewIconImageForPresentationOption_accessoryIconCache = (uint64_t)v8;

  }
  if (a1 <= 2047)
  {
    if (a1 == 16)
    {
      v10 = 0.8;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v10, 1.0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
        v11 = v7;
      goto LABEL_14;
    }
    if (a1 != 1024)
      goto LABEL_26;
LABEL_9:
    v10 = 0.5;
    goto LABEL_11;
  }
  if (a1 == 4096 || a1 == 2048)
    goto LABEL_9;
LABEL_26:
  v11 = v7;
  if (a1 != 0x2000)
  {
LABEL_14:
    v36 = 0;
    goto LABEL_15;
  }
  v31 = CFSTR("small");
  if (a4)
    v31 = CFSTR("large");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v31, CFSTR("downtime"), v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _MFAtomViewIconImageVariantNameForGlyphType((uint64_t)v32, a3);
  v33 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v33;
LABEL_15:
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v12);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v14, "CGColor"));
  v16 = objc_retainAutorelease(v14);
  for (i = CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v16, "CGColor")); i; --i)
    objc_msgSend(v13, "appendFormat:", CFSTR("%f."), *(_QWORD *)Components++);

  objc_msgSend(v36, "stringByAppendingFormat:", CFSTR("_%@"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)MFAtomViewIconImageForPresentationOption_accessoryIconCache, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v20 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageNamed:inBundle:", v36, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      if (v16)
      {
        objc_msgSend(v22, "_flatImageWithColor:", v16);
        v23 = objc_claimAutoreleasedReturnValue();

        v22 = (id)v23;
      }
      v24 = [MFAtomIcon alloc];
      v22 = objc_retainAutorelease(v22);
      v25 = objc_msgSend(v22, "CGImage");
      objc_msgSend(v22, "scale");
      v27 = -[MFAtomIcon initWithCGImage:scale:orientation:](v24, "initWithCGImage:scale:orientation:", v25, objc_msgSend(v22, "imageOrientation"), v26);
      v28 = 0;
      v19 = v27;
      v29 = *MEMORY[0x1E0C9D538];
      v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      while (_predefinedAtomIconDrawingOffsets[v28] != a1 || _predefinedAtomIconDrawingOffsets[v28 + 3] > a3)
      {
        v28 += 4;
        if (v28 == 12)
          goto LABEL_32;
      }
      v30 = *(double *)&_predefinedAtomIconDrawingOffsets[v28 + 2];
      v29 = 0.0;
LABEL_32:
      -[MFAtomIcon setDrawingOffset:](v27, "setDrawingOffset:", v29, v30);
      objc_msgSend((id)MFAtomViewIconImageForPresentationOption_accessoryIconCache, "setObject:forKey:", v19, v18);
    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

void sub_1ABA33FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA34094(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA340FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA34170(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA341D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA34258(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA343D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA344B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA34590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA346C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA34BEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA34CEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA34E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA35038(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA35180(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA35444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id _MFAtomViewIconImageVariantNameForGlyphType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = xmmword_1E5A697E0;
  v9 = *(_OWORD *)&off_1E5A697F0;
  v10 = xmmword_1E5A69800;
  v11 = CFSTR("XXXL");
  v3 = 6;
  if (a2 < 6)
    v3 = a2;
  v4 = *((id *)&v8 + v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@.png"), v4, a1, v8, v9, v10, v11, v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 48; i != -8; i -= 8)

  return v5;
}

void sub_1ABA355B0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t i;

  for (i = 48; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_1ABA35638(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA356CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA357A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA3586C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA359D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA35A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA35F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA362D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3644C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA364B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3652C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA36570(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA365E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA36728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA367A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA36934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, char a10)
{
  void *v10;
  void *v11;
  uint64_t i;

  for (i = 16; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1ABA36B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA36CDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA371E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA37284(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3735C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3747C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA375F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA37820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1ABA37B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA37CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA37D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA37E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA38030(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA380B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA38138(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA38438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA385F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA3870C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA38960(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA38C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA38D78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA38F60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA3903C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA39108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA391A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA39220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA3927C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA393F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3947C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA394D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA395F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFModernLabelledAtomList;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA39948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA39A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA39C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA39D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA39E50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA39FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3A06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3A13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA3A5C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA3A8CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3AB60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3ACC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3ADEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3AF20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3B04C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3B170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3B2D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3B424(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3B4C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3B71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,id a47)
{
  void *v47;
  void *v48;
  uint64_t v49;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a42, 8);

  _Block_object_dispose((const void *)(v49 - 232), 8);
  _Block_object_dispose((const void *)(v49 - 168), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1ABA3B928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3BB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA3BBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3BD34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MFModernUIContentSizeCategoryOrdering()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[13];

  v7[12] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC4930];
  v7[0] = *MEMORY[0x1E0DC4908];
  v7[1] = v0;
  v1 = *MEMORY[0x1E0DC4918];
  v7[2] = *MEMORY[0x1E0DC4920];
  v7[3] = v1;
  v2 = *MEMORY[0x1E0DC48F8];
  v7[4] = *MEMORY[0x1E0DC4900];
  v7[5] = v2;
  v3 = *MEMORY[0x1E0DC48D8];
  v7[6] = *MEMORY[0x1E0DC48F0];
  v7[7] = v3;
  v4 = *MEMORY[0x1E0DC48C8];
  v7[8] = *MEMORY[0x1E0DC48D0];
  v7[9] = v4;
  v5 = *MEMORY[0x1E0DC48B8];
  v7[10] = *MEMORY[0x1E0DC48C0];
  v7[11] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

id MFModernUIApplicationPreferredContentSizeCode()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t i;
  void *v4;
  char v5;
  void *v6;

  MFModernUIContentSizeCategoryOrdering();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 6; ++i)
  {
    objc_msgSend(v0, "objectAtIndex:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", v2);

    if ((v5 & 1) != 0)
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MFModernUIApplicationPreferredContentSizeCode_contentSizeCodes[i]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1ABA3C070(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL MFModernUIApplicationPreferredContentSizeIsLargerThanLarge()
{
  void *v0;
  void *v1;
  void *v2;
  unint64_t v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  MFModernUIContentSizeCategoryOrdering();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", v1);
  v4 = v3 > objc_msgSend(v2, "indexOfObject:", *MEMORY[0x1E0DC4918]);

  return v4;
}

void sub_1ABA3C12C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL MFModernUIApplicationPreferredContentSizeIsAccessibility()
{
  void *v0;
  void *v1;
  void *v2;
  unint64_t v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  MFModernUIContentSizeCategoryOrdering();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", v1);
  v4 = v3 >= objc_msgSend(v2, "indexOfObject:", *MEMORY[0x1E0DC48D8]);

  return v4;
}

void sub_1ABA3C1D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3C480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1ABA3C580(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL MFIsAuthorizedToAccessPhotoLibrary()
{
  uint64_t v0;

  v0 = -[objc_class authorizationStatus](getPHPhotoLibraryClass(), "authorizationStatus");
  return v0 == 3 || v0 == 0;
}

uint64_t MFCameraRollSaveAssetWithURL(void *a1, uint64_t a2)
{
  id v3;
  NSString *v4;
  _BOOL4 IsCompatibleWithSavedPhotosAlbum;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = a1;
  objc_msgSend(v3, "path");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v4);

  -[objc_class sharedPhotoLibrary](getPHPhotoLibraryClass(), "sharedPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsCompatibleWithSavedPhotosAlbum)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __MFCameraRollSaveAssetWithURL_block_invoke;
    v12[3] = &unk_1E5A65480;
    v7 = v12;
    v12[4] = v3;
    v8 = objc_msgSend(v6, "performChangesAndWait:error:", v12, a2);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __MFCameraRollSaveAssetWithURL_block_invoke_2;
    v11[3] = &unk_1E5A65480;
    v7 = v11;
    v11[4] = v3;
    v8 = objc_msgSend(v6, "performChangesAndWait:error:", v11, a2);
  }
  v9 = v8;

  return v9;
}

void sub_1ABA3C6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t MFCameraRollSaveImage(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a1;
  -[objc_class sharedPhotoLibrary](getPHPhotoLibraryClass(), "sharedPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MFCameraRollSaveImage_block_invoke;
  v8[3] = &unk_1E5A65480;
  v5 = v3;
  v9 = v5;
  v6 = objc_msgSend(v4, "performChangesAndWait:error:", v8, a2);

  return v6;
}

void sub_1ABA3C834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

Class initPHPhotoLibrary()
{
  Class result;

  if (LoadPhotos_loadPredicate != -1)
    dispatch_once(&LoadPhotos_loadPredicate, &__block_literal_global_29);
  result = objc_getClass("PHPhotoLibrary");
  classPHPhotoLibrary = (uint64_t)result;
  getPHPhotoLibraryClass = (uint64_t (*)())PHPhotoLibraryFunction;
  return result;
}

id PHPhotoLibraryFunction()
{
  return (id)classPHPhotoLibrary;
}

Class initPHAssetChangeRequest()
{
  Class result;

  if (LoadPhotos_loadPredicate != -1)
    dispatch_once(&LoadPhotos_loadPredicate, &__block_literal_global_29);
  result = objc_getClass("PHAssetChangeRequest");
  classPHAssetChangeRequest = (uint64_t)result;
  getPHAssetChangeRequestClass[0] = (uint64_t (*)())PHAssetChangeRequestFunction;
  return result;
}

id PHAssetChangeRequestFunction()
{
  return (id)classPHAssetChangeRequest;
}

void sub_1ABA3CF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_1ABA3D178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3D1C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3D298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3D32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA3D3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA3D460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3D4FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3D72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3D824(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3D904(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3DAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3DC58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3DE14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3DF94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3DFEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3E27C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABA3E3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA3E6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_1ABA3E8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1ABA3E9A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA3EAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1ABA3EB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3ED48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABA3EE64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA3EF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3F074(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA3F114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA3F2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1ABA3F41C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3F58C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA3F794(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3F890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1ABA3F9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1ABA3FADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_1ABA3FB8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA3FC3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1ABA3FCF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1ABA3FE08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1ABA3FF20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA3FFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4008C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA401EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA406E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA408A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA40B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA40E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA40F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA40FC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4103C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4115C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1ABA412B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4176C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id _plaintextDocumentForMimePart(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  if (objc_msgSend(v1, "approximateRawSize"))
  {
    v2 = (void *)objc_msgSend(v1, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:", -1, 0, 1);
    v3 = (void *)MFCreateStringWithData();
    v4 = objc_alloc_init(MEMORY[0x1E0D4D5E0]);
    objc_msgSend(v4, "appendString:withQuoteLevel:", v3, 0);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1ABA41968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA42020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA42220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4226C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA422B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4232C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA42384(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA423E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA425B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA42784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1ABA428AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA42A78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA42B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA42BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA42C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA42D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA42F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA42FE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA43060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABA430C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA43164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA432E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA43404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA435AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;
  void *v18;
  void *v19;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABA43658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA43718(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1ABA43788(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA43840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA438FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA43B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA43C40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA43CF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA43DA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA43E5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA43FDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA443D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA44510(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA446AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4473C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFProgressView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA44894(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA44908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA44B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA44DB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA44E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA44F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA45138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4523C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA45404(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA45508(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4563C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t MFABPropertyForRecentsKind(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  MFInitializeAddressBookConstants();
  if (objc_msgSend((id)*MEMORY[0x1E0D18208], "isEqualToString:", v1))
  {
    v2 = *MEMORY[0x1E0CF5F98];
  }
  else if (objc_msgSend((id)*MEMORY[0x1E0D18228], "isEqualToString:", v1))
  {
    v2 = *MEMORY[0x1E0CF61A0];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1ABA45704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MFRecentsKindForABProperty(int a1)
{
  id *v2;
  id v3;

  MFInitializeAddressBookConstants();
  if (*MEMORY[0x1E0CF5F98] == a1)
  {
    v2 = (id *)MEMORY[0x1E0D18208];
  }
  else
  {
    if (*MEMORY[0x1E0CF61A0] != a1)
    {
      v3 = 0;
      return v3;
    }
    v2 = (id *)MEMORY[0x1E0D18228];
  }
  v3 = *v2;
  return v3;
}

void sub_1ABA45830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_MFCRRecentContactABContext;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA4594C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA45C10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _MFPhoneNumbersEqualCallback(void *a1, void *a2)
{
  const void *v3;
  uint64_t v4;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  v3 = (const void *)CPPhoneNumberCopyHomeCountryCode();
  v4 = CPPhoneNumbersEqual();
  if (v3)
    CFRelease(v3);
  return v4;
}

void sub_1ABA46014(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA460DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA46428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1ABA46990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,void *a40)
{
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;

  _Block_object_dispose((const void *)(v45 - 152), 8);
  _Unwind_Resume(a1);
}

id MFLocalizedAddressSeparator()
{
  if (MFLocalizedAddressSeparator_onceToken != -1)
    dispatch_once(&MFLocalizedAddressSeparator_onceToken, &__block_literal_global_77);
  return (id)MFLocalizedAddressSeparator___result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1ABA46B9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA46C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA46CD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA46E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1ABA46EC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA470AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1ABA47124(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA47214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA47300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA473A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA47458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA475BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA476A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA47898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA47E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA4800C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4820C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA48C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

id _displayNameForRecipient(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  objc_msgSend(v3, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && a2)
  {
    +[MFAddressBookManager sharedManager](MFAddressBookManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const void *)objc_msgSend(v5, "addressBook");

    objc_msgSend(v3, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MFPreferredAbbreviatedNameForAddressAndDisplayName(v6, v7, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "displayString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
  }

  return v8;
}

void sub_1ABA48FA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA494BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABA49734(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA49940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1ABA49990()
{
  JUMPOUT(0x1ABA49980);
}

void sub_1ABA49A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4A188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1ABA4A6A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA4A790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4A850(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4A938(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4AB10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA4ABEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABA4ACE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABA4AE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1ABA4AF5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4B154(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B1C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B22C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B364(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4B3EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B47C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _baseDetailAttributes()
{
  void *v0;
  void *v1;

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("detailBase"), &__block_literal_global_187);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1ABA4B4FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4B6E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4B7F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4B944(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4B9D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4BB48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1ABA4BC0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4BC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)_MFTableCellAttributesCache;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA4BD60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id ___baseDetailAttributes_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("mf_tintType");
  v5[0] = v1;
  v5[1] = CFSTR("mf_ttdimmed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1ABA4BE78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4BEF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4BF80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4C090(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4C2E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4C410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4C4B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4C558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFRoundProgressView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABA4C844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4C928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4CA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4CB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4CF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4D0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1ABA4D198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4D28C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4D360(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4D3EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4D438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4D598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4D868(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4D910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4D968(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4D9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4DA24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4DA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4DAE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4DBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4DD4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4DECC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4DFA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4E064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4E510(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4E64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4E6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4E9D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1ABA4EA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4EB38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4EC84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4F1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1ABA4F428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4F4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4F57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4F660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA4F700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4F79C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA4FA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA4FBD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA4FC98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4FD4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA4FFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA50030(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA500EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA50230(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA502A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA50350(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA50454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1ABA50580(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA50694(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA507C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1ABA50848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA50CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1ABA50DD4()
{
  JUMPOUT(0x1ABA50DC8);
}

id EFLocalizedStringWithValue()
{
  _EFLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1ABA50F50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA50FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA51158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA5125C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA512F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA5159C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  _Block_object_dispose((const void *)(v35 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA517B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

Class initTLAlertConfiguration()
{
  Class result;

  if (LoadToneLibrary_loadPredicate != -1)
    dispatch_once(&LoadToneLibrary_loadPredicate, &__block_literal_global_35);
  result = objc_getClass("TLAlertConfiguration");
  classTLAlertConfiguration = (uint64_t)result;
  getTLAlertConfigurationClass = (uint64_t (*)())TLAlertConfigurationFunction;
  return result;
}

id TLAlertConfigurationFunction()
{
  return (id)classTLAlertConfiguration;
}

Class initTLAlert()
{
  Class result;

  if (LoadToneLibrary_loadPredicate != -1)
    dispatch_once(&LoadToneLibrary_loadPredicate, &__block_literal_global_35);
  result = objc_getClass("TLAlert");
  classTLAlert = (uint64_t)result;
  getTLAlertClass = (uint64_t (*)())TLAlertFunction;
  return result;
}

id TLAlertFunction()
{
  return (id)classTLAlert;
}

Class initFMDFMIPManager()
{
  Class result;

  if (LoadFindMyDevice_loadPredicate != -1)
    dispatch_once(&LoadFindMyDevice_loadPredicate, &__block_literal_global_32);
  result = objc_getClass("FMDFMIPManager");
  classFMDFMIPManager = (uint64_t)result;
  getFMDFMIPManagerClass = (uint64_t (*)())FMDFMIPManagerFunction;
  return result;
}

id FMDFMIPManagerFunction()
{
  return (id)classFMDFMIPManager;
}

void sub_1ABA519D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA51AF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA51C60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA51D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABA51DC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA51E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_1ABA520F8(_Unwind_Exception *a1)
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

void sub_1ABA521F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA522BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA52540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA52608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABA52680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA526D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA52734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA5278C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA52978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA52A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA52B18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA52C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA52DA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA52EA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA52FC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA5306C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA53168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA531F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA535A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1ABA53734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABA537E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA538AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA53AA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABA53C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t MFAddressHasSafeDomain(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v1 = a1;
  objc_msgSend(v1, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedEmailDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_map:", &__block_literal_global_38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __MFAddressHasSafeDomain_block_invoke_2;
    v9[3] = &unk_1E5A690D0;
    v10 = v3;
    v7 = objc_msgSend(v6, "ef_any:", v9);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void sub_1ABA53EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1ABA53FAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t MFFirstIndexPassingTest(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;

  v3 = a2;
  if (a1)
    v4 = MFFirstIndexInRangePassingTest(0, a1 - 1, v3);
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

void sub_1ABA54030(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t MFFirstIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  unsigned int (**v6)(_QWORD, _QWORD);

  v5 = a3;
  v6 = (unsigned int (**)(_QWORD, _QWORD))v5;
  if (a1 > a2)
    goto LABEL_2;
  if (((*((uint64_t (**)(id, unint64_t))v5 + 2))(v5, a1) & 1) != 0)
  {
    a2 = a1;
    goto LABEL_5;
  }
  if (v6[2](v6, a2))
  {
    while (a1 + 1 < a2)
    {
      if (v6[2](v6, (a2 + a1) >> 1))
        a2 = (a2 + a1) >> 1;
      else
        a1 = (a2 + a1) >> 1;
    }
  }
  else
  {
LABEL_2:
    a2 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_5:

  return a2;
}

void sub_1ABA540E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MFLastIndexPassingTest(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (a1)
    v4 = MFLastIndexInRangePassingTest(0, a1 - 1, v3);
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

void sub_1ABA5414C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MFLastIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = v5;
  if (a1 <= a2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __MFLastIndexInRangePassingTest_block_invoke;
    v11[3] = &unk_1E5A69E18;
    v12 = v5;
    v8 = MFFirstIndexInRangePassingTest(a1, a2, v11);
    v9 = v8 - 1;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = a2;
    if (v8 == a1)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = v9;

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

void sub_1ABA54214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABA542BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA543C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABA54464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA544C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA54528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA5468C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABA54728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t _CopyCompositionServicesDomain()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D4D7D8];
  v1 = CPCopySharedResourcesPreferencesDomainForDomain();
  if (!v1)
  {
    MFLogGeneral();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v0;
      _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "#Warning Unable to find shared resources preference domain for %@", (uint8_t *)&v4, 0xCu);
    }

  }
  return v1;
}

void sub_1ABA5486C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA548E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA54974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA54A04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA54C78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA54DD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABA54F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA55014(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA550C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA551F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABA55238()
{
  JUMPOUT(0x1ABA5522CLL);
}

void sub_1ABA55340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1ABA553B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA55520(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA555FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA556FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA55940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABA55B18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA55C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1ABA55CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA55D84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABA55E14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA55E8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA55EF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA55F64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA55FD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA560D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA5618C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA56274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABA56330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA56424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id *v14;
  void *v15;
  uint64_t v16;

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABA564AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABA565AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA56748(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA56888(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA56934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA569D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABA56B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1ABA56CA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABA56DA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1ABA56F58()
{
  return sub_1ABA65360();
}

uint64_t sub_1ABA56F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v36 = &v42;
  v42 = 0;
  v35 = &v41;
  v41 = 0;
  v34 = &v39;
  v39 = 0;
  v33 = &v38;
  v38 = 0;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE58);
  v21 = *(_QWORD *)(v23 - 8);
  v11 = (*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v23, v0, v1, v2);
  v25 = (char *)&v11 - v11;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD70);
  v14 = *(_QWORD *)(v15 - 8);
  v12 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v15, v3, v4, v5);
  v19 = (char *)&v11 - v12;
  v16 = 0;
  v27 = sub_1ABA6527C();
  v20 = *(_QWORD *)(v27 - 8);
  v13 = (*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v27, v6, v7, v8);
  v29 = (char *)&v11 - v13;
  v9 = sub_1ABA572F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v19, v9, v15);
  v17 = sub_1ABA6521C();
  v18 = sub_1ABA576B8();
  sub_1ABA57728();
  v26 = 0;
  sub_1ABA65288();
  v30 = sub_1ABA651F8();
  v28 = *(void (**)(char *, uint64_t))(v20 + 8);
  v28(v29, v27);
  sub_1ABA65210();
  v42 = v30;
  v22 = sub_1ABA578D0();
  v24 = &v40;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v25, v22, v23);
  swift_endAccess();
  sub_1ABA65294();
  v31 = sub_1ABA651F8();
  v28(v29, v27);
  sub_1ABA65210();
  v41 = v31;
  v32 = sub_1ABA65210();
  swift_bridgeObjectRelease();
  sub_1ABA65210();
  v39 = v32;
  v37 = sub_1ABA65204();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1ABA65210();
  v38 = v37;
  sub_1ABA57AB4();
  sub_1ABA57AB4();
  sub_1ABA57AB4();
  sub_1ABA57AB4();
  return v37;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x1AF433338]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

uint64_t sub_1ABA572F8()
{
  uint64_t v0;

  if (qword_1EEC3E028 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD70);
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E650);
}

uint64_t sub_1ABA5735C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *boxed_opaque_existential_1;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v39 = a2;
  v28 = a1;
  v52 = 0;
  v44 = sub_1ABA65078();
  v42 = *(_QWORD *)(v44 - 8);
  v23 = (*(_QWORD *)(v42 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v44, v2, v3, v4);
  v43 = (char *)&v22 - v23;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3ADD0);
  v45 = *(_QWORD *)(v47 - 8);
  v24 = (*(_QWORD *)(v45 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v47, v5, v6, v7);
  v46 = (char *)&v22 - v24;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE18);
  v31 = *(_QWORD *)(v33 - 8);
  v25 = (*(_QWORD *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v33, v8, v9, v10);
  v32 = (char *)&v22 - v25;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3ADE8);
  v35 = *(_QWORD *)(v37 - 8);
  v26 = (*(_QWORD *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v37, v11, v12, v13);
  v36 = (char *)&v22 - v26;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE00);
  v48 = *(_QWORD *)(v50 - 8);
  v27 = (*(_QWORD *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = MEMORY[0x1E0C80A78](v28, v14, v15, v16);
  v49 = (char *)&v22 - v27;
  v52 = v17;
  v29 = sub_1ABA58738();
  sub_1ABA65090();
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DD88);
  sub_1ABA57848();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  v34 = swift_getKeyPath();
  sub_1ABA587D0();
  v38 = MEMORY[0x1E0DEB418];
  sub_1ABA57848();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  v51 = 20;
  sub_1ABA65084();
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v43, *MEMORY[0x1E0CAF808], v44);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD90);
  v39[3] = v18;
  v19 = sub_1ABA58840();
  v20 = v39;
  v39[4] = v19;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  v41 = sub_1ABA58AA4();
  sub_1ABA58B14();
  sub_1ABA6506C();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v49, v50);
}

unint64_t sub_1ABA576B8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3AE40;
  if (!qword_1EEC3AE40)
  {
    v0 = sub_1ABA6521C();
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CE9488], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3AE40);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA57728()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3AE38;
  if (!qword_1EEC3AE38)
  {
    v0 = sub_1ABA6521C();
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CE9478], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3AE38);
    return v1;
  }
  return v3;
}

uint64_t sub_1ABA57798@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;

  v12 = a2;
  v10 = a1;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD70);
  v13 = *(_QWORD *)(v14 - 8);
  v11 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v14, v10, v14, v2);
  v15 = (char *)&v10 - v11;
  (*(void (**)(char *))(v3 + 16))((char *)&v10 - v11);
  v4 = sub_1ABA652B8();
  v5 = v13;
  v6 = v14;
  v7 = v4;
  v8 = v15;
  *v12 = v7;
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v6);
}

uint64_t sub_1ABA57848()
{
  return sub_1ABA65060();
}

uint64_t sub_1ABA57878@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  sub_1ABA58B84(a1, &v6);
  v5 = v6;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DD90);
  *a2 = MEMORY[0x1AF432060](v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1ABA578D0()
{
  uint64_t v0;

  if (qword_1EEC3DF90 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE58);
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E638);
}

uint64_t sub_1ABA57934@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *boxed_opaque_existential_1;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v16 = a2;
  v15 = a1;
  v26 = 0;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3ADB8);
  v19 = *(_QWORD *)(v21 - 8);
  v13 = (*(_QWORD *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v21, v2, v3, v4);
  v20 = (char *)&v13 - v13;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE30);
  v22 = *(_QWORD *)(v24 - 8);
  v14 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x1E0C80A78](v15, v5, v6, v7);
  v23 = (char *)&v13 - v14;
  v26 = v8;
  v18 = sub_1ABA583FC();
  sub_1ABA65090();
  v25 = 1;
  sub_1ABA65084();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3ADA0);
  v16[3] = v9;
  v10 = sub_1ABA584E0();
  v11 = v16;
  v16[4] = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  sub_1ABA586C8();
  sub_1ABA65054();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v23, v24);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1ABA57AB4()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1ABA57ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;

  v46 = 0;
  v45 = 0;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE50);
  v32 = *(_QWORD *)(v35 - 8);
  v18 = (*(_QWORD *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v35, v0, v1, v2);
  v33 = (char *)&v17 - v18;
  v19 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v17 - v18, v4, v5, v6);
  v34 = (char *)&v17 - v19;
  v46 = (char *)&v17 - v19;
  v26 = sub_1ABA65258();
  v24 = *(_QWORD *)(v26 - 8);
  v20 = (*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v26, v7, v8, v9);
  v25 = (char *)&v17 - v20;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE48);
  v28 = *(_QWORD *)(v38 - 8);
  v22 = *(_QWORD *)(v28 + 64);
  v21 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v38, v10, v11, v12);
  v29 = (char *)&v17 - v21;
  v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)&v17 - v21, v13, v14, v15);
  v37 = (char *)&v17 - v23;
  v45 = (char *)&v17 - v23;
  sub_1ABA65264();
  v27 = MEMORY[0x1E0CE95C0];
  MEMORY[0x1AF431EA4](v25, v26);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v29, v37, v38);
  v43 = v26;
  v44 = v27;
  v31 = 1;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1AF431EBC](v29, v38);
  v39 = *(void (**)(char *, uint64_t))(v28 + 8);
  v39(v29, v38);
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v33, v34, v35);
  v41 = v38;
  v42 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v40 = sub_1ABA65234();
  v36 = *(void (**)(char *, uint64_t))(v32 + 8);
  v36(v33, v35);
  v36(v34, v35);
  v39(v37, v38);
  return v40;
}

uint64_t sub_1ABA57D98()
{
  sub_1ABA65360();
  return sub_1ABA652E8();
}

uint64_t sub_1ABA57DCC()
{
  return sub_1ABA56F58();
}

uint64_t sub_1ABA57DE0()
{
  return sub_1ABA651B0();
}

uint64_t sub_1ABA57E44()
{
  return sub_1ABA651C8();
}

uint64_t sub_1ABA57E58()
{
  return sub_1ABA57D98();
}

uint64_t sub_1ABA57E6C()
{
  return sub_1ABA651BC();
}

uint64_t sub_1ABA57E80()
{
  return sub_1ABA56F84();
}

uint64_t sub_1ABA57E94()
{
  return sub_1ABA57ADC();
}

uint64_t sub_1ABA57EA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_1ABA56F58();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_1ABA57ED4()
{
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE58);
  __swift_allocate_value_buffer(v1, qword_1EEC3E638);
  __swift_project_value_buffer(v1, (uint64_t)qword_1EEC3E638);
  sub_1ABA65360();
  sub_1ABA6524C();
  sub_1ABA654E0();
  return sub_1ABA652DC();
}

uint64_t sub_1ABA57FAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA578D0();
  swift_beginAccess();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
  return swift_endAccess();
}

uint64_t sub_1ABA58014(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v10 = a1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE58);
  v9 = *(_QWORD *)(v11 - 8);
  v5 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11, v1, v2, v3);
  v7 = (char *)&v5 - v5;
  v6 = sub_1ABA578D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, v10, v11);
  v8 = &v12;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v6, v7, v11);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t sub_1ABA580F0()
{
  char v1;

  sub_1ABA578D0();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE58);
  sub_1ABA652C4();
  swift_endAccess();
  return v1 & 1;
}

uint64_t sub_1ABA58160()
{
  sub_1ABA578D0();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE58);
  sub_1ABA652D0();
  return swift_endAccess();
}

uint64_t sub_1ABA581F8()
{
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD70);
  __swift_allocate_value_buffer(v1, qword_1EEC3E650);
  __swift_project_value_buffer(v1, (uint64_t)qword_1EEC3E650);
  sub_1ABA65360();
  return sub_1ABA652AC();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_1ABA58314@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA572F8();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD70);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

unint64_t sub_1ABA5835C()
{
  return sub_1ABA58370();
}

unint64_t sub_1ABA58370()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EEC3AE68;
  if (!qword_1EEC3AE68)
  {
    v0 = MEMORY[0x1AF433350](&unk_1ABAA11C0, &unk_1E5A64E50);
    atomic_store(v0, (unint64_t *)&qword_1EEC3AE68);
    return v0;
  }
  return v2;
}

uint64_t sub_1ABA583DC()
{
  return MEMORY[0x1E0DEA978];
}

void *type metadata accessor for AddToYourEmailTip()
{
  return &unk_1E5A64E50;
}

unint64_t sub_1ABA583FC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3AE28;
  if (!qword_1EEC3AE28)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AE30);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF898], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3AE28);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x1AF433344](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

unint64_t sub_1ABA584E0()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EEC3AD98;
  if (!qword_1EEC3AD98)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3ADA0);
    v4[0] = sub_1ABA5856C();
    v4[1] = sub_1ABA585DC();
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF830], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EEC3AD98);
    return v0;
  }
  return v3;
}

unint64_t sub_1ABA5856C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3AE20;
  if (!qword_1EEC3AE20)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AE30);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF890], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3AE20);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA585DC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EEC3ADA8;
  if (!qword_1EEC3ADA8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3ADB8);
    v4[0] = MEMORY[0x1E0DEAFC0];
    v4[1] = MEMORY[0x1E0DEAFA8];
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF848], v0, v4);
    atomic_store(v1, (unint64_t *)&qword_1EEC3ADA8);
    return v1;
  }
  return v3;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;

  v3 = result;
  if ((*(_DWORD *)(*(_QWORD *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    v1 = swift_allocBox();
    result = v2;
    *v3 = v1;
  }
  return result;
}

unint64_t sub_1ABA586C8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3ADB0;
  if (!qword_1EEC3ADB0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3ADB8);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF850], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3ADB0);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA58738()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3AE08;
  if (!qword_1EEC3AE08)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AE18);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF898], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3AE08);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA587A8()
{
  return sub_1ABA576B8();
}

unint64_t sub_1ABA587BC()
{
  return sub_1ABA57728();
}

unint64_t sub_1ABA587D0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3ADD8;
  if (!qword_1EEC3ADD8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3ADE8);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF868], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3ADD8);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA58840()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EEC3AD88;
  if (!qword_1EEC3AD88)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AD90);
    v4[0] = sub_1ABA588CC();
    v4[1] = sub_1ABA58A34();
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0CE9210], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EEC3AD88);
    return v0;
  }
  return v3;
}

unint64_t sub_1ABA588CC()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = qword_1EEC3ADF8;
  if (!qword_1EEC3ADF8)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AE00);
    v4 = sub_1ABA58948();
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0CE9238], v2, &v4);
    atomic_store(v0, (unint64_t *)&qword_1EEC3ADF8);
    return v0;
  }
  return v3;
}

unint64_t sub_1ABA58948()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = qword_1EEC3ADE0;
  if (!qword_1EEC3ADE0)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3ADE8);
    v4 = sub_1ABA589C4();
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0CE9238], v2, &v4);
    atomic_store(v0, (unint64_t *)&qword_1EEC3ADE0);
    return v0;
  }
  return v3;
}

unint64_t sub_1ABA589C4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3AE10;
  if (!qword_1EEC3AE10)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AE18);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CE9248], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3AE10);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA58A34()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3ADC0;
  if (!qword_1EEC3ADC0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3ADD0);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CE9228], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3ADC0);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA58AA4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3ADF0;
  if (!qword_1EEC3ADF0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AE00);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF868], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3ADF0);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA58B14()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3ADC8;
  if (!qword_1EEC3ADC8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3ADD0);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0CAF850], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3ADC8);
    return v1;
  }
  return v3;
}

_QWORD *sub_1ABA58B84(uint64_t *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  sub_1ABA65210();
  result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_1ABA58BB8()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipObservation);
  swift_beginAccess();
  v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t sub_1ABA58C1C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_retain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipObservation);
  swift_beginAccess();
  *v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_1ABA58C98())()
{
  swift_beginAccess();
  return sub_1ABA58CE8;
}

uint64_t sub_1ABA58CE8()
{
  return swift_endAccess();
}

uint64_t sub_1ABA58D24()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v2 = v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_presentingController;
  swift_beginAccess();
  v3 = MEMORY[0x1AF433404](v2);
  swift_endAccess();
  return v3;
}

void sub_1ABA58D88(void *a1)
{
  id v1;

  v1 = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  swift_endAccess();
}

void (*sub_1ABA58E04(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = v1;
  v2 = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_presentingController;
  v6[5] = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_presentingController;
  v5 = v1 + v2;
  swift_beginAccess();
  v6[3] = MEMORY[0x1AF433404](v5);
  return sub_1ABA58E8C;
}

void sub_1ABA58E8C(id **a1, char a2)
{
  id v2;
  id v3;
  id v4;
  id *v5;

  v5 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v5[3];
    v2 = v3;
    swift_unknownObjectWeakAssign();

    sub_1ABA5998C(v5 + 3);
  }
  else
  {
    v4 = v5[3];
    swift_unknownObjectWeakAssign();

  }
  swift_endAccess();
  free(v5);
}

uint64_t sub_1ABA58F3C()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v2 = v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipPopoverController;
  swift_beginAccess();
  v3 = MEMORY[0x1AF433404](v2);
  swift_endAccess();
  return v3;
}

void sub_1ABA58FA0(void *a1)
{
  id v1;

  v1 = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  swift_endAccess();
}

void (*sub_1ABA5901C(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = v1;
  v2 = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipPopoverController;
  v6[5] = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipPopoverController;
  v5 = v1 + v2;
  swift_beginAccess();
  v6[3] = MEMORY[0x1AF433404](v5);
  return sub_1ABA58E8C;
}

uint64_t sub_1ABA590A4()
{
  uint64_t v0;
  uint64_t result;
  _BYTE *v2;
  uint64_t v3;
  char *v4;
  char v5;

  v4 = (char *)(v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip);
  swift_beginAccess();
  v5 = *v4;
  result = swift_endAccess();
  if ((v5 & 1) != 0)
  {
    nullsub_1(result);
    v2 = (_BYTE *)(v3 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip);
    swift_beginAccess();
    *v2 = 0;
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1ABA59168()
{
  uint64_t v0;
  _BYTE *v2;

  v2 = (_BYTE *)(v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip);
  swift_beginAccess();
  *v2 = 0;
  return swift_endAccess();
}

uint64_t (*sub_1ABA591CC(_QWORD *a1))()
{
  uint64_t v1;

  *a1 = v1;
  sub_1ABA590A4();
  return sub_1ABA59208;
}

uint64_t sub_1ABA59208()
{
  return sub_1ABA59168();
}

id MessageUITipsManager.__allocating_init(with:)(void *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return MessageUITipsManager.init(with:)(a1);
}

id MessageUITipsManager.init(with:)(void *a1)
{
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  id v7;
  id v8;
  id v10;
  id v12;
  objc_super v13;
  void *v14;
  id v15;

  v14 = a1;
  v2 = v1;
  v3 = v1;
  v4 = v1;
  v5 = v1;
  v6 = v1;
  v15 = v1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipObservation] = 0;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();

  v1[OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip] = 1;
  v7 = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  swift_endAccess();
  v13.receiver = v15;
  v13.super_class = (Class)type metadata accessor for MessageUITipsManager();
  v12 = objc_msgSendSuper2(&v13, sel_init);
  v8 = v12;
  v15 = v12;

  return v12;
}

uint64_t type metadata accessor for MessageUITipsManager()
{
  return objc_opt_self();
}

uint64_t sub_1ABA59470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t *v32;
  _QWORD *v33;
  _BYTE **v34;
  uint64_t *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint32_t v43;
  int v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL4 v49;
  _BOOL4 v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint32_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;

  v52 = MEMORY[0x1E0DF06E8];
  v68 = 0;
  v53 = 0;
  v54 = sub_1ABA6518C();
  v55 = *(_QWORD *)(v54 - 8);
  v56 = (*(_QWORD *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v54, v1, v2, v3);
  v57 = (char *)v26 - v56;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD78);
  v58 = (*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v4, v5, v6, v7);
  v59 = (char *)v26 - v58;
  v68 = v0;
  v67 = sub_1ABA58D24();
  v50 = v67 != 0;
  v49 = v50;
  sub_1ABA5998C((id *)&v67);
  if (v49)
  {
    v47 = 0;
    v8 = sub_1ABA6542C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v59, 1);
    v9 = v51;
    sub_1ABA65414();
    v10 = sub_1ABA65408();
    v11 = v51;
    v48 = v10;
    v12 = swift_allocObject();
    v13 = v52;
    v14 = (_QWORD *)v12;
    v15 = (uint64_t)v59;
    v14[2] = v48;
    v14[3] = v13;
    v14[4] = v11;
    v16 = sub_1ABA59F8C(v15, (uint64_t)&unk_1EEC3DDC0, (uint64_t)v14, MEMORY[0x1E0DEE9C0] + 8);
    return sub_1ABA58C1C(v16);
  }
  else
  {
    v18 = v57;
    v38 = sub_1ABA599B4();
    v39 = &v66;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v18, v38, v54);
    swift_endAccess();
    v45 = sub_1ABA65174();
    v44 = sub_1ABA65450();
    v42 = &v64;
    v64 = 2;
    v40 = sub_1ABA59A14();
    v41 = sub_1ABA59A7C();
    sub_1ABA59AE4();
    sub_1ABA653B4();
    v43 = v65;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AEB0);
    v46 = sub_1ABA654E0();
    if (os_log_type_enabled(v45, (os_log_type_t)v44))
    {
      v19 = v53;
      v28 = (uint8_t *)sub_1ABA65474();
      v26[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE88);
      v27 = 0;
      v29 = sub_1ABA5BAC0(0);
      v30 = sub_1ABA5BAC0(v27);
      v34 = &v63;
      v63 = v28;
      v35 = &v62;
      v62 = v29;
      v32 = &v61;
      v61 = v30;
      v31 = 0;
      sub_1ABA5BB18(0, &v63);
      sub_1ABA5BB18(v31, v34);
      v60 = v46;
      v33 = v26;
      MEMORY[0x1E0C80A78](v26, v20, v21, v22);
      v23 = v35;
      v24 = &v26[-6];
      v36 = &v26[-6];
      v24[2] = v34;
      v24[3] = v23;
      v24[4] = v25;
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE78);
      sub_1ABA5BB9C();
      sub_1ABA653A8();
      if (v19)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1AB96A000, v45, (os_log_type_t)v44, "Trying to observe tip display changes with no MFMailComposeController instance", v28, v43);
        v26[0] = 0;
        sub_1ABA5BC0C(v29);
        sub_1ABA5BC0C(v30);
        sub_1ABA6545C();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v57, v54);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1ABA5998C(id *a1)
{

}

uint64_t sub_1ABA599B4()
{
  uint64_t v0;

  if (qword_1EEC3DF70 != -1)
    swift_once();
  v0 = sub_1ABA6518C();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3DF78);
}

unint64_t sub_1ABA59A14()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EEC3AEA8;
  if (!qword_1EEC3AEA8)
  {
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0DEE148], MEMORY[0x1E0DEE0F8]);
    atomic_store(v0, (unint64_t *)&qword_1EEC3AEA8);
    return v0;
  }
  return v2;
}

unint64_t sub_1ABA59A7C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EEC3AEA0;
  if (!qword_1EEC3AEA0)
  {
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0DEE120], MEMORY[0x1E0DEE0F8]);
    atomic_store(v0, (unint64_t *)&qword_1EEC3AEA0);
    return v0;
  }
  return v2;
}

unint64_t sub_1ABA59AE4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EEC3AE70;
  if (!qword_1EEC3AE70)
  {
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(v0, (unint64_t *)&qword_1EEC3AE70);
    return v0;
  }
  return v2;
}

uint64_t sub_1ABA59B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 32) = a4;
  *(_QWORD *)(v4 + 16) = v4;
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 128) = 0;
  *(_QWORD *)(v4 + 40) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE98);
  *(_QWORD *)(v4 + 48) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE90);
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 72) = swift_task_alloc();
  *(_QWORD *)(v4 + 24) = a4;
  *(_QWORD *)(v4 + 80) = sub_1ABA65414();
  *(_QWORD *)(v4 + 88) = sub_1ABA65408();
  *(_QWORD *)(v4 + 96) = sub_1ABA653FC();
  *(_QWORD *)(v4 + 104) = v6;
  return swift_task_switch();
}

uint64_t sub_1ABA59C54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  *(_QWORD *)(v0 + 16) = v0;
  sub_1ABA590A4();
  sub_1ABA5BDDC();
  sub_1ABA651A4();
  sub_1ABA6548C();
  *(_QWORD *)(v0 + 112) = sub_1ABA65408();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 120) = v1;
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_1ABA59D48;
  return sub_1ABA65498();
}

uint64_t sub_1ABA59D48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)v1 + 16) = *(_QWORD *)v1;
  result = swift_task_dealloc();
  if (!v0)
  {
    swift_unknownObjectRelease();
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_1ABA59DF4()
{
  uint64_t v0;
  _QWORD *v2;
  uint64_t v3;
  int v4;

  *(_QWORD *)(v0 + 16) = v0;
  v4 = *(unsigned __int8 *)(v0 + 129);
  if (v4 == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(v3 + 64) + 8))();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 16) + 8))();
  }
  else
  {
    *(_BYTE *)(v3 + 128) = v4 & 1;
    if ((v4 & 1) != 0)
      sub_1ABA5A2F4();
    else
      sub_1ABA5B010();
    *(_QWORD *)(v3 + 112) = sub_1ABA65408();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 120) = v2;
    *v2 = *(_QWORD *)(v3 + 16);
    v2[1] = sub_1ABA59D48;
    return sub_1ABA65498();
  }
}

uint64_t sub_1ABA59F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;

  v11 = sub_1ABA6542C();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_1ABA5D234(a1);
  }
  else
  {
    sub_1ABA65420();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  v6 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v6)
  {
    swift_getObjectType();
    sub_1ABA653FC();
    swift_unknownObjectRelease();
  }
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a4;
  v5[3] = a2;
  v5[4] = a3;
  return swift_task_create();
}

void sub_1ABA5A1F0()
{
  sub_1ABA5B010();
  if (sub_1ABA58BB8())
  {
    swift_retain();
    sub_1ABA5BDB4();
    sub_1ABA65438();
    swift_release();
  }
  else
  {
    sub_1ABA5BDB4();
  }
  sub_1ABA58C1C(0);
  sub_1ABA58D88(0);
}

void sub_1ABA5A2F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  int v26;
  _QWORD v27[3];
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t *v33;
  _QWORD *v34;
  _BYTE **v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint32_t v44;
  int v45;
  NSObject *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  id v74;
  double v75;
  double v76;
  double v77;
  double v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  double v83;
  double v84;
  id v85;
  id v86;
  uint64_t *v87;
  uint64_t v88;
  id *v89;
  id v90;
  uint64_t v91;
  id v92;
  _BOOL4 v93;
  _BOOL4 v94;
  _BOOL4 v95;
  _BOOL4 v96;
  id v97;
  id v98;
  const char *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  id v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  uint64_t v123;
  id v124;
  double v125;
  void *v126;
  void *v127;
  unint64_t v128;
  uint64_t v129;
  id v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE *v135;
  uint64_t v136;
  uint32_t v137;
  char v138;
  uint64_t v139;

  v99 = "Fatal error";
  v100 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  v101 = "MessageUI/MessageUITipsManager.swift";
  v139 = 0;
  v102 = 0;
  v131 = 0;
  v126 = 0;
  v125 = 0.0;
  v120 = 0;
  v103 = sub_1ABA6518C();
  v104 = *(_QWORD *)(v103 - 8);
  v105 = (*(_QWORD *)(v104 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v103, v1, v2, v3);
  v106 = (char *)v27 - v105;
  v139 = v0;
  v107 = (id)sub_1ABA58D24();
  if (!v107)
  {
LABEL_36:
    v16 = v106;
    v39 = sub_1ABA599B4();
    v40 = &v138;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v104 + 16))(v16, v39, v103);
    swift_endAccess();
    v46 = sub_1ABA65174();
    v45 = sub_1ABA65450();
    v43 = &v136;
    v136 = 2;
    v41 = sub_1ABA59A14();
    v42 = sub_1ABA59A7C();
    sub_1ABA59AE4();
    sub_1ABA653B4();
    v44 = v137;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AEB0);
    v47 = sub_1ABA654E0();
    if (os_log_type_enabled(v46, (os_log_type_t)v45))
    {
      v17 = v102;
      v29 = (uint8_t *)sub_1ABA65474();
      v27[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE88);
      v28 = 0;
      v30 = sub_1ABA5BAC0(0);
      v31 = sub_1ABA5BAC0(v28);
      v35 = &v135;
      v135 = v29;
      v36 = &v134;
      v134 = v30;
      v33 = &v133;
      v133 = v31;
      v32 = 0;
      sub_1ABA5BB18(0, &v135);
      sub_1ABA5BB18(v32, v35);
      v132 = v47;
      v34 = v27;
      MEMORY[0x1E0C80A78](v27, v18, v19, v20);
      v21 = v36;
      v22 = &v27[-6];
      v37 = &v27[-6];
      v22[2] = v35;
      v22[3] = v21;
      v22[4] = v23;
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE78);
      sub_1ABA5BB9C();
      sub_1ABA653A8();
      if (v17)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1AB96A000, v46, (os_log_type_t)v45, "Trying to present more than one MiniTipPopoverViewController", v29, v44);
        v27[1] = 0;
        sub_1ABA5BC0C(v30);
        sub_1ABA5BC0C(v31);
        sub_1ABA6545C();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v104 + 8))(v106, v103);
    return;
  }
  v98 = v107;
  v97 = v107;
  v131 = v107;
  v130 = objc_msgSend(v107, sel_presentedViewController);
  v96 = v130 == 0;
  v95 = v96;
  sub_1ABA5998C(&v130);
  if (!v95 || (v129 = sub_1ABA58F3C(), v94 = v129 == 0, v93 = v94, sub_1ABA5998C((id *)&v129), !v93))
  {

    goto LABEL_36;
  }
  v91 = sub_1ABA651E0();
  sub_1ABA590A4();
  v127 = &unk_1E5A64E50;
  v128 = sub_1ABA5BDDC();
  v92 = objc_msgSend(v97, sel_view);
  if (v92)
  {
    v90 = v92;
  }
  else
  {
    v24 = 2;
    v25 = 66;
    v26 = 0;
    sub_1ABA654A4();
    __break(1u);
  }
  v81 = v90;
  sub_1ABA5ADA0();
  v82 = (void *)sub_1ABA651EC();
  v126 = v82;
  v83 = *MEMORY[0x1E0DC4FF8];
  v84 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  v85 = objc_msgSend(v97, sel_traitCollection);
  v86 = objc_msgSend(v85, sel_horizontalSizeClass);

  v89 = &v124;
  v124 = v86;
  v87 = &v123;
  v123 = 1;
  v88 = type metadata accessor for UIUserInterfaceSizeClass();
  sub_1ABA5BEE4();
  if ((sub_1ABA654EC() & 1) != 0)
  {
    v80 = objc_msgSend(v97, sel_view);
    if (v80)
    {
      v79 = v80;
    }
    else
    {
      v24 = 2;
      v25 = 72;
      v26 = 0;
      sub_1ABA654A4();
      __break(1u);
    }
    v74 = v79;
    objc_msgSend(v79, sel_bounds);
    v108 = v4;
    v109 = v5;
    v110 = v6;
    v111 = v7;
    v75 = v4;
    v76 = v5;
    v77 = v6;
    v78 = v7;

    v125 = sub_1ABA5ADB0(v75, v76, v77, v78);
  }
  else
  {
    v125 = v83;
  }
  v8 = v82;
  v9 = v82;
  v121 = v125;
  v122 = v84;
  objc_msgSend(v8, sel_setPreferredContentSize_, v125, v84);

  v73 = (id)sub_1ABA651D4();
  if (v73)
  {
    v72 = v73;
    v71 = v73;
    objc_msgSend(v73, sel_setPermittedArrowDirections_, 2);

  }
  v10 = v97;
  objc_opt_self();
  v70 = swift_dynamicCastObjCClass();
  if (v70)
  {
    v69 = (void *)v70;
  }
  else
  {
    v68 = 0;

    v69 = v68;
  }
  v67 = v69;
  if (v69)
  {
    v66 = v67;
    v64 = v67;
    v120 = v67;
    v65 = (void *)sub_1ABA651D4();
    if (v65)
    {
      v63 = v65;
      v61 = v65;
      v62 = objc_msgSend(v64, sel_mailComposeView);
      if (v62)
      {
        v60 = v62;
      }
      else
      {
        v24 = 2;
        v25 = 81;
        v26 = 0;
        sub_1ABA654A4();
        __break(1u);
      }
      v54 = v60;
      v55 = objc_msgSend(v60, sel_keyboardLayoutGuide);

      objc_msgSend(v55, sel_layoutFrame);
      v116 = v11;
      v117 = v12;
      v118 = v13;
      v119 = v14;
      v56 = v11;
      v57 = v12;
      v58 = v13;
      v59 = v14;

      v112 = v56;
      v113 = v57;
      v114 = v58;
      v115 = v59;
      objc_msgSend(v61, sel_setSourceRect_, v56, v57, v58, v59);

    }
  }
  v53 = (void *)sub_1ABA651D4();
  if (v53)
  {
    v52 = v53;
    v51 = v53;
    v48 = objc_msgSend(v97, sel_view);
    v49 = sub_1ABA5ADEC(v48);

    sub_1ABA5BF54();
    v50 = (id)sub_1ABA653C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v51, sel_setPassthroughViews_, v50);

  }
  objc_msgSend(v97, sel_presentViewController_animated_completion_, v82, 1, 0);
  v15 = v82;
  sub_1ABA58FA0(v82);

}

uint64_t (*sub_1ABA5ADA0())()
{
  return nullsub_1;
}

CGFloat sub_1ABA5ADB0(double a1, double a2, double a3, double a4)
{
  return CGRectGetWidth(*(CGRect *)&a1);
}

uint64_t sub_1ABA5ADEC(void *a1)
{
  id v1;
  id v3;
  _QWORD *v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t ObjectType;
  id v15;

  v1 = a1;
  if (!a1)
  {
    sub_1ABA5BF54();
    return sub_1ABA654E0();
  }
  v15 = objc_msgSend(a1, sel_superview);
  if (!v15)
    goto LABEL_8;
  ObjectType = swift_getObjectType();
  if (ObjectType == sub_1ABA5BFB8())
  {

LABEL_8:
    sub_1ABA5BF54();
    v10 = sub_1ABA654E0();
    v9 = v6;
    v7 = a1;
    *v9 = a1;
    sub_1ABA5B9DC();

    return v10;
  }
  v3 = v15;
  sub_1ABA5ADEC(v15);

  sub_1ABA5BF54();
  sub_1ABA654E0();
  v11 = v4;
  v5 = a1;
  *v11 = a1;
  sub_1ABA5B9DC();
  v12 = sub_1ABA653D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

void sub_1ABA5B010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t *v19;
  _QWORD *v20;
  _BYTE **v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint32_t v30;
  int v31;
  NSObject *v32;
  void *v33;
  id *v34;
  id v35;
  _BOOL4 v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  id v43[2];
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint32_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;

  v51 = 0;
  v38 = 0;
  v39 = sub_1ABA6518C();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = (*(_QWORD *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v39, v1, v2, v3);
  v42 = (char *)v13 - v41;
  v51 = v0;
  v50 = sub_1ABA58F3C();
  v37 = v50 != 0;
  v36 = v37;
  sub_1ABA5998C((id *)&v50);
  if (v36)
  {
    v43[0] = (id)sub_1ABA58F3C();
    if (v43[0])
    {
      v34 = v43;
      v35 = v43[0];
      v4 = v43[0];
      sub_1ABA5998C(v34);
      objc_msgSend(v35, sel_dismissViewControllerAnimated_completion_, 1, 0);

    }
    else
    {
      sub_1ABA5998C(v43);
    }
    sub_1ABA58FA0(0);
  }
  else
  {
    v5 = v42;
    v25 = sub_1ABA599B4();
    v26 = &v49;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v5, v25, v39);
    swift_endAccess();
    v32 = sub_1ABA65174();
    v31 = sub_1ABA65450();
    v29 = &v47;
    v47 = 2;
    v27 = sub_1ABA59A14();
    v28 = sub_1ABA59A7C();
    sub_1ABA59AE4();
    sub_1ABA653B4();
    v30 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AEB0);
    v33 = (void *)sub_1ABA654E0();
    if (os_log_type_enabled(v32, (os_log_type_t)v31))
    {
      v6 = v38;
      v15 = (uint8_t *)sub_1ABA65474();
      v13[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE88);
      v14 = 0;
      v16 = sub_1ABA5BAC0(0);
      v17 = sub_1ABA5BAC0(v14);
      v21 = &v46;
      v46 = v15;
      v22 = &v45;
      v45 = v16;
      v19 = &v44;
      v44 = v17;
      v18 = 0;
      sub_1ABA5BB18(0, &v46);
      sub_1ABA5BB18(v18, v21);
      v43[1] = v33;
      v20 = v13;
      MEMORY[0x1E0C80A78](v13, v7, v8, v9);
      v10 = v22;
      v11 = &v13[-6];
      v23 = &v13[-6];
      v11[2] = v21;
      v11[3] = v10;
      v11[4] = v12;
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AE78);
      sub_1ABA5BB9C();
      sub_1ABA653A8();
      if (v6)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1AB96A000, v32, (os_log_type_t)v31, "Could not dismiss Tip, no existing view controller", v15, v30);
        v13[0] = 0;
        sub_1ABA5BC0C(v16);
        sub_1ABA5BC0C(v17);
        sub_1ABA6545C();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v39);
  }
}

uint64_t static MessageUITipsManager.setShouldDisplay(to:)()
{
  return sub_1ABA58160();
}

uint64_t static MessageUITipsManager.donateHasUsedAttachment()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = 0;
  v9 = sub_1ABA65270();
  v7 = *(_QWORD *)(v9 - 8);
  v6 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v9, v0, v1, v2);
  v8 = (char *)&v5 - v6;
  v10 = v3;
  nullsub_1((char *)&v5 - v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v8, *MEMORY[0x1E0CE9610], v9);
  sub_1ABA5BDDC();
  sub_1ABA65198();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v8, v9);
}

uint64_t static MessageUITipsManager.donateHasSentEmailEvent()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3AD70);
  v9 = *(_QWORD *)(v11 - 8);
  v8 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11, v0, v1, v2);
  v3 = (char *)&v7 - v8;
  v10 = (char *)&v7 - v8;
  v12 = v4;
  v5 = sub_1ABA572F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v3, v5, v11);
  sub_1ABA652A0();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v10, v11);
}

id MessageUITipsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MessageUITipsManager.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"MessageUI.MessageUITipsManager")
  {
    sub_1ABA654A4();
    __break(1u);
  }
  result = sub_1ABA5C390((uint64_t)"MessageUI.MessageUITipsManager", 30, (unint64_t)"init()", 6, 2, (unint64_t)"MessageUI/MessageUITipsManager.swift", 36, 2, v1, 0xFuLL, 0x1BuLL);
  __break(1u);
  return result;
}

id MessageUITipsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageUITipsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1ABA5B91C()
{
  uint64_t v1;

  v1 = sub_1ABA6518C();
  __swift_allocate_value_buffer(v1, qword_1EEC3DF78);
  __swift_project_value_buffer(v1, (uint64_t)qword_1EEC3DF78);
  return sub_1ABA5B964();
}

uint64_t sub_1ABA5B964()
{
  sub_1ABA65360();
  sub_1ABA65360();
  return sub_1ABA65180();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1ABA5B9DC()
{
  sub_1ABA653F0();
  sub_1ABA5D228();
}

void sub_1ABA5BA1C(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  sub_1ABA5BA54();
  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2 & 1;
}

void sub_1ABA5BA78(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1ABA5BAA4();
  *a1 = v1;
}

uint64_t sub_1ABA5BAC0(uint64_t a1)
{
  if (a1)
    return sub_1ABA65474();
  else
    return 0;
}

uint64_t sub_1ABA5BB18(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1ABA5BB2C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1ABA5BB70(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_1ABA5BB2C(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_1ABA5BB9C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3AE80;
  if (!qword_1EEC3AE80)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3AE78);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3AE80);
    return v1;
  }
  return v3;
}

uint64_t sub_1ABA5BC0C(uint64_t result)
{
  if (result)
  {
    sub_1ABA65468();
    return sub_1ABA6545C();
  }
  return result;
}

uint64_t sub_1ABA5BC78()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1ABA5BCBC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1ABA5BD54;
  return sub_1ABA59B4C(a1, v5, v6, v7);
}

uint64_t sub_1ABA5BD54()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1ABA5BDB4()
{
  swift_release();
}

unint64_t sub_1ABA5BDDC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EEC3AE60;
  if (!qword_1EEC3AE60)
  {
    v0 = MEMORY[0x1AF433350](&unk_1ABAA1160, &unk_1E5A64E50);
    atomic_store(v0, (unint64_t *)&qword_1EEC3AE60);
    return v0;
  }
  return v2;
}

uint64_t type metadata accessor for UIUserInterfaceSizeClass()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_1EEC3DDE0;
  if (!qword_1EEC3DDE0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EEC3DDE0);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_1ABA5BEE4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3DDC8;
  if (!qword_1EEC3DDC8)
  {
    v0 = type metadata accessor for UIUserInterfaceSizeClass();
    v1 = MEMORY[0x1AF433350](&unk_1ABAA1304, v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3DDC8);
    return v1;
  }
  return v3;
}

unint64_t sub_1ABA5BF54()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EEC3DDD0;
  if (!qword_1EEC3DDD0)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EEC3DDD0);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1ABA5BFB8()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EEC3DDD8;
  if (!qword_1EEC3DDD8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EEC3DDD8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1ABA5C01C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1ABA5C04C(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;

  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF)
      goto LABEL_12;
    v5 = (a3 + 1);
  }
  else
  {
    v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL)
        v5 = (v6 | (a3 >> 12)) + 8487393;
      else
        v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
    }
  }
  v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0)
    return a1(&v8, v4);
  sub_1ABA654B0();
  __break(1u);
LABEL_12:
  result = sub_1ABA654A4();
  __break(1u);
  return result;
}

uint64_t sub_1ABA5C390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  unsigned int v11;
  uint64_t result;
  char v13[8];
  uint64_t v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  char *v16;
  uint64_t v17[2];
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = a11;
  v30 = "Fatal error";
  v31 = "Unexpectedly found nil while unwrapping an Optional value";
  v32 = "Swift/StaticString.swift";
  v33 = "Not enough bits to represent the passed value";
  v34 = "Swift/Integers.swift";
  v35 = "UnsafeBufferPointer with negative count";
  v36 = "Swift/UnsafeBufferPointer.swift";
  v37 = 0;
  v39 = a6;
  v40 = a7;
  v41 = a8;
  v42 = a1;
  v43 = a2;
  v44 = a10;
  v45 = a11;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = v17;
        MEMORY[0x1E0C80A78](v17, a2, v19, a4);
        v15 = sub_1ABA5CB74;
        v16 = &v38;
        sub_1ABA5C04C((uint64_t (*)(uint64_t *, uint64_t))sub_1ABA5CBB4, (uint64_t)v13, v11);
        return (uint64_t)v18;
      }
      v13[0] = 2;
      v14 = 148;
      LODWORD(v15) = 0;
      sub_1ABA654A4();
      __break(1u);
    }
    v13[0] = 2;
    v14 = 3455;
    LODWORD(v15) = 0;
    sub_1ABA654A4();
    __break(1u);
  }
  if (v23)
    v46 = v23;
  else
    v46 = 0;
  v17[0] = v46;
  if (!v46)
  {
    v13[0] = 2;
    v14 = 136;
    LODWORD(v15) = 0;
    sub_1ABA654A4();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_1ABA5C7E0(v17[0], v24, v25, v26, v27, v21, v22, v28, v20, v29);
  result = sub_1ABA654B0();
  __break(1u);
  return result;
}

uint64_t method lookup function for MessageUITipsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageUITipsManager.__allocating_init(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of MessageUITipsManager.controllerDidAppear()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0xD8))();
}

uint64_t dispatch thunk of MessageUITipsManager.controllerDidDisappear()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0xE0))();
}

uint64_t sub_1ABA5C7E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  unsigned int v10;
  uint64_t result;
  char v12[8];
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = "Fatal error";
  v30 = "Unexpectedly found nil while unwrapping an Optional value";
  v31 = "Swift/StaticString.swift";
  v32 = "Not enough bits to represent the passed value";
  v33 = "Swift/Integers.swift";
  v34 = "UnsafeBufferPointer with negative count";
  v35 = "Swift/UnsafeBufferPointer.swift";
  v36 = 0;
  v38 = a6;
  v39 = a7;
  v40 = a1;
  v41 = a2;
  v42 = a8;
  v43 = a10;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = &v16;
        MEMORY[0x1E0C80A78](&v16, a2, v19, a4);
        v14 = sub_1ABA5D124;
        v15 = &v37;
        sub_1ABA5C04C((uint64_t (*)(uint64_t *, uint64_t))sub_1ABA5CBB4, (uint64_t)v12, v10);
        return (uint64_t)v18;
      }
      v12[0] = 2;
      v13 = 148;
      LODWORD(v14) = 0;
      sub_1ABA654A4();
      __break(1u);
    }
    v12[0] = 2;
    v13 = 3455;
    LODWORD(v14) = 0;
    sub_1ABA654A4();
    __break(1u);
  }
  if (v23)
    v44 = v23;
  else
    v44 = 0;
  v17 = v44;
  if (!v44)
  {
    v12[0] = 2;
    v13 = 136;
    LODWORD(v14) = 0;
    sub_1ABA654A4();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_1ABA5CBDC(v17, v24, v25, v26, v21, v22, v27, v28);
  result = sub_1ABA654B0();
  __break(1u);
  return result;
}

uint64_t sub_1ABA5CB74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1ABA5C7E0(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), a3, *(_QWORD *)(v3 + 64));
}

uint64_t sub_1ABA5CBB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1ABA5C01C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1ABA5CBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t result;

  if (!a3)
  {
    sub_1ABA654A4();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_1ABA654A4();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_1ABA654A4();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF)
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                sub_1ABA654A4();
                __break(1u);
              }
              sub_1ABA654A4();
              __break(1u);
            }
            sub_1ABA654A4();
            __break(1u);
          }
          sub_1ABA654A4();
          __break(1u);
        }
        sub_1ABA654A4();
        __break(1u);
      }
      sub_1ABA654A4();
      __break(1u);
    }
    sub_1ABA654A4();
    __break(1u);
  }
  result = sub_1ABA654A4();
  __break(1u);
  return result;
}

uint64_t sub_1ABA5D124(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1ABA5CBDC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_1ABA5D140(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1ABA5D1C4;
  return v5(a1);
}

uint64_t sub_1ABA5D1C4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

void sub_1ABA5D228()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_1ABA5D234(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1ABA6542C();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_1ABA5D2A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1ABA5D2E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int *v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(int **)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1ABA5BD54;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEC3DDE8 + dword_1EEC3DDE8))(a1, v5);
}

uint64_t sub_1ABA5D39C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1ABA65360();
  qword_1EEC3E4F8 = result;
  qword_1EEC3E500 = v1;
  return result;
}

uint64_t *sub_1ABA5D3DC()
{
  if (qword_1EEC3E4F0 != -1)
    swift_once();
  return &qword_1EEC3E4F8;
}

uint64_t sub_1ABA5D430()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1ABA65360();
  qword_1EEC3E510 = result;
  qword_1EEC3E518 = v1;
  return result;
}

uint64_t *sub_1ABA5D470()
{
  if (qword_1EEC3E508 != -1)
    swift_once();
  return &qword_1EEC3E510;
}

uint64_t PhotoPickerItem.assetIdentifier.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_assetIdentifier);
  sub_1ABA65210();
  return v2;
}

void *PhotoPickerItem.assetURL.getter@<X0>(void *a1@<X8>)
{
  uint64_t v1;

  return sub_1ABA5D6A4((const void *)(v1 + OBJC_IVAR___MFComposePhotoPickerItem_assetURL), a1);
}

void *sub_1ABA5D6A4(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1ABA650B4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE00);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t PhotoPickerItem.assetData.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_assetData);
  sub_1ABA5D8EC(v2, *(_QWORD *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_assetData + 8));
  return v2;
}

uint64_t sub_1ABA5D864(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_release();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1ABA5D8EC(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000)
    return sub_1ABA5D934(result, a2);
  return result;
}

uint64_t sub_1ABA5D934(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_retain();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t PhotoPickerItem.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR___MFComposePhotoPickerItem_contentType;
  v2 = sub_1ABA65168();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t PhotoPickerItem.contentIdentifier.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_contentIdentifier);
  sub_1ABA65210();
  return v2;
}

uint64_t sub_1ABA5DBC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  int v17;
  uint64_t v18;

  v18 = 0;
  v15 = sub_1ABA65168();
  v12 = *(_QWORD *)(v15 - 8);
  v9 = *(_QWORD *)(v12 + 64);
  v8 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v15, v0, v15, v1);
  v13 = (char *)&v7 - v8;
  v10 = v8;
  MEMORY[0x1E0C80A78]((char *)&v7 - v8, v2, v3, v4);
  v14 = (char *)&v7 - v10;
  v18 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - v10, v11 + OBJC_IVAR___MFComposePhotoPickerItem_contentType);
  sub_1ABA65150();
  v17 = sub_1ABA6515C();
  v16 = *(void (**)(char *, uint64_t))(v12 + 8);
  v16(v13, v15);
  v16(v14, v15);
  return v17 & 1;
}

uint64_t sub_1ABA5DCD8()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1ABA65360();
  qword_1EEC3E528 = result;
  qword_1EEC3E530 = v1;
  return result;
}

uint64_t *sub_1ABA5DD18()
{
  if (qword_1EEC3E520 != -1)
    swift_once();
  return &qword_1EEC3E528;
}

uint64_t static PhotoPickerItem.contentIdentifierPrefix.getter()
{
  uint64_t v1;

  v1 = *sub_1ABA5DD18();
  sub_1ABA65210();
  return v1;
}

id PhotoPickerItem.__allocating_init(assetIdentifier:assetURL:assetData:contentType:)(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  objc_class *v6;
  id v7;

  v7 = objc_allocWithZone(v6);
  return PhotoPickerItem.init(assetIdentifier:assetURL:assetData:contentType:)(a1, a2, a3, a4, a5, a6);
}

id PhotoPickerItem.init(assetIdentifier:assetURL:assetData:contentType:)(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  objc_class *v36;
  id v37;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  int v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  const void *v67;
  uint64_t v68;
  id v69;
  objc_super v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;

  v48 = a1;
  v68 = a2;
  v67 = a3;
  v65 = a4;
  v66 = a5;
  v64 = a6;
  v82 = 0;
  v80 = 0;
  v81 = 0;
  v79 = 0;
  v77 = 0;
  v78 = 0;
  v76 = 0;
  v60 = 0;
  v63 = sub_1ABA65168();
  v62 = *(_QWORD *)(v63 - 8);
  v40 = (*(_QWORD *)(v62 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v63, v7, v8, v9);
  v58 = (char *)&v39 - v40;
  v41 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE00) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x1E0C80A78](v48, v68, v67, v65);
  v42 = (char *)&v39 - v41;
  v80 = v10;
  v81 = v11;
  v79 = v12;
  v77 = v13;
  v78 = v14;
  v76 = v15;
  v16 = v6;
  v17 = v6;
  v18 = v6;
  v19 = v6;
  v20 = v6;
  v82 = v6;
  sub_1ABA65210();
  v21 = v68;
  v22 = &v6[OBJC_IVAR___MFComposePhotoPickerItem_assetIdentifier];
  *(_QWORD *)v22 = v48;
  *((_QWORD *)v22 + 1) = v21;

  sub_1ABA5D6A4(v67, v42);
  sub_1ABA5E2EC(v42, &v6[OBJC_IVAR___MFComposePhotoPickerItem_assetURL]);

  sub_1ABA5D8EC(v65, v66);
  v23 = v59;
  v24 = v66;
  v25 = &v59[OBJC_IVAR___MFComposePhotoPickerItem_assetData];
  *(_QWORD *)v25 = v65;
  *((_QWORD *)v25 + 1) = v24;

  v26 = sub_1ABA654D4();
  v55 = &v74;
  v74 = v26;
  v75 = v27;
  v52 = "";
  v53 = 1;
  sub_1ABA65360();
  v43 = v28;
  sub_1ABA654C8();
  swift_bridgeObjectRelease();
  v29 = sub_1ABA5DD18();
  v44 = *v29;
  v45 = v29[1];
  sub_1ABA65210();
  v46 = v73;
  v73[0] = v44;
  v73[1] = v45;
  v49 = MEMORY[0x1E0DEA968];
  v50 = MEMORY[0x1E0DEA9D8];
  v51 = MEMORY[0x1E0DEA9D0];
  sub_1ABA654BC();
  sub_1ABA5E3A8();
  sub_1ABA65360();
  v47 = v30;
  sub_1ABA654C8();
  swift_bridgeObjectRelease();
  v71 = v48;
  v72 = v68;
  sub_1ABA654BC();
  sub_1ABA65360();
  v54 = v31;
  sub_1ABA654C8();
  v32 = v59;
  swift_bridgeObjectRelease();
  v57 = v74;
  v56 = v75;
  sub_1ABA65210();
  sub_1ABA5E3A8();
  v33 = sub_1ABA65354();
  v34 = (uint64_t *)&v32[OBJC_IVAR___MFComposePhotoPickerItem_contentIdentifier];
  *v34 = v33;
  v34[1] = v35;

  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v58, v64, v63);
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v32[OBJC_IVAR___MFComposePhotoPickerItem_contentType], v58, v63);

  v61 = v82;
  v36 = (objc_class *)type metadata accessor for PhotoPickerItem();
  v70.receiver = v61;
  v70.super_class = v36;
  v69 = objc_msgSendSuper2(&v70, sel_init);
  v37 = v69;
  v82 = v69;
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v64, v63);
  sub_1ABA5E434(v65, v66);
  sub_1ABA5E47C((uint64_t)v67);
  swift_bridgeObjectRelease();

  return v69;
}

void *sub_1ABA5E2EC(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1ABA650B4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE00);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1ABA5E3A8()
{
  swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for PhotoPickerItem()
{
  uint64_t v1;

  v1 = qword_1EEC3E538;
  if (!qword_1EEC3E538)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_1ABA5E434(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000)
    return sub_1ABA5D864(result, a2);
  return result;
}

uint64_t sub_1ABA5E47C(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1ABA650B4();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_1ABA5E778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  unint64_t v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  char *v80;

  v43 = a2;
  v52 = a1;
  v80 = 0;
  v79 = 0;
  v78 = 0;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE08);
  v44 = (*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v2, v3, v4, v5);
  v45 = (uint64_t)v40 - v44;
  v46 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)v40 - v44, v7, v8, v9);
  v47 = (uint64_t)v40 - v46;
  v48 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)v40 - v46, v11, v12, v13);
  v49 = (uint64_t)v40 - v48;
  v50 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]((char *)v40 - v48, v15, v16, v17);
  v64 = (uint64_t)v40 - v50;
  v53 = sub_1ABA65168();
  v54 = *(_QWORD *)(v53 - 8);
  v60 = *(_QWORD *)(v54 + 64);
  v55 = (v60 + 15) & 0xFFFFFFFFFFFFFFF0;
  v21 = MEMORY[0x1E0C80A78](v52, v18, v19, v20);
  v56 = (char *)v40 - v55;
  v80 = (char *)v40 - v55;
  v57 = (v60 + 15) & 0xFFFFFFFFFFFFFFF0;
  v25 = MEMORY[0x1E0C80A78](v21, v22, v23, v24);
  v58 = (char *)v40 - v57;
  v79 = (char *)v40 - v57;
  v59 = (v60 + 15) & 0xFFFFFFFFFFFFFFF0;
  v29 = MEMORY[0x1E0C80A78](v25, v26, v27, v28);
  v61 = (char *)v40 - v59;
  v78 = (char *)v40 - v59;
  v62 = (v60 + 15) & 0xFFFFFFFFFFFFFFF0;
  v33 = MEMORY[0x1E0C80A78](v29, v30, v31, v32);
  v63 = (char *)v40 - v62;
  v77 = (char *)v40 - v62;
  v76 = v33;
  v75 = v34;
  v74 = v33;
  v65 = &v69;
  v70 = v34;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE10);
  v67 = sub_1ABA5EFA0();
  sub_1ABA6539C();
  v68 = 0;
  v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
  if (v42(v64, 1, v53) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v63, v64, v53);
    (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v43, v63, v53);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v43, 0, 1, v53);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v63, v53);
  }
  v36 = v68;
  sub_1ABA5F010(v64);
  v73 = v52;
  v40[1] = v40;
  MEMORY[0x1E0C80A78](v40, v37, v66, v67);
  v40[-2] = v51;
  result = sub_1ABA6539C();
  v41 = v36;
  if (v36)
  {
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    return result;
  }
  if (v42(v49, 1, v53) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v61, v49, v53);
    (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v43, v61, v53);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v43, 0, 1, v53);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v61, v53);
  }
  v38 = v41;
  sub_1ABA5F010(v49);
  v72 = v52;
  result = sub_1ABA6539C();
  v40[0] = v38;
  if (v38)
    goto LABEL_14;
  if (v42(v47, 1, v53) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v58, v47, v53);
    (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v43, v58, v53);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v43, 0, 1, v53);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v58, v53);
  }
  v39 = v40[0];
  sub_1ABA5F010(v47);
  v71 = v52;
  result = sub_1ABA6539C();
  if (v39)
    goto LABEL_15;
  if (v42(v45, 1, v53) == 1)
  {
    sub_1ABA5F010(v45);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56))(v43, 1, 1, v53);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v56, v45, v53);
    (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v43, v56, v53);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v43, 0, 1, v53);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v56, v53);
  }
}

uint64_t sub_1ABA5EEE0()
{
  char v1;

  sub_1ABA65120();
  sub_1ABA5D3DC();
  sub_1ABA65210();
  v1 = sub_1ABA6536C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1ABA5EF78()
{
  return sub_1ABA5EEE0() & 1;
}

unint64_t sub_1ABA5EFA0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3DE18;
  if (!qword_1EEC3DE18)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3DE10);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3DE18);
    return v1;
  }
  return v3;
}

uint64_t sub_1ABA5F010(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1ABA65168();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_1ABA5F080()
{
  char v1;

  sub_1ABA65120();
  sub_1ABA5D470();
  sub_1ABA65210();
  v1 = sub_1ABA6536C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1ABA5F118()
{
  return sub_1ABA5F080() & 1;
}

uint64_t sub_1ABA5F140(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;

  v12 = 0;
  v9 = sub_1ABA65168();
  v8 = *(_QWORD *)(v9 - 8);
  v7 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v9, v2, v3, v4);
  v10 = (char *)&v6 - v7;
  v12 = a1;
  sub_1ABA65150();
  v11 = sub_1ABA6515C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v9);
  return v11 & 1;
}

uint64_t sub_1ABA5F1F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;

  v12 = 0;
  v9 = sub_1ABA65168();
  v8 = *(_QWORD *)(v9 - 8);
  v7 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v9, v2, v3, v4);
  v10 = (char *)&v6 - v7;
  v12 = a1;
  sub_1ABA65144();
  v11 = sub_1ABA6515C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v9);
  return v11 & 1;
}

uint64_t sub_1ABA5F3D0()
{
  uint64_t v1;
  char v3;

  sub_1ABA5DD18();
  sub_1ABA65210();
  v3 = sub_1ABA65384();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
    return 0;
  sub_1ABA65210();
  sub_1ABA5DD18();
  sub_1ABA65210();
  sub_1ABA65378();
  swift_bridgeObjectRelease();
  sub_1ABA5F520();
  sub_1ABA65444();
  v1 = MEMORY[0x1AF43200C]();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1ABA5F520()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EEC3DE20;
  if (!qword_1EEC3DE20)
  {
    v0 = MEMORY[0x1AF433350](MEMORY[0x1E0DEA9A8], MEMORY[0x1E0DEA968]);
    atomic_store(v0, (unint64_t *)&qword_1EEC3DE20);
    return v0;
  }
  return v2;
}

id PhotoPickerItem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t PhotoPickerItem.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"MessageUI.PhotoPickerItem")
  {
    sub_1ABA654A4();
    __break(1u);
  }
  result = sub_1ABA5C390((uint64_t)"MessageUI.PhotoPickerItem", 25, (unint64_t)"init()", 6, 2, (unint64_t)"MessageUI/PhotoPickerItem.swift", 31, 2, v1, 0xCuLL, 0xEuLL);
  __break(1u);
  return result;
}

id PhotoPickerItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoPickerItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1ABA5F8A4(uint64_t a1)
{
  if ((*(_QWORD *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000)
    sub_1ABA5D864(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_1ABA5F8F4()
{
  return type metadata accessor for PhotoPickerItem();
}

uint64_t sub_1ABA5F90C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t updated;

  updated = sub_1ABA5FAC0();
  if (v0 <= 0x3F)
  {
    updated = sub_1ABA65168();
    if (v1 <= 0x3F)
    {
      updated = swift_updateClassMetadata2();
      if (!updated)
        return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for PhotoPickerItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotoPickerItem.isVideo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x78))() & 1;
}

uint64_t dispatch thunk of PhotoPickerItem.__allocating_init(assetIdentifier:assetURL:assetData:contentType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of static PhotoPickerItem.bestTypeToLoad(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of static PhotoPickerItem.assetIdentifierFromContentIdentifier(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_1ABA5FAC0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;

  v4 = qword_1EEC3DE28;
  if (!qword_1EEC3DE28)
  {
    sub_1ABA650B4();
    v3 = sub_1ABA65480();
    v4 = v3;
    if (!v0)
    {
      v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_1EEC3DE28);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_1ABA5FB64()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EEC3DE38;
  if (!qword_1EEC3DE38)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EEC3DE38);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1ABA5FBC8()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR___MFComposePhotoPickerProgressManager_progresses);
  swift_beginAccess();
  v3 = *v2;
  sub_1ABA65210();
  swift_endAccess();
  return v3;
}

uint64_t sub_1ABA5FC2C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  sub_1ABA65210();
  v3 = (_QWORD *)(v1 + OBJC_IVAR___MFComposePhotoPickerProgressManager_progresses);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1ABA5FCAC())()
{
  swift_beginAccess();
  return sub_1ABA58CE8;
}

uint64_t sub_1ABA5FD50()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v3;
  int v4;

  v3 = (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x58))();
  v1 = sub_1ABA5FB64();
  v4 = MEMORY[0x1AF431F88](v3, MEMORY[0x1E0DEA968], v1, MEMORY[0x1E0DEA978]);
  swift_bridgeObjectRelease();
  return (v4 ^ 1) & 1;
}

uint64_t sub_1ABA5FDD4(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t (*v8)(char *, _QWORD);
  void (*v9)(char *, _QWORD);
  _QWORD *v11;
  uint64_t v14;
  void *v15;
  char v16[32];
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  char v21[32];
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v20 = 0;
  v30 = a1;
  v28 = a2;
  v29 = a3;
  v27 = v3;
  v4 = sub_1ABA65210();
  v14 = (*(uint64_t (**)(uint64_t))((*v3 & *MEMORY[0x1E0DEEDD8]) + 0x58))(v4);
  v25[0] = a2;
  v25[1] = a3;
  v5 = sub_1ABA5FB64();
  MEMORY[0x1AF431FA0](&v26, v25, v14, MEMORY[0x1E0DEA968], v5, MEMORY[0x1E0DEA978]);
  sub_1ABA5E3A8();
  v15 = v26;
  if (v26)
  {
    v20 = v26;
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_cancel);
    v17 = a2;
    v18 = a3;
    v9 = (void (*)(char *, _QWORD))(*(uint64_t (**)(void))((*v11 & *MEMORY[0x1E0DEEDD8]) + 0x68))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE48);
    sub_1ABA652F4();
    v9(v16, 0);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1ABA65210();
  v6 = a1;
  v24 = a1;
  v22 = a2;
  v23 = a3;
  v8 = (uint64_t (*)(char *, _QWORD))(*(uint64_t (**)(void))((*v11 & *MEMORY[0x1E0DEEDD8]) + 0x68))();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE48);
  sub_1ABA65330();
  return v8(v21, 0);
}

uint64_t sub_1ABA600AC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  v13 = v2;
  v3 = sub_1ABA65210();
  v9 = (*(uint64_t (**)(uint64_t))((*v2 & *MEMORY[0x1E0DEEDD8]) + 0x58))(v3);
  v11[0] = a1;
  v11[1] = a2;
  v4 = sub_1ABA5FB64();
  MEMORY[0x1AF431FA0](&v12, v11, v9, MEMORY[0x1E0DEA968], v4, MEMORY[0x1E0DEA978]);
  sub_1ABA5E3A8();
  v10 = v12;
  if (v12)
  {
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

void sub_1ABA60240(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  void (*v5)(char *, _QWORD);
  _QWORD *v6;
  uint64_t v9;
  void *v10;
  char v11[32];
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[2];
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v15 = 0;
  v19 = a1;
  v20 = a2;
  v18 = v2;
  v3 = sub_1ABA65210();
  v9 = (*(uint64_t (**)(uint64_t))((*v2 & *MEMORY[0x1E0DEEDD8]) + 0x58))(v3);
  v16[0] = a1;
  v16[1] = a2;
  v4 = sub_1ABA5FB64();
  MEMORY[0x1AF431FA0](&v17, v16, v9, MEMORY[0x1E0DEA968], v4, MEMORY[0x1E0DEA978]);
  sub_1ABA5E3A8();
  v10 = v17;
  if (v17)
  {
    v15 = v17;
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_cancel);
    v12 = a1;
    v13 = a2;
    v5 = (void (*)(char *, _QWORD))(*(uint64_t (**)(void))((*v6 & *MEMORY[0x1E0DEEDD8]) + 0x68))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE48);
    sub_1ABA652F4();
    v5(v11, 0);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1ABA60450()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t (*v2)(_BYTE *, _QWORD);
  _QWORD *v3;
  uint64_t v4;
  unsigned int v5;
  _BYTE v6[32];
  uint64_t v7;
  _QWORD *v8;

  v8 = v0;
  v4 = (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x58))();
  sub_1ABA5FB64();
  v5 = MEMORY[0x1AF431F88](v4, MEMORY[0x1E0DEA968]);
  swift_bridgeObjectRelease();
  result = v5;
  if ((v5 & 1) == 0)
  {
    v7 = (*(uint64_t (**)(void))((*v3 & *MEMORY[0x1E0DEEDD8]) + 0x58))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE48);
    sub_1ABA60628();
    sub_1ABA653A8();
    sub_1ABA57AB4();
    v2 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(void))((*v3 & *MEMORY[0x1E0DEEDD8]) + 0x68))();
    sub_1ABA60698();
    sub_1ABA65318();
    return v2(v6, 0);
  }
  return result;
}

id sub_1ABA605D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 16), sel_cancel);
}

unint64_t sub_1ABA60628()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EEC3DE50;
  if (!qword_1EEC3DE50)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEC3DE48);
    v1 = MEMORY[0x1AF433350](MEMORY[0x1E0DEA0D0], v0);
    atomic_store(v1, (unint64_t *)&qword_1EEC3DE50);
    return v1;
  }
  return v3;
}

uint64_t sub_1ABA60698()
{
  return 0;
}

id PhotoPickerProgressManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PhotoPickerProgressManager.init()()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v4;
  char *v5;
  id v6;
  objc_super v7;
  void *v8;

  v1 = v0;
  v8 = v0;
  v4 = OBJC_IVAR___MFComposePhotoPickerProgressManager_progresses;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE30);
  sub_1ABA654E0();
  sub_1ABA5FB64();
  *(_QWORD *)&v5[v4] = sub_1ABA65300();

  v7.receiver = v8;
  v7.super_class = (Class)type metadata accessor for PhotoPickerProgressManager();
  v6 = objc_msgSendSuper2(&v7, sel_init);
  v2 = v6;
  v8 = v6;

  return v6;
}

uint64_t type metadata accessor for PhotoPickerProgressManager()
{
  return objc_opt_self();
}

id PhotoPickerProgressManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoPickerProgressManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PhotoPickerProgressManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.hasAnyProgress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x70))() & 1;
}

uint64_t dispatch thunk of PhotoPickerProgressManager.setProgress(_:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x78))();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.progress(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x80))();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.cancelProgress(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x88))();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.cancelEverything()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x90))();
}

uint64_t SwiftHelloMessageUI.world.getter()
{
  return sub_1ABA65360();
}

Swift::String __swiftcall SwiftHelloMessageUI.world(truncated:)(Swift::Int truncated)
{
  void *v1;
  uint64_t v2;
  void *v3;
  Swift::String result;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;

  SwiftHelloMessageUI.world.getter();
  v12 = (void *)sub_1ABA6533C();
  v13 = objc_msgSend(v12, sel_mf_substringTruncatedToIndex_, truncated);

  swift_bridgeObjectRelease();
  if (v13)
  {
    v7 = sub_1ABA65348();
    v8 = v1;

    v9 = v7;
    v10 = v8;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  if (v10)
  {
    v5 = v9;
    v6 = v10;
  }
  else
  {
    sub_1ABA654A4();
    __break(1u);
  }
  v2 = v5;
  v3 = v6;
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

id SwiftHelloMessageUI.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SwiftHelloMessageUI.init()()
{
  void *v0;
  id v1;
  id v3;
  objc_super v4;
  id v5;

  v5 = v0;
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v4, sel_init);
  v1 = v3;
  v5 = v3;

  return v3;
}

id SwiftHelloMessageUI.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SwiftHelloMessageUI()
{
  return objc_opt_self();
}

uint64_t sub_1ABA60D58()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1ABA60D7C()
{
  sub_1ABA60D58();
  return swift_deallocClassInstance();
}

uint64_t sub_1ABA60DB8()
{
  swift_allocObject();
  return sub_1ABA60D58();
}

id sub_1ABA60DF0()
{
  id result;

  sub_1ABA63030();
  type metadata accessor for ResourceBundleClass();
  result = sub_1ABA60E34();
  qword_1EEC3E550 = (uint64_t)result;
  return result;
}

id sub_1ABA60E34()
{
  uint64_t ObjCClassFromMetadata;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
}

uint64_t *sub_1ABA60E78()
{
  if (qword_1EEC3E548 != -1)
    swift_once();
  return &qword_1EEC3E550;
}

uint64_t sub_1ABA60ECC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E690);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E690);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA60F58()
{
  uint64_t v0;

  if (qword_1EEC3E558 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E690);
}

uint64_t sub_1ABA60FB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA60F58();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA60FFC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E6A8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E6A8);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61088()
{
  uint64_t v0;

  if (qword_1EEC3E560 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E6A8);
}

uint64_t sub_1ABA610E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61088();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6112C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E6C0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E6C0);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA611B8()
{
  uint64_t v0;

  if (qword_1EEC3E568 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E6C0);
}

uint64_t sub_1ABA61218@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA611B8();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6125C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E6D8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E6D8);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA612E8()
{
  uint64_t v0;

  if (qword_1EEC3E570 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E6D8);
}

uint64_t sub_1ABA61348@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA612E8();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6138C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E6F0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E6F0);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61418()
{
  uint64_t v0;

  if (qword_1EEC3E578 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E6F0);
}

uint64_t sub_1ABA61478@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61418();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA614BC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E708);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E708);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61548()
{
  uint64_t v0;

  if (qword_1EEC3E580 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E708);
}

uint64_t sub_1ABA615A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61548();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA615EC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E720);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E720);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61678()
{
  uint64_t v0;

  if (qword_1EEC3E588 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E720);
}

uint64_t sub_1ABA616D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61678();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6171C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E738);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E738);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA617A8()
{
  uint64_t v0;

  if (qword_1EEC3E590 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E738);
}

uint64_t sub_1ABA61808@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA617A8();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6184C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E750);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E750);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA618D8()
{
  uint64_t v0;

  if (qword_1EEC3E598 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E750);
}

uint64_t sub_1ABA61938@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA618D8();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6197C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E768);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E768);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61A08()
{
  uint64_t v0;

  if (qword_1EEC3E5A0 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E768);
}

uint64_t sub_1ABA61A68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61A08();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA61AAC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA650FC();
  __swift_allocate_value_buffer(v2, qword_1EEC3E780);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E780);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61B38()
{
  uint64_t v0;

  if (qword_1EEC3E5A8 != -1)
    swift_once();
  v0 = sub_1ABA650FC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E780);
}

uint64_t sub_1ABA61B98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61B38();
  v1 = sub_1ABA650FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA61BDC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E798);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E798);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61C68()
{
  uint64_t v0;

  if (qword_1EEC3E5B0 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E798);
}

uint64_t sub_1ABA61CC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61C68();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA61D0C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E7B0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E7B0);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61D98()
{
  uint64_t v0;

  if (qword_1EEC3E5B8 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E7B0);
}

uint64_t sub_1ABA61DF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61D98();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA61E3C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E7C8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E7C8);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61EC8()
{
  uint64_t v0;

  if (qword_1EEC3E5C0 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E7C8);
}

uint64_t sub_1ABA61F28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61EC8();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA61F6C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E7E0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E7E0);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA61FF8()
{
  uint64_t v0;

  if (qword_1EEC3E5C8 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E7E0);
}

uint64_t sub_1ABA62058@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA61FF8();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6209C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E7F8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E7F8);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62128()
{
  uint64_t v0;

  if (qword_1EEC3E5D0 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E7F8);
}

uint64_t sub_1ABA62188@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62128();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA621CC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E810);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E810);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62258()
{
  uint64_t v0;

  if (qword_1EEC3E5D8 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E810);
}

uint64_t sub_1ABA622B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62258();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA622FC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E828);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E828);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62388()
{
  uint64_t v0;

  if (qword_1EEC3E5E0 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E828);
}

uint64_t sub_1ABA623E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62388();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6242C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E840);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E840);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA624B8()
{
  uint64_t v0;

  if (qword_1EEC3E5E8 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E840);
}

uint64_t sub_1ABA62518@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA624B8();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6255C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E858);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E858);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA625E8()
{
  uint64_t v0;

  if (qword_1EEC3E5F0 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E858);
}

uint64_t sub_1ABA62648@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA625E8();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA6268C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E870);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E870);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62718()
{
  uint64_t v0;

  if (qword_1EEC3E5F8 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E870);
}

uint64_t sub_1ABA62778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62718();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA627BC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E888);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E888);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62848()
{
  uint64_t v0;

  if (qword_1EEC3E600 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E888);
}

uint64_t sub_1ABA628A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62848();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA628EC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E8A0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E8A0);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62978()
{
  uint64_t v0;

  if (qword_1EEC3E608 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E8A0);
}

uint64_t sub_1ABA629D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62978();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA62A1C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E8B8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E8B8);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62AA8()
{
  uint64_t v0;

  if (qword_1EEC3E610 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E8B8);
}

uint64_t sub_1ABA62B08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62AA8();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA62B4C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E8D0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E8D0);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62BD8()
{
  uint64_t v0;

  if (qword_1EEC3E618 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E8D0);
}

uint64_t sub_1ABA62C38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62BD8();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA62C7C()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E8E8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E8E8);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62D08()
{
  uint64_t v0;

  if (qword_1EEC3E620 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E8E8);
}

uint64_t sub_1ABA62D68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62D08();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA62DAC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E900);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E900);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62E38()
{
  uint64_t v0;

  if (qword_1EEC3E628 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E900);
}

uint64_t sub_1ABA62E98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62E38();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1ABA62EDC()
{
  id v0;
  uint64_t v2;

  v2 = sub_1ABA65114();
  __swift_allocate_value_buffer(v2, qword_1EEC3E918);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC3E918);
  sub_1ABA65360();
  v0 = (id)*sub_1ABA60E78();
  return sub_1ABA650F0();
}

uint64_t sub_1ABA62F68()
{
  uint64_t v0;

  if (qword_1EEC3E630 != -1)
    swift_once();
  v0 = sub_1ABA65114();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC3E918);
}

uint64_t sub_1ABA62FC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1ABA62F68();
  v1 = sub_1ABA65114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

unint64_t sub_1ABA63030()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EEC3B000;
  if (!qword_1EEC3B000)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EEC3B000);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1ABA65054()
{
  return MEMORY[0x1E0CAF7E0]();
}

uint64_t sub_1ABA65060()
{
  return MEMORY[0x1E0CAF7E8]();
}

uint64_t sub_1ABA6506C()
{
  return MEMORY[0x1E0CAF7F8]();
}

uint64_t sub_1ABA65078()
{
  return MEMORY[0x1E0CAF818]();
}

uint64_t sub_1ABA65084()
{
  return MEMORY[0x1E0CAF8A0]();
}

uint64_t sub_1ABA65090()
{
  return MEMORY[0x1E0CAF8A8]();
}

uint64_t sub_1ABA6509C()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1ABA650A8()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1ABA650B4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1ABA650C0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1ABA650CC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1ABA650D8()
{
  return MEMORY[0x1E0DEFC78]();
}

uint64_t sub_1ABA650E4()
{
  return MEMORY[0x1E0DEFC80]();
}

uint64_t sub_1ABA650F0()
{
  return MEMORY[0x1E0CA9B80]();
}

uint64_t sub_1ABA650FC()
{
  return MEMORY[0x1E0CA9B90]();
}

uint64_t sub_1ABA65108()
{
  return MEMORY[0x1E0CA9B98]();
}

uint64_t sub_1ABA65114()
{
  return MEMORY[0x1E0CA9BA8]();
}

uint64_t sub_1ABA65120()
{
  return MEMORY[0x1E0DF0190]();
}

uint64_t sub_1ABA6512C()
{
  return MEMORY[0x1E0DF01F8]();
}

uint64_t sub_1ABA65138()
{
  return MEMORY[0x1E0DF0220]();
}

uint64_t sub_1ABA65144()
{
  return MEMORY[0x1E0DF02C8]();
}

uint64_t sub_1ABA65150()
{
  return MEMORY[0x1E0DF02D0]();
}

uint64_t sub_1ABA6515C()
{
  return MEMORY[0x1E0DF0308]();
}

uint64_t sub_1ABA65168()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1ABA65174()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1ABA65180()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1ABA6518C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1ABA65198()
{
  return MEMORY[0x1E0CE9288]();
}

uint64_t sub_1ABA651A4()
{
  return MEMORY[0x1E0CE92B0]();
}

uint64_t sub_1ABA651B0()
{
  return MEMORY[0x1E0CE92E8]();
}

uint64_t sub_1ABA651BC()
{
  return MEMORY[0x1E0CE9300]();
}

uint64_t sub_1ABA651C8()
{
  return MEMORY[0x1E0CE9318]();
}

uint64_t sub_1ABA651D4()
{
  return MEMORY[0x1E0CE9330]();
}

uint64_t sub_1ABA651E0()
{
  return MEMORY[0x1E0CE9340]();
}

uint64_t sub_1ABA651EC()
{
  return MEMORY[0x1E0CE9350]();
}

uint64_t sub_1ABA651F8()
{
  return MEMORY[0x1E0CE93F8]();
}

uint64_t sub_1ABA65204()
{
  return MEMORY[0x1E0CE9420]();
}

uint64_t sub_1ABA65210()
{
  return MEMORY[0x1E0CE9430]();
}

uint64_t sub_1ABA6521C()
{
  return MEMORY[0x1E0CE9458]();
}

uint64_t sub_1ABA65228()
{
  return MEMORY[0x1E0CE94D8]();
}

uint64_t sub_1ABA65234()
{
  return MEMORY[0x1E0CE94F8]();
}

uint64_t sub_1ABA65240()
{
  return MEMORY[0x1E0CE9510]();
}

uint64_t sub_1ABA6524C()
{
  return MEMORY[0x1E0CE9588]();
}

uint64_t sub_1ABA65258()
{
  return MEMORY[0x1E0CE95C8]();
}

uint64_t sub_1ABA65264()
{
  return MEMORY[0x1E0CE95F0]();
}

uint64_t sub_1ABA65270()
{
  return MEMORY[0x1E0CE9630]();
}

uint64_t sub_1ABA6527C()
{
  return MEMORY[0x1E0CE9740]();
}

uint64_t sub_1ABA65288()
{
  return MEMORY[0x1E0CE9760]();
}

uint64_t sub_1ABA65294()
{
  return MEMORY[0x1E0CE9778]();
}

uint64_t sub_1ABA652A0()
{
  return MEMORY[0x1E0CE9780]();
}

uint64_t sub_1ABA652AC()
{
  return MEMORY[0x1E0CE9798]();
}

uint64_t sub_1ABA652B8()
{
  return MEMORY[0x1E0CE97C8]();
}

uint64_t sub_1ABA652C4()
{
  return MEMORY[0x1E0CE98A8]();
}

uint64_t sub_1ABA652D0()
{
  return MEMORY[0x1E0CE98C0]();
}

uint64_t sub_1ABA652DC()
{
  return MEMORY[0x1E0CE98E8]();
}

uint64_t sub_1ABA652E8()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1ABA652F4()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_1ABA65300()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1ABA6530C()
{
  return MEMORY[0x1E0DE9FC8]();
}

uint64_t sub_1ABA65318()
{
  return MEMORY[0x1E0DEA040]();
}

uint64_t sub_1ABA65324()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1ABA65330()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1ABA6533C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1ABA65348()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1ABA65354()
{
  return MEMORY[0x1E0DEA708]();
}

uint64_t sub_1ABA65360()
{
  return MEMORY[0x1E0DEA718]();
}

uint64_t sub_1ABA6536C()
{
  return MEMORY[0x1E0DEA730]();
}

uint64_t sub_1ABA65378()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1ABA65384()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1ABA65390()
{
  return MEMORY[0x1E0DEAA30]();
}

uint64_t sub_1ABA6539C()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_1ABA653A8()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1ABA653B4()
{
  return MEMORY[0x1E0DEABC0]();
}

uint64_t sub_1ABA653C0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1ABA653CC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1ABA653D8()
{
  return MEMORY[0x1E0DEADF8]();
}

uint64_t sub_1ABA653E4()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1ABA653F0()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1ABA653FC()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1ABA65408()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1ABA65414()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1ABA65420()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1ABA6542C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1ABA65438()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1ABA65444()
{
  return MEMORY[0x1E0DEB678]();
}

uint64_t sub_1ABA65450()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1ABA6545C()
{
  return MEMORY[0x1E0DEB8C8]();
}

uint64_t sub_1ABA65468()
{
  return MEMORY[0x1E0DEB8E8]();
}

uint64_t sub_1ABA65474()
{
  return MEMORY[0x1E0DEB908]();
}

uint64_t sub_1ABA65480()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1ABA6548C()
{
  return MEMORY[0x1E0DF0C00]();
}

uint64_t sub_1ABA65498()
{
  return MEMORY[0x1E0DF0C18]();
}

uint64_t sub_1ABA654A4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1ABA654B0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1ABA654BC()
{
  return MEMORY[0x1E0DED558]();
}

uint64_t sub_1ABA654C8()
{
  return MEMORY[0x1E0DED560]();
}

uint64_t sub_1ABA654D4()
{
  return MEMORY[0x1E0DED568]();
}

uint64_t sub_1ABA654E0()
{
  return MEMORY[0x1E0DED5E8]();
}

uint64_t sub_1ABA654EC()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t ABAddressBookCopyArrayOfUIDsMatchingEmailAddress()
{
  return MEMORY[0x1E0CF5678]();
}

uint64_t ABAddressBookCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint()
{
  return MEMORY[0x1E0CF5680]();
}

CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef label)
{
  return (CFStringRef)MEMORY[0x1E0CF56A8](label);
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x1E0CF5710](options, error);
}

ABAuthorizationStatus ABAddressBookGetAuthorizationStatus(void)
{
  return MEMORY[0x1E0CF5778]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x1E0CF57A8](addressBook, *(_QWORD *)&recordID);
}

uint64_t ABAddressBookRegisterChangeCallback()
{
  return MEMORY[0x1E0CF5818]();
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  MEMORY[0x1E0CF5820](addressBook, callback, context);
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
  MEMORY[0x1E0CF5840](addressBook);
}

uint64_t ABAddressBookUnregisterChangeCallback()
{
  return MEMORY[0x1E0CF58C0]();
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  MEMORY[0x1E0CF58C8](addressBook, callback, context);
}

uint64_t ABCFindPersonMatchingEmailAddress()
{
  return MEMORY[0x1E0CF58E0]();
}

uint64_t ABCFindPersonMatchingPhoneNumber()
{
  return MEMORY[0x1E0CF58E8]();
}

BOOL ABMultiValueAddValueAndLabel(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, ABMultiValueIdentifier *outIdentifier)
{
  return MEMORY[0x1E0CF5A18](multiValue, value, label, outIdentifier);
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFStringRef)MEMORY[0x1E0CF5A30](multiValue, index);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x1E0CF5A40](multiValue, index);
}

ABMutableMultiValueRef ABMultiValueCreateMutable(ABPropertyType type)
{
  return (ABMutableMultiValueRef)MEMORY[0x1E0CF5A48](*(_QWORD *)&type);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x1E0CF5A58](multiValue);
}

CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef multiValue, CFTypeRef value)
{
  return MEMORY[0x1E0CF5A60](multiValue, value);
}

uint64_t ABMultiValueGetFirstIndexOfValueWithCallback()
{
  return MEMORY[0x1E0CF5A68]();
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x1E0CF5A70](multiValue, index);
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  return MEMORY[0x1E0CF5A78](multiValue, *(_QWORD *)&identifier);
}

CFComparisonResult ABPersonComparePeopleByName(ABRecordRef person1, ABRecordRef person2, ABPersonSortOrdering ordering)
{
  return MEMORY[0x1E0CF5AC0](person1, person2, *(_QWORD *)&ordering);
}

uint64_t ABPersonCopyCompositeName()
{
  return MEMORY[0x1E0CF5AD0]();
}

uint64_t ABPersonCopyPreferredLinkedPersonForName()
{
  return MEMORY[0x1E0CF5AF8]();
}

uint64_t ABPersonCopyShortName()
{
  return MEMORY[0x1E0CF5B00]();
}

ABRecordRef ABPersonCreate(void)
{
  return (ABRecordRef)MEMORY[0x1E0CF5B18]();
}

uint64_t ABPersonGetShortNamePreferNicknames()
{
  return MEMORY[0x1E0CF5B58]();
}

ABPersonSortOrdering ABPersonGetSortOrdering(void)
{
  return MEMORY[0x1E0CF5B60]();
}

CFStringRef ABRecordCopyCompositeName(ABRecordRef record)
{
  return (CFStringRef)MEMORY[0x1E0CF5C80](record);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x1E0CF5C90](record, *(_QWORD *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x1E0CF5CA8](record);
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  return MEMORY[0x1E0CF5CB8](record, *(_QWORD *)&property, value, error);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

CFSocketRef CFSocketCreate(CFAllocatorRef allocator, SInt32 protocolFamily, SInt32 socketType, SInt32 protocol, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1E0C98E10](allocator, *(_QWORD *)&protocolFamily, *(_QWORD *)&socketType, *(_QWORD *)&protocol, callBackTypes, callout, context);
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98E18](allocator, s, order);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return MEMORY[0x1E0C98E38](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x1E0C98E50](s);
}

CFSocketError CFSocketSetAddress(CFSocketRef s, CFDataRef address)
{
  return MEMORY[0x1E0C98E60](s, address);
}

void CFStreamCreatePairWithSocket(CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
  MEMORY[0x1E0C98EC8](alloc, *(_QWORD *)&sock, readStream, writeStream);
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
  MEMORY[0x1E0C98ED0](alloc, host, *(_QWORD *)&port, readStream, writeStream);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1E0C9C5A8](info, cbks);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x1E0C9C5D0](consumer);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x1E0CBC2C8]();
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC318](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC340](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC528](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

uint64_t CGImageSourceIsColorOptimizedForSharing()
{
  return MEMORY[0x1E0CBC648]();
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1E0CFA250]();
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1E0CFA2A0]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1E0CFA330]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x1E0CFA350]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1E0CFA360]();
}

uint64_t CPPhoneNumberCopyNormalized()
{
  return MEMORY[0x1E0CFA378]();
}

uint64_t CPPhoneNumberGetLastFour()
{
  return MEMORY[0x1E0CFA380]();
}

uint64_t CPPhoneNumbersEqual()
{
  return MEMORY[0x1E0CFA3A0]();
}

CFStringRef CTFontCopyLocalizedName(CTFontRef font, CFStringRef nameKey, CFStringRef *actualLanguage)
{
  return (CFStringRef)MEMORY[0x1E0CA79D0](font, nameKey, actualLanguage);
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1E0CA7B40]();
}

uint64_t CTFontDescriptorGetTextStyleWithSymbolicTraits()
{
  return MEMORY[0x1E0CA7B48]();
}

uint64_t CTFontIsSystemUIFont()
{
  return MEMORY[0x1E0CA7D08]();
}

uint64_t CTFontIsTextStyleFont()
{
  return MEMORY[0x1E0CA7D10]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1E0D1EDC8]();
}

uint64_t EFSaveTailspin()
{
  return MEMORY[0x1E0D1EE20]();
}

uint64_t EMIsGreymatterAvailableWithOverride()
{
  return MEMORY[0x1E0D1DC60]();
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  return MEMORY[0x1E0D1DC68]();
}

uint64_t EMLogCategoryMessageLoading()
{
  return MEMORY[0x1E0D1DC70]();
}

uint64_t EMLogCompose()
{
  return MEMORY[0x1E0D1DC78]();
}

uint64_t EMLogMailDrop()
{
  return MEMORY[0x1E0D1DC80]();
}

uint64_t EMStringFromSubtype()
{
  return MEMORY[0x1E0D1DFE8]();
}

uint64_t FigAspenCreateJPEGFromIOSurface()
{
  return MEMORY[0x1E0D0D540]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x1E0CEC8C8]();
}

uint64_t FigCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x1E0D0D550]();
}

uint64_t IMMMSEnabled()
{
  return MEMORY[0x1E0D36660]();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MFComposeLog()
{
  return MEMORY[0x1E0D4D7D0]();
}

uint64_t MFCreateStringWithData()
{
  return MEMORY[0x1E0D45F50]();
}

uint64_t MFCreateURLForContentID()
{
  return MEMORY[0x1E0D4D490]();
}

uint64_t MFEncodingForCharset()
{
  return MEMORY[0x1E0D45F98]();
}

uint64_t MFGetTypeInfo()
{
  return MEMORY[0x1E0D45FB0]();
}

uint64_t MFGreenTeaLogger()
{
  return MEMORY[0x1E0D4D7E8]();
}

uint64_t MFIsMobileMail()
{
  return MEMORY[0x1E0D4D7F8]();
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x1E0D4D800]();
}

uint64_t MFLookupLocalizedString()
{
  return MEMORY[0x1E0D4D498]();
}

uint64_t MFMessageComposeLoadingSignpostLog()
{
  return MEMORY[0x1E0D4D810]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MSCanSendMail()
{
  return MEMORY[0x1E0D46A90]();
}

uint64_t MSCanSendMailWithOptions()
{
  return MEMORY[0x1E0D46A98]();
}

uint64_t MSDEntitledOpenComposeProtocolDelegateXPCInterface()
{
  return MEMORY[0x1E0D46AA0]();
}

uint64_t MSMailComposeWindowTargetContentIdentifierWithIdentifier()
{
  return MEMORY[0x1E0D46D00]();
}

uint64_t MSSharedContactStore()
{
  return MEMORY[0x1E0D46D78]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0DC3300](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PFCreateGIFFromVideoURL()
{
  return MEMORY[0x1E0D753F0]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0DC4888]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1E0DC4E50]();
}

uint64_t UIKeyboardForceOrderInAutomaticAnimated()
{
  return MEMORY[0x1E0DC4E78]();
}

uint64_t UIKeyboardForceOrderOutAutomaticAnimated()
{
  return MEMORY[0x1E0DC4E80]();
}

uint64_t UIKeyboardIsAutomaticAppearanceEnabled()
{
  return MEMORY[0x1E0DC4F48]();
}

uint64_t UIKeyboardOrderInAutomatic()
{
  return MEMORY[0x1E0DC4F78]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0DC5238]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1E0DC53C8]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x1E0DC55D8]();
}

BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(NSString *videoPath)
{
  return MEMORY[0x1E0DC55E0](videoPath);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

uint64_t WebThreadLock()
{
  return MEMORY[0x1E0DD9860]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1E0D1F0A0]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _UIAccessibilityLargeTextFontSize()
{
  return MEMORY[0x1E0DC56E8]();
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x1E0DC5840]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x1E0DEEA48]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x1E0C834D0](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1E0C836C8](a1);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1E0C83960](*(_QWORD *)&a1.s_addr);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

