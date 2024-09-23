@implementation IMAVChatParticipantProxy

- (IMAVChatParticipantProxy)initWithDictionary:(id)a3 chat:(id)a4
{
  id v7;
  id v8;
  IMAVChatParticipantProxy *v9;
  IMAVChatParticipantProxy *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMAVChatParticipantProxy;
  v9 = -[IMAVChatParticipantProxy init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_info, a3);
    objc_storeStrong((id *)&v10->_chat, a4);
  }

  return v10;
}

- (IMAVChat)avChat
{
  return (IMAVChat *)self->_chat;
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("Name"), v2, v3);
}

- (BOOL)_inviteDelivered
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsInvitationDelivered"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isLocalParticipant
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_objectForKey_(self->_info, a2, (uint64_t)CFSTR("IsLocalParticipant"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (const char *)objc_msgSend_selector(v3, v5, v6, v7, v8);
    NSStringFromSelector(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] ********** IMAVChatParticipantProxy does not respond to selector %@, please file a radar **********", (uint8_t *)&v11, 0xCu);

  }
  IMLogBacktrace();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
