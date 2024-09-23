@implementation MFSMTPDelivery

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__MFSMTPDelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_36 != -1)
    dispatch_once(&log_onceToken_36, block);
  return (id)log_log_36;
}

void __21__MFSMTPDelivery_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_36;
  log_log_36 = (uint64_t)v1;

}

- (Class)deliveryClass
{
  return (Class)objc_opt_class();
}

- (void)_openConnection
{
  MFSMTPConnection *v3;
  MFSMTPConnection *connection;

  if (!-[MFConnection isValid](self->_connection, "isValid"))
  {
    -[DeliveryAccount authenticatedConnection:](self->super._account, "authenticatedConnection:", (*((unsigned __int8 *)&self->super + 104) >> 1) & 1);
    v3 = (MFSMTPConnection *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = v3;

  }
}

- (void)setAccount:(id)a3
{
  DeliveryAccount *v4;
  DeliveryAccount *v5;
  MFSMTPConnection *connection;
  objc_super v7;

  v4 = (DeliveryAccount *)a3;
  v5 = v4;
  connection = self->_connection;
  if (connection && self->super._account != v4)
  {
    self->_connection = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)MFSMTPDelivery;
  -[MFMailDelivery setAccount:](&v7, sel_setAccount_, v5);

}

- (id)deliverMessageData:(id)a3 toRecipients:(id)a4
{
  void *v6;
  void *v7;
  MFSMTPConnection *connection;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  MFMailMessage *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  double v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _BOOL8 v56;
  MFSMTPConnection *v57;
  void *v58;
  NSObject *v59;
  MFMailMessage *message;
  int v61;
  double Current;
  MFSMTPConnection *v63;
  id v64;
  double v65;
  DeliveryAccount *account;
  _BOOL8 v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  MFDeliveryResult *v76;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[4];
  id v93;
  char v94;
  int v95;
  uint8_t buf[4];
  MFMailMessage *v97;
  _QWORD v98[8];

  v98[6] = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v80 = a4;
  -[MFAccount hostname](self->super._account, "hostname");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 1030;
  v94 = 0;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v6;
  objc_msgSend(v6, "resetConnectionStats");
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E788]), "initWithDomain:type:", 21, 21);
  objc_msgSend(v82, "startActivity");
  if (!-[MFConnection isValid](self->_connection, "isValid"))
    -[MFSMTPDelivery _openConnection](self, "_openConnection");
  if (v87)
  {
    v7 = 0;
  }
  else
  {
    v95 = 1044;
    MFLookupLocalizedString(CFSTR("NO_SMTP_HOST"), CFSTR("You have not specified an SMTP server in Mail Preferences. You must specify a server before you can send mail."), CFSTR("Delayed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[MFConnection isValid](self->_connection, "isValid"))
  {
    connection = self->_connection;
    WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    -[MFSMTPConnection setDelegate:](connection, "setDelegate:", WeakRetained);

    v10 = objc_loadWeakRetained(&self->super._delegate);
    objc_msgSend(v10, "setPercentDone:", 0.1);

    if (!v87)
    {
      v23 = 0;
      v84 = 0;
      v24 = 0;
      v25 = 1;
      goto LABEL_30;
    }
    -[MFMailMessage headers](self->super._message, "headers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyAddressListForResentFrom");
    if (!objc_msgSend(v12, "count"))
      goto LABEL_21;
    objc_msgSend(v12, "objectAtIndex:", 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emailAddressValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "simpleAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v13, "stringValue");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v17;

    if (v26)
    {
      v85 = v26;
      if (!objc_msgSend(v26, "isEqualToString:", &stru_1E4F1C8F8))
      {
        v27 = v26;
LABEL_29:
        v84 = v27;
        objc_msgSend(v27, "dataUsingEncoding:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v35 == 0;

        v25 = 0;
        v23 = 1;
        goto LABEL_30;
      }
    }
    else
    {
LABEL_21:
      v85 = 0;
    }
    -[MFMailMessage senders](self->super._message, "senders");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(v28, "objectAtIndex:", 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "emailAddressValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "simpleAddress");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        v33 = v31;
      }
      else
      {
        objc_msgSend(v29, "stringValue");
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v33;

    }
    else
    {
      v34 = 0;
      v29 = v85;
    }

    v27 = v34;
    v12 = v28;
    goto LABEL_29;
  }
  objc_msgSend(v6, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("SMTP_NO_CONNECTION"), CFSTR("The connection to the outgoing server “%@” failed. Additional Outgoing Mail Servers can be configured for Mail accounts in Settings > Apps > Mail > Accounts."), CFSTR("Delayed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v87);
    v21 = objc_claimAutoreleasedReturnValue();

    v95 = 1051;
    v7 = (void *)v21;
  }
  +[MFSMTPDelivery log](MFSMTPDelivery, "log");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[MFSMTPDelivery deliverMessageData:toRecipients:].cold.2(v22);

  v23 = 0;
  v84 = 0;
  v24 = 0;
  v25 = 5;
LABEL_30:
  v36 = *MEMORY[0x1E0D1E520];
  v98[0] = *MEMORY[0x1E0D1E600];
  v98[1] = v36;
  v37 = *MEMORY[0x1E0D1E5F0];
  v98[2] = *MEMORY[0x1E0D1E518];
  v98[3] = v37;
  v38 = *MEMORY[0x1E0D1E5D0];
  v98[4] = *MEMORY[0x1E0D1E5D8];
  v98[5] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 6);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDelivery headersForDelivery](self, "headersForDelivery");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "headersRequiringSMTPUTF8Support");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __50__MFSMTPDelivery_deliverMessageData_toRecipients___block_invoke;
  v92[3] = &unk_1E4E8D530;
  v78 = v79;
  v93 = v78;
  if ((v24 | objc_msgSend(v83, "ef_any:", v92)) == 1)
  {
    if (!-[MFSMTPConnection supportsSMTPUTF8](self->_connection, "supportsSMTPUTF8"))
    {
      +[MFSMTPDelivery log](MFSMTPDelivery, "log");
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        message = self->super._message;
        *(_DWORD *)buf = 138412290;
        v97 = message;
        _os_log_impl(&dword_1A4F90000, v59, OS_LOG_TYPE_DEFAULT, "SMTPUTF8 is not supported: %@", buf, 0xCu);
      }

      MFLookupLocalizedString(CFSTR("SMTP_SENDING_FAILED_TITLE"), CFSTR("Unable to Send Email"), CFSTR("Delayed"));
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (v24)
        v61 = 1047;
      else
        v61 = 1049;
      v95 = v61;
      if (v24)
        MFLookupLocalizedString(CFSTR("SMTP_INVALID_SENDER_ADDRESS"), CFSTR("The sender address “%@” was rejected by the server."), CFSTR("Delayed"));
      else
        MFLookupLocalizedString(CFSTR("MF_SMTP_RECIPIENT_INVALID_ADDRESS"), CFSTR("The recipient “%@” was rejected by the server because it is not a valid email address."), CFSTR("Delayed"));
      v54 = objc_claimAutoreleasedReturnValue();
      v25 = 1;
      goto LABEL_61;
    }
    +[MFSMTPDelivery log](MFSMTPDelivery, "log");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = self->super._message;
      *(_DWORD *)buf = 138412290;
      v97 = v41;
      _os_log_impl(&dword_1A4F90000, v40, OS_LOG_TYPE_DEFAULT, "Enabling SMTPUTF8 support for message delivery: %@", buf, 0xCu);
    }

    v42 = 0;
    if (!v23)
      goto LABEL_35;
  }
  else
  {
    v42 = 1;
    if (!v23)
    {
LABEL_35:
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0.0;
      goto LABEL_62;
    }
  }
  v47 = -[MFSMTPConnection maximumMessageBytes](self->_connection, "maximumMessageBytes");
  if (v47)
  {
    v48 = objc_msgSend(v81, "length");
    v49 = objc_msgSend(v81, "numberOfNewlinesNeedingConversion:", 0) + v48;
    if (v47 < v49)
    {
      v50 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("MESSAGE_TOO_LARGE"), CFSTR("Your message has size %@, which exceeds %@, the maximum allowed by the server."), CFSTR("Message"));
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v47);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringWithFormat:", v51, v52, v53);
      v54 = objc_claimAutoreleasedReturnValue();

      v43 = 0;
      v25 = 7;
      v7 = (void *)v51;
LABEL_61:

      v44 = 0;
      v45 = 0;
      v46 = 0.0;
      v7 = (void *)v54;
      goto LABEL_62;
    }
  }
  -[MFMailDelivery archiveAccount](self, "archiveAccount");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[DeliveryAccount shouldUseSaveSentForAccount:](self->super._account, "shouldUseSaveSentForAccount:", v55);
  v57 = self->_connection;
  if (v56)
  {
    objc_msgSend(v55, "saveSentFolder");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = 0;
  }
  -[MFSMTPConnection setUseSaveSent:toFolder:](v57, "setUseSaveSent:toFolder:", v56, v58);
  if (v56)

  Current = CFAbsoluteTimeGetCurrent();
  -[MFConnection enableThroughputMonitoring:](self->_connection, "enableThroughputMonitoring:", 1);
  -[MFConnection startActivity](self->_connection, "startActivity");
  v63 = self->_connection;
  v90 = v7;
  v91 = 0;
  v88 = 0;
  v89 = 0;
  v25 = -[MFSMTPConnection mailFrom:recipients:withData:host:emailFormatStyle:errorTitle:errorMessage:serverResponse:displayError:errorCode:errorUserInfo:](v63, "mailFrom:recipients:withData:host:emailFormatStyle:errorTitle:errorMessage:serverResponse:displayError:errorCode:errorUserInfo:", v84, v80, v81, v87, v42, &v91, &v90, &v89, &v94, &v95, &v88);
  v43 = v91;
  v64 = v90;

  v7 = v64;
  v45 = v89;
  v44 = v88;
  -[MFConnection stopActivity](self->_connection, "stopActivity");
  -[MFConnection enableThroughputMonitoring:](self->_connection, "enableThroughputMonitoring:", 0);
  v65 = CFAbsoluteTimeGetCurrent();
  account = self->super._account;
  v67 = v56 && -[MFSMTPConnection supportsOutboxCopy](self->_connection, "supportsOutboxCopy");
  -[DeliveryAccount setSupportsOutboxCopy:](account, "setSupportsOutboxCopy:", v67);

  v46 = v65 - Current;
  if (v25 == 3)
  {
    -[MFSMTPConnection abort](self->_connection, "abort");
    v69 = 0;
    v25 = 3;
    if (!v7)
      goto LABEL_71;
    goto LABEL_65;
  }
  if (!v25)
  {
    -[MFMailDelivery account](self, "account");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "checkInConnection:", self->_connection);

    v25 = 0;
    v69 = 1;
    if (!v7)
      goto LABEL_71;
    goto LABEL_65;
  }
