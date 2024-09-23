@implementation IMReplyingRemoteDaemonProxy

- (IMReplyingRemoteDaemonProxy)initWithDaemonController:(id)a3 synchronousReplies:(BOOL)a4
{
  if (self)
  {
    objc_storeWeak((id *)&self->_daemonController, a3);
    self->_synchronousReplies = a4;
  }
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[IMReplyingRemoteDaemonProxy daemonController](self, "daemonController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "methodSignatureForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  _QWORD v8[4];
  id v9;
  IMReplyingRemoteDaemonProxy *v10;

  v4 = a3;
  -[IMReplyingRemoteDaemonProxy daemonController](self, "daemonController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IMReplyingRemoteDaemonProxy synchronousReplies](self, "synchronousReplies");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A20EB580;
  v8[3] = &unk_1E471E7C8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v5, "sendQueryWithReply:query:", v6, v8);

}

- (BOOL)synchronousReplies
{
  return self->_synchronousReplies;
}

- (void)setSynchronousReplies:(BOOL)a3
{
  self->_synchronousReplies = a3;
}

- (IMDaemonController)daemonController
{
  return (IMDaemonController *)objc_loadWeakRetained((id *)&self->_daemonController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemonController);
}

@end
