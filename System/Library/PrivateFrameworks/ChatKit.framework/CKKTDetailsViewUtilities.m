@implementation CKKTDetailsViewUtilities

+ (id)ktSecuritySectionFooterTextViewForKTStatus:(unint64_t)a3 withHandles:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (objc_class *)MEMORY[0x1E0CEAB18];
  v6 = a4;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v8, "setEditable:", 0);
  objc_msgSend(v8, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(v8, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v8, "setBackgroundColor:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v10);

  objc_msgSend(v8, "setScrollEnabled:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "headerFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v12);

  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
  +[CKKTDetailsViewUtilities securityFooterStringForKTChatState:handles:](CKKTDetailsViewUtilities, "securityFooterStringForKTChatState:handles:", a3, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAttributedText:", v13);
  return v8;
}

+ (BOOL)shouldHighlightCell:(id)a3 forConversation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasKnownParticipants");

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_opt_class();
      v8 = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return v8 & 1;
}

+ (int64_t)numberOfRowsInKTSectionForStatus:(unint64_t)a3 isGroupChat:(BOOL)a4
{
  if (a3 - 9 < 0xFFFFFFFFFFFFFFFBLL || a4)
    return 1;
  else
    return 2;
}

+ (id)verifiedHandlesInChat:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isKTVerified", (_QWORD)v13))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (id)namesFromHandles:(id)a3 shouldUseShortFormat:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v4)
    v9 = 1;
  else
    v9 = 3;
  objc_msgSend(v7, "setStyle:", v9);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = (void *)objc_opt_new();
        objc_msgSend(v15, "firstName", (_QWORD)v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v15, "firstName");
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v15, "displayID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            goto LABEL_14;
          objc_msgSend(v15, "displayID");
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v20 = (void *)v18;
        objc_msgSend(v16, "setGivenName:", v18);

LABEL_14:
        objc_msgSend(v15, "lastName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v15, "lastName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setFamilyName:", v22);

        }
        objc_msgSend(v8, "stringFromPersonNameComponents:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v23);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  v24 = (void *)objc_msgSend(v6, "copy");
  return v24;
}

+ (id)_commaSeparatedNamesForHandles:(id)a3
{
  void *v3;
  void *v4;

  +[CKKTDetailsViewUtilities namesFromHandles:shouldUseShortFormat:](CKKTDetailsViewUtilities, "namesFromHandles:shouldUseShortFormat:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)securityDescriptionWithPlaceholder:(id)a3 handles:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  +[CKKTDetailsViewUtilities _commaSeparatedNamesForHandles:](CKKTDetailsViewUtilities, "_commaSeparatedNamesForHandles:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("KT_LEARN_MORE_FOOTER_BUTTON_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)securityFooterStringForKTChatState:(unint64_t)a3 handles:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v44;
  void *v45;

  v5 = a4;
  v45 = v5;
  v6 = v5;
  switch(a3)
  {
    case 0uLL:
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v20;
      v21 = CFSTR("KT_TURN_ON_FOOTER_TEXT");
      goto LABEL_22;
    case 1uLL:
    case 0xAuLL:
    case 0xDuLL:
    case 0xEuLL:
      v7 = CKIsRunningInMacCatalyst();
      CKFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
        v10 = CFSTR("SYSTEM_SETTINGS");
      else
        v10 = CFSTR("SETTINGS");
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKKTDetailsViewUtilities _commaSeparatedNamesForHandles:](CKKTDetailsViewUtilities, "_commaSeparatedNamesForHandles:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "count");
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v13 == 1)
        v17 = CFSTR("KT_FOOTER_VIEW_TEXT_DISABLED");
      else
        v17 = CFSTR("KT_FOOTER_VIEW_TEXT_DISABLED_PLURAL");
      objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("KT_LEARN_MORE_FOOTER_BUTTON_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v22, v12, v11, v24);
      v19 = objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    case 2uLL:
    case 0xBuLL:
    case 0xCuLL:
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v20;
      v21 = CFSTR("KT_FOOTER_VIEW_TEXT_UNAVAILABLE");
      goto LABEL_22;
    case 3uLL:
      if (objc_msgSend(v5, "count") == 1)
        v18 = CFSTR("KT_FOOTER_TEXT_NOT_VERIFIED");
      else
        v18 = CFSTR("KT_FOOTER_TEXT_NOT_VERIFIED_GROUP");
      goto LABEL_8;
    case 4uLL:
      if (objc_msgSend(v5, "count") == 1)
      {
        v18 = CFSTR("KT_FOOTER_TEXT_VERIFIED");
LABEL_8:
        +[CKKTDetailsViewUtilities securityDescriptionWithPlaceholder:handles:](CKKTDetailsViewUtilities, "securityDescriptionWithPlaceholder:handles:", v18, v6);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CKFrameworkBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v20;
        v21 = CFSTR("KT_FOOTER_TEXT_VERIFIED_GROUP");
LABEL_22:
        objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_23:

      }
LABEL_24:
      v44 = (void *)v19;
      CKFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("KT_LEARN_MORE_FOOTER_BUTTON_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v19, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "rangeOfString:", v26);
      v30 = v29;
      v31 = objc_msgSend(v27, "length");
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v27);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "headerFont");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior font:adjustedForMaxSizeCategory:](CKUIBehavior, "font:adjustedForMaxSizeCategory:", v34, *MEMORY[0x1E0CEB3C8]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v35, 0, v31);
      v36 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAttribute:value:range:", v36, v37, 0, v31);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "theme");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "appTintColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAttribute:value:range:", v36, v40, v28, v30);

      v41 = *MEMORY[0x1E0DC1160];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E276D870);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAttribute:value:range:", v41, v42, v28, v30);

      objc_msgSend(v32, "addAttribute:value:range:", *MEMORY[0x1E0DC1248], MEMORY[0x1E0C9AAA0], v28, v30);
      return v32;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      v18 = CFSTR("KT_FOOTER_VIEW_TEXT_VERIFICATION_FAILURE");
      goto LABEL_8;
    case 9uLL:
      if (objc_msgSend(v5, "count") == 1)
        v18 = CFSTR("KT_FOOTER_VIEW_TEXT_TURNED_OFF");
      else
        v18 = CFSTR("KT_FOOTER_VIEW_TEXT_TURNED_OFF_PLURAL");
      goto LABEL_8;
    default:
      v19 = 0;
      goto LABEL_24;
  }
}

+ (id)securityHeaderString
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("KT_HEADER_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)enableKTCellText
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("KT_ENABLE_KT_CELL_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
