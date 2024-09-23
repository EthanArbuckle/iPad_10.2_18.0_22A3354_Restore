@implementation IMAssistantMessageHandler

- (IMAssistantMessageHandler)initWithIntentIdentifier:(id)a3
{
  return (IMAssistantMessageHandler *)MEMORY[0x24BEDD108](self, sel__initWithDataSource_contactKeysToFetch_intentIdentifier_);
}

- (IMAssistantMessageHandler)initWithDataSource:(id)a3 intentIdentifier:(id)a4
{
  return (IMAssistantMessageHandler *)MEMORY[0x24BEDD108](self, sel__initWithDataSource_contactKeysToFetch_intentIdentifier_);
}

- (IMAssistantMessageHandler)initWithDataSource:(id)a3 keysToFetch:(id)a4 intentIdentifier:(id)a5
{
  return (IMAssistantMessageHandler *)MEMORY[0x24BEDD108](self, sel__initWithDataSource_contactKeysToFetch_intentIdentifier_);
}

- (id)_initWithDataSource:(id)a3 contactKeysToFetch:(id)a4 intentIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMAssistantMessageHandler *v11;
  IMAssistantMessageHandlerDataSource *v12;
  IMAssistantMessageHandlerDataSource *messageHandlerDataSource;
  uint64_t v14;
  NSString *intentIdentifier;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMAssistantMessageHandler;
  v11 = -[IMAssistantMessageHandler init](&v17, sel_init);
  if (v11)
  {
    if (v8)
    {
      v12 = (IMAssistantMessageHandlerDataSource *)v8;
    }
    else
    {
      +[IMAssistantMessageHandlerDefaultDataSource sharedInstance](IMAssistantMessageHandlerDefaultDataSource, "sharedInstance");
      v12 = (IMAssistantMessageHandlerDataSource *)objc_claimAutoreleasedReturnValue();
    }
    messageHandlerDataSource = v11->_messageHandlerDataSource;
    v11->_messageHandlerDataSource = v12;

    objc_storeStrong((id *)&v11->_keysToFetch, a4);
    v14 = objc_msgSend(v10, "copy");
    intentIdentifier = v11->_intentIdentifier;
    v11->_intentIdentifier = (NSString *)v14;

    -[IMAssistantMessageHandler forceTriggerResumeNotification](v11, "forceTriggerResumeNotification");
  }

  return v11;
}

- (NSArray)keysToFetch
{
  NSArray *keysToFetch;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[12];

  v11[11] = *MEMORY[0x24BDAC8D0];
  keysToFetch = self->_keysToFetch;
  if (!keysToFetch)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x24BDBA318], *MEMORY[0x24BDBA2C8], *MEMORY[0x24BDBA310], *MEMORY[0x24BDBA2C0], *MEMORY[0x24BDBA320], *MEMORY[0x24BDBA328], *MEMORY[0x24BDBA348], *MEMORY[0x24BDBA288], *MEMORY[0x24BDBA350]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[9] = v5;
    objc_msgSend(MEMORY[0x24BDD1730], "descriptorForUsedKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[10] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    v8 = (NSArray *)objc_msgSend(v4, "copy");
    v9 = self->_keysToFetch;
    self->_keysToFetch = v8;

    keysToFetch = self->_keysToFetch;
  }
  return keysToFetch;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (id)contactsMatchingINPerson:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "contactsMatchingPerson", (const char *)&unk_21EDC1733, (uint8_t *)&v25, 2u);
  }

  objc_msgSend(v4, "__im_assistant_allContactIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsWithIdentifiers:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    -[IMAssistantMessageHandler contactsMatchingPredicate:forPerson:](self, "contactsMatchingPredicate:forPerson:", v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = objc_msgSend(v12, "count");
          v25 = 134218498;
          v26 = v15;
          v27 = 2112;
          v28 = v4;
          v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Person resolved to %ld contacts via siriMatches. Person: %@, Contacts: %@", (uint8_t *)&v25, 0x20u);
        }

      }
      _IMAssistantCoreGeneralSignpostLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v16))
      {
        LOWORD(v25) = 0;
        _os_signpost_emit_with_name_impl(&dword_21ED90000, v17, OS_SIGNPOST_INTERVAL_END, v6, "contactsMatchingPerson", (const char *)&unk_21EDC1733, (uint8_t *)&v25, 2u);
      }

      v18 = v12;
    }
    else
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v25 = 138412290;
          v26 = (uint64_t)v4;
          _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "Person contained siriMatches that did not resolve to any contacts. Person: %@", (uint8_t *)&v25, 0xCu);
        }

      }
      _IMAssistantCoreGeneralSignpostLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
      {
        LOWORD(v25) = 0;
        _os_signpost_emit_with_name_impl(&dword_21ED90000, v23, OS_SIGNPOST_INTERVAL_END, v6, "contactsMatchingPerson", (const char *)&unk_21EDC1733, (uint8_t *)&v25, 2u);
      }

      v18 = (id)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = (uint64_t)v4;
        _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Person to resolve contains no siriMatches. Person: %@", (uint8_t *)&v25, 0xCu);
      }

    }
    _IMAssistantCoreGeneralSignpostLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v11 = v20;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_END, v6, "contactsMatchingPerson", (const char *)&unk_21EDC1733, (uint8_t *)&v25, 2u);
    }
    v18 = (id)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

- (id)unifiedContactIdentifierForContactIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "unifiedContactIdentifierForContactIdentifier", (const char *)&unk_21EDC1733, buf, 2u);
  }

  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contactIdentifierToUnifiedContactIdentifierCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    _IMAssistantCoreGeneralSignpostLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v14, OS_SIGNPOST_INTERVAL_END, v6, "unifiedContactIdentifierForContactIdentifier", (const char *)&unk_21EDC1733, buf, 2u);
    }

    v15 = v12;
  }
  else
  {
    -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contactsDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = *MEMORY[0x24BDBA2E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v17, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v18, &v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;

    if (v20 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v4;
        v28 = 2112;
        v29 = v20;
        _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "Error fetching unified contact identifier for contact with identifier %@ from contact store. Error: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v19, "identifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v11, "setObject:forKey:", v15, v4);
    _IMAssistantCoreGeneralSignpostLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v23, OS_SIGNPOST_INTERVAL_END, v6, "unifiedContactIdentifierForContactIdentifier", (const char *)&unk_21EDC1733, buf, 2u);
    }

  }
  return v15;
}

- (id)contactWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "contactWithIdentifier", (const char *)&unk_21EDC1733, buf, 2u);
  }

  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageHandler keysToFetch](self, "keysToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v11, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;

  if (v13 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Error fetching contact with identifier %@ from contact store. Error: %@", buf, 0x16u);
    }

  }
  _IMAssistantCoreGeneralSignpostLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v6 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v16, OS_SIGNPOST_INTERVAL_END, v6, "contactWithIdentifier", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v12;
}

- (id)contactsMatchingPredicate:(id)a3 forPerson:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "contactsMatchingPredicate", (const char *)&unk_21EDC1733, buf, 2u);
  }

  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contactsDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageHandler keysToFetch](self, "keysToFetch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v13, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v14, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v7;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Error fetching %@ from contact store: %@", buf, 0x16u);
      }
LABEL_13:

    }
  }
  else if (!objc_msgSend(v15, "count") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Could not find person %@ in contact store with predicate", buf, 0xCu);
    }
    goto LABEL_13;
  }
  _IMAssistantCoreGeneralSignpostLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v19, OS_SIGNPOST_INTERVAL_END, v9, "contactsMatchingPredicate", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v15;
}

- (id)contactIdentifiersMatchingHandleID:(id)a3 handleType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  _QWORD v51[6];

  v51[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (!objc_msgSend(v6, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Returning empty contactID array for nil handleID", buf, 2u);
      }

    }
    _IMAssistantCoreGeneralSignpostLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = v16;
    if (v11 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v16))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    goto LABEL_20;
  }
  if (MEMORY[0x2207BE168](v6))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v6;
        _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Returning empty contactID array for handleID that is a businessID: %@", buf, 0xCu);
      }

    }
    _IMAssistantCoreGeneralSignpostLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v13))
      goto LABEL_21;
    *(_WORD *)buf = 0;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v14, OS_SIGNPOST_INTERVAL_END, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_21EDC1733, buf, 2u);
LABEL_21:
    v17 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_50;
  }
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleToContactIdentifierCache");
  v14 = objc_claimAutoreleasedReturnValue();

  -[NSObject objectForKey:](v14, "objectForKey:", v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    _IMAssistantCoreGeneralSignpostLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v11 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v20, OS_SIGNPOST_INTERVAL_END, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_21EDC1733, buf, 2u);
    }

    v21 = v40;
    v17 = v40;
  }
  else
  {
    -[IMAssistantMessageHandler contactPredicateFromHandle:handleType:](self, "contactPredicateFromHandle:handleType:", v6, a4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    if (v39)
    {
      -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactsDataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BDBA288];
      v51[0] = *MEMORY[0x24BDBA2E0];
      v51[1] = v25;
      v51[2] = *MEMORY[0x24BDBA348];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      objc_msgSend(v24, "unifiedContactsMatchingPredicate:keysToFetch:error:", v39, v26, &v45);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v45;

      if (v38 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v6;
          v49 = 2112;
          v50 = v38;
          _os_log_impl(&dword_21ED90000, v28, OS_LOG_TYPE_INFO, "Error fetching contact identifiers matching handle %@ from contact store: %@", buf, 0x16u);
        }

      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v29 = v27;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v42 != v31)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v33);

          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v30);
      }

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v6;
        _os_log_impl(&dword_21ED90000, v34, OS_LOG_TYPE_INFO, "Could not search for contacts matching handle because a predicate could not be consrtuced from handle ID: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v22, "array");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    _IMAssistantCoreGeneralSignpostLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v11 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v36, OS_SIGNPOST_INTERVAL_END, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_21EDC1733, buf, 2u);
    }

    v21 = 0;
  }

