@implementation IMServiceReachabilityContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *chatIdentifier;
  id v5;

  chatIdentifier = self->_chatIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", chatIdentifier, CFSTR("ci"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_chatStyle, CFSTR("cs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderLastAddressedHandle, CFSTR("slah"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderLastAddressedSIMID, CFSTR("slas"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUsedServiceName, CFSTR("lus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceOfLastMessage, CFSTR("slm"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_conversationWasDowngraded, CFSTR("cd"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasConversationHistory, CFSTR("hh"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldForceServerStatusRefresh, CFSTR("fr"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceMMS, CFSTR("fm"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isForPendingConversation, CFSTR("pc"));

}

- (IMServiceReachabilityContext)initWithCoder:(id)a3
{
  id v4;
  IMServiceReachabilityContext *v5;
  uint64_t v6;
  NSString *chatIdentifier;
  uint64_t v8;
  NSString *senderLastAddressedHandle;
  uint64_t v10;
  NSString *senderLastAddressedSIMID;
  uint64_t v12;
  NSString *lastUsedServiceName;
  uint64_t v14;
  NSString *serviceOfLastMessage;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMServiceReachabilityContext;
  v5 = -[IMServiceReachabilityContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ci"));
    v6 = objc_claimAutoreleasedReturnValue();
    chatIdentifier = v5->_chatIdentifier;
    v5->_chatIdentifier = (NSString *)v6;

    v5->_chatStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cs"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slah"));
    v8 = objc_claimAutoreleasedReturnValue();
    senderLastAddressedHandle = v5->_senderLastAddressedHandle;
    v5->_senderLastAddressedHandle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slas"));
    v10 = objc_claimAutoreleasedReturnValue();
    senderLastAddressedSIMID = v5->_senderLastAddressedSIMID;
    v5->_senderLastAddressedSIMID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lus"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastUsedServiceName = v5->_lastUsedServiceName;
    v5->_lastUsedServiceName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slm"));
    v14 = objc_claimAutoreleasedReturnValue();
    serviceOfLastMessage = v5->_serviceOfLastMessage;
    v5->_serviceOfLastMessage = (NSString *)v14;

    v5->_conversationWasDowngraded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cd"));
    v5->_hasConversationHistory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hh"));
    v5->_shouldForceServerStatusRefresh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fr"));
    v5->_forceMMS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fm"));
    v5->_isForPendingConversation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pc"));
  }

  return v5;
}

