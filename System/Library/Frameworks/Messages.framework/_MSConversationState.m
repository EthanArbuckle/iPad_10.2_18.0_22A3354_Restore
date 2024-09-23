@implementation _MSConversationState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_MSConversationState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MSConversationState;
  return -[_MSConversationState init](&v3, sel_init);
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_isiMessage)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_isBusiness)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("conversationID: %@, senderIdentifier: %@, recipientIdentifiers: %@, activeMessage: %@, conversationIdentifier: %@, iMessageLoginID: %@, senderAddress: %@, recipientAddresses: %@, isiMessage: %@, isBusiness: %@"), self->_conversationID, self->_senderIdentifier, self->_recipientIdentifiers, self->_activeMessage, self->_conversationIdentifier, self->_iMessageLoginID, self->_senderAddress, self->_recipientAddresses, v3, v2);
}

- (_MSConversationState)initWithCoder:(id)a3
{
  id v4;
  _MSConversationState *v5;
  uint64_t v6;
  NSString *conversationID;
  uint64_t v8;
  NSData *conversationEngramID;
  uint64_t v10;
  NSString *groupID;
  uint64_t v12;
  NSUUID *senderIdentifier;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *recipientIdentifiers;
  uint64_t v19;
  MSMessage *activeMessage;
  uint64_t v21;
  NSUUID *conversationIdentifier;
  uint64_t v23;
  NSString *iMessageLoginID;
  uint64_t v25;
  NSString *senderAddress;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *recipientAddresses;
  uint64_t v32;
  NSString *generatedSummary;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *conversationContext;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSArray *draftAssetArchives;
  objc_super v45;
  _QWORD v46[2];
  _QWORD v47[4];
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_MSConversationState;
  v5 = -[_MSConversationState init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_conversationID"));
    v6 = objc_claimAutoreleasedReturnValue();
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_conversationEngramID"));
    v8 = objc_claimAutoreleasedReturnValue();
    conversationEngramID = v5->_conversationEngramID;
    v5->_conversationEngramID = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupID"));
    v10 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_senderIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    senderIdentifier = v5->_senderIdentifier;
    v5->_senderIdentifier = (NSUUID *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_recipientIdentifiers"));
    v17 = objc_claimAutoreleasedReturnValue();
    recipientIdentifiers = v5->_recipientIdentifiers;
    v5->_recipientIdentifiers = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activeMessage"));
    v19 = objc_claimAutoreleasedReturnValue();
    activeMessage = v5->_activeMessage;
    v5->_activeMessage = (MSMessage *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cid"));
    v21 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSUUID *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lid"));
    v23 = objc_claimAutoreleasedReturnValue();
    iMessageLoginID = v5->_iMessageLoginID;
    v5->_iMessageLoginID = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sad"));
    v25 = objc_claimAutoreleasedReturnValue();
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("_rad"));
    v30 = objc_claimAutoreleasedReturnValue();
    recipientAddresses = v5->_recipientAddresses;
    v5->_recipientAddresses = (NSArray *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smry"));
    v32 = objc_claimAutoreleasedReturnValue();
    generatedSummary = v5->_generatedSummary;
    v5->_generatedSummary = (NSString *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    v47[2] = objc_opt_class();
    v47[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("_ccxt"));
    v37 = objc_claimAutoreleasedReturnValue();
    conversationContext = v5->_conversationContext;
    v5->_conversationContext = (NSArray *)v37;

    v5->_isiMessage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isiMessage"));
    v5->_isBusiness = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isBusiness"));
    v39 = (void *)MEMORY[0x1E0C99E60];
    v46[0] = objc_opt_class();
    v46[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("_dap"));
    v42 = objc_claimAutoreleasedReturnValue();
    draftAssetArchives = v5->_draftAssetArchives;
    v5->_draftAssetArchives = (NSArray *)v42;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *conversationID;
  id v5;

  conversationID = self->_conversationID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", conversationID, CFSTR("_conversationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationEngramID, CFSTR("_conversationEngramID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupID, CFSTR("_groupID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iMessageLoginID, CFSTR("_lid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderIdentifier, CFSTR("_senderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientIdentifiers, CFSTR("_recipientIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeMessage, CFSTR("_activeMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationIdentifier, CFSTR("_cid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderAddress, CFSTR("_sad"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientAddresses, CFSTR("_rad"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_generatedSummary, CFSTR("_smry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationContext, CFSTR("_ccxt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isiMessage, CFSTR("_isiMessage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isBusiness, CFSTR("_isBusiness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_draftAssetArchives, CFSTR("_dap"));

}

- (NSUUID)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conversationIdentifier, a3);
}

- (NSUUID)senderIdentifier
{
  return self->_senderIdentifier;
}

- (void)setSenderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_senderIdentifier, a3);
}

- (NSArray)recipientIdentifiers
{
  return self->_recipientIdentifiers;
}

- (void)setRecipientIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_recipientIdentifiers, a3);
}

- (MSMessage)activeMessage
{
  return self->_activeMessage;
}

- (void)setActiveMessage:(id)a3
{
  objc_storeStrong((id *)&self->_activeMessage, a3);
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationID, a3);
}

- (NSData)conversationEngramID
{
  return self->_conversationEngramID;
}

- (void)setConversationEngramID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationEngramID, a3);
}

- (NSString)iMessageLoginID
{
  return self->_iMessageLoginID;
}

- (void)setiMessageLoginID:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageLoginID, a3);
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_storeStrong((id *)&self->_senderAddress, a3);
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAddresses, a3);
}

- (NSString)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
  objc_storeStrong((id *)&self->_generatedSummary, a3);
}

- (NSArray)conversationContext
{
  return self->_conversationContext;
}

- (void)setConversationContext:(id)a3
{
  objc_storeStrong((id *)&self->_conversationContext, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (BOOL)isiMessage
{
  return self->_isiMessage;
}

- (void)setIsiMessage:(BOOL)a3
{
  self->_isiMessage = a3;
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (NSArray)draftAssetArchives
{
  return self->_draftAssetArchives;
}

- (void)setDraftAssetArchives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftAssetArchives, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_iMessageLoginID, 0);
  objc_storeStrong((id *)&self->_conversationEngramID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_activeMessage, 0);
  objc_storeStrong((id *)&self->_recipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_senderIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
}

@end
