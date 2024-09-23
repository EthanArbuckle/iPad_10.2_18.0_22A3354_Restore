@implementation DDTelephoneNumberAction

- (DDTelephoneNumberAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  id v9;
  DDTelephoneNumberAction *v10;
  void *v11;
  void *v12;
  NSURL *url;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *phoneNumber;
  NSString *body;
  NSString *v20;
  NSString *suggestions;
  NSString *v22;
  NSString *serviceID;
  NSString *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v8 = a3;
  v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)DDTelephoneNumberAction;
  v10 = -[DDAction initWithURL:result:context:](&v37, sel_initWithURL_result_context_, v8, a4, v9);
  if (v10)
  {
    if (v8)
    {
      objc_msgSend(v8, "scheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("sms")) & 1) != 0
        || objc_msgSend(v12, "isEqualToString:", CFSTR("sip")))
      {
        url = v10->super._url;
        v35 = 0;
        v36 = 0;
        v34 = 0;
        -[NSURL dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:](url, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", &v36, &v35, &v34);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (NSString *)v36;
        v16 = (NSString *)v35;
        v17 = (NSString *)v34;
        phoneNumber = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v14;

        body = v10->_body;
        v10->_body = v15;
        v20 = v15;

        suggestions = v10->_suggestions;
        v10->_suggestions = v17;
        v22 = v17;

        serviceID = v10->_serviceID;
        v10->_serviceID = v16;
        v24 = v16;

      }
      else if (objc_msgSend(v12, "isEqualToString:", CFSTR("mailto")))
      {
        -[NSURL dd_emailFromMailtoScheme](v10->super._url, "dd_emailFromMailtoScheme");
        v26 = objc_claimAutoreleasedReturnValue();
        v20 = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v26;
      }
      else
      {
        v20 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithURL:", v8);
        -[NSString handle](v20, "handle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "value");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v30;

        if (!v10->_phoneNumber)
        {
          objc_msgSend(v8, "dd_phoneNumberFromTelScheme");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = v10->_phoneNumber;
          v10->_phoneNumber = (NSString *)v32;

        }
      }

      goto LABEL_7;
    }
    if (!a4)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContactValue"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContactValue"));
        v28 = objc_claimAutoreleasedReturnValue();
        v12 = v10->_phoneNumber;
        v10->_phoneNumber = (NSString *)v28;
LABEL_7:

      }
    }
  }

  return v10;
}

- (id)iconName
{
  return CFSTR("phone");
}

