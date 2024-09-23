@implementation _SWCollaborationCoordinator

+ (SWCollaborationCoordinator)sharedManager
{
  return (SWCollaborationCoordinator *)objc_msgSend((id)objc_opt_class(), "sharedCoordinator");
}

- (void)_sendStartCollaborationAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    SWFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B618000, v7, OS_LOG_TYPE_DEFAULT, "_sendStartCollaborationAction: invoking the action handler", buf, 2u);
    }

    -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleStartCollaborationAction:", v4);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SWCollaborationCoordinator;
    -[SWCollaborationCoordinator _sendStartCollaborationAction:](&v9, sel__sendStartCollaborationAction_, v4);
  }

}

- (void)_sendUpdateCollaborationParticipantsAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74___SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke;
    block[3] = &unk_1E217B388;
    block[4] = self;
    v9 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SWCollaborationCoordinator;
    -[SWCollaborationCoordinator _sendUpdateCollaborationParticipantsAction:](&v7, sel__sendUpdateCollaborationParticipantsAction_, v4);
  }

}

@end
