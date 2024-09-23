@implementation STSiriMessage

- (STSiriMessage)init
{
  STSiriMessage *v2;
  STSiriMessage *v3;
  NSArray *recipientAddresses;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSiriMessage;
  v2 = -[STSiriMessage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    recipientAddresses = v2->_recipientAddresses;
    v2->_recipientAddresses = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (BOOL)isOutbound
{
  return self->_outbound;
}

- (void)setOutbound:(BOOL)a3
{
  self->_outbound = a3;
}

- (id)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_storeStrong((id *)&self->_senderAddress, a3);
}

- (id)senderInternalGUID
{
  return self->_senderInternalGUID;
}

- (void)_setSenderInternalGUID:(id)a3
{
  objc_storeStrong((id *)&self->_senderInternalGUID, a3);
}

- (id)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (void *)objc_msgSend(v4, "copy");
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)&self->_recipientAddresses, v5);
  v6 = v7;
  if (v7)
  {

    v6 = v7;
  }

}

- (id)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (id)groupNameId
{
  return self->_groupNameId;
}

- (void)setGroupNameId:(id)a3
{
  objc_storeStrong((id *)&self->_groupNameId, a3);
}

- (id)subjectText
{
  return self->_subjectText;
}

- (void)setSubjectText:(id)a3
{
  NSString *v4;
  NSString *subjectText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subjectText = self->_subjectText;
  self->_subjectText = v4;

}

- (id)bodyText
{
  return self->_bodyText;
}

- (void)setBodyText:(id)a3
{
  NSString *v4;
  NSString *bodyText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bodyText = self->_bodyText;
  self->_bodyText = v4;

}

- (id)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  NSString *v4;
  NSString *effect;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  effect = self->_effect;
  self->_effect = v4;

}

- (id)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
  NSURL *v4;
  NSURL *attachmentURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  attachmentURL = self->_attachmentURL;
  self->_attachmentURL = v4;

}

- (id)sendDate
{
  return self->_sendDate;
}

- (void)setSendDate:(id)a3
{
  NSDate *v4;
  NSDate *sendDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  sendDate = self->_sendDate;
  self->_sendDate = v4;

}

- (id)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void)setChatIdentifier:(id)a3
{
  NSString *v4;
  NSString *chatIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  chatIdentifier = self->_chatIdentifier;
  self->_chatIdentifier = v4;

}

- (id)_aceContextObjectValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D88498]);
  v4 = (void *)MEMORY[0x1E0C99E98];
  -[STSiriModelObject identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_af_URLWithMessageIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v6);

  -[STSiriMessage attachmentURL](self, "attachmentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D87F90]);
    objc_msgSend(v8, "setIdentifier:", v7);
    v35[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAttachments:", v9);

  }
  -[STSiriMessage sendDate](self, "sendDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateSent:", v10);

  -[STSiriMessage bodyText](self, "bodyText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STSiriMessage isOutbound](self, "isOutbound"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOutgoing:", v12);

  -[STSiriMessage subjectText](self, "subjectText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubject:", v13);

  -[STSiriMessage chatIdentifier](self, "chatIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChatIdentifier:", v14);

  -[STSiriMessage groupName](self, "groupName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupName:", v15);

  -[STSiriMessage groupNameId](self, "groupNameId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupNameId:", v16);

  -[STSiriMessage senderAddress](self, "senderAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_aceContextObjectValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMsgSender:", v18);

  v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[STSiriMessage recipientAddresses](self, "recipientAddresses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[STSiriMessage recipientAddresses](self, "recipientAddresses", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v26), "_aceContextObjectValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "setMsgRecipients:", v21);
  -[STSiriMessage effect](self, "effect");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffect:", v28);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSiriMessage;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_outbound, CFSTR("Outbound"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_senderAddress, CFSTR("SenderAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_senderInternalGUID, CFSTR("SenderInternalGUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recipientAddresses, CFSTR("RecipientAddresses"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupName, CFSTR("GroupName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupNameId, CFSTR("GroupNameId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subjectText, CFSTR("SubjectText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodyText, CFSTR("BodyText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_attachmentURL, CFSTR("AttachmentURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sendDate, CFSTR("SendDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chatIdentifier, CFSTR("ChatIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_effect, CFSTR("Effect"));

}

- (STSiriMessage)initWithCoder:(id)a3
{
  id v4;
  STSiriMessage *v5;
  uint64_t v6;
  STContactAddress *senderAddress;
  uint64_t v8;
  NSString *senderInternalGUID;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *recipientAddresses;
  uint64_t v15;
  NSString *groupName;
  uint64_t v17;
  NSString *groupNameId;
  void *v19;
  uint64_t v20;
  NSString *subjectText;
  void *v22;
  uint64_t v23;
  NSString *bodyText;
  void *v25;
  uint64_t v26;
  NSURL *attachmentURL;
  void *v28;
  uint64_t v29;
  NSDate *sendDate;
  void *v31;
  uint64_t v32;
  NSString *chatIdentifier;
  void *v34;
  uint64_t v35;
  NSString *effect;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)STSiriMessage;
  v5 = -[STSiriModelObject initWithCoder:](&v38, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_outbound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Outbound"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SenderAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (STContactAddress *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SenderInternalGUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    senderInternalGUID = v5->_senderInternalGUID;
    v5->_senderInternalGUID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("RecipientAddresses"));
    v13 = objc_claimAutoreleasedReturnValue();
    recipientAddresses = v5->_recipientAddresses;
    v5->_recipientAddresses = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GroupName"));
    v15 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GroupNameId"));
    v17 = objc_claimAutoreleasedReturnValue();
    groupNameId = v5->_groupNameId;
    v5->_groupNameId = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SubjectText"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    subjectText = v5->_subjectText;
    v5->_subjectText = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BodyText"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AttachmentURL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    attachmentURL = v5->_attachmentURL;
    v5->_attachmentURL = (NSURL *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SendDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    sendDate = v5->_sendDate;
    v5->_sendDate = (NSDate *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ChatIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    chatIdentifier = v5->_chatIdentifier;
    v5->_chatIdentifier = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Effect"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "copy");
    effect = v5->_effect;
    v5->_effect = (NSString *)v35;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_subjectText, 0);
  objc_storeStrong((id *)&self->_groupNameId, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderInternalGUID, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
