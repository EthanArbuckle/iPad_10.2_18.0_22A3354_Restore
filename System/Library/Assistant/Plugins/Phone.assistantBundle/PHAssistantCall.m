@implementation PHAssistantCall

- (PHAssistantCall)initWithDictionary:(id)a3
{
  PHAssistantCall *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  uint64_t v12;
  CoreTelephonyClient *telephonyClient;
  NSBundle *voiceDialBundle;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PHAssistantCall;
  v3 = -[PHAssistantCall initWithDictionary:](&v16, sel_initWithDictionary_, a3);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v3->_serialQueue);
    telephonyClient = v3->_telephonyClient;
    v3->_telephonyClient = (CoreTelephonyClient *)v12;

    voiceDialBundle = v3->_voiceDialBundle;
    v3->_voiceDialBundle = 0;

    -[PHAssistantCall _addFaceTimeAvailabilityListener](v3, "_addFaceTimeAvailabilityListener");
  }
  return v3;
}

- (CNContact)backingContact
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  CNContact *v14;
  NSObject *p_super;
  id v17;
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!self->_hasComputedBackingContact)
  {
    self->_hasComputedBackingContact = 1;
    -[SAPhoneCall callRecipient](self, "callRecipient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PHDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl(&dword_226FFC000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to find contact with Siri URL: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE19120], "contactIDFromAssistantID:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDBA288];
      v18[0] = *MEMORY[0x24BDBA2E0];
      v18[1] = v9;
      v18[2] = *MEMORY[0x24BDBA348];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAssistantServices sharedContactStore](PHAssistantServices, "sharedContactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v11, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v10, &v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v17;

      if (v12)
      {
        PHDefaultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v12;
          _os_log_impl(&dword_226FFC000, v13, OS_LOG_TYPE_DEFAULT, "Found contact: %@", buf, 0xCu);
        }

        v14 = v12;
        p_super = &self->_backingContact->super;
        self->_backingContact = v14;
      }
      else if (v6 && -[NSObject code](v6, "code") == 200)
      {
        PHDefaultLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v8;
          _os_log_impl(&dword_226FFC000, p_super, OS_LOG_TYPE_DEFAULT, "[WARN] No contact found with identifier: %@", buf, 0xCu);
        }
      }
      else
      {
        PHDefaultLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          sub_227002578();
      }

    }
    else
    {
      if (!v7)
      {
LABEL_19:

        return self->_backingContact;
      }
      -[SAPhoneCall callRecipient](self, "callRecipient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_226FFC000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] No URL found for SAPerson: %@", buf, 0xCu);
    }

    goto LABEL_19;
  }
  return self->_backingContact;
}

- (TUHandle)destinationHandle
{
  unint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  objc_class *v45;
  uint64_t v46;
  void *v47;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v3 = 0x2558AE000;
  if (!self->_hasComputedDestinationHandle)
  {
    self->_hasComputedDestinationHandle = 1;
    -[SAPhoneCall callRecipient](self, "callRecipient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v5, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssistantCall backingContact](self, "backingContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      v59 = 0uLL;
      v60 = 0uLL;
      v57 = 0uLL;
      v58 = 0uLL;
      objc_msgSend(v8, "emailAddresses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v11)
      {
        v12 = v11;
        v51 = isKindOfClass;
        v52 = v9;
        v13 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v58 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v15, "label");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v7);

            if (v17)
            {
              PHDefaultLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v15, "value");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v63 = v7;
                v64 = 2112;
                v65 = v27;
                _os_log_impl(&dword_226FFC000, v26, OS_LOG_TYPE_DEFAULT, "Found email address with matching label %@: %@", buf, 0x16u);

              }
              objc_msgSend(v15, "value");
              v25 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v12)
            continue;
          break;
        }
LABEL_20:
        v25 = 0;
        v3 = 0x2558AE000;
        v9 = v52;
LABEL_29:
        isKindOfClass = v51;
