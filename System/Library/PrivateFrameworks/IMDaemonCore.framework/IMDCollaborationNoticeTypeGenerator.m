@implementation IMDCollaborationNoticeTypeGenerator

+ (id)sharedGenerator
{
  if (qword_1EFC63C78 != -1)
    dispatch_once(&qword_1EFC63C78, &unk_1E92289E0);
  return (id)qword_1EFC63C70;
}

- (IMDCollaborationNoticeTypeGenerator)init
{
  IMDCollaborationNoticeTypeGenerator *v2;
  SWHighlightCenter *v3;
  SWHighlightCenter *highlightCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDCollaborationNoticeTypeGenerator;
  v2 = -[IMDCollaborationNoticeTypeGenerator init](&v6, sel_init);
  if (v2)
  {
    v3 = (SWHighlightCenter *)objc_alloc_init((Class)MEMORY[0x1D17EA3EC](CFSTR("SWHighlightCenter"), CFSTR("SharedWithYou")));
    highlightCenter = v2->_highlightCenter;
    v2->_highlightCenter = v3;

  }
  return v2;
}

- (int64_t)typeForHighlightEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "changeEventType");
    if (v5 == 2)
      v6 = 2;
    else
      v6 = -1;
    if (v5 == 1)
      v7 = 1;
    else
      v7 = v6;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v4, "mentionedPersonHandle"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "length"),
            v10,
            v11))
      {
        objc_msgSend(v4, "mentionedPersonHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[IMDCollaborationNoticeTypeGenerator processMentionForPersonHandle:](self, "processMentionForPersonHandle:", v12);
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v14 = objc_msgSend(v4, "persistenceEventType");
            if ((unint64_t)(v14 - 1) >= 4)
              v7 = -1;
            else
              v7 = v14 + 3;
          }
          else
          {
            v7 = -1;
          }
          goto LABEL_26;
        }
        objc_msgSend(v4, "mentionedPersonIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "highlightURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[IMDCollaborationNoticeTypeGenerator processMentionForPersonIdentity:highlightURL:](self, "processMentionForPersonIdentity:highlightURL:", v12, v13);

      }
      goto LABEL_26;
    }
    v8 = objc_msgSend(v4, "membershipEventType");
    v9 = 9;
    if (v8 != 2)
      v9 = -1;
    if (v8 == 1)
      v7 = 8;
    else
      v7 = v9;
  }
LABEL_26:

  return v7;
}

- (int64_t)processMentionForPersonHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeAliases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "containsObject:", v3);
    if ((v8 & 1) != 0)
    {
      v9 = 3;
    }
    else
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = v3;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Received a mention for a handle not associated with local account: %@", (uint8_t *)&v13, 0xCu);
        }

      }
      v9 = -1;
    }

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Received a mention for a handle not associated with local account: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    v9 = -1;
  }

  return v9;
}

- (int64_t)processMentionForPersonIdentity:(id)a3 highlightURL:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  int64_t v28;
  NSObject *v29;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 *p_buf;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t v46[4];
  __CFString *v47;
  uint8_t v48[128];
  __int128 buf;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v34 = a4;
  -[IMDCollaborationNoticeTypeGenerator highlightCenter](self, "highlightCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[IMDCollaborationNoticeTypeGenerator highlightCenter](self, "highlightCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v8, "collaborationHighlightForURL:error:", v34, &v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v45;

    if (v32)
      v10 = 1;
    else
      v10 = v33 == 0;
    v11 = !v10;
    v12 = IMOSLoggingEnabled(v9);
    if ((v11 & 1) != 0)
    {
      if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v33, "stringIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Received a mention with a person identity for highlight: %@. Attempting to find the handle for the mentioned identity.", (uint8_t *)&buf, 0xCu);

        }
      }
      v15 = (void *)MEMORY[0x1E0C99E60];
      +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activeAliases");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v50 = 0x2020000000;
      v51 = -1;
      -[IMDCollaborationNoticeTypeGenerator highlightCenter](self, "highlightCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fetchAttributionsForHighlight:", v33);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v31, "attributions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v42;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v42 != v21)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v22), "collaborationMetadata");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v23, "handleToIdentityMap");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = sub_1D14462A4;
              v37[3] = &unk_1E9228A08;
              v38 = v36;
              v39 = v35;
              p_buf = &buf;
              objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v37);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        }
        while (v20);
      }

      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) == 3)
        v25 = CFSTR("IMCollaborationNoticeTypeMentionedMe");
      else
        v25 = CFSTR("IMCollaborationNoticeTypeInvalid");
      v26 = v25;
      if (IMOSLoggingEnabled(v26))
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v46 = 138412290;
          v47 = v26;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "processMentionForPersonIdentity returning: %@", v46, 0xCu);
        }

      }
      v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v32;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Received a notice for a URL without a tracked highlight, returning invalid for this notice. error: %@", (uint8_t *)&buf, 0xCu);
        }

      }
      v28 = -1;
    }

  }
  else
  {
    v28 = -1;
  }

  return v28;
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightCenter, 0);
}

@end
