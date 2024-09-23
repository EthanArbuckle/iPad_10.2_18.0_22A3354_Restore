@implementation SGIPMessage

- (id)description
{
  id v3;
  NSString *messageId;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  messageId = self->_messageId;
  -[SGIPPerson handle](self->_sender, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGIPMessage id:%@ s:%@ sbj:'%@' d:%@>"), messageId, v5, self->_subject, self->_dateSent);

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_messageId, "hash");
}

- (SGIPMessage)initWithCoder:(id)a3
{
  id v4;
  SGIPMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (SGIPMessage *)objc_opt_new();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPMessage setMessageId:](v5, "setMessageId:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPMessage setSender:](v5, "setSender:", v7);

  v8 = (void *)MEMORY[0x1A8583A40]();
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("rec"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPMessage setRecipients:](v5, "setRecipients:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sbj"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPMessage setSubject:](v5, "setSubject:", v13);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dat"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPMessage setDateSent:](v5, "setDateSent:", v14);

  -[SGIPMessage setIsSent:](v5, "setIsSent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("snt")));
  -[SGIPMessage setIsGroupConversation:](v5, "setIsGroupConversation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("igc")));
  v15 = (void *)MEMORY[0x1A8583A40](-[SGIPMessage setIsSenderSignificant:](v5, "setIsSenderSignificant:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("iss"))));
  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v17 = objc_opt_class();
  v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("mun"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPMessage setMessageUnits:](v5, "setMessageUnits:", v19);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typ"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPMessage setType:](v5, "setType:", v20);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageId;
  id v5;

  messageId = self->_messageId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageId, CFSTR("mid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("sen"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("rec"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subject, CFSTR("sbj"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateSent, CFSTR("dat"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSent, CFSTR("snt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isGroupConversation, CFSTR("igc"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSenderSignificant, CFSTR("iss"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageUnits, CFSTR("mun"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("typ"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_messageId, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = -[SGIPPerson copyWithZone:](self->_sender, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[NSString copyWithZone:](self->_subject, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[NSDate copyWithZone:](self->_dateSent, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    *(_BYTE *)(v5 + 8) = self->_isSent;
    *(_BYTE *)(v5 + 9) = self->_isGroupConversation;
    *(_BYTE *)(v5 + 10) = self->_isSenderSignificant;
    v16 = -[NSArray copyWithZone:](self->_messageUnits, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    v18 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v18;

  }
  return (id)v5;
}

- (BOOL)isEqualToMessage:(id)a3
{
  id *v4;
  id *v5;
  NSString *messageId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  SGIPPerson *sender;
  SGIPPerson *v12;
  SGIPPerson *v13;
  SGIPPerson *v14;
  BOOL v15;
  NSArray *recipients;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;
  NSString *subject;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  NSDate *dateSent;
  NSDate *v27;
  NSDate *v28;
  NSDate *v29;
  char v30;
  NSArray *messageUnits;
  NSArray *v32;
  NSArray *v33;
  NSArray *v34;
  char v35;
  char v36;
  NSString *v38;
  NSString *v39;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_27;
  messageId = self->_messageId;
  v7 = (NSString *)v4[2];
  if (messageId == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = messageId;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_27;
  }
  sender = self->_sender;
  v12 = (SGIPPerson *)v5[3];
  if (sender == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = sender;
    v15 = -[SGIPPerson isEqual:](v14, "isEqual:", v13);

    if (!v15)
      goto LABEL_27;
  }
  recipients = self->_recipients;
  v17 = (NSArray *)v5[4];
  if (recipients == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = recipients;
    v20 = -[NSArray isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_27;
  }
  subject = self->_subject;
  v22 = (NSString *)v5[5];
  if (subject == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = subject;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_27;
  }
  dateSent = self->_dateSent;
  v27 = (NSDate *)v5[6];
  if (dateSent == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = dateSent;
    v30 = -[NSDate isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_27;
  }
  if (self->_isSent != *((unsigned __int8 *)v5 + 8)
    || self->_isGroupConversation != *((unsigned __int8 *)v5 + 9)
    || self->_isSenderSignificant != *((unsigned __int8 *)v5 + 10))
  {
    goto LABEL_27;
  }
  messageUnits = self->_messageUnits;
  v32 = (NSArray *)v5[7];
  if (messageUnits == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = messageUnits;
    v35 = -[NSArray isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
    {
LABEL_27:
      v36 = 0;
      goto LABEL_28;
    }
  }
  v38 = self->_type;
  v39 = v38;
  if (v38 == v5[8])
    v36 = 1;
  else
    v36 = -[NSString isEqual:](v38, "isEqual:");

LABEL_28:
  return v36;
}

- (BOOL)isEqual:(id)a3
{
  SGIPMessage *v4;
  SGIPMessage *v5;
  BOOL v6;

  v4 = (SGIPMessage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGIPMessage isEqualToMessage:](self, "isEqualToMessage:", v5);

  return v6;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (SGIPPerson)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_storeStrong((id *)&self->_dateSent, a3);
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (void)setIsGroupConversation:(BOOL)a3
{
  self->_isGroupConversation = a3;
}

- (BOOL)isSenderSignificant
{
  return self->_isSenderSignificant;
}

- (void)setIsSenderSignificant:(BOOL)a3
{
  self->_isSenderSignificant = a3;
}

- (NSArray)messageUnits
{
  return self->_messageUnits;
}

- (void)setMessageUnits:(id)a3
{
  objc_storeStrong((id *)&self->_messageUnits, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_messageUnits, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

+ (id)messageWithIPMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMessageId:", v6);

  objc_msgSend(v3, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGIPPerson personWithIPPerson:](SGIPPerson, "personWithIPPerson:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  objc_msgSend(v4, "setSender:", v8);

  v9 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v3, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1A8583A40]();
        +[SGIPPerson personWithIPPerson:](SGIPPerson, "personWithIPPerson:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v17);

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v12);
  }

  objc_msgSend(v35, "setRecipients:", v9);
  objc_msgSend(v3, "subject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v35, "setSubject:", v19);

  objc_msgSend(v3, "dateSent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v35, "setDateSent:", v21);

  objc_msgSend(v35, "setIsSent:", objc_msgSend(v3, "isSent"));
  objc_msgSend(v35, "setIsGroupConversation:", objc_msgSend(v3, "isGroupConversation"));
  objc_msgSend(v35, "setIsSenderSignificant:", objc_msgSend(v3, "isSenderSignificant"));
  v22 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v3, "messageUnits");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v27);
        v29 = (void *)MEMORY[0x1A8583A40]();
        objc_msgSend(v28, "text");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v28, "text");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v31);

        }
        objc_autoreleasePoolPop(v29);
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v25);
  }

  objc_msgSend(v35, "setMessageUnits:", v22);
  objc_msgSend(v3, "type");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copy");
  objc_msgSend(v35, "setType:", v33);

  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
