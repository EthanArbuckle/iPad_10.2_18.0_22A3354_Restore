@implementation CKContextMenuGenerator

+ (id)recipientSubmenuForHandle:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[CKContextMenuGenerator menuActionToDisplayRecipientForHandle:](CKContextMenuGenerator, "menuActionToDisplayRecipientForHandle:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CEA740];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)menuActionToDisplayRecipientForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "ID"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (((MEMORY[0x193FF3B1C]() & 1) != 0 || IMStringIsEmail())
      && (IMFormattedDisplayStringForNumber(), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithTitle:image:identifier:handler:", v8, 0, 0, &__block_literal_global_63);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAttributes:", 1);
      objc_msgSend(v7, "setState:", 1);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)submenuForIndividualParticipantWithHandle:(id)a3 forConversation:(id)a4 includeAddToContactsAction:(BOOL)a5 includeRemoveAction:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", MEMORY[0x1E0C9AA60]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CKContextMenuGenerator menuActionToRemoveHandle:fromConversation:](CKContextMenuGenerator, "menuActionToRemoveHandle:fromConversation:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v11, "addObject:", v12);

  }
  if (objc_msgSend(a1, "_shouldShowPrivateMessageOptionForHandle:conversation:", v9, v10))
  {
    objc_msgSend(v9, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKContextMenuGenerator menuActionToSendPrivateMessageToHandleID:](CKContextMenuGenerator, "menuActionToSendPrivateMessageToHandleID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v11, "addObject:", v14);

  }
  objc_msgSend(v9, "email");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v9, "email");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKContextMenuGenerator menuActionToSendEmailToAddress:](CKContextMenuGenerator, "menuActionToSendEmailToAddress:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v11, "addObject:", v17);

  }
  objc_msgSend(v9, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v18))
  {
    +[CKContextMenuGenerator menuActionToOpenContactCardForContact:](CKContextMenuGenerator, "menuActionToOpenContactCardForContact:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v11, "addObject:", v19);

  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)menuActionToRemoveHandle:(id)a3 fromConversation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECIPIENT"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__CKContextMenuGenerator_menuActionToRemoveHandle_fromConversation___block_invoke;
    v13[3] = &unk_1E274F768;
    v14 = v7;
    v15 = v5;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __68__CKContextMenuGenerator_menuActionToRemoveHandle_fromConversation___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeRecipientHandles:", v2);

}

+ (id)menuActionToSendPrivateMessageToHandleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEND_PRIVATE_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke;
    v10[3] = &unk_1E274B178;
    v11 = v4;
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://open?addresses=%@"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)*MEMORY[0x1E0CEB258];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke_42;
    v9[3] = &unk_1E274A1B8;
    v10 = v5;
    objc_msgSend(v7, "openURL:withCompletionHandler:", v10, v9);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Unable to create NSURL with urlString: %@", buf, 0xCu);
    }

  }
}

void __67__CKContextMenuGenerator_menuActionToSendPrivateMessageToHandleID___block_invoke_42(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("Failed");
      v6 = *(_QWORD *)(a1 + 32);
      if (a2)
        v5 = CFSTR("Succeeded");
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Opening private conversation URL: %@ %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

+ (id)menuActionToSendEmailToAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEND_EMAIL"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__CKContextMenuGenerator_menuActionToSendEmailToAddress___block_invoke;
    v10[3] = &unk_1E274B178;
    v11 = v4;
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __57__CKContextMenuGenerator_menuActionToSendEmailToAddress___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "initWithFormat:", CFSTR("mailto:%@"), v5);

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "openURL:withCompletionHandler:", v6, 0);

  }
}

+ (id)menuActionToOpenContactCardForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHOW_CONTACT_CARD"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__CKContextMenuGenerator_menuActionToOpenContactCardForContact___block_invoke;
      v12[3] = &unk_1E274B178;
      v13 = v4;
      objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    v5 = 0;
  }
LABEL_6:

  return v5;
}

void __64__CKContextMenuGenerator_menuActionToOpenContactCardForContact___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("addressbook://"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v2);

  v3 = (void *)*MEMORY[0x1E0CEB258];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, 0);

}

+ (id)menuActionToCreateContactForID:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "_appearsToBeBusinessID") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ADD_TO_CONTACTS…"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__CKContextMenuGenerator_menuActionToCreateContactForID_handler___block_invoke;
    v12[3] = &unk_1E274F790;
    v14 = v6;
    v13 = v5;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __65__CKContextMenuGenerator_menuActionToCreateContactForID_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

