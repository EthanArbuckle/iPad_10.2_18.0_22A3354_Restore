@implementation IMAssistantMessageSearchChatParticipant

- (IMAssistantMessageSearchChatParticipant)initWithHandle:(id)a3 contactIdentifiers:(id)a4 isMe:(BOOL)a5
{
  id v8;
  id v9;
  IMAssistantMessageSearchChatParticipant *v10;
  id v11;
  NSString *v12;
  NSObject *v13;
  NSString *v14;
  NSString *handle;
  uint64_t v16;
  NSArray *contactIdentifiers;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IMAssistantMessageSearchChatParticipant;
  v10 = -[IMAssistantMessageSearchChatParticipant init](&v19, sel_init);
  if (v10)
  {
    v11 = v8;
    if (MEMORY[0x2207BE180]() || IMStringIsEmail())
    {
      IMCanonicalizeFormattedString();
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!MEMORY[0x2207BE168](v11) && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v11;
          _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", buf, 0xCu);
        }

      }
      v12 = (NSString *)v11;
    }
    v14 = v12;

    handle = v10->_handle;
    v10->_handle = v14;

    v16 = objc_msgSend(v9, "copy");
    contactIdentifiers = v10->_contactIdentifiers;
    v10->_contactIdentifiers = (NSArray *)v16;

    v10->_isMe = a5;
  }

  return v10;
}

- (BOOL)matchesPerson:(id)a3 withUnifiedContactIdentifiers:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_isMe || (objc_msgSend(v6, "isMe") & 1) == 0)
  {
    objc_msgSend(v6, "__im_assistant_allContactIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v27;
LABEL_7:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          if (-[NSArray containsObject:](self->_contactIdentifiers, "containsObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13)))
          {
            goto LABEL_35;
          }
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
            if (v11)
              goto LABEL_7;
            break;
          }
        }
      }

    }
    if (objc_msgSend(v7, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v7;
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v23;
LABEL_17:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v10);
          if (-[NSArray containsObject:](self->_contactIdentifiers, "containsObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), (_QWORD)v22))
          {
            goto LABEL_35;
          }
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v14)
              goto LABEL_17;
            break;
          }
        }
      }

    }
    objc_msgSend(v6, "personHandle", (_QWORD)v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x2207BE180]() || IMStringIsEmail())
    {
      IMCanonicalizeFormattedString();
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!MEMORY[0x2207BE168](v18) && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v18;
          _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", buf, 0xCu);
        }

      }
      v19 = v18;
    }
    v10 = v19;

    if (!objc_msgSend(v10, "length") || (objc_msgSend(v10, "isEqualToString:", self->_handle) & 1) == 0)
    {
      v8 = 0;
      goto LABEL_37;
    }
LABEL_35:
    v8 = 1;
LABEL_37:

    goto LABEL_38;
  }
  v8 = 1;
LABEL_38:

  return v8;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
