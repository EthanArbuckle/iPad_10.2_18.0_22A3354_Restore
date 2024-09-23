@implementation IMChatContext

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  objc_class *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMChatContext.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[cls isSubclassOfClass:[IMChatContext class]]"));

  }
  v8 = -[objc_class init](-[objc_class allocWithZone:](a3, "allocWithZone:", a4), "init");
  *((_QWORD *)v8 + 1) = -[IMChatContext serviceType](self, "serviceType");
  *((_QWORD *)v8 + 2) = -[IMChatContext filterCategory](self, "filterCategory");
  *((_BYTE *)v8 + 24) = -[IMChatContext isSpam](self, "isSpam");
  *((_BYTE *)v8 + 25) = -[IMChatContext areSendersUnknown](self, "areSendersUnknown");
  *((_BYTE *)v8 + 26) = -[IMChatContext hasResponded](self, "hasResponded");
  -[IMChatContext activeTelephonyConversationUUID](self, "activeTelephonyConversationUUID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v9;

  -[IMChatContext showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v8 + 5);
  *((_QWORD *)v8 + 5) = v11;

  *((_BYTE *)v8 + 48) = -[IMChatContext isChatBot](self, "isChatBot");
  return v8;
}

- (id)description
{
  int64_t v3;
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v13;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_opt_class();
  v3 = -[IMChatContext serviceType](self, "serviceType");
  v4 = -[IMChatContext filterCategory](self, "filterCategory");
  if (-[IMChatContext isSpam](self, "isSpam"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[IMChatContext areSendersUnknown](self, "areSendersUnknown"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[IMChatContext hasResponded](self, "hasResponded"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[IMChatContext activeTelephonyConversationUUID](self, "activeTelephonyConversationUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMChatContext isChatBot](self, "isChatBot"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@, serviceType: %lu, filterCategory: %tu, spam: %@, sendersUnknown: %@, responded: %@, activeTelephonyConversationUUID: %@, isChatBot: %@>"), v13, v3, v4, v5, v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](self, sel__copyWithClass_zone_);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](self, sel__copyWithClass_zone_);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (int64_t)filterCategory
{
  return self->_filterCategory;
}

- (BOOL)isSpam
{
  return self->_spam;
}

- (BOOL)areSendersUnknown
{
  return self->_sendersUnknown;
}

- (BOOL)hasResponded
{
  return self->_responded;
}

- (NSUUID)activeTelephonyConversationUUID
{
  return self->_activeTelephonyConversationUUID;
}

- (NSArray)showingEditHistoryForChatItemGUIDs
{
  return self->_showingEditHistoryForChatItemGUIDs;
}

- (BOOL)isChatBot
{
  return self->_isChatBot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showingEditHistoryForChatItemGUIDs, 0);
  objc_storeStrong((id *)&self->_activeTelephonyConversationUUID, 0);
}

@end
