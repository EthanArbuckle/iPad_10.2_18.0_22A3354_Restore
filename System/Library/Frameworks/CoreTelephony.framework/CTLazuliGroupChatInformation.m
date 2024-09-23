@implementation CTLazuliGroupChatInformation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliGroupChatInformation participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", participants = %@"), v4);

  -[CTLazuliGroupChatInformation conversationID](self, "conversationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationID = %@"), v5);

  -[CTLazuliGroupChatInformation contributionID](self, "contributionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", contributionID = %@"), v6);

  -[CTLazuliGroupChatInformation remoteUri](self, "remoteUri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", remoteUri = %@"), v7);

  -[CTLazuliGroupChatInformation subject](self, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", subject = %@"), v8);

  -[CTLazuliGroupChatInformation icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", icon = %@"), v9);

  -[CTLazuliGroupChatInformation mastermind](self, "mastermind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mastermind = %@"), v10);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  -[CTLazuliGroupChatInformation participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToCTLazuliGroupChatParticipantList:", v6))
  {
    -[CTLazuliGroupChatInformation conversationID](self, "conversationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToCTLazuliGroupChatConversationID:", v8))
    {
      v11 = 0;
LABEL_38:

      goto LABEL_39;
    }
    -[CTLazuliGroupChatInformation contributionID](self, "contributionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contributionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToCTLazuliGroupChatContributionID:", v10))
    {
      v11 = 0;
LABEL_37:

      goto LABEL_38;
    }
    -[CTLazuliGroupChatInformation remoteUri](self, "remoteUri");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 || (objc_msgSend(v4, "remoteUri"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliGroupChatInformation remoteUri](self, "remoteUri");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteUri");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v30, "isEqualToCTLazuliGroupChatUri:"))
      {
        v11 = 0;
LABEL_33:

LABEL_34:
        if (!v29)

        goto LABEL_37;
      }
      v25 = 1;
    }
    else
    {
      v23 = 0;
      v25 = 0;
    }
    -[CTLazuliGroupChatInformation subject](self, "subject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 || (objc_msgSend(v4, "subject"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliGroupChatInformation subject](self, "subject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v27, "isEqualToCTLazuliGroupChatSubject:"))
      {
        v11 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v20 = 1;
    }
    else
    {
      v18 = 0;
      v20 = 0;
    }
    -[CTLazuliGroupChatInformation icon](self, "icon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 || (objc_msgSend(v4, "icon"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliGroupChatInformation icon](self, "icon");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "icon");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "isEqualToCTLazuliGroupChatIcon:"))
      {
        v11 = 0;
        goto LABEL_26;
      }
      v17 = 1;
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    -[CTLazuliGroupChatInformation mastermind](self, "mastermind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mastermind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "isEqualToCTLazuliGroupChatParticipant:", v13);

    if (!v17)
    {
      v15 = v21;
      if (!v21)
        v15 = v16;

      if ((v20 & 1) != 0)
        goto LABEL_29;
      goto LABEL_30;
    }
LABEL_26:

    if (!v21)
    if (v20)
      goto LABEL_29;
LABEL_30:
    if (!v26)

    if (!v25)
      goto LABEL_34;
    goto LABEL_33;
  }
  v11 = 0;
LABEL_39:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliGroupChatInformation *v4;
  CTLazuliGroupChatInformation *v5;
  BOOL v6;

  v4 = (CTLazuliGroupChatInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliGroupChatInformation isEqualToCTLazuliGroupChatInformation:](self, "isEqualToCTLazuliGroupChatInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliGroupChatInformation *v4;

  v4 = +[CTLazuliGroupChatInformation allocWithZone:](CTLazuliGroupChatInformation, "allocWithZone:", a3);
  -[CTLazuliGroupChatInformation setParticipants:](v4, "setParticipants:", self->_participants);
  -[CTLazuliGroupChatInformation setConversationID:](v4, "setConversationID:", self->_conversationID);
  -[CTLazuliGroupChatInformation setContributionID:](v4, "setContributionID:", self->_contributionID);
  -[CTLazuliGroupChatInformation setRemoteUri:](v4, "setRemoteUri:", self->_remoteUri);
  -[CTLazuliGroupChatInformation setSubject:](v4, "setSubject:", self->_subject);
  -[CTLazuliGroupChatInformation setIcon:](v4, "setIcon:", self->_icon);
  -[CTLazuliGroupChatInformation setMastermind:](v4, "setMastermind:", self->_mastermind);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_participants, CFSTR("kParticipantsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_conversationID, CFSTR("kConversationIDKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contributionID, CFSTR("kContributionIDKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_remoteUri, CFSTR("kRemoteUriKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subject, CFSTR("kSubjectKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_icon, CFSTR("kIconKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mastermind, CFSTR("kMastermindKey"));

}

- (CTLazuliGroupChatInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliGroupChatInformation *v5;
  uint64_t v6;
  CTLazuliGroupChatParticipantList *participants;
  uint64_t v8;
  CTLazuliGroupChatConversationID *conversationID;
  uint64_t v10;
  CTLazuliGroupChatContributionID *contributionID;
  uint64_t v12;
  CTLazuliGroupChatUri *remoteUri;
  uint64_t v14;
  CTLazuliGroupChatSubject *subject;
  uint64_t v16;
  CTLazuliGroupChatIcon *icon;
  uint64_t v18;
  CTLazuliGroupChatParticipant *mastermind;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CTLazuliGroupChatInformation;
  v5 = -[CTLazuliGroupChatInformation init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kParticipantsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    participants = v5->_participants;
    v5->_participants = (CTLazuliGroupChatParticipantList *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kConversationIDKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    conversationID = v5->_conversationID;
    v5->_conversationID = (CTLazuliGroupChatConversationID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContributionIDKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    contributionID = v5->_contributionID;
    v5->_contributionID = (CTLazuliGroupChatContributionID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRemoteUriKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    remoteUri = v5->_remoteUri;
    v5->_remoteUri = (CTLazuliGroupChatUri *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSubjectKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (CTLazuliGroupChatSubject *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIconKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (CTLazuliGroupChatIcon *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMastermindKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    mastermind = v5->_mastermind;
    v5->_mastermind = (CTLazuliGroupChatParticipant *)v18;

  }
  return v5;
}

- (CTLazuliGroupChatInformation)initWithReflection:(const void *)a3
{
  CTLazuliGroupChatInformation *v4;
  CTLazuliGroupChatParticipantList *v5;
  CTLazuliGroupChatParticipantList *participants;
  CTLazuliGroupChatConversationID *v7;
  CTLazuliGroupChatConversationID *conversationID;
  CTLazuliGroupChatContributionID *v9;
  CTLazuliGroupChatContributionID *contributionID;
  CTLazuliGroupChatUri *v11;
  uint64_t v12;
  CTLazuliGroupChatUri *remoteUri;
  CTLazuliGroupChatSubject *v14;
  uint64_t v15;
  CTLazuliGroupChatSubject *subject;
  CTLazuliGroupChatIcon *v17;
  uint64_t v18;
  CTLazuliGroupChatIcon *icon;
  CTLazuliGroupChatParticipant *v20;
  CTLazuliGroupChatParticipant *mastermind;
  CTLazuliGroupChatInformation *result;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CTLazuliGroupChatInformation;
  v4 = -[CTLazuliGroupChatInformation init](&v23, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliGroupChatParticipantList initWithReflection:]([CTLazuliGroupChatParticipantList alloc], "initWithReflection:", a3);
  participants = v4->_participants;
  v4->_participants = v5;

  v7 = -[CTLazuliGroupChatConversationID initWithReflection:]([CTLazuliGroupChatConversationID alloc], "initWithReflection:", (char *)a3 + 48);
  conversationID = v4->_conversationID;
  v4->_conversationID = v7;

  v9 = -[CTLazuliGroupChatContributionID initWithReflection:]([CTLazuliGroupChatContributionID alloc], "initWithReflection:", (char *)a3 + 72);
  contributionID = v4->_contributionID;
  v4->_contributionID = v9;

  if (*((_BYTE *)a3 + 168))
  {
    v11 = [CTLazuliGroupChatUri alloc];
    if (!*((_BYTE *)a3 + 168))
      goto LABEL_16;
    v12 = -[CTLazuliGroupChatUri initWithReflection:](v11, "initWithReflection:", (char *)a3 + 96);
    remoteUri = v4->_remoteUri;
    v4->_remoteUri = (CTLazuliGroupChatUri *)v12;
  }
  else
  {
    remoteUri = v4->_remoteUri;
    v4->_remoteUri = 0;
  }

  if (*((_BYTE *)a3 + 200))
  {
    v14 = [CTLazuliGroupChatSubject alloc];
    if (!*((_BYTE *)a3 + 200))
      goto LABEL_16;
    v15 = -[CTLazuliGroupChatSubject initWithReflection:](v14, "initWithReflection:", (char *)a3 + 176);
    subject = v4->_subject;
    v4->_subject = (CTLazuliGroupChatSubject *)v15;
  }
  else
  {
    subject = v4->_subject;
    v4->_subject = 0;
  }

  if (!*((_BYTE *)a3 + 280))
  {
    icon = v4->_icon;
    v4->_icon = 0;
    goto LABEL_14;
  }
  v17 = [CTLazuliGroupChatIcon alloc];
  if (*((_BYTE *)a3 + 280))
  {
    v18 = -[CTLazuliGroupChatIcon initWithReflection:](v17, "initWithReflection:", (char *)a3 + 208);
    icon = v4->_icon;
    v4->_icon = (CTLazuliGroupChatIcon *)v18;
LABEL_14:

    v20 = -[CTLazuliGroupChatParticipant initWithReflection:]([CTLazuliGroupChatParticipant alloc], "initWithReflection:", (char *)a3 + 288);
    mastermind = v4->_mastermind;
    v4->_mastermind = v20;

    return v4;
  }
LABEL_16:
  result = (CTLazuliGroupChatInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatParticipantList)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (CTLazuliGroupChatConversationID)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationID, a3);
}

- (CTLazuliGroupChatContributionID)contributionID
{
  return self->_contributionID;
}

- (void)setContributionID:(id)a3
{
  objc_storeStrong((id *)&self->_contributionID, a3);
}

- (CTLazuliGroupChatUri)remoteUri
{
  return self->_remoteUri;
}

- (void)setRemoteUri:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUri, a3);
}

- (CTLazuliGroupChatSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (CTLazuliGroupChatIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (CTLazuliGroupChatParticipant)mastermind
{
  return self->_mastermind;
}

- (void)setMastermind:(id)a3
{
  objc_storeStrong((id *)&self->_mastermind, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mastermind, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_remoteUri, 0);
  objc_storeStrong((id *)&self->_contributionID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
