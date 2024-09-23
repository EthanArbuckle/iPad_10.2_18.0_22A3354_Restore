@implementation IMCarrierReportJunkHelper

+ (BOOL)isRCSServiceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[IMService rcsService](IMService, "rcsService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

+ (id)junkReportMessageItemForMessageItem:(id)a3 account:(id)a4 junkChatStyle:(unsigned __int8)a5 serviceName:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(a1, "createJunkReportMessageItemBodyForMessageItem:junkChatStyle:serviceName:", v10, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isRCSServiceName:", v12) & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v10, "fileTransferGUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_alloc(MEMORY[0x1E0D39918]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", 0, v16, v13, 0, v14, 5, 0, v17, 0);

  objc_msgSend(v10, "destinationCallerID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDestinationCallerID:", v19);

  objc_msgSend(a1, "setHandleParametersOfMessageItem:usingAccount:usingMessageItem:junkChatStyle:", v18, v11, v10, v7);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "IMMessageItem for reporting junk -> %@", buf, 0xCu);
    }

  }
  return v18;
}

+ (BOOL)canReportJunkOverCellularServiceOfMessageItem:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "destinationCallerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "userInHomeCountryWithDestinationCallerID:", v4);
  LOBYTE(a1) = objc_msgSend(a1, "wifiCallingEnabledForDestinationCallerID:", v4) | v5;

  return (char)a1;
}

+ (BOOL)isReportJunkServiceAllowedForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1A2198BD4(v7);
    goto LABEL_12;
  }
  objc_msgSend(a1, "reportJunkCarrierAddressForMessageItem:junkChatStyle:", v6, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Found nil carrier address in carrier bundle. Report Junk not allowed.", v14, 2u);
      }

    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v8 = objc_msgSend(a1, "validateReportJunkCarrierAddress:", v7);
  v9 = (void *)MEMORY[0x1E0D39730];
  objc_msgSend(v6, "destinationCallerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "carrierNameForPhoneNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    v8 = 0;

LABEL_13:
  return v8;
}

+ (void)collectReportJunkMetricsForJunkMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 totalMessagesInThread:(unint64_t)a5
{
  int v6;
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v6 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "isRCSServiceName:", v9);

  v48 = a5;
  if (v10)
  {
    v11 = v6 == 45;
    v12 = 10;
    goto LABEL_5;
  }
  objc_msgSend(v8, "subject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {

    v11 = v6 == 45;
    v12 = 2;
LABEL_5:
    if (!v11)
      ++v12;
    goto LABEL_7;
  }
  objc_msgSend(v8, "fileTransferGUIDs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  v12 = 2;
  if (v6 == 45)
  {
    if (!v43)
      v12 = 1;
  }
  else
  {
    v12 = 3;
  }
LABEL_7:
  v44 = v12;
  objc_msgSend(v8, "destinationCallerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "userInHomeCountryWithDestinationCallerID:", v14);

  v16 = 4;
  if (!v15)
    v16 = 5;
  v46 = v16;
  v17 = (void *)MEMORY[0x1E0D39730];
  objc_msgSend(v8, "destinationCallerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "carrierNameForPhoneNumber:", v18);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v8, "fileTransferGUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v51 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "transferForGUID:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v22 += objc_msgSend(v27, "totalBytes");
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  v49 = v8;
  objc_msgSend(v8, "body");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  v45 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v48);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0D38538];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x1E0D38528];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x1E0D38540];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0D38508];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v45, "initWithObjectsAndKeys:", v31, v32, v33, v34, v35, v36, v37, v38, v39, *MEMORY[0x1E0D38530], 0);

  if (objc_msgSend(v47, "length"))
    objc_msgSend(v40, "setObject:forKey:", v47, *MEMORY[0x1E0D38510]);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trackEvent:withDictionary:", *MEMORY[0x1E0D38500], v40);

}

+ (void)collectReportJunkMetricsForChatbotJunkMessageItem:(id)a3 totalMessagesInThread:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v5, "fileTransferGUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "transferForGUID:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v9 += objc_msgSend(v14, "totalBytes");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v5, "body");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  v18 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0D38538];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0D38528];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0D38540];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", v19, v20, v21, v22, v23, v24, v25, *MEMORY[0x1E0D38508], 0);

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trackEvent:withDictionary:", *MEMORY[0x1E0D38500], v26);

}

+ (void)setHandleParametersOfMessageItem:(id)a3 usingAccount:(id)a4 usingMessageItem:(id)a5 junkChatStyle:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a1, "reportJunkCarrierAddressForMessageItem:junkChatStyle:", a5, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imHandleWithID:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHandle:", v13);

  objc_msgSend(v12, "originalID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUnformattedID:", v14);

  objc_msgSend(v12, "countryCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCountryCode:", v15);

}

+ (id)reportJunkCarrierAddressForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "destinationCallerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (IMStringIsEmail() & 1) == 0)
  {
    v9 = MEMORY[0x1A858280C](v7);
    v10 = v7;
    v11 = v9 == 0;
    if (v9)
      v12 = v10;
    else
      v12 = 0;
    if (v11)
      v13 = v10;
    else
      v13 = 0;
    objc_msgSend(v6, "subject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {

    }
    else
    {
      objc_msgSend(v6, "fileTransferGUIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v4 == 45 && !v18)
      {
        objc_msgSend(a1, "fetchSMSReportJunkCarrierAddressForPhoneNumber:simID:", v12, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    objc_msgSend(a1, "fetchMMSReportJunkCarrierAddressForPhoneNumber:simID:", v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v8 = (void *)v15;

    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

+ (id)fetchSMSReportJunkCarrierAddressForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D39730], "carrierBundleValueForKeyHierarchy:phoneNumber:simID:", &unk_1E475EF58, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v7;
    objc_msgSend(v8, "valueForKey:", CFSTR("SMSCarrierReportJunkAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v9;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Report junk address provided by carrier is -> %@.\n", (uint8_t *)&v14, 0xCu);
      }

    }
    v11 = v9;

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = 138412546;
        v15 = &unk_1E475EF58;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Error getting Carrier Bundle dictionary. Key Hierarchy -> %@.\nCarrier Bundle object -> %@", (uint8_t *)&v14, 0x16u);
      }

    }
    v11 = 0;
  }

  return v11;
}

+ (id)fetchMMSReportJunkCarrierAddressForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D39730], "carrierBundleValueForKeyHierarchy:phoneNumber:simID:", &unk_1E475EF70, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v7;
    objc_msgSend(v8, "valueForKey:", CFSTR("MMSCarrierReportJunkAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v9;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Report junk address provided by carrier is -> %@.\n", (uint8_t *)&v14, 0xCu);
      }

    }
    v11 = v9;

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = 138412546;
        v15 = &unk_1E475EF70;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Error getting Carrier Bundle dictionary. Key Hierarchy -> %@.\nCarrier Bundle object -> %@", (uint8_t *)&v14, 0x16u);
      }

    }
    v11 = 0;
  }

  return v11;
}

+ (id)createJunkReportMessageItemBodyForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 serviceName:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "createJunkReportMessageBodyTextForMessageItem:junkChatStyle:serviceName:", v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(a1, "isRCSServiceName:", v9);

  if ((v6 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "fileTransferGUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "__im_attributedStringWithFileTransfers:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v13, "appendAttributedString:", v10);
  objc_msgSend(v13, "__im_attributedStringByAssigningMessagePartNumbers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)createJunkReportMessageBodyTextForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 serviceName:(id)a5
{
  int v6;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  BOOL v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("MMS");
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(v8, "fileTransferGUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      v13 = 0;
    else
      v13 = v6 == 45;
    if (v13)
      v11 = CFSTR("SMS");

  }
  v14 = v11;
  v15 = (id)qword_1EE65D550;
  if (objc_msgSend(a1, "isRCSServiceName:", v34))
  {
    v16 = (__CFString *)v34;

    v17 = (id)qword_1EE65D558;
    objc_msgSend(v8, "fallbackHash");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v9, "setValue:forKey:", v18, CFSTR("e"));
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileTransferGUIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transferForGUID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "originalFilename");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("a"));

    v14 = v16;
    v15 = v17;
  }
  objc_msgSend(v9, "setValue:forKey:", v14, CFSTR("r"));
  objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("v"));
  objc_msgSend(v8, "handle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "im_stripCategoryLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v9, "setValue:forKey:", v25, CFSTR("f"));
  objc_msgSend(a1, "receiveDateForMessageItem:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v9, "setValue:forKey:", v26, CFSTR("t"));
  objc_msgSend(v8, "body");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "string");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    objc_msgSend(v9, "setValue:forKey:", v28, CFSTR("m"));
  objc_msgSend(a1, "jsonSerializeDictionary:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "jsonSerializeDictionaryStrippingOutMessageContent:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v31;
      _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "Created serialize junk report: %@", buf, 0xCu);

    }
  }
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v29);

  return v32;
}

+ (id)receiveDateForMessageItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "time");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZ"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Receiving date of message item -> %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v7;
}

+ (id)jsonSerializeDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);

  return v4;
}

+ (id)jsonSerializeDictionaryStrippingOutMessageContent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", CFSTR("(hidden)"), CFSTR("m"));
  objc_msgSend(a1, "jsonSerializeDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)validateReportJunkCarrierAddress:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("^[+]?[0-9]+$"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "evaluateWithObject:", v3) & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v3);
    objc_msgSend(v5, "digitsRemovingDialingCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    v8 = v7 < 11;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = CFSTR("NO");
        if (v7 < 11)
          v10 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Is valid carrier report junk address - %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Not a valid report junk address from carrier. Carrier report junk address - %@", buf, 0xCu);
      }

    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)userInHomeCountryWithDestinationCallerID:(id)a3
{
  id v3;
  char v4;
  int v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (v3 && (IMStringIsEmail() & 1) == 0)
  {
    v5 = MEMORY[0x1A858280C](v3);
    v6 = v3;
    v7 = v5 == 0;
    if (v5)
      v8 = v6;
    else
      v8 = 0;
    if (v7)
      v9 = v6;
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ctSubscriptionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__im_subscriptionContextForForSimID:phoneNumber:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v13, "simInHomeCountryWithSubscriptionContext:", v12);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)wifiCallingEnabledForDestinationCallerID:(id)a3
{
  id v3;
  char v4;
  int v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (v3 && (IMStringIsEmail() & 1) == 0)
  {
    v5 = MEMORY[0x1A858280C](v3);
    v6 = v3;
    v7 = v5 == 0;
    if (v5)
      v8 = v6;
    else
      v8 = 0;
    if (v7)
      v9 = v6;
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ctSubscriptionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__im_subscriptionContextForForSimID:phoneNumber:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v13, "wifiCallingEnabledForSubscriptionContext:", v12);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
