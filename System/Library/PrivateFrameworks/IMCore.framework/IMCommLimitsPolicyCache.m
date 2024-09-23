@implementation IMCommLimitsPolicyCache

- (NSMutableDictionary)participantIDsHashToConversationContext
{
  return self->_participantIDsHashToConversationContext;
}

- (NSMutableDictionary)participantIDsHashToChatIdentifier
{
  return self->_participantIDsHashToChatIdentifier;
}

- (BOOL)isFetchingCommLimitsPolicyForChat:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;

  objc_msgSend(a3, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[IMCommLimitsPolicyCache chatIdentifierToParticipantIDsHash](self, "chatIdentifierToParticipantIDsHash"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    -[IMCommLimitsPolicyCache participantIDsHashToConversationContext](self, "participantIDsHashToConversationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (IMCommLimitsPolicyCache)init
{
  IMCommLimitsPolicyCache *v2;
  uint64_t v3;
  NSMutableDictionary *participantIDsHashToConversationContext;
  uint64_t v5;
  NSMutableDictionary *conversationContextToParticipantIDsHash;
  uint64_t v7;
  NSMutableDictionary *participantIDsHashToChatIdentifier;
  uint64_t v9;
  NSMutableDictionary *chatIdentifierToParticipantIDsHash;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMCommLimitsPolicyCache;
  v2 = -[IMCommLimitsPolicyCache init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    participantIDsHashToConversationContext = v2->_participantIDsHashToConversationContext;
    v2->_participantIDsHashToConversationContext = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    conversationContextToParticipantIDsHash = v2->_conversationContextToParticipantIDsHash;
    v2->_conversationContextToParticipantIDsHash = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    participantIDsHashToChatIdentifier = v2->_participantIDsHashToChatIdentifier;
    v2->_participantIDsHashToChatIdentifier = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    chatIdentifierToParticipantIDsHash = v2->_chatIdentifierToParticipantIDsHash;
    v2->_chatIdentifierToParticipantIDsHash = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (NSMutableDictionary)conversationContextToParticipantIDsHash
{
  return self->_conversationContextToParticipantIDsHash;
}

- (id)conversationContextForChat:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = 0;
    goto LABEL_8;
  }
  -[IMCommLimitsPolicyCache chatIdentifierToParticipantIDsHash](self, "chatIdentifierToParticipantIDsHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  -[IMCommLimitsPolicyCache participantIDsHashToConversationContext](self, "participantIDsHashToConversationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v8 = 0;
  }

LABEL_8:
  return v8;
}

- (id)contextForParticipantIDsHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[IMCommLimitsPolicyCache participantIDsHashToConversationContext](self, "participantIDsHashToConversationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSMutableDictionary)chatIdentifierToParticipantIDsHash
{
  return self->_chatIdentifierToParticipantIDsHash;
}

- (id)chatForParticipantIDsHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[IMCommLimitsPolicyCache participantIDsHashToChatIdentifier](self, "participantIDsHashToChatIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "existingChatWithChatIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)chatForConversationContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCommLimitsPolicyCache conversationContextToParticipantIDsHash](self, "conversationContextToParticipantIDsHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMCommLimitsPolicyCache chatForParticipantIDsHash:](self, "chatForParticipantIDsHash:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)addTrackingForConversationContext:(id)a3 forParticipantIDsHash:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[IMCommLimitsPolicyCache participantIDsHashToConversationContext](self, "participantIDsHashToConversationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[IMCommLimitsPolicyCache conversationContextToParticipantIDsHash](self, "conversationContextToParticipantIDsHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

    }
  }
}

- (void)addTrackingForChat:(id)a3 participantIDsHash:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "chatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v6)
  {
    -[IMCommLimitsPolicyCache participantIDsHashToChatIdentifier](self, "participantIDsHashToChatIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v9);

    -[IMCommLimitsPolicyCache chatIdentifierToParticipantIDsHash](self, "chatIdentifierToParticipantIDsHash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

  }
}

- (void)addSentinelContextForParticipantIDsHash:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E38];
    v5 = a3;
    objc_msgSend(v4, "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[IMCommLimitsPolicyCache participantIDsHashToConversationContext](self, "participantIDsHashToConversationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

  }
}

- (void)removeTrackingForChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMCommLimitsPolicyCache chatIdentifierToParticipantIDsHash](self, "chatIdentifierToParticipantIDsHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v16 = 138412546;
          v17 = v4;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Participants changed for chat %@. Invalidating cached Screen Time policy for participants group IDs hash: %@", (uint8_t *)&v16, 0x16u);
        }

      }
      -[IMCommLimitsPolicyCache participantIDsHashToConversationContext](self, "participantIDsHashToConversationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMCommLimitsPolicyCache conversationContextToParticipantIDsHash](self, "conversationContextToParticipantIDsHash");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v11);

      }
      -[IMCommLimitsPolicyCache chatIdentifierToParticipantIDsHash](self, "chatIdentifierToParticipantIDsHash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v5);

      -[IMCommLimitsPolicyCache participantIDsHashToChatIdentifier](self, "participantIDsHashToChatIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v7);

      -[IMCommLimitsPolicyCache participantIDsHashToConversationContext](self, "participantIDsHashToConversationContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v7);

    }
  }

}

- (void)setConversationContextToParticipantIDsHash:(id)a3
{
  objc_storeStrong((id *)&self->_conversationContextToParticipantIDsHash, a3);
}

- (void)setParticipantIDsHashToConversationContext:(id)a3
{
  objc_storeStrong((id *)&self->_participantIDsHashToConversationContext, a3);
}

- (void)setParticipantIDsHashToChatIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_participantIDsHashToChatIdentifier, a3);
}

- (void)setChatIdentifierToParticipantIDsHash:(id)a3
{
  objc_storeStrong((id *)&self->_chatIdentifierToParticipantIDsHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifierToParticipantIDsHash, 0);
  objc_storeStrong((id *)&self->_participantIDsHashToChatIdentifier, 0);
  objc_storeStrong((id *)&self->_participantIDsHashToConversationContext, 0);
  objc_storeStrong((id *)&self->_conversationContextToParticipantIDsHash, 0);
}

@end
