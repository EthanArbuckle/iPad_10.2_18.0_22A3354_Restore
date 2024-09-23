@implementation LNSystemEntityProtocol

- (LNSystemEntityProtocol)initWithIdentifier:(id)a3
{
  id v5;
  LNSystemEntityProtocol *v6;
  uint64_t v7;
  NSString *identifier;
  LNSystemEntityProtocol *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSystemEntityProtocol.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNSystemEntityProtocol;
  v6 = -[LNSystemEntityProtocol init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSystemEntityProtocol identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LNSystemEntityProtocol)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNSystemEntityProtocol *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNSystemEntityProtocol initWithIdentifier:](self, "initWithIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNSystemEntityProtocol identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNSystemEntityProtocol identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNSystemEntityProtocol *v4;
  LNSystemEntityProtocol *v5;
  LNSystemEntityProtocol *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (LNSystemEntityProtocol *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNSystemEntityProtocol identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNSystemEntityProtocol identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (LNSystemEntityProtocol)assistantEntityProtocol
{
  if (assistantEntityProtocol_onceToken != -1)
    dispatch_once(&assistantEntityProtocol_onceToken, &__block_literal_global_2353);
  return (LNSystemEntityProtocol *)(id)assistantEntityProtocol_value;
}

+ (LNSystemEntityProtocol)mailAccountProtocol
{
  if (mailAccountProtocol_onceToken != -1)
    dispatch_once(&mailAccountProtocol_onceToken, &__block_literal_global_30);
  return (LNSystemEntityProtocol *)(id)mailAccountProtocol_value;
}

+ (LNSystemEntityProtocol)mailAddresseeProtocol
{
  if (mailAddresseeProtocol_onceToken != -1)
    dispatch_once(&mailAddresseeProtocol_onceToken, &__block_literal_global_31);
  return (LNSystemEntityProtocol *)(id)mailAddresseeProtocol_value;
}

+ (LNSystemEntityProtocol)mailMessageProtocol
{
  if (mailMessageProtocol_onceToken != -1)
    dispatch_once(&mailMessageProtocol_onceToken, &__block_literal_global_32);
  return (LNSystemEntityProtocol *)(id)mailMessageProtocol_value;
}

+ (LNSystemEntityProtocol)mailboxProtocol
{
  if (mailboxProtocol_onceToken != -1)
    dispatch_once(&mailboxProtocol_onceToken, &__block_literal_global_33);
  return (LNSystemEntityProtocol *)(id)mailboxProtocol_value;
}

+ (LNSystemEntityProtocol)intentMessageProtocol
{
  if (intentMessageProtocol_onceToken != -1)
    dispatch_once(&intentMessageProtocol_onceToken, &__block_literal_global_34);
  return (LNSystemEntityProtocol *)(id)intentMessageProtocol_value;
}

+ (LNSystemEntityProtocol)messageGroupProtocol
{
  if (messageGroupProtocol_onceToken != -1)
    dispatch_once(&messageGroupProtocol_onceToken, &__block_literal_global_35);
  return (LNSystemEntityProtocol *)(id)messageGroupProtocol_value;
}

+ (LNSystemEntityProtocol)messageParticipantProtocol
{
  if (messageParticipantProtocol_onceToken != -1)
    dispatch_once(&messageParticipantProtocol_onceToken, &__block_literal_global_36);
  return (LNSystemEntityProtocol *)(id)messageParticipantProtocol_value;
}

+ (LNSystemEntityProtocol)visualSearchProtocol
{
  if (visualSearchProtocol_onceToken != -1)
    dispatch_once(&visualSearchProtocol_onceToken, &__block_literal_global_37);
  return (LNSystemEntityProtocol *)(id)visualSearchProtocol_value;
}

+ (LNSystemEntityProtocol)visualSearchOCRProtocol
{
  if (visualSearchOCRProtocol_onceToken != -1)
    dispatch_once(&visualSearchOCRProtocol_onceToken, &__block_literal_global_38);
  return (LNSystemEntityProtocol *)(id)visualSearchOCRProtocol_value;
}

+ (LNSystemEntityProtocol)uniqueEntityProtocol
{
  if (uniqueEntityProtocol_onceToken != -1)
    dispatch_once(&uniqueEntityProtocol_onceToken, &__block_literal_global_39);
  return (LNSystemEntityProtocol *)(id)uniqueEntityProtocol_value;
}

+ (LNSystemEntityProtocol)updatableEntityProtocol
{
  if (updatableEntityProtocol_onceToken != -1)
    dispatch_once(&updatableEntityProtocol_onceToken, &__block_literal_global_40);
  return (LNSystemEntityProtocol *)(id)updatableEntityProtocol_value;
}

+ (LNSystemEntityProtocol)indexedEntityProtocol
{
  if (indexedEntityProtocol_onceToken != -1)
    dispatch_once(&indexedEntityProtocol_onceToken, &__block_literal_global_41);
  return (LNSystemEntityProtocol *)(id)indexedEntityProtocol_value;
}

+ (LNSystemEntityProtocol)persistentFileIdentifiableEntityProtocol
{
  if (persistentFileIdentifiableEntityProtocol_onceToken != -1)
    dispatch_once(&persistentFileIdentifiableEntityProtocol_onceToken, &__block_literal_global_42);
  return (LNSystemEntityProtocol *)(id)persistentFileIdentifiableEntityProtocol_value;
}

+ (LNSystemEntityProtocol)urlRepresentableProtocol
{
  if (urlRepresentableProtocol_onceToken != -1)
    dispatch_once(&urlRepresentableProtocol_onceToken, &__block_literal_global_43);
  return (LNSystemEntityProtocol *)(id)urlRepresentableProtocol_value;
}

+ (id)allProtocolsByIdentifier
{
  if (allProtocolsByIdentifier_onceToken != -1)
    dispatch_once(&allProtocolsByIdentifier_onceToken, &__block_literal_global_44);
  return (id)allProtocolsByIdentifier_protocolsByIdentifier;
}

+ (NSArray)allProtocols
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "allProtocolsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)protocolWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSystemEntityProtocol.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  objc_msgSend(a1, "allProtocolsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    getLNLogCategoryExecution();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_19A9C7000, v8, OS_LOG_TYPE_ERROR, "%{public}@ is not a valid LNSystemEntityProtocolIdentifier", buf, 0xCu);
    }

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __50__LNSystemEntityProtocol_allProtocolsByIdentifier__block_invoke()
{
  LNSystemEntityProtocol *v0;
  LNSystemEntityProtocol *v1;
  LNSystemEntityProtocol *v2;
  LNSystemEntityProtocol *v3;
  LNSystemEntityProtocol *v4;
  LNSystemEntityProtocol *v5;
  LNSystemEntityProtocol *v6;
  LNSystemEntityProtocol *v7;
  LNSystemEntityProtocol *v8;
  uint64_t v9;
  void *v10;
  LNSystemEntityProtocol *v11;
  LNSystemEntityProtocol *v12;
  LNSystemEntityProtocol *v13;
  LNSystemEntityProtocol *v14;
  LNSystemEntityProtocol *v15;
  LNSystemEntityProtocol *v16;
  _QWORD v17[15];
  _QWORD v18[17];

  v18[15] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("com.apple.appintents.entity.AssistantEntity");
  v16 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.AssistantEntity"));
  v18[0] = v16;
  v17[1] = CFSTR("com.apple.appintents.entity.MailAccount");
  v15 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.MailAccount"));
  v18[1] = v15;
  v17[2] = CFSTR("com.apple.appintents.entity.MailAddressee");
  v14 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.MailAddressee"));
  v18[2] = v14;
  v17[3] = CFSTR("com.apple.appintents.entity.MailMessage");
  v13 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.MailMessage"));
  v18[3] = v13;
  v17[4] = CFSTR("com.apple.appintents.entity.Mailbox");
  v12 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.Mailbox"));
  v18[4] = v12;
  v17[5] = CFSTR("com.apple.appintents.entity.IntentMessage");
  v11 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.IntentMessage"));
  v18[5] = v11;
  v17[6] = CFSTR("com.apple.appintents.entity.MessageGroup");
  v0 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.MessageGroup"));
  v18[6] = v0;
  v17[7] = CFSTR("com.apple.appintents.entity.MessageParticipant");
  v1 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.MessageParticipant"));
  v18[7] = v1;
  v17[8] = CFSTR("com.apple.appintents.entity.SingleEntity");
  v2 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.SingleEntity"));
  v18[8] = v2;
  v17[9] = CFSTR("com.apple.appintents.entity.Updatable");
  v3 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.Updatable"));
  v18[9] = v3;
  v17[10] = CFSTR("com.apple.appintents.entity.Indexed");
  v4 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.Indexed"));
  v18[10] = v4;
  v17[11] = CFSTR("com.apple.appintents.entity.PersistentFileIdentifiable");
  v5 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.PersistentFileIdentifiable"));
  v18[11] = v5;
  v17[12] = CFSTR("com.apple.appintents.entity.VisualSearch");
  v6 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.VisualSearch"));
  v18[12] = v6;
  v17[13] = CFSTR("com.apple.appintents.entity.VisualSearchOCR");
  v7 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.VisualSearchOCR"));
  v18[13] = v7;
  v17[14] = CFSTR("com.apple.appintents.entity.URLRepresentable");
  v8 = -[LNSystemEntityProtocol initWithIdentifier:]([LNSystemEntityProtocol alloc], "initWithIdentifier:", CFSTR("com.apple.appintents.entity.URLRepresentable"));
  v18[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 15);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)allProtocolsByIdentifier_protocolsByIdentifier;
  allProtocolsByIdentifier_protocolsByIdentifier = v9;

}

