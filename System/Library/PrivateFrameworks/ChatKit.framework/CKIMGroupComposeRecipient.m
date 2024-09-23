@implementation CKIMGroupComposeRecipient

+ (id)composeRecipientWithConversation:(id)a3 searchTerm:(id)a4 matchingRecipient:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CKIMGroupComposeRecipient *v19;
  void *v20;
  void *v21;
  void *v22;
  CKIMGroupComposeRecipient *v23;
  void *v25;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "chat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "lastMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "time");
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v10, "lastMessageTimeStampOnLoad"));
    v13 = objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v7, "hasDisplayName"))
  {
    objc_msgSend(v7, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v25 = v10;
  v15 = (void *)v13;
  v16 = v9;
  v17 = v8;
  if (objc_msgSend(v7, "hasDisplayName"))
  {
    objc_msgSend(v7, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = [CKIMGroupComposeRecipient alloc];
  objc_msgSend(v7, "chat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "guid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CKIMGroupComposeRecipient initWithGUID:displayString:detailsString:handles:lastMessageDate:searchTerm:matchingRecipient:](v19, "initWithGUID:displayString:detailsString:handles:lastMessageDate:searchTerm:matchingRecipient:", v21, v14, v18, v22, v15, v16, v17);

  return v23;
}

- (CKIMGroupComposeRecipient)initWithGUID:(id)a3 displayString:(id)a4 detailsString:(id)a5 handles:(id)a6 lastMessageDate:(id)a7 searchTerm:(id)a8 matchingRecipient:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  CKIMComposeRecipient *v24;
  CKIMGroupComposeRecipient *v25;
  CKIMGroupComposeRecipient *v26;
  id v27;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v30 = a4;
  v31 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = -[CKIMComposeRecipient initWithHandle:]([CKIMComposeRecipient alloc], "initWithHandle:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        objc_msgSend(v18, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v21);
  }

  v33.receiver = self;
  v33.super_class = (Class)CKIMGroupComposeRecipient;
  v25 = -[CNComposeRecipientGroup initWithChildren:displayString:](&v33, sel_initWithChildren_displayString_, v18, v30);
  v26 = v25;
  if (v25)
  {
    -[CKIMGroupComposeRecipient setConversationGUID:](v25, "setConversationGUID:", v32);
    -[CKIMGroupComposeRecipient setDetailsString:](v26, "setDetailsString:", v31);
    -[CKIMGroupComposeRecipient setHandles:](v26, "setHandles:", v19);
    -[CKIMGroupComposeRecipient setLastMessageDate:](v26, "setLastMessageDate:", v15);
    -[CKIMGroupComposeRecipient setMatchingRecipient:](v26, "setMatchingRecipient:", v17);
    v27 = objc_alloc_init(MEMORY[0x1E0D136A8]);
    objc_msgSend(v27, "setResultType:", 1);
    objc_msgSend(v27, "setSearchTerm:", v16);
    -[CKIMGroupComposeRecipient setOriginContext:](v26, "setOriginContext:", v27);

  }
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKIMGroupComposeRecipient;
  v4 = a3;
  -[CKIMGroupComposeRecipient encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[CKIMGroupComposeRecipient conversationGUID](self, "conversationGUID", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("conversationGUID"));

  -[CKIMGroupComposeRecipient detailsString](self, "detailsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("detailsString"));

  -[CKIMGroupComposeRecipient handles](self, "handles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("handles"));

  -[CKIMGroupComposeRecipient lastMessageDate](self, "lastMessageDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lastMessageDate"));

  -[CKIMGroupComposeRecipient matchingRecipient](self, "matchingRecipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("matchingRecipient"));

}

- (CKIMGroupComposeRecipient)initWithCoder:(id)a3
{
  id v4;
  CKIMGroupComposeRecipient *v5;
  uint64_t v6;
  NSString *conversationGUID;
  uint64_t v8;
  NSString *detailsString;
  uint64_t v10;
  NSArray *handles;
  uint64_t v12;
  NSDate *lastMessageDate;
  uint64_t v14;
  CKIMComposeRecipient *matchingRecipient;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKIMGroupComposeRecipient;
  v5 = -[CKIMGroupComposeRecipient initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationGUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    conversationGUID = v5->_conversationGUID;
    v5->_conversationGUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailsString"));
    v8 = objc_claimAutoreleasedReturnValue();
    detailsString = v5->_detailsString;
    v5->_detailsString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handles"));
    v10 = objc_claimAutoreleasedReturnValue();
    handles = v5->_handles;
    v5->_handles = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastMessageDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastMessageDate = v5->_lastMessageDate;
    v5->_lastMessageDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchingRecipient"));
    v14 = objc_claimAutoreleasedReturnValue();
    matchingRecipient = v5->_matchingRecipient;
    v5->_matchingRecipient = (CKIMComposeRecipient *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRemovableFromSearchResults
{
  return 0;
}

- (id)address
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[CKIMGroupComposeRecipient conversationGUID](self, "conversationGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKIMGroupComposeRecipient;
    -[CNComposeRecipientGroup address](&v8, sel_address);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSString)conversationGUID
{
  return self->_conversationGUID;
}

- (void)setConversationGUID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationGUID, a3);
}

- (NSArray)composeRecipients
{
  return self->_composeRecipients;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSDate)lastMessageDate
{
  return self->_lastMessageDate;
}

- (void)setLastMessageDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMessageDate, a3);
}

- (CKIMComposeRecipient)matchingRecipient
{
  return self->_matchingRecipient;
}

- (void)setMatchingRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_matchingRecipient, a3);
}

- (NSString)detailsString
{
  return self->_detailsString;
}

- (void)setDetailsString:(id)a3
{
  objc_storeStrong((id *)&self->_detailsString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsString, 0);
  objc_storeStrong((id *)&self->_matchingRecipient, 0);
  objc_storeStrong((id *)&self->_lastMessageDate, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);
  objc_storeStrong((id *)&self->_conversationGUID, 0);
}

@end