LABEL_62:
  -[MFSMTPConnection quit](self->_connection, "quit");
  if (v25 == 4)
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1028, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setError:", v70);
    v69 = 0;
    v25 = 4;
LABEL_70:

    goto LABEL_71;
  }
  v69 = 0;
  if (v7)
  {
LABEL_65:
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), v95, 0, v43, v44);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setShortDescription:", v71);

    }
    objc_msgSend(v70, "setLocalizedDescription:", v7);
    objc_msgSend(v70, "setMoreInfo:", v45);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setUserInfoObject:forKey:", v72, CFSTR("MailErrorHandlerDoNotSanitize"));

    objc_msgSend(v86, "setError:", v70);
    +[MFSMTPDelivery log](MFSMTPDelivery, "log");
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      -[MFMailMessage messageID](self->super._message, "messageID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "ef_publicDescription");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSMTPDelivery deliverMessageData:toRecipients:].cold.1(v74, v75, buf, v73);
    }

    goto LABEL_70;
  }
LABEL_71:
  v76 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", v25);
  -[MFDeliveryResult setDuration:](v76, "setDuration:", v46);
  -[MFDeliveryResult setBytesSent:](v76, "setBytesSent:", objc_msgSend(v86, "bytesWritten"));
  objc_msgSend(v82, "stopActivityWithSuccess:", v69);

  return v76;
}

uint64_t __50__MFSMTPDelivery_deliverMessageData_toRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)deliverMessageData:(uint8_t *)buf toRecipients:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "SMTP Delivery for messageID %@ failed with error %{public}@", buf, 0x16u);

}

- (void)deliverMessageData:(os_log_t)log toRecipients:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Failed to find valid connection for SMTP delivery", v1, 2u);
}

@end