LABEL_30:

        if (v25)
          goto LABEL_50;
        PHDefaultLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v5;
          _os_log_impl(&dword_226FFC000, v32, OS_LOG_TYPE_DEFAULT, "Could not determine a destination ID from the backing contact. Checking if a destination ID was explicitly encoded in typed data: %@", buf, 0xCu);
        }

        v33 = v5;
        v34 = v33;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v33, "emailAddress");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          PHDefaultLog();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v35)
          {
            if (v37)
            {
              objc_msgSend(v34, "emailAddress");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v63 = v38;
              _os_log_impl(&dword_226FFC000, v36, OS_LOG_TYPE_DEFAULT, "Explicit destinationID was encoded in the SAEmail: %@", buf, 0xCu);

            }
            objc_msgSend(v34, "emailAddress");
            v39 = objc_claimAutoreleasedReturnValue();
LABEL_42:
            v25 = v39;
            goto LABEL_49;
          }
          if (v37)
          {
            *(_WORD *)buf = 0;
            v43 = "No destinationID was explicitly encoded in the SAEmail";
LABEL_47:
            _os_log_impl(&dword_226FFC000, v36, OS_LOG_TYPE_DEFAULT, v43, buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v33, "number");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          PHDefaultLog();
          v36 = objc_claimAutoreleasedReturnValue();
          v41 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v40)
          {
            if (v41)
            {
              objc_msgSend(v34, "number");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v63 = v42;
              _os_log_impl(&dword_226FFC000, v36, OS_LOG_TYPE_DEFAULT, "Explicit destinationID was encoded in the SAPhone: %@", buf, 0xCu);

            }
            objc_msgSend(v34, "number");
            v39 = objc_claimAutoreleasedReturnValue();
            goto LABEL_42;
          }
          if (v41)
          {
            *(_WORD *)buf = 0;
            v43 = "No destinationID was explicitly encoded in the SAPhone";
            goto LABEL_47;
          }
        }

        v25 = 0;
LABEL_49:

        if (!v25)
        {
          PHDefaultLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            -[SAPhoneCall callRecipient](self, "callRecipient");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "typedData");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v63 = v50;
            _os_log_impl(&dword_226FFC000, v25, OS_LOG_TYPE_DEFAULT, "[WARN] No destination found for %@", buf, 0xCu);

          }
          goto LABEL_54;
        }
LABEL_50:
        if ((isKindOfClass & 1) != 0)
          v44 = 3;
        else
          v44 = 2;
        v45 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49E8]), "initWithType:value:", v44, v25);
        v46 = *(int *)(v3 + 1040);
        v47 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v46);
        *(Class *)((char *)&self->super.super.super.super.super.super.isa + v46) = v45;

LABEL_54:
        return (TUHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                   + *(int *)(v3 + 1040)));
      }
    }
    else
    {
      v55 = 0uLL;
      v56 = 0uLL;
      v53 = 0uLL;
      v54 = 0uLL;
      objc_msgSend(v8, "phoneNumbers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v18)
      {
        v19 = v18;
        v51 = isKindOfClass;
        v52 = v9;
        v20 = *(_QWORD *)v54;
        while (2)
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v54 != v20)
              objc_enumerationMutation(v10);
            v22 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            objc_msgSend(v22, "label");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v7);

            if (v24)
            {
              PHDefaultLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v22, "value");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "stringValue");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v63 = v7;
                v64 = 2112;
                v65 = v30;
                _os_log_impl(&dword_226FFC000, v28, OS_LOG_TYPE_DEFAULT, "Found phone number with matching label %@: %@", buf, 0x16u);

              }
              objc_msgSend(v22, "value");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringValue");
              v25 = objc_claimAutoreleasedReturnValue();

LABEL_28:
              v3 = 0x2558AE000uLL;
              v9 = v52;
              goto LABEL_29;
            }
          }
          v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v19)
            continue;
          goto LABEL_20;
        }
      }
    }
    v25 = 0;
    goto LABEL_30;
  }
  return (TUHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                             + *(int *)(v3 + 1040)));
}

