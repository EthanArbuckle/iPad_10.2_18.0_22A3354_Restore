@implementation WFEmail

- (WFEmail)initWithIdentifier:(id)a3 accountIdentifier:(id)a4 subject:(id)a5 sender:(id)a6 recipients:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WFEmail *v19;
  WFEmail *v20;
  uint64_t v21;
  NSString *accountIdentifier;
  uint64_t v23;
  NSString *subject;
  uint64_t v25;
  WFEmailAddress *sender;
  uint64_t v27;
  NSArray *recipients;
  WFEmail *v29;
  void *v31;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEmail.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v32.receiver = self;
  v32.super_class = (Class)WFEmail;
  v19 = -[WFEmail init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v21 = objc_msgSend(v15, "copy");
    accountIdentifier = v20->_accountIdentifier;
    v20->_accountIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    subject = v20->_subject;
    v20->_subject = (NSString *)v23;

    +[WFEmailAddress addressWithEmailAddress:](WFEmailAddress, "addressWithEmailAddress:", v17);
    v25 = objc_claimAutoreleasedReturnValue();
    sender = v20->_sender;
    v20->_sender = (WFEmailAddress *)v25;

    objc_msgSend(v18, "if_compactMap:", &__block_literal_global_18739);
    v27 = objc_claimAutoreleasedReturnValue();
    recipients = v20->_recipients;
    v20->_recipients = (NSArray *)v27;

    v29 = v20;
  }

  return v20;
}

- (EMDaemonInterface)interface
{
  EMDaemonInterface *interface;
  EMDaemonInterface *v4;
  EMDaemonInterface *v5;

  interface = self->_interface;
  if (!interface)
  {
    v4 = (EMDaemonInterface *)objc_alloc_init(getEMDaemonInterfaceClass());
    v5 = self->_interface;
    self->_interface = v4;

    interface = self->_interface;
  }
  return interface;
}

- (void)fetchAttachmentsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  Class EMObjectIDClass;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFContentItemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[WFEmail fetchAttachmentsWithCompletionHandler:]";
    _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_DEBUG, "%s Fetching Message Attachments", buf, 0xCu);
  }

  -[WFEmail interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageRepository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EMObjectIDClass = getEMObjectIDClass();
  -[WFEmail identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class objectIDFromSerializedRepresentation:](EMObjectIDClass, "objectIDFromSerializedRepresentation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "messageForObjectID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke;
  v17[3] = &unk_24C4E1D50;
  v13 = v4;
  v18 = v13;
  objc_msgSend(v11, "addSuccessBlock:", v17);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_4;
  v15[3] = &unk_24C4E1D78;
  v16 = v13;
  v14 = v13;
  objc_msgSend(v11, "addFailureBlock:", v15);

}

- (void)fetchContentRepresentationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  Class EMObjectIDClass;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFContentItemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[WFEmail fetchContentRepresentationWithCompletionHandler:]";
    _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_DEBUG, "%s Fetching Message Content", buf, 0xCu);
  }

  -[WFEmail interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageRepository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EMObjectIDClass = getEMObjectIDClass();
  -[WFEmail identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class objectIDFromSerializedRepresentation:](EMObjectIDClass, "objectIDFromSerializedRepresentation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "messageForObjectID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke;
  v17[3] = &unk_24C4E1DC8;
  v13 = v4;
  v17[4] = self;
  v18 = v13;
  objc_msgSend(v11, "addSuccessBlock:", v17);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_17;
  v15[3] = &unk_24C4E1D78;
  v16 = v13;
  v14 = v13;
  objc_msgSend(v11, "addFailureBlock:", v15);

}

- (NSString)wfName
{
  void *v3;
  void *v4;

  -[WFEmail subject](self, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    -[WFEmail subject](self, "subject");
  else
    WFLocalizedStringWithKey(CFSTR("Name of email"), CFSTR("Email"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (WFEmail)initWithCoder:(id)a3
{
  id v4;
  WFEmail *v5;
  uint64_t v6;
  NSString *subject;
  uint64_t v8;
  NSData *identifier;
  uint64_t v10;
  NSString *accountIdentifier;
  uint64_t v12;
  WFEmailAddress *sender;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *recipients;
  WFEmail *v19;

  v4 = a3;
  v5 = -[WFEmail init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
    v6 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
    v12 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (WFEmailAddress *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("recipients"));
    v17 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFEmail subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subject"));

  -[WFEmail identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[WFEmail accountIdentifier](self, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("accountIdentifier"));

  -[WFEmail sender](self, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sender"));

  -[WFEmail recipients](self, "recipients");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("recipients"));

}

- (NSString)subject
{
  return self->_subject;
}

- (unint64_t)subjectPrefix
{
  return self->_subjectPrefix;
}

- (WFEmailAddress)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

void __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  Class EMContentRequestOptionsClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  EMContentRequestOptionsClass = getEMContentRequestOptionsClass();
  getEMContentRepresentationTypeHTML();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class optionsWithRequestedRepresentationType:networkUsage:](EMContentRequestOptionsClass, "optionsWithRequestedRepresentationType:networkUsage:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_24C4E1DA0;
  v7 = *(id *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v8 = (id)objc_msgSend(v3, "requestRepresentationWithOptions:completionHandler:", v6, v9);

}

void __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  getWFContentItemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[WFEmail fetchContentRepresentationWithCompletionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_20BBAD000, v4, OS_LOG_TYPE_DEBUG, "%s Failure fetching message content: %@", (uint8_t *)&v6, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFContentItemLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[WFEmail fetchContentRepresentationWithCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_DEBUG, "%s Recieved message content representation", (uint8_t *)&v13, 0xCu);
  }

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "subject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "subject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v5, "contentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v10, 5, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *EMContentRequestOptionsClass;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  EMContentRequestOptionsClass = (void *)getEMContentRequestOptionsClass();
  getEMContentRepresentationTypeHTML();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(EMContentRequestOptionsClass, "optionsWithRequestedRepresentationType:networkUsage:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_24C4E1D28;
  v9 = *(id *)(a1 + 32);
  v7 = (id)objc_msgSend(v3, "requestRepresentationWithOptions:completionHandler:", v6, v8);

}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  getWFContentItemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[WFEmail fetchAttachmentsWithCompletionHandler:]_block_invoke_4";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_20BBAD000, v4, OS_LOG_TYPE_DEBUG, "%s Failure fetching message attachments: %@", (uint8_t *)&v6, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFContentItemLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[WFEmail fetchAttachmentsWithCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_DEBUG, "%s Recieved message content representation", buf, 0xCu);
  }

  if (v5)
  {
    objc_msgSend(v5, "relatedContentItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_24C4E33B0;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", &__block_literal_global_9_18730, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  Class EMContentRequestOptionsClass;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a4;
  EMContentRequestOptionsClass = getEMContentRequestOptionsClass();
  getEMContentRepresentationTypeRaw();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class optionsWithRequestedRepresentationType:networkUsage:](EMContentRequestOptionsClass, "optionsWithRequestedRepresentationType:networkUsage:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2_10;
  v12[3] = &unk_24C4E1D28;
  v13 = v6;
  v10 = v6;
  v11 = (id)objc_msgSend(v5, "requestRepresentationWithOptions:completionHandler:", v9, v12);

}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "contentURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", v3, 5, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

WFEmailAddress *__74__WFEmail_initWithIdentifier_accountIdentifier_subject_sender_recipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFEmailAddress addressWithEmailAddress:](WFEmailAddress, "addressWithEmailAddress:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