void __50__LNSystemEntityProtocol_urlRepresentableProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.URLRepresentable"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)urlRepresentableProtocol_value;
  urlRepresentableProtocol_value = v0;

}

void __66__LNSystemEntityProtocol_persistentFileIdentifiableEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.PersistentFileIdentifiable"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)persistentFileIdentifiableEntityProtocol_value;
  persistentFileIdentifiableEntityProtocol_value = v0;

}

void __47__LNSystemEntityProtocol_indexedEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.Indexed"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)indexedEntityProtocol_value;
  indexedEntityProtocol_value = v0;

}

void __49__LNSystemEntityProtocol_updatableEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.Updatable"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)updatableEntityProtocol_value;
  updatableEntityProtocol_value = v0;

}

void __46__LNSystemEntityProtocol_uniqueEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.SingleEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)uniqueEntityProtocol_value;
  uniqueEntityProtocol_value = v0;

}

void __49__LNSystemEntityProtocol_visualSearchOCRProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.VisualSearchOCR"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)visualSearchOCRProtocol_value;
  visualSearchOCRProtocol_value = v0;

}

void __46__LNSystemEntityProtocol_visualSearchProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.VisualSearch"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)visualSearchProtocol_value;
  visualSearchProtocol_value = v0;

}

void __52__LNSystemEntityProtocol_messageParticipantProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.MessageParticipant"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageParticipantProtocol_value;
  messageParticipantProtocol_value = v0;

}