- (id)compactTitle
{
  NSString *phoneNumber;
  NSString *v4;
  void *v5;
  NSURL *url;
  BOOL v8;
  objc_super v9;
  _QWORD activity_block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__DDTelephoneNumberAction_compactTitle__block_invoke;
  activity_block[3] = &unk_1E4258968;
  activity_block[4] = self;
  activity_block[5] = &v11;
  _os_activity_initiate(&dword_19EFBB000, "searching for name in Contacts to display Call compact label", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  if (objc_msgSend((id)v12[5], "length"))
  {
    phoneNumber = (NSString *)v12[5];
  }
  else
  {
    url = self->super._url;
    if (url)
    {
      -[NSURL dd_formattedPhoneNumber](url, "dd_formattedPhoneNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
        goto LABEL_5;

    }
    if (!-[NSString length](self->_phoneNumber, "length"))
    {
      v9.receiver = self;
      v9.super_class = (Class)DDTelephoneNumberAction;
      -[DDAction compactTitle](&v9, sel_compactTitle);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    v8 = -[NSString containsString:](self->_phoneNumber, "containsString:", CFSTR("@"));
    phoneNumber = self->_phoneNumber;
    if (!v8)
    {
      TUFormattedPhoneNumber();
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  v4 = phoneNumber;
LABEL_4:
  v5 = v4;
LABEL_5:
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __39__DDTelephoneNumberAction_compactTitle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "contactAndLabelForPhoneNumber:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v8, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)contactsMatchingPhoneNumber:(id)a3 inContactStore:(id)a4
{
  id v5;
  id v6;
  char isDeviceLocked;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  isDeviceLocked = dd_isDeviceLocked();
  v8 = 0;
  if (v6 && (isDeviceLocked & 1) == 0)
  {
    if (objc_msgSend(v5, "length"))
    {
      if (v5)
      {
        if (objc_msgSend(v5, "containsString:", CFSTR("@")))
        {
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v11;
        objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *MEMORY[0x1E0C967C0];
        v16[1] = v12;
        v16[2] = v13;
        v16[3] = *MEMORY[0x1E0C966A8];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v14, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[DDTelephoneNumberAction contactsMatchingPhoneNumber:inContactStore:].cold.1();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)labelToUseForPhoneNumber:(id)a3 ofContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "phoneNumbers");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "value", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isLikePhoneNumber:", v5);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "label");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)labelToUseForEmail:(id)a3 ofContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "value", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "length") && (objc_msgSend(v8, "isEqualToString:", v15) & 1) != 0)
          {
            objc_msgSend(v13, "label");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }

        }
        v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v10 = 0;
    v8 = v5;
  }

  return v10;
}

- (id)contactAndLabelForPhoneNumber:(id *)a3
{
  NSString *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFArray *SubResults;
  const __CFArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFIndex v28;
  NSObject *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    if (DDResultGetCategory() == 2)
    {
      if (DDResultGetSubresultWithType())
      {
        DDResultGetMatchedString();
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_29;
      }
      else
      {
        v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v15)
          -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
        SubResults = (const __CFArray *)DDResultGetSubResults();
        if (SubResults)
        {
          v24 = SubResults;
          if (CFArrayGetCount(SubResults) >= 1)
          {
            v28 = 0;
            v29 = MEMORY[0x1E0C81028];
            do
            {
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:].cold.2((uint8_t *)v46, v24, v28, (uint64_t *)((char *)v46 + 4));
              ++v28;
            }
            while (v28 < CFArrayGetCount(v24));
          }
        }
        else
        {
          v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v30)
            -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:].cold.1(v30, v31, v32, v33, v34, v25, v26, v27);
        }
        DDUILogAssertionFailure((uint64_t)"valueResult != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDAction.m", (uint64_t)"-[DDTelephoneNumberAction contactAndLabelForPhoneNumber:]", 1833, CFSTR("PhoneNumber without a <Value>"), v25, v26, v27, v46[0]);
      }
    }
    v5 = self->_phoneNumber;
    if (!v5)
    {
      if (self->super._result && (v35 = DDResultCopyExtractedURL()) != 0)
      {
        v36 = (const void *)v35;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "scheme");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lowercaseString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("tel"));

        if (v40)
        {
          objc_msgSend(v37, "dd_formattedPhoneNumber");
          v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = 0;
        }
        CFRelease(v36);

      }
      else
      {
        v5 = 0;
      }
    }
LABEL_29:
    v41 = (void *)objc_opt_new();
    if (!v41)
    {
      v43 = 0;
LABEL_44:

      return v43;
    }
    -[DDTelephoneNumberAction contactsMatchingPhoneNumber:inContactStore:](self, "contactsMatchingPhoneNumber:inContactStore:", v5, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "count") == 1)
    {
      objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        if (-[NSString containsString:](v5, "containsString:", CFSTR("@")))
        {
          -[DDTelephoneNumberAction labelToUseForEmail:ofContact:](self, "labelToUseForEmail:ofContact:", v5, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v44)
            goto LABEL_43;
        }
        else
        {
          if (!v5)
            goto LABEL_43;
          objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            -[DDTelephoneNumberAction labelToUseForPhoneNumber:ofContact:](self, "labelToUseForPhoneNumber:ofContact:", v45, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }

          if (!v44)
            goto LABEL_43;
        }
        objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v44);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v43 = 0;
    }
LABEL_43:

    goto LABEL_44;
  }
  v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v6)
    -[DDTelephoneNumberAction contactAndLabelForPhoneNumber:].cold.4(v6, v7, v8, v9, v10, v11, v12, v13);
  return 0;
}

- (BCSBusinessItem)bizItem
{
  return (BCSBusinessItem *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBizItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bizItem, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

- (void)contactsMatchingPhoneNumber:inContactStore:.cold.1()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v2 = 2112;
  v3 = v0;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Found these contacts: %@ for phone number %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)contactAndLabelForPhoneNumber:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Phone number results without any subresults", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)contactAndLabelForPhoneNumber:(CFIndex)idx .cold.2(uint8_t *a1, CFArrayRef theArray, CFIndex idx, uint64_t *a4)
{
  uint64_t Type;

  CFArrayGetValueAtIndex(theArray, idx);
  Type = DDResultGetType();
  *(_DWORD *)a1 = 138412290;
  *a4 = Type;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Subresult type: %@", a1, 0xCu);
}

- (void)contactAndLabelForPhoneNumber:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Phone number without a Value sub-binder: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)contactAndLabelForPhoneNumber:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No access to Contacts", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
