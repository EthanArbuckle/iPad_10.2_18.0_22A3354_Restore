@implementation MFSMTPDelivery

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSMTPDelivery;
  -[MFMailDelivery dealloc](&v3, sel_dealloc);
}

- (Class)deliveryClass
{
  return (Class)objc_opt_class();
}

- (void)_openConnection
{
  if (!-[MFConnection isValid](self->_connection, "isValid"))
  {

    self->_connection = (MFSMTPConnection *)(id)-[DeliveryAccount authenticatedConnection:](self->super._account, "authenticatedConnection:", (*((unsigned __int8 *)&self->super + 112) >> 1) & 1);
  }
}

- (void)setAccount:(id)a3
{
  MFSMTPConnection *connection;
  objc_super v6;

  connection = self->_connection;
  if (connection && self->super._account != a3)
  {

    self->_connection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MFSMTPDelivery;
  -[MFMailDelivery setAccount:](&v6, sel_setAccount_, a3);
}

- (id)deliverMessageData:(id)a3 toRecipients:(id)a4
{
  NSString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  id v21;
  _BOOL8 v22;
  MFSMTPConnection *connection;
  uint64_t v24;
  double v25;
  MFError *v26;
  MFDeliveryResult *v27;
  double Current;
  double v30;
  _BOOL8 v31;
  DeliveryAccount *account;
  id v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;

  v7 = -[MFAccount hostname](self->super._account, "hostname");
  v39 = 1030;
  v37 = 0;
  v38 = 0;
  v35 = 0;
  v36 = 0;
  v34 = 0;
  v8 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  objc_msgSend(v8, "resetConnectionStats");
  if (!-[MFConnection isValid](self->_connection, "isValid"))
    -[MFSMTPDelivery _openConnection](self, "_openConnection");
  if (!v7)
  {
    v39 = 1044;
    v10 = 0;
    v37 = MFLookupLocalizedString((uint64_t)CFSTR("NO_SMTP_HOST"), (uint64_t)CFSTR("You have not specified an SMTP server in Mail Preferences. You must specify a server before you can send mail."), CFSTR("Delayed"));
    goto LABEL_13;
  }
  v9 = (void *)objc_msgSend((id)-[MFMessage headers](self->super._message, "headers"), "copyAddressListForResentFrom");
  if (!objc_msgSend(v9, "count"))
  {

LABEL_10:
    v11 = (void *)-[MFMessage senders](self->super._message, "senders");
    if (objc_msgSend(v11, "count"))
      v10 = (void *)objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "mf_uncommentedAddress");
    else
      v10 = 0;
    goto LABEL_13;
  }
  v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "mf_uncommentedAddress");

  if (!v10 || objc_msgSend(v10, "isEqualToString:", &stru_1E81CBE50))
    goto LABEL_10;
LABEL_13:
  if (!-[MFConnection isValid](self->_connection, "isValid"))
  {
    if (!objc_msgSend(v8, "error"))
    {
      v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMTP_NO_CONNECTION"), (uint64_t)CFSTR("The connection to the outgoing server “%@” failed. Additional Outgoing Mail Servers can be configured for Mail accounts in Settings > Accounts & Passwords."), CFSTR("Delayed")), v7);
      v39 = 1051;
    }
    v20 = 5;
    goto LABEL_24;
  }
  -[MFSMTPConnection setDelegate:](self->_connection, "setDelegate:", self->super._delegate);
  objc_msgSend(self->super._delegate, "setPercentDone:", 0.1);
  if (!v7)
  {
    v20 = 1;
    goto LABEL_24;
  }
  v33 = a4;
  v12 = -[MFSMTPConnection maximumMessageBytes](self->_connection, "maximumMessageBytes");
  if (v12)
  {
    v13 = v12;
    v14 = -[MFSMTPConnection supportsBinaryMime](self->_connection, "supportsBinaryMime");
    v15 = objc_msgSend(a3, "length");
    v16 = objc_msgSend(a3, "numberOfNewlinesNeedingConversion:", v14) + v15;
    if (v13 < v16)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = MFLookupLocalizedString((uint64_t)CFSTR("MESSAGE_TOO_LARGE"), (uint64_t)CFSTR("Your message has size %@, which exceeds %@, the maximum allowed by the server."), 0);
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v16);
      v37 = objc_msgSend(v17, "stringWithFormat:", v18, v19, objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v13));
      v20 = 7;
LABEL_24:
      -[MFSMTPConnection quit](self->_connection, "quit");
      v25 = 0.0;
      goto LABEL_25;
    }
  }
  v21 = -[MFMailDelivery archiveAccount](self, "archiveAccount");
  v22 = -[DeliveryAccount shouldUseSaveSentForAccount:](self->super._account, "shouldUseSaveSentForAccount:", v21);
  connection = self->_connection;
  if (v22)
    v24 = objc_msgSend(v21, "saveSentFolder");
  else
    v24 = 0;
  -[MFSMTPConnection setUseSaveSent:toFolder:](connection, "setUseSaveSent:toFolder:", v22, v24);
  Current = CFAbsoluteTimeGetCurrent();
  -[MFConnection enableThroughputMonitoring:](self->_connection, "enableThroughputMonitoring:", 1);
  v20 = -[MFSMTPConnection mailFrom:recipients:withData:host:errorTitle:errorMessage:serverResponse:displayError:errorCode:errorUserInfo:](self->_connection, "mailFrom:recipients:withData:host:errorTitle:errorMessage:serverResponse:displayError:errorCode:errorUserInfo:", v10, v33, a3, v7, &v38, &v37, &v35, &v34, &v39, &v36);
  -[MFConnection enableThroughputMonitoring:](self->_connection, "enableThroughputMonitoring:", 0);
  v30 = CFAbsoluteTimeGetCurrent();
  v31 = 0;
  account = self->super._account;
  if (v22)
    v31 = -[MFSMTPConnection supportsOutboxCopy](self->_connection, "supportsOutboxCopy", 0);
  v25 = v30 - Current;
  -[DeliveryAccount setSupportsOutboxCopy:](account, "setSupportsOutboxCopy:", v31);
  if (v20 == 3)
  {
    -[MFSMTPConnection abort](self->_connection, "abort");
  }
  else if (v20)
  {
    -[MFSMTPConnection quit](self->_connection, "quit");
    if (v20 == 4)
    {
      v26 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1028, 0);
LABEL_29:
      objc_msgSend(v8, "setError:", v26);
      goto LABEL_30;
    }
  }
  else
  {
    objc_msgSend(-[MFMailDelivery account](self, "account"), "checkInConnection:", self->_connection);
  }
LABEL_25:
  if (v37)
  {
    v26 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), v39, 0, v38, v36);
    if (v34)
      -[MFError setShortDescription:](v26, "setShortDescription:", MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_TITLE"), (uint64_t)CFSTR("Cannot Send Mail"), CFSTR("Delayed")));
    -[MFError setLocalizedDescription:](v26, "setLocalizedDescription:", v37);
    -[MFError setMoreInfo:](v26, "setMoreInfo:", v35);
    -[MFError setUserInfoObject:forKey:](v26, "setUserInfoObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("MailErrorHandlerDoNotSanitize"));
    goto LABEL_29;
  }
LABEL_30:
  v27 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", v20);
  -[MFDeliveryResult setDuration:](v27, "setDuration:", v25);
  -[MFDeliveryResult setBytesSent:](v27, "setBytesSent:", objc_msgSend(v8, "bytesWritten"));
  return v27;
}

@end
