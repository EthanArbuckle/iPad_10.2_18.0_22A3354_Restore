@implementation IMCoreRecentsMetadataBuilder

+ (id)referenceURLForMessageGUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://open?message-guid=%@"), a3);
}

+ (id)deprecatedReferenceURLForMessageGUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms:/open?message-guid=%@"), a3);
}

+ (id)metadataDictionaryForMessageID:(id)a3 senderID:(id)a4 date:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void **v11;
  void *v12;
  void **v13;
  void *v14;
  void **v15;
  void *v16;
  void **v17;
  void *v18;
  void **v19;
  void *v20;
  void **v21;
  void *v22;
  void **v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  __CFString *v28;
  uint64_t *v29;
  __CFString *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint8_t v37[8];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (!qword_1EE503F38)
  {
    v11 = (void **)MEMORY[0x1A1AE7D58]("CRAddressKindEmail", CFSTR("CoreRecents"));
    if (v11)
      v12 = *v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&qword_1EE503F38, v12);
  }
  if (!qword_1EE503F40)
  {
    v13 = (void **)MEMORY[0x1A1AE7D58]("CRAddressKindPhoneNumber", CFSTR("CoreRecents"));
    if (v13)
      v14 = *v13;
    else
      v14 = 0;
    objc_storeStrong((id *)&qword_1EE503F40, v14);
  }
  if (!qword_1EE503F48)
  {
    v15 = (void **)MEMORY[0x1A1AE7D58]("CRRecentContactMetadataEventTime", CFSTR("CoreRecents"));
    if (v15)
      v16 = *v15;
    else
      v16 = 0;
    objc_storeStrong((id *)&qword_1EE503F48, v16);
  }
  if (!qword_1EE503F50)
  {
    v17 = (void **)MEMORY[0x1A1AE7D58]("CRRecentContactMetadataReferenceURL", CFSTR("CoreRecents"));
    if (v17)
      v18 = *v17;
    else
      v18 = 0;
    objc_storeStrong((id *)&qword_1EE503F50, v18);
  }
  if (!qword_1EE503F58)
  {
    v19 = (void **)MEMORY[0x1A1AE7D58]("CRRecentContactMetadataFromAddress", CFSTR("CoreRecents"));
    if (v19)
      v20 = *v19;
    else
      v20 = 0;
    objc_storeStrong((id *)&qword_1EE503F58, v20);
  }
  if (!qword_1EE503F60)
  {
    v21 = (void **)MEMORY[0x1A1AE7D58]("CRRecentContactMetadataFromAddressKind", CFSTR("CoreRecents"));
    if (v21)
      v22 = *v21;
    else
      v22 = 0;
    objc_storeStrong((id *)&qword_1EE503F60, v22);
  }
  if (!qword_1EE503F68)
  {
    v23 = (void **)MEMORY[0x1A1AE7D58]("CRRecentContactMetadataFrom", CFSTR("CoreRecents"));
    if (v23)
      v24 = *v23;
    else
      v24 = 0;
    objc_storeStrong((id *)&qword_1EE503F68, v24);
  }
  if (v9)
  {
    if (v10)
      goto LABEL_49;
    goto LABEL_44;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v37 = 0;
    }

  }
  v9 = &stru_1E3FBBA48;
  if (!v10)
  {
LABEL_44:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_49:
  v27 = -[__CFString _appearsToBePhoneNumber](v9, "_appearsToBePhoneNumber");
  IMNormalizeFormattedString();
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v29 = &qword_1EE503F40;
  if (!v27)
    v29 = &qword_1EE503F38;
  v30 = (__CFString *)(id)*v29;
  objc_msgSend(a1, "referenceURLForMessageGUID:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (v30)
      goto LABEL_64;
    goto LABEL_59;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v37 = 0;
    }

  }
  v28 = &stru_1E3FBBA48;
  if (!v30)
  {
LABEL_59:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
      }

    }
    v30 = &stru_1E3FBBA48;
  }
LABEL_64:
  v40[0] = qword_1EE503F58;
  v40[1] = qword_1EE503F60;
  v41[0] = v28;
  v41[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = qword_1EE503F48;
  v38[1] = qword_1EE503F68;
  v39[0] = v10;
  v39[1] = v34;
  v38[2] = qword_1EE503F50;
  v38[3] = CFSTR("messages:message-guid");
  v39[2] = v31;
  v39[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

@end
