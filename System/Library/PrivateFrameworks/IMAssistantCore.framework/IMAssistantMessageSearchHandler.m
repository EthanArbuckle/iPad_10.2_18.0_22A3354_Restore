@implementation IMAssistantMessageSearchHandler

- (IMAssistantMessageSearchHandler)initWithIntentIdentifier:(id)a3
{
  return (IMAssistantMessageSearchHandler *)MEMORY[0x24BEDD108](self, sel_initWithAttributeSanitizer_intentIdentifier_);
}

- (IMAssistantMessageSearchHandler)initWithDataSource:(id)a3 intentIdentifier:(id)a4
{
  return (IMAssistantMessageSearchHandler *)MEMORY[0x24BEDD108](self, sel_initWithDataSource_attributeSanitizer_intentIdentifier_);
}

- (IMAssistantMessageSearchHandler)initWithAttributeSanitizer:(id)a3 intentIdentifier:(id)a4
{
  return (IMAssistantMessageSearchHandler *)MEMORY[0x24BEDD108](self, sel_initWithDataSource_attributeSanitizer_intentIdentifier_);
}

- (IMAssistantMessageSearchHandler)initWithDataSource:(id)a3 attributeSanitizer:(id)a4 intentIdentifier:(id)a5
{
  id v8;
  IMAssistantMessageSearchHandler *v9;
  IMAssistantMessageReadAttributeSanitizer *v10;
  IMAssistantMessageAttributeSanitizer *attributeSanitizer;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantMessageSearchHandler;
  v9 = -[IMAssistantMessageHandler initWithDataSource:intentIdentifier:](&v13, sel_initWithDataSource_intentIdentifier_, a3, a5);
  if (v9)
  {
    if (v8)
      v10 = (IMAssistantMessageReadAttributeSanitizer *)v8;
    else
      v10 = objc_alloc_init(IMAssistantMessageReadAttributeSanitizer);
    attributeSanitizer = v9->_attributeSanitizer;
    v9->_attributeSanitizer = (IMAssistantMessageAttributeSanitizer *)v10;

  }
  return v9;
}

- (void)resolveRecipientsForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveRecipientsForSearchForMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "resolveRecipients called with intent: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "recipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21EDA76D4;
  v15[3] = &unk_24E395F20;
  v16 = v7;
  v17 = v9;
  v14 = v7;
  -[IMAssistantMessageQueryHandler resolvePersons:forIntent:completionHandler:](self, "resolvePersons:forIntent:completionHandler:", v13, v6, v15);

}

- (void)resolveSendersForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveSendersForSearchForMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "resolveSenders called with intent: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "senders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21EDA7A08;
  v15[3] = &unk_24E395F20;
  v16 = v7;
  v17 = v9;
  v14 = v7;
  -[IMAssistantMessageQueryHandler resolvePersons:forIntent:completionHandler:](self, "resolvePersons:forIntent:completionHandler:", v13, v6, v15);

}

- (void)resolveAttributesForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveAttributesForSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&v26, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v6;
      _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "resolveAttributes called with intent: %@", (uint8_t *)&v26, 0xCu);
    }

  }
  v13 = objc_msgSend(v6, "attributes");
  -[IMAssistantMessageSearchHandler attributeSanitizer](self, "attributeSanitizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAssistantMessageAttributeOptions optionsWithAttributes:sanitizer:](IMAssistantMessageAttributeOptions, "optionsWithAttributes:sanitizer:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "includeRead"))
  {
    objc_msgSend(v6, "identifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count") == 0;

    if (v17 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v6;
        _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "intent with read options lacks message identifiers: %@", (uint8_t *)&v26, 0xCu);
      }

    }
    objc_msgSend(v6, "dateTimeRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v6;
        _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "intent with read options lacks dateTimeRange: %@", (uint8_t *)&v26, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDD9E88], "successWithResolvedMessageAttributeOptions:", objc_msgSend(v15, "attributes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v22;
      _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "Calling resolveAttributes completion handler with result: %@", (uint8_t *)&v26, 0xCu);
    }

  }
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v24))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v25, OS_SIGNPOST_INTERVAL_END, v9, "resolveAttributesForSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&v26, 2u);
  }

  v7[2](v7, v22);
}

- (void)resolveSpeakableGroupNamesForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[4];
  void (**v23)(_QWORD);
  _QWORD v24[5];
  id v25;
  id v26;
  os_signpost_id_t v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveSpeakableGroupNamesForSearchForMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "resolveSpeakableGroupNames called with intent: %@", buf, 0xCu);
    }

  }
  v13 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_21EDA829C;
  v24[3] = &unk_24E395F48;
  v24[4] = self;
  v14 = v6;
  v25 = v14;
  v27 = v9;
  v15 = v7;
  v26 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x2207BE4D4](v24);
  objc_msgSend(v14, "speakableGroupNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count") == 0;

  if (v18)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Calling resolveSpeakableGroupNames completion handler with empty results", buf, 2u);
      }

    }
    _IMAssistantCoreSearchForMessageSignpostLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v21, OS_SIGNPOST_INTERVAL_END, v9, "resolveSpeakableGroupNamesForSearchForMessages", (const char *)&unk_21EDC1733, buf, 2u);
    }

    (*((void (**)(id, _QWORD))v15 + 2))(v15, MEMORY[0x24BDBD1A8]);
  }
  else if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v16[2](v16);
  }
  else
  {
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = sub_21EDA8414;
    block[3] = &unk_24E395F70;
    v23 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)handleSearchForMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD block[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  IMAssistantMessageSearchHandler *v20;
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "handleSearchForMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_21EDA85B0;
  v18[3] = &unk_24E395F48;
  v13 = v6;
  v19 = v13;
  v20 = self;
  v22 = v9;
  v14 = v7;
  v21 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x2207BE4D4](v18);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v15[2](v15);
  }
  else
  {
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = sub_21EDA8EBC;
    block[3] = &unk_24E395F70;
    v17 = v15;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)resolveRecipientsAndSender:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  IMAssistantMessageSearchHandler *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_21EDA8F8C;
  v11[3] = &unk_24E395FC0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  -[IMAssistantMessageQueryHandler resolvePersons:forIntent:completionHandler:](self, "resolvePersons:forIntent:completionHandler:", v8, v10, v11);

}

- (id)resolveSpeakableGroupNames:(id)a3 forIntent:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v33;
  id obj;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33 = a4;
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v7)
  {
    v35 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v49 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAssistantMessageQueryHandler chatsForChatNames:](self, "chatsForChatNames:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "spokenPhrase");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "vocabularyIdentifier");
            v14 = (id)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v11, "count");
            *(_DWORD *)buf = 138413058;
            v42 = v13;
            v43 = 2112;
            v44 = v14;
            v45 = 2048;
            v46 = v15;
            v47 = 2112;
            v48 = v11;
            _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "resolveSpeakableGroupName for name:\"%@\" vocabularyIdentifier:\"%@\" matches %ld chats: %@", buf, 0x2Au);

          }
        }
        if (objc_msgSend(v11, "count") == 1)
        {
          objc_msgSend(v11, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "displayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "chatIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "screentimeAllowedToShowChat:error:", v16, 0);

          if (v20)
          {
            if (objc_msgSend(v17, "length"))
            {
              v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDA1A0]), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v18, v17, 0);
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v42 = v17;
                  v43 = 2112;
                  v44 = v18;
                  _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Resolve chatName: %@ and vocabularyIdentifier: %@", buf, 0x16u);
                }

              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v30, OS_LOG_TYPE_INFO, "Chat search by name resolved to a chat without a displayName. Passing through the input name instead.", buf, 2u);
                }

              }
              v21 = v9;
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v42 = v17;
                v43 = 2112;
                v44 = v18;
                _os_log_impl(&dword_21ED90000, v29, OS_LOG_TYPE_INFO, "downtime suppressing resolve for chatName: %@ and vocabularyIdentifier: %@", buf, 0x16u);
              }

            }
            v21 = 0;
          }
          objc_msgSend(MEMORY[0x24BDDA1A8], "successWithResolvedString:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = (unint64_t)objc_msgSend(v11, "count") > 1;
          v24 = IMOSLoggingEnabled();
          if (v23)
          {
            if (v24)
            {
              OSLogHandleForIMFoundationCategory();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v25, OS_LOG_TYPE_INFO, "Using input as resolved value.", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x24BDDA1A8], "successWithResolvedString:", v9);
            v26 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v24)
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "No matching chats were found, returning unsupported/notFound for resolveSpeakableGroupNames", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x24BDDA1A8], "unsupported");
            v26 = objc_claimAutoreleasedReturnValue();
          }
          v28 = (void *)v26;
        }
        objc_msgSend(v36, "addObject:", v28);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v7);
  }

  v31 = (void *)objc_msgSend(v36, "copy");
  return v31;
}

- (IMAssistantMessageAttributeSanitizer)attributeSanitizer
{
  return self->_attributeSanitizer;
}

- (void)setAttributeSanitizer:(id)a3
{
  objc_storeStrong((id *)&self->_attributeSanitizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeSanitizer, 0);
}

@end