- (id)createDictionary
{
  id v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMServiceReachabilityContext chatIdentifier](self, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IMServiceReachabilityContext chatIdentifier](self, "chatIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ci"));

  }
  if (-[IMServiceReachabilityContext chatStyle](self, "chatStyle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[IMServiceReachabilityContext chatStyle](self, "chatStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cs"));

  }
  -[IMServiceReachabilityContext senderLastAddressedHandle](self, "senderLastAddressedHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IMServiceReachabilityContext senderLastAddressedHandle](self, "senderLastAddressedHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("slah"));

  }
  -[IMServiceReachabilityContext senderLastAddressedSIMID](self, "senderLastAddressedSIMID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IMServiceReachabilityContext senderLastAddressedSIMID](self, "senderLastAddressedSIMID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("slas"));

  }
  -[IMServiceReachabilityContext lastUsedServiceName](self, "lastUsedServiceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IMServiceReachabilityContext lastUsedServiceName](self, "lastUsedServiceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lus"));

  }
  -[IMServiceReachabilityContext serviceOfLastMessage](self, "serviceOfLastMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[IMServiceReachabilityContext serviceOfLastMessage](self, "serviceOfLastMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("slm"));

  }
  if (-[IMServiceReachabilityContext conversationWasDowngraded](self, "conversationWasDowngraded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMServiceReachabilityContext conversationWasDowngraded](self, "conversationWasDowngraded"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cd"));

  }
  if (-[IMServiceReachabilityContext hasConversationHistory](self, "hasConversationHistory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMServiceReachabilityContext hasConversationHistory](self, "hasConversationHistory"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hh"));

  }
  if (-[IMServiceReachabilityContext shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMServiceReachabilityContext shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("fr"));

  }
  if (-[IMServiceReachabilityContext forceMMS](self, "forceMMS"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMServiceReachabilityContext forceMMS](self, "forceMMS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("fm"));

  }
  if (-[IMServiceReachabilityContext isForPendingConversation](self, "isForPendingConversation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMServiceReachabilityContext isForPendingConversation](self, "isForPendingConversation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("pc"));

  }
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IMServiceReachabilityContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(IMServiceReachabilityContext);
  -[IMServiceReachabilityContext chatIdentifier](self, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext setChatIdentifier:](v4, "setChatIdentifier:", v5);

  -[IMServiceReachabilityContext setChatStyle:](v4, "setChatStyle:", -[IMServiceReachabilityContext chatStyle](self, "chatStyle"));
  -[IMServiceReachabilityContext senderLastAddressedHandle](self, "senderLastAddressedHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext setSenderLastAddressedHandle:](v4, "setSenderLastAddressedHandle:", v6);

  -[IMServiceReachabilityContext senderLastAddressedSIMID](self, "senderLastAddressedSIMID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext setSenderLastAddressedSIMID:](v4, "setSenderLastAddressedSIMID:", v7);

  -[IMServiceReachabilityContext lastUsedServiceName](self, "lastUsedServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext setLastUsedServiceName:](v4, "setLastUsedServiceName:", v8);

  -[IMServiceReachabilityContext serviceOfLastMessage](self, "serviceOfLastMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext setServiceOfLastMessage:](v4, "setServiceOfLastMessage:", v9);

  -[IMServiceReachabilityContext setConversationWasDowngraded:](v4, "setConversationWasDowngraded:", -[IMServiceReachabilityContext conversationWasDowngraded](self, "conversationWasDowngraded"));
  -[IMServiceReachabilityContext setHasConversationHistory:](v4, "setHasConversationHistory:", -[IMServiceReachabilityContext hasConversationHistory](self, "hasConversationHistory"));
  -[IMServiceReachabilityContext setShouldForceServerStatusRefresh:](v4, "setShouldForceServerStatusRefresh:", -[IMServiceReachabilityContext shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh"));
  -[IMServiceReachabilityContext setForceMMS:](v4, "setForceMMS:", -[IMServiceReachabilityContext forceMMS](self, "forceMMS"));
  -[IMServiceReachabilityContext setIsForPendingConversation:](v4, "setIsForPendingConversation:", -[IMServiceReachabilityContext isForPendingConversation](self, "isForPendingConversation"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v13;
  signed __int8 v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_class();
  -[IMServiceReachabilityContext chatIdentifier](self, "chatIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[IMServiceReachabilityContext chatStyle](self, "chatStyle");
  -[IMServiceReachabilityContext senderLastAddressedHandle](self, "senderLastAddressedHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext senderLastAddressedSIMID](self, "senderLastAddressedSIMID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext lastUsedServiceName](self, "lastUsedServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext serviceOfLastMessage](self, "serviceOfLastMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMServiceReachabilityContext conversationWasDowngraded](self, "conversationWasDowngraded"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[IMServiceReachabilityContext hasConversationHistory](self, "hasConversationHistory"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[IMServiceReachabilityContext shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[IMServiceReachabilityContext forceMMS](self, "forceMMS"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[IMServiceReachabilityContext isForPendingConversation](self, "isForPendingConversation"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p [chatIdentifier: %@ style: %c senderLastAddressedHandle: %@ SIMID: %@ lastUsedService: %@ serviceOfLastMessage: %@ wasDowngraded: %@ hasHistory: %@ shouldForceRefresh: %@ forceMMS: %@ isForPendingConversation: %@]>"), v16, self, v15, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_signature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMServiceReachabilityContext senderLastAddressedHandle](self, "senderLastAddressedHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityContext senderLastAddressedSIMID](self, "senderLastAddressedSIMID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%b%b%b"), v4, v5, -[IMServiceReachabilityContext shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh"), -[IMServiceReachabilityContext forceMMS](self, "forceMMS"), -[IMServiceReachabilityContext isForPendingConversation](self, "isForPendingConversation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)senderLastAddressedHandle
{
  return self->_senderLastAddressedHandle;
}

- (void)setSenderLastAddressedHandle:(id)a3
{
  objc_storeStrong((id *)&self->_senderLastAddressedHandle, a3);
}

- (NSString)senderLastAddressedSIMID
{
  return self->_senderLastAddressedSIMID;
}

- (void)setSenderLastAddressedSIMID:(id)a3
{
  objc_storeStrong((id *)&self->_senderLastAddressedSIMID, a3);
}

- (NSString)lastUsedServiceName
{
  return self->_lastUsedServiceName;
}

- (void)setLastUsedServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedServiceName, a3);
}

- (NSString)serviceOfLastMessage
{
  return self->_serviceOfLastMessage;
}

- (void)setServiceOfLastMessage:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOfLastMessage, a3);
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void)setChatIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_chatIdentifier, a3);
}

- (unsigned)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(unsigned __int8)a3
{
  self->_chatStyle = a3;
}

- (BOOL)shouldForceServerStatusRefresh
{
  return self->_shouldForceServerStatusRefresh;
}

- (void)setShouldForceServerStatusRefresh:(BOOL)a3
{
  self->_shouldForceServerStatusRefresh = a3;
}

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setForceMMS:(BOOL)a3
{
  self->_forceMMS = a3;
}

- (BOOL)conversationWasDowngraded
{
  return self->_conversationWasDowngraded;
}

- (void)setConversationWasDowngraded:(BOOL)a3
{
  self->_conversationWasDowngraded = a3;
}

- (BOOL)hasConversationHistory
{
  return self->_hasConversationHistory;
}

- (void)setHasConversationHistory:(BOOL)a3
{
  self->_hasConversationHistory = a3;
}

- (BOOL)isForPendingConversation
{
  return self->_isForPendingConversation;
}

- (void)setIsForPendingConversation:(BOOL)a3
{
  self->_isForPendingConversation = a3;
}

- (NSSet)preconditionsIgnoredForServices
{
  return self->_preconditionsIgnoredForServices;
}

- (void)setPreconditionsIgnoredForServices:(id)a3
{
  objc_storeStrong((id *)&self->_preconditionsIgnoredForServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preconditionsIgnoredForServices, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceOfLastMessage, 0);
  objc_storeStrong((id *)&self->_lastUsedServiceName, 0);
  objc_storeStrong((id *)&self->_senderLastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_senderLastAddressedHandle, 0);
}

@end