- (id)destinationID
{
  void *v2;
  void *v3;

  -[PHAssistantCall destinationHandle](self, "destinationHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_addFaceTimeAvailabilityListener
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addListenerID:forService:", CFSTR("com.apple.assistant"), 2);

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addListenerID:forService:", CFSTR("com.apple.assistant"), 0);

}

- (void)_removeFaceTimeAvailabilityListener
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeListenerID:forService:", CFSTR("com.apple.assistant"), 2);

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.assistant"), 0);

}

- (BOOL)shouldApplyInternationalAssist
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SAPhoneCall callRecipient](self, "callRecipient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isCarPlayActive
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDF6D38], "_carScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_voiceDialBundle
{
  NSBundle *voiceDialBundle;
  NSBundle *v4;
  NSBundle *v5;

  voiceDialBundle = self->_voiceDialBundle;
  if (!voiceDialBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/VoiceServices/PlugIns/VoiceDial.vsplugin"));
    v4 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v5 = self->_voiceDialBundle;
    self->_voiceDialBundle = v4;

    voiceDialBundle = self->_voiceDialBundle;
  }
  return voiceDialBundle;
}

- (id)ISOCountryCode
{
  void *v2;

  if (-[PHAssistantCall shouldApplyInternationalAssist](self, "shouldApplyInternationalAssist")
    || (v2 = (void *)CPPhoneNumberCopyNetworkCountryCode()) == 0)
  {
    v2 = (void *)CPPhoneNumberCopyHomeCountryCode();
  }
  return v2;
}

- (id)_copyExceptionsForCountryCode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exceptions-%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssistantCall _voiceDialBundle](self, "_voiceDialBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:subdirectory:", v4, CFSTR("plist"), CFSTR("DigitDialExceptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:error:", v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (!v7)
    {
      PHDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_2270025D8();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isEmergencyNumberOrIsWhiteListed:(id)a3 forProvider:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *i;
  void *v16;
  void *v17;
  int v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BEB4A30]);
  objc_msgSend(v6, "prioritizedSenderIdentities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl(&dword_226FFC000, v10, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ are an emergency or whitelisted telephone number.", buf, 0xCu);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v20 = v6;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v16, "UUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v7, "isWhitelistedEmergencyNumberForDigits:senderIdentityUUID:", v5, v17);

          if (v18)
          {
            PHDefaultLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v26 = v5;
              v27 = 2112;
              v28 = v16;
              _os_log_impl(&dword_226FFC000, v13, OS_LOG_TYPE_DEFAULT, "Digits %@ are an emergency or whitelisted telephone number for sender identity %@.", buf, 0x16u);
            }

            LOBYTE(v13) = 1;
            goto LABEL_16;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
          continue;
        break;
      }
LABEL_16:
      v6 = v20;
    }

  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl(&dword_226FFC000, v10, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ is an emergency or whitelisted telephone number for nil sender identity.", buf, 0xCu);
    }

    LOBYTE(v13) = objc_msgSend(v7, "isWhitelistedEmergencyNumberForDigits:senderIdentityUUID:", v5, 0);
  }

  return (char)v13;
}

