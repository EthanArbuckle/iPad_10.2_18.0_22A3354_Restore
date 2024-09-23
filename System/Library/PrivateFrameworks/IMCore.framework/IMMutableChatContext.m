@implementation IMMutableChatContext

- (void)setServiceType:(int64_t)a3
{
  self->super._serviceType = a3;
}

- (void)setFilterCategory:(int64_t)a3
{
  self->super._filterCategory = a3;
}

- (void)setSpam:(BOOL)a3
{
  self->super._spam = a3;
}

- (void)setSendersUnknown:(BOOL)a3
{
  self->super._sendersUnknown = a3;
}

- (void)setResponded:(BOOL)a3
{
  self->super._responded = a3;
}

- (void)setActiveTelephonyConversationUUID:(id)a3
{
  objc_storeStrong((id *)&self->super._activeTelephonyConversationUUID, a3);
}

- (void)setShowingEditHistoryForChatItemGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->super._showingEditHistoryForChatItemGUIDs, a3);
}

- (void)setIsChatBot:(BOOL)a3
{
  self->super._isChatBot = a3;
}

+ (id)chatContextForPinnedChat:(id)a3
{
  id v3;
  IMMutableChatContext *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(IMMutableChatContext);
  if ((objc_msgSend(v3, "isBusinessChat") & 1) != 0)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v3, "isSMS"))
  {
    v5 = 1;
  }
  else
  {
    v5 = 2;
  }
  if (objc_msgSend(v3, "isStewieChat"))
    v5 = 4;
  if (objc_msgSend(v3, "isStewieSharingChat"))
    v6 = 5;
  else
    v6 = v5;
  -[IMMutableChatContext setServiceType:](v4, "setServiceType:", v6);
  -[IMMutableChatContext setFilterCategory:](v4, "setFilterCategory:", 0);
  -[IMMutableChatContext setSpam:](v4, "setSpam:", 0);
  -[IMMutableChatContext setSendersUnknown:](v4, "setSendersUnknown:", objc_msgSend(v3, "hasKnownParticipantsCache") ^ 1);
  -[IMMutableChatContext setResponded:](v4, "setResponded:", objc_msgSend(v3, "repliedToChat"));
  objc_msgSend(v3, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableChatContext setActiveTelephonyConversationUUID:](v4, "setActiveTelephonyConversationUUID:", v8);

  objc_msgSend(v3, "showingEditHistoryForChatItemGUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableChatContext setShowingEditHistoryForChatItemGUIDs:](v4, "setShowingEditHistoryForChatItemGUIDs:", v9);

  -[IMMutableChatContext setIsChatBot:](v4, "setIsChatBot:", objc_msgSend(v3, "isChatBot"));
  return v4;
}

@end