+ (id)menuActionToShowIDAsLargeType:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "_appearsToBeEmail") & 1) != 0 || (objc_msgSend(v5, "_appearsToBeBusinessID") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LARGE_TYPE"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__CKContextMenuGenerator_menuActionToShowIDAsLargeType_handler___block_invoke;
    v12[3] = &unk_1E274F790;
    v14 = v6;
    v13 = v5;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __64__CKContextMenuGenerator_menuActionToShowIDAsLargeType_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), 1);
  return result;
}

+ (id)subMenuForScreenSharingOptionsWithHandle:(id)a3 conversation:(id)a4 andContactsManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[CKContextMenuGenerator _menuActionToShareMyScreenWithHandle:conversation:andContactsManager:](CKContextMenuGenerator, "_menuActionToShareMyScreenWithHandle:conversation:andContactsManager:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKContextMenuGenerator _menuActionToInviteHandleToShareTheirScreen:conversation:andContactsManager:](CKContextMenuGenerator, "_menuActionToInviteHandleToShareTheirScreen:conversation:andContactsManager:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v15 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CEA740];
    v17[0] = v10;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

+ (id)_menuActionToShareMyScreenWithHandle:(id)a3 conversation:(id)a4 andContactsManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INVITE_TO_SHARE_MY_SCREEN"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __95__CKContextMenuGenerator__menuActionToShareMyScreenWithHandle_conversation_andContactsManager___block_invoke;
      v15[3] = &unk_1E274F768;
      v16 = v9;
      v17 = v8;
      objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __95__CKContextMenuGenerator__menuActionToShareMyScreenWithHandle_conversation_andContactsManager___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recipient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shareMyScreenWithEntity:", v2);

}

+ (id)_menuActionToInviteHandleToShareTheirScreen:(id)a3 conversation:(id)a4 andContactsManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ASK_TO_SHARE_THEIR_SCREEN"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __102__CKContextMenuGenerator__menuActionToInviteHandleToShareTheirScreen_conversation_andContactsManager___block_invoke;
      v15[3] = &unk_1E274F768;
      v16 = v9;
      v17 = v8;
      objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __102__CKContextMenuGenerator__menuActionToInviteHandleToShareTheirScreen_conversation_andContactsManager___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recipient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "inviteEntityToShareTheirScreen:", v2);

}

+ (id)menuActionToInitiateFaceTimeAudioWithHandle:(id)a3 andContactsManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACE_TIME_AUDIO"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeAudioWithHandle_andContactsManager___block_invoke;
    v13[3] = &unk_1E274F768;
    v14 = v5;
    v15 = v7;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeAudioWithHandle_andContactsManager___block_invoke(uint64_t a1)
{
  CKEntity *v2;

  v2 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "startCommunicationForEntity:action:address:", v2, 1, 0);

}

+ (id)menuActionToInitiateFaceTimeVideoWithHandle:(id)a3 andContactsManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACE_TIME"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeVideoWithHandle_andContactsManager___block_invoke;
    v13[3] = &unk_1E274F768;
    v14 = v5;
    v15 = v7;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __89__CKContextMenuGenerator_menuActionToInitiateFaceTimeVideoWithHandle_andContactsManager___block_invoke(uint64_t a1)
{
  CKEntity *v2;

  v2 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "startCommunicationForEntity:action:address:", v2, 0, 0);

}

+ (id)menuActionsToInitiateRelayPhoneCallWithHandle:(id)a3
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = +[CKContextMenuGenerator supportsRelayPhoneCallsCalls](CKContextMenuGenerator, "supportsRelayPhoneCallsCalls");
  v5 = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", MEMORY[0x1E0C9AA60]);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnContactWithKeys:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 && v6 != 0)
  {
    v20 = (void *)v6;
    v21 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(MEMORY[0x1E0D397A8], "phoneNumbersForCNContact:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v15, "_appearsToBePhoneNumber"))
          {
            v16 = (void *)MEMORY[0x1E0CEA2A8];
            +[CKContextMenuGenerator relayPhoneCallActionTextForPhoneNumber:](CKContextMenuGenerator, "relayPhoneCallActionTextForPhoneNumber:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __72__CKContextMenuGenerator_menuActionsToInitiateRelayPhoneCallWithHandle___block_invoke;
            v23[3] = &unk_1E274B178;
            v23[4] = v15;
            objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, 0, 0, v23);
            v18 = objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v22, "addObject:", v18);
            v12 = (void *)v18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v7 = v20;
    v3 = v21;
  }

  return v22;
}