- (id)_validate
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  const __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  __int128 v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  -[SAPhoneCall emergencyCall](self, "emergencyCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    PHDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226FFC000, v5, OS_LOG_TYPE_DEFAULT, "-[PHAssistantCall _validate]: Call is an emergency call, passing validation", buf, 2u);
    }

    return 0;
  }
  -[SAPhoneCall callRecipient](self, "callRecipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PHDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_227002638();

    v10 = objc_alloc(MEMORY[0x24BE811A8]);
    v11 = CFSTR("No recipient was specified");
    goto LABEL_21;
  }
  -[PHAssistantCall destinationID](self, "destinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    PHDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_227002664();

    v10 = objc_alloc(MEMORY[0x24BE811A8]);
    v11 = CFSTR("No destination ID was specified");
    goto LABEL_21;
  }
  if (!-[SAPhoneCall faceTime](self, "faceTime"))
  {
    if (-[SAPhoneCall faceTimeAudio](self, "faceTimeAudio"))
    {
      if ((objc_msgSend(MEMORY[0x24BEB4930], "supportsDisplayingFaceTimeAudioCalls") & 1) == 0)
      {
        PHDefaultLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_2270027CC();
        goto LABEL_40;
      }
      if ((objc_msgSend(MEMORY[0x24BEB4930], "supportsFaceTimeAudioCalls") & 1) == 0)
      {
        PHDefaultLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_2270027A0();
        goto LABEL_37;
      }
LABEL_70:
      -[SAPhoneCall callRecipient](self, "callRecipient");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17 || -[SAPhoneCall faceTime](self, "faceTime"))
        goto LABEL_72;
      v40 = -[SAPhoneCall faceTimeAudio](self, "faceTimeAudio");

      if (v40)
        return 0;
      -[PHAssistantCall ISOCountryCode](self, "ISOCountryCode");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        PHDefaultLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_2270026BC();

        v10 = objc_alloc(MEMORY[0x24BE811A8]);
        v11 = CFSTR("Device has no country code");
        goto LABEL_21;
      }
      v17 = (id)v41;
      -[PHAssistantCall destinationID](self, "destinationID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PNIsValidPhoneNumberForCountry() & 1) != 0)
      {
LABEL_81:

LABEL_72:
        return 0;
      }
      v43 = -[PHAssistantCall _copyExceptionsForCountryCode:](self, "_copyExceptionsForCountryCode:", v17);
      v44 = v43;
      if (v43 && objc_msgSend(v43, "containsObject:", v42))
      {
        PHDefaultLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v61 = v42;
          v62 = 2112;
          v63 = v17;
          _os_log_impl(&dword_226FFC000, v45, OS_LOG_TYPE_DEFAULT, "-[PHAssistantCall _validate]: Destination ID %@ is an exception for country %@, passing validation", buf, 0x16u);
        }

        goto LABEL_81;
      }
      PHDefaultLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        sub_2270026E8();

      v48 = objc_alloc(MEMORY[0x24BE811A8]);
      v23 = (void *)objc_msgSend(v48, "initWithErrorCode:", *MEMORY[0x24BE823E0]);

