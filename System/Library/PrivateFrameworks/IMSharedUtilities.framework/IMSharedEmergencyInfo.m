@implementation IMSharedEmergencyInfo

+ (id)infoFromDictionary:(id)a3 isStewieTranscriptSharingMessage:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  IMSharedEmergencyInfo *v19;

  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  objc_msgSend(v5, "_dictionaryForKey:", CFSTR("eufo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v6, "_dictionaryForKey:", CFSTR("prsna"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v19 = 0;
      goto LABEL_25;
    }
  }
  if (a4)
    *a4 = 1;
  objc_msgSend(v6, "_dictionaryForKey:", CFSTR("eufo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMSharedPersona personaFromDictionaryRepresentation:](IMSharedPersona, "personaFromDictionaryRepresentation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_dictionaryForKey:", CFSTR("prsna"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMSharedPersona personaFromDictionaryRepresentation:](IMSharedPersona, "personaFromDictionaryRepresentation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_dictionaryForKey:", CFSTR("eufo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_stringForKey:", CFSTR("cid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_dictionaryForKey:", CFSTR("eufo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_stringForKey:", CFSTR("t"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("message")) & 1) != 0)
  {
    v17 = 1;
    if (!a4)
    {
LABEL_10:
      objc_msgSend(v6, "_stringForKey:", CFSTR("cid"));
      v18 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v18;
    }
  }
  else
  {
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("information")))
      v17 = 2;
    else
      v17 = 1;
    if (!a4)
      goto LABEL_10;
  }
  v19 = -[IMSharedEmergencyInfo initWithStewieUserPersona:stewieUserPersona:conversationID:messageType:]([IMSharedEmergencyInfo alloc], "initWithStewieUserPersona:stewieUserPersona:conversationID:messageType:", v10, v12, v14, v17);
  if (!v10 || v12)
  {
    if (v10 || !v12)
      goto LABEL_20;
    if (_IMWillLog())
      goto LABEL_18;
  }
  else if ((_IMWillLog() & 1) != 0)
  {
LABEL_18:
    _IMAlwaysLog();
  }

  v19 = 0;
LABEL_20:
  if (!v14)
  {
    if (_IMWillLog())
      _IMAlwaysLog();

    v19 = 0;
  }

LABEL_25:
  return v19;
}

- (IMSharedEmergencyInfo)initWithStewieUserPersona:(id)a3 stewieUserPersona:(id)a4 conversationID:(id)a5 messageType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  IMSharedEmergencyInfo *v14;
  IMSharedEmergencyInfo *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMSharedEmergencyInfo;
  v14 = -[IMSharedEmergencyInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_emergencyUserPersona, a3);
    objc_storeStrong((id *)&v15->_senderPersona, a4);
    objc_storeStrong((id *)&v15->_conversationID, a5);
    v15->_messageType = a6;
  }

  return v15;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSharedPersona dictionaryRepresentation](self->_emergencyUserPersona, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("eufo"));

  -[IMSharedPersona dictionaryRepresentation](self->_senderPersona, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("prsna"));

  objc_msgSend(v3, "setValue:forKey:", self->_conversationID, CFSTR("cid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_messageType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("t"));

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IMSharedEmergencyInfo initWithStewieUserPersona:stewieUserPersona:conversationID:messageType:]([IMSharedEmergencyInfo alloc], "initWithStewieUserPersona:stewieUserPersona:conversationID:messageType:", self->_emergencyUserPersona, self->_senderPersona, self->_conversationID, self->_messageType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSharedEmergencyInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  IMSharedEmergencyInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eufo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prsna"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t"));

  v9 = -[IMSharedEmergencyInfo initWithStewieUserPersona:stewieUserPersona:conversationID:messageType:](self, "initWithStewieUserPersona:stewieUserPersona:conversationID:messageType:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  IMSharedPersona *emergencyUserPersona;
  id v5;

  emergencyUserPersona = self->_emergencyUserPersona;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", emergencyUserPersona, CFSTR("eufo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderPersona, CFSTR("prsna"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationID, CFSTR("cid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_messageType, CFSTR("t"));

}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_conversationID, CFSTR("ConversationID"));
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_messageType, CFSTR("messageType"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_emergencyUserPersona, CFSTR("emergencyUserPersona"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_senderPersona, CFSTR("senderPersona"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (IMSharedPersona)emergencyUserPersona
{
  return self->_emergencyUserPersona;
}

- (IMSharedPersona)senderPersona
{
  return self->_senderPersona;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_senderPersona, 0);
  objc_storeStrong((id *)&self->_emergencyUserPersona, 0);
}

@end