LABEL_50:
  return v17;
}

- (id)contactPredicateFromHandle:(id)a3 handleType:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  v5 = a3;
  switch(a4)
  {
    case 0:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Unknown handle type, determining type from handle string value", v10, 2u);
        }

      }
      if (IMStringIsEmail())
        goto LABEL_10;
      if (!MEMORY[0x2207BE180](v5))
        break;
LABEL_12:
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v5);
      objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingPhoneNumber:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    case 2:
      goto LABEL_12;
    case 1:
LABEL_10:
      objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (id)contactIdentifiersMatchingINPersonHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMAssistantMessageHandler contactIdentifiersMatchingHandleID:handleType:](self, "contactIdentifiersMatchingHandleID:handleType:", v5, objc_msgSend(v4, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)contactIdentifiersMatchingHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "normalizedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[IMAssistantMessageHandler contactIdentifiersMatchingHandleID:handleType:](self, "contactIdentifiersMatchingHandleID:handleType:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)contactIdentifiersMatchingSPIHandle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  if (objc_msgSend(v4, "isMe"))
  {
    -[IMAssistantMessageHandler meContactIdentifier](self, "meContactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v5, "addObject:", v6);

  }
  objc_msgSend(v4, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IMAssistantMessageHandler contactIdentifiersMatchingHandleID:handleType:](self, "contactIdentifiersMatchingHandleID:handleType:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  objc_msgSend(v5, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)meContactIdentifier
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  _IMAssistantCoreGeneralSignpostLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "meContactIdentifier", (const char *)&unk_21EDC1733, buf, 2u);
  }

  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = *MEMORY[0x24BDBA2E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v8, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v9, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v11 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Error fetching me contact: %@", buf, 0xCu);
    }

  }
  if (!v10 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Could not find me contact identifier", buf, 2u);
    }

  }
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _IMAssistantCoreGeneralSignpostLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v16, OS_SIGNPOST_INTERVAL_END, v4, "meContactIdentifier", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v14;
}

- (id)contactIdentifiersForParticipantsInChat:(id)a3
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "participantsWithState:", 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[IMAssistantMessageHandler contactIdentifiersMatchingHandle:](self, "contactIdentifiersMatchingHandle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (id)personFromSPIHandle:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "personFromSPIHandle", (const char *)&unk_21EDC1733, (uint8_t *)&v24, 2u);
  }

  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spiHandleToPersonCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    _IMAssistantCoreGeneralSignpostLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v13))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v14, OS_SIGNPOST_INTERVAL_END, v6, "personFromSPIHandle", (const char *)&unk_21EDC1733, (uint8_t *)&v24, 2u);
    }

    v15 = v12;
  }
  else
  {
    -[IMAssistantMessageHandler contactIdentifiersMatchingSPIHandle:](self, "contactIdentifiersMatchingSPIHandle:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAssistantMessageHandler contactWithIdentifier:](self, "contactWithIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v16, "count") >= 2 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = objc_msgSend(v16, "count");
          v24 = 134218754;
          v25 = v20;
          v26 = 2112;
          v27 = v4;
          v28 = 2112;
          v29 = v16;
          v30 = 2112;
          v31 = v18;
          _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "%ld contacts matched handle %@. Matching identifiers: %@. Using contact: %@", (uint8_t *)&v24, 0x2Au);
        }

      }
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD9F30], "__im_personFromSPIHandle:contact:", v4, v18);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, v4);
    _IMAssistantCoreGeneralSignpostLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v22, OS_SIGNPOST_INTERVAL_END, v6, "personFromSPIHandle", (const char *)&unk_21EDC1733, (uint8_t *)&v24, 2u);
    }

  }
  return v15;
}

+ (id)connectToIMDaemonController
{
  id v2;

  if (IMIsRunningInUnitTesting())
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_25548B9F0 != -1)
      dispatch_once(&qword_25548B9F0, &unk_24E396098);
    v2 = (id)qword_25548B9F8;
  }
  return v2;
}

- (void)forceTriggerResumeNotification
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD v4[4];
  void (**v5)(_QWORD);
  _QWORD v6[5];

  v2 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_21EDAE3E0;
  v6[3] = &unk_24E3960C0;
  v6[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x2207BE4D4](v6, a2);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v3[2](v3);
  }
  else
  {
    v4[0] = v2;
    v4[1] = 3221225472;
    v4[2] = sub_21EDAE6C0;
    v4[3] = &unk_24E395F70;
    v5 = v3;
    dispatch_sync(MEMORY[0x24BDAC9B8], v4);

  }
}

- (IMAssistantMessageHandlerDataSource)messageHandlerDataSource
{
  return self->_messageHandlerDataSource;
}

- (void)setMessageHandlerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_messageHandlerDataSource, a3);
}

- (void)setKeysToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_keysToFetch, a3);
}

- (void)setIntentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_messageHandlerDataSource, 0);
}

@end