void __72__CKContextMenuGenerator_menuActionsToInitiateRelayPhoneCallWithHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Initiating relay phone call.", (uint8_t *)&v12, 2u);
    }

  }
  v5 = objc_alloc_init(MEMORY[0x1E0DBD1E0]);
  v6 = objc_alloc(MEMORY[0x1E0DBD2E0]);
  objc_msgSend(v5, "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProvider:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2F8]), "initWithType:value:", 2, *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "setHandle:", v9);
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "openURL:withCompletionHandler:", v10, &__block_literal_global_76_0);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKContextMenuGenerator: Relay phone call: Couldn't get URL from dial request %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

void __72__CKContextMenuGenerator_menuActionsToInitiateRelayPhoneCallWithHandle___block_invoke_75(uint64_t a1, int a2)
{
  int v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  v3 = IMOSLoggingEnabled();
  if (a2)
  {
    if (!v3)
      return;
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v8 = 0;
    v5 = "Successfully initiated relay phone call";
    v6 = (uint8_t *)&v8;
    goto LABEL_8;
  }
  if (!v3)
    return;
  OSLogHandleForIMFoundationCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 0;
    v5 = "CKContextMenuGenerator: Attempt to open relay phone call request URL failed.";
    v6 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
  }
LABEL_9:

}

+ (BOOL)supportsRelayPhoneCallsCalls
{
  return +[CKFaceTimeUtilities isTelephonyAvailable](CKFaceTimeUtilities, "isTelephonyAvailable");
}

+ (id)relayPhoneCallActionTextForPhoneNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DBD1B0];
  CKFormattedPhoneNumberFromNumber(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supplementalDialTelephonyCallStringForDestination:isPhoneNumber:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)menuForNamedGroupConversation:(id)a3 andContactsManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isGroupConversation")
    && (objc_msgSend(v5, "displayName"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    +[CKContextMenuGenerator _menuActionToInitiateFaceTimeVideoForConversation:andContactsManager:](CKContextMenuGenerator, "_menuActionToInitiateFaceTimeVideoForConversation:andContactsManager:", v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKContextMenuGenerator _menuActionToInitiateFaceTimeAudioForConversation:andContactsManager:](CKContextMenuGenerator, "_menuActionToInitiateFaceTimeAudioForConversation:andContactsManager:", v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "addObject:", v10);
    if (v11)
      objc_msgSend(v9, "addObject:", v11);
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

    }
    +[CKContextMenuGenerator _menuActionToSendEmailForConversation:andContactsManager:](CKContextMenuGenerator, "_menuActionToSendEmailForConversation:andContactsManager:", v5, v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      v15 = (void *)MEMORY[0x1E0CEA740];
      v20[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v17);

    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_menuActionToInitiateFaceTimeVideoForConversation:(id)a3 andContactsManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACE_TIME"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeVideoForConversation_andContactsManager___block_invoke;
    v12[3] = &unk_1E274B178;
    v13 = v6;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeVideoForConversation_andContactsManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginFacetimeCallWithVideo:", 1);
}

+ (id)_menuActionToInitiateFaceTimeAudioForConversation:(id)a3 andContactsManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACE_TIME_AUDIO"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeAudioForConversation_andContactsManager___block_invoke;
    v12[3] = &unk_1E274B178;
    v13 = v6;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __95__CKContextMenuGenerator__menuActionToInitiateFaceTimeAudioForConversation_andContactsManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginFacetimeCallWithVideo:", 0);
}

+ (id)_menuActionToSendEmailForConversation:(id)a3 andContactsManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SEND_EMAIL"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__CKContextMenuGenerator__menuActionToSendEmailForConversation_andContactsManager___block_invoke;
    v12[3] = &unk_1E274B178;
    v13 = v6;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __83__CKContextMenuGenerator__menuActionToSendEmailForConversation_andContactsManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendEmail");
}

+ (BOOL)_shouldShowPrivateMessageOptionForHandle:(id)a3 conversation:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 0;
  objc_msgSend(a4, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)objc_msgSend(v5, "count") > 1;

  return v6;
}

@end
