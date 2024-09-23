@implementation MFComposeMailMessage

+ (id)legacyMessageWithMessage:(id)a3 mailboxUid:(id)a4 skipAttachmentDownload:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  MFEMMessageStore *v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = -[MFEMMessageStore initWithEMMessage:messageClass:mailboxUid:skipAttachmentDownload:]([MFEMMessageStore alloc], "initWithEMMessage:messageClass:mailboxUid:skipAttachmentDownload:", v7, objc_opt_class(), v8, v5);
  -[MFEMMessageStore legacyMessage](v9, "legacyMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEmailMessageRepresentation:", v7);

  return v10;
}

+ (id)legacyMessageWithMessage:(id)a3 mailboxUid:(id)a4
{
  objc_msgSend(a1, "legacyMessageWithMessage:mailboxUid:skipAttachmentDownload:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)account
{
  void *v2;
  void *v3;

  -[MFComposeMailMessage mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EMMessageRepository)messageRepository
{
  void *v2;
  void *v3;

  -[MFComposeMailMessage emailMessageRepresentation](self, "emailMessageRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMMessageRepository *)v3;
}

- (id)documentID
{
  void *v2;
  void *v3;

  -[MFComposeMailMessage emailMessageRepresentation](self, "emailMessageRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)markAsViewed
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E778]), "initWithBuilder:", &__block_literal_global_8);
  v4 = objc_alloc(MEMORY[0x1E0D1E210]);
  -[MFComposeMailMessage emailMessageRepresentation](self, "emailMessageRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMessageListItems:origin:actor:flagChange:", v6, 4, 2, v3);

  -[MFComposeMailMessage messageRepository](self, "messageRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performMessageChangeAction:", v7);

}

void __36__MFComposeMailMessage_markAsViewed__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "changesReadTo:", 1);
  objc_msgSend(v2, "setReason:", 3);

}

- (void)markAsReplied
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E778]), "initWithBuilder:", &__block_literal_global_12);
  v4 = objc_alloc(MEMORY[0x1E0D1E210]);
  -[MFComposeMailMessage emailMessageRepresentation](self, "emailMessageRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMessageListItems:origin:actor:flagChange:", v6, 4, 2, v3);

  -[MFComposeMailMessage messageRepository](self, "messageRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performMessageChangeAction:", v7);

}

void __37__MFComposeMailMessage_markAsReplied__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "changesRepliedTo:", 1);
  objc_msgSend(v2, "setReason:", 4);

}

- (void)markAsForwarded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E778]), "initWithBuilder:", &__block_literal_global_13);
  v4 = objc_alloc(MEMORY[0x1E0D1E210]);
  -[MFComposeMailMessage emailMessageRepresentation](self, "emailMessageRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMessageListItems:origin:actor:flagChange:", v6, 4, 2, v3);

  -[MFComposeMailMessage messageRepository](self, "messageRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performMessageChangeAction:", v7);

}

void __39__MFComposeMailMessage_markAsForwarded__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "changesForwardedTo:", 1);
  objc_msgSend(v2, "setReason:", 4);

}

- (EMMessage)emailMessageRepresentation
{
  return self->_emailMessageRepresentation;
}

- (void)setEmailMessageRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_emailMessageRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailMessageRepresentation, 0);
}

@end