void __46__LNSystemEntityProtocol_messageGroupProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.MessageGroup"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageGroupProtocol_value;
  messageGroupProtocol_value = v0;

}

void __47__LNSystemEntityProtocol_intentMessageProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.IntentMessage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)intentMessageProtocol_value;
  intentMessageProtocol_value = v0;

}

void __41__LNSystemEntityProtocol_mailboxProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.Mailbox"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mailboxProtocol_value;
  mailboxProtocol_value = v0;

}

void __45__LNSystemEntityProtocol_mailMessageProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.MailMessage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mailMessageProtocol_value;
  mailMessageProtocol_value = v0;

}

void __47__LNSystemEntityProtocol_mailAddresseeProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.MailAddressee"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mailAddresseeProtocol_value;
  mailAddresseeProtocol_value = v0;

}

void __45__LNSystemEntityProtocol_mailAccountProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.MailAccount"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mailAccountProtocol_value;
  mailAccountProtocol_value = v0;

}

void __49__LNSystemEntityProtocol_assistantEntityProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LNSystemEntityProtocol allProtocolsByIdentifier](LNSystemEntityProtocol, "allProtocolsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.appintents.entity.AssistantEntity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)assistantEntityProtocol_value;
  assistantEntityProtocol_value = v0;

}

@end