LABEL_97:
      return v23;
    }
    if ((objc_msgSend(MEMORY[0x24BEB4930], "supportsTelephonyCalls") & 1) == 0)
    {
      PHDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_2270028C0();

      v20 = objc_alloc(MEMORY[0x24BE811A8]);
      v21 = (_QWORD *)MEMORY[0x24BE823D8];
      goto LABEL_44;
    }
    if ((objc_msgSend(MEMORY[0x24BEB4930], "canAttemptTelephonyCallsWithoutCellularConnection") & 1) != 0)
      goto LABEL_70;
    v17 = objc_alloc_init(MEMORY[0x24BE04788]);
    if (objc_msgSend(v17, "airplaneMode"))
    {
      PHDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_2270027F8();
      v19 = (_QWORD *)MEMORY[0x24BE823C0];
LABEL_96:

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithErrorCode:", *v19);
      goto LABEL_97;
    }
    if (!objc_msgSend(MEMORY[0x24BEB4930], "supportsPrimaryCalling"))
    {
LABEL_69:

      goto LABEL_70;
    }
    -[PHAssistantCall telephonyClient](self, "telephonyClient");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0)
    {
LABEL_93:
      PHDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_227002824();
      v19 = (_QWORD *)MEMORY[0x24BE823F0];
      goto LABEL_96;
    }
    -[PHAssistantCall telephonyClient](self, "telephonyClient");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v26, "getSubscriptionInfoWithError:", &v59);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v59;

    if (v27)
    {
      v50 = v27;
      -[NSObject subscriptionsInUse](v27, "subscriptionsInUse");
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (v29)
      {
        v31 = v29;
        v32 = *(_QWORD *)v56;
        v52 = *MEMORY[0x24BDC2C60];
        v51 = *MEMORY[0x24BDC2C68];
        *(_QWORD *)&v30 = 138412546;
        v49 = v30;
        while (2)
        {
          v33 = 0;
          v34 = v28;
          do
          {
            if (*(_QWORD *)v56 != v32)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v33);
            if ((objc_msgSend(v35, "isSimHidden", v49) & 1) != 0)
            {
              v28 = v34;
            }
            else
            {
              -[PHAssistantCall telephonyClient](self, "telephonyClient");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = v34;
              v37 = (void *)objc_msgSend(v36, "copyRegistrationStatus:error:", v35, &v54);
              v28 = v54;

              if ((objc_msgSend(v37, "isEqualToString:", v52) & 1) != 0
                || (objc_msgSend(v37, "isEqualToString:", v51) & 1) != 0)
              {

                goto LABEL_69;
              }
              if (!v37 && v28)
              {
                PHDefaultLog();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v49;
                  v61 = v28;
                  v62 = 2112;
                  v63 = v35;
                  _os_log_error_impl(&dword_226FFC000, v38, OS_LOG_TYPE_ERROR, "Retrieving registration status failed with error %@ for subscription context %@.", buf, 0x16u);
                }

              }
              v34 = v28;
            }
            ++v33;
          }
          while (v31 != v33);
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          if (v31)
            continue;
          break;
        }
      }

      v39 = v50;
    }
    else
    {
      if (!v28)
      {
LABEL_92:

        goto LABEL_93;
      }
      PHDefaultLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_227002850((uint64_t)v28, v39);
    }

    goto LABEL_92;
  }
  if ((objc_msgSend(MEMORY[0x24BEB4930], "supportsDisplayingFaceTimeVideoCalls") & 1) == 0)
  {
    PHDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_227002774();
LABEL_40:

    v20 = objc_alloc(MEMORY[0x24BE811A8]);
    v21 = (_QWORD *)MEMORY[0x24BE81AC8];
    goto LABEL_44;
  }
  if ((objc_msgSend(MEMORY[0x24BEB4930], "supportsFaceTimeVideoCalls") & 1) == 0)
  {
    PHDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_227002748();
LABEL_37:

    v20 = objc_alloc(MEMORY[0x24BE811A8]);
    v21 = (_QWORD *)MEMORY[0x24BE823E8];
LABEL_44:
    v14 = objc_msgSend(v20, "initWithErrorCode:", *v21);
    goto LABEL_45;
  }
  if (!-[PHAssistantCall isCarPlayActive](self, "isCarPlayActive"))
    goto LABEL_70;
  PHDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_227002690();

  v10 = objc_alloc(MEMORY[0x24BE811A8]);
  v11 = CFSTR("FaceTime video not supported in CarPlay");
LABEL_21:
  v14 = objc_msgSend(v10, "initWithReason:", v11);
LABEL_45:
  v23 = (void *)v14;
  return v23;
}

- (id)appPunchOutDialRequestWithEndpointIDSDestinationURI:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEB4950]);
  -[PHAssistantCall destinationID](self, "destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAPhoneCall emergencyCall](self, "emergencyCall");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (!v8)
  {
    if (-[SAPhoneCall faceTime](self, "faceTime") || -[SAPhoneCall faceTimeAudio](self, "faceTimeAudio"))
    {
      objc_msgSend(v5, "faceTimeProvider");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "telephonyProvider");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v18;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49D0]), "initWithProvider:", v18);
    objc_msgSend(v12, "setVideo:", -[SAPhoneCall faceTime](self, "faceTime"));
    objc_msgSend(v12, "setDestinationID:", v6);
    -[PHAssistantCall backingContact](self, "backingContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContactIdentifier:", v20);

    objc_msgSend(v12, "setPerformDialAssist:", -[PHAssistantCall shouldApplyInternationalAssist](self, "shouldApplyInternationalAssist"));
