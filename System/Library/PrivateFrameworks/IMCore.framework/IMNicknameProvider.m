@implementation IMNicknameProvider

- (IMNicknameProvider)init
{
  IMNicknameProvider *v2;
  IMNicknameProvider_Impl *v3;
  IMNicknameProvider_Impl *swiftImpl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMNicknameProvider;
  v2 = -[IMNicknameProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMNicknameProvider_Impl);
    swiftImpl = v2->_swiftImpl;
    v2->_swiftImpl = v3;

  }
  return v2;
}

- (BOOL)haveNicknamesLoaded
{
  return MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_haveNicknamesLoaded);
}

- (void)nicknameForCurrentUserWithCompletionHandler:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_nicknameForCurrentUserWithCompletionHandler_);
}

- (id)nicknameForHandleID:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_nicknameForHandleID_);
}

- (id)nicknameForContact:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_nicknameForContact_);
}

- (id)pendingNicknameForContact:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_pendingNicknameForContact_);
}

- (id)currentNicknameForContact:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_currentNicknameForContact_);
}

- (id)allNicknamesForContact:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_allNicknamesForContact_);
}

- (void)updatePendingNicknameWithContact:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_updatePendingNicknameWith_);
}

- (void)setPersonalNicknameWithContact:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_setPersonalNicknameWith_);
}

- (void)setNicknameListener:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_setNicknameListener_);
}

- (void)sendPersonalNicknameToHandleID:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_sendPersonalNicknameTo_);
}

- (void)sendPersonalNicknameToHandleID:(id)a3 fromHandleID:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_sendPersonalNicknameTo_from_);
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_sendNameOnlyTo_from_);
}

- (BOOL)hasObservedTransitionForHandleID:(id)a3
{
  return -[IMNicknameProvider_Impl hasObservedTransitionForHandleID:](self->_swiftImpl, "hasObservedTransitionForHandleID:", a3);
}

- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4
{
  -[IMNicknameProvider_Impl markTransitionAsObservedForHandleID:isAutoUpdate:](self->_swiftImpl, "markTransitionAsObservedForHandleID:isAutoUpdate:", a3, a4);
}

- (void)bannerActionTapped:(id)a3 IMNicknameBannerAction:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_bannerActionTappedFrom_on_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftImpl, 0);
}

@end