LABEL_17:

    goto LABEL_18;
  }
  PHDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v6;
    _os_log_impl(&dword_226FFC000, v9, OS_LOG_TYPE_DEFAULT, "Siri punch out URL is handling an emergency call request, with destination ID %@", (uint8_t *)&v23, 0xCu);
  }

  v10 = objc_alloc(MEMORY[0x24BEB49D0]);
  objc_msgSend(v5, "emergencyProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithProvider:", v11);

  objc_msgSend(v12, "setPerformDialAssist:", 0);
  objc_msgSend(v5, "emergencyProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[PHAssistantCall isEmergencyNumberOrIsWhiteListed:forProvider:](PHAssistantCall, "isEmergencyNumberOrIsWhiteListed:forProvider:", v6, v13);

  PHDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v6 && v14)
  {
    if (v16)
    {
      v23 = 138412290;
      v24 = v6;
      _os_log_impl(&dword_226FFC000, v15, OS_LOG_TYPE_DEFAULT, "The destinationID is whitelisted as an emergency number, so the punch out URL will contain the destinationID: %@", (uint8_t *)&v23, 0xCu);
    }

    -[PHAssistantCall destinationHandle](self, "destinationHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHandle:", v17);
    goto LABEL_17;
  }
  if (v16)
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_226FFC000, v15, OS_LOG_TYPE_DEFAULT, "The destinationID is NOT whitelisted, so we will not include the destinationID in the URL but dial a generic emergency number", (uint8_t *)&v23, 2u);
  }

  objc_msgSend(v12, "setDialType:", 1);
LABEL_18:
  if (-[SAPhoneCall speakerphoneCall](self, "speakerphoneCall"))
    objc_msgSend(v12, "setAudioSourceIdentifier:", *MEMORY[0x24BEB4B18]);
  objc_msgSend(v12, "setEndpointIDSDestinationURI:", v4);
  PHDefaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v12;
    _os_log_impl(&dword_226FFC000, v21, OS_LOG_TYPE_DEFAULT, "Siri punch out URL created dial request %@", (uint8_t *)&v23, 0xCu);
  }

  return v12;
}

- (void)_performAppPunchOutWithDialRequest:(id)a3 withServiceHelper:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PHDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_226FFC000, v11, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", buf, 0xCu);
  }

  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x24BE81860]);
    -[PHAssistantCall refId](self, "refId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRefId:", v14);

    objc_msgSend(v13, "setPunchOutUri:", v12);
    PHDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_226FFC000, v15, OS_LOG_TYPE_DEFAULT, "appPunchOut: %@", buf, 0xCu);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_226FFFD80;
    v16[3] = &unk_24EF4A0B8;
    v17 = v12;
    v18 = v8;
    v19 = v10;
    objc_msgSend(v9, "handleCommand:completion:", v13, v16);

  }
  else
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithReason:", CFSTR("Unable to call recipient"));
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }

}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  PHAssistantCall *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_227000018;
  v24 = sub_227000028;
  -[PHAssistantCall _validate](self, "_validate");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v21[5];
  if (!v8)
  {
    v10 = (void *)MEMORY[0x24BEB4938];
    -[PHAssistantCall serialQueue](self, "serialQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCenterWithQueue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAssistantCall serialQueue](self, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227000030;
    block[3] = &unk_24EF4A108;
    v15 = v12;
    v19 = &v20;
    v18 = v6;
    v16 = v7;
    v17 = self;
    v9 = v12;
    dispatch_sync(v13, block);

    goto LABEL_5;
  }
  if (v6)
  {
    objc_msgSend(v8, "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v6 + 2))(v6, v9);
LABEL_5:

  }
  _Block_object_dispose(&v20, 8);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (NSBundle)voiceDialBundle
{
  return self->_voiceDialBundle;
}

- (BOOL)hasComputedDestinationHandle
{
  return self->_hasComputedDestinationHandle;
}

- (BOOL)hasComputedBackingContact
{
  return self->_hasComputedBackingContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceDialBundle, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_destinationHandle, 0);
  objc_storeStrong((id *)&self->_backingContact, 0);
}

@end
