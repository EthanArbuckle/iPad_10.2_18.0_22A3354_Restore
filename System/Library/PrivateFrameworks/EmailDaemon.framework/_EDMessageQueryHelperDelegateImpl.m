@implementation _EDMessageQueryHelperDelegateImpl

- (_EDMessageQueryHelperDelegateImpl)initWithMessageQueryHelperObserver:(id)a3 didFindAllMessagesBlock:(id)a4
{
  id v7;
  id v8;
  _EDMessageQueryHelperDelegateImpl *v9;
  _EDMessageQueryHelperDelegateImpl *v10;
  void *v11;
  id didFindAllMessagesBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EDMessageQueryHelperDelegateImpl;
  v9 = -[_EDMessageQueryHelperDelegateImpl init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    v11 = _Block_copy(v8);
    didFindAllMessagesBlock = v10->_didFindAllMessagesBlock;
    v10->_didFindAllMessagesBlock = v11;

  }
  return v10;
}

- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryHelperConversationIDDidChangeForMessages:fromConversationID:", v8, a5);

}

- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5
{
  id v7;

  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryHelperConversationNotificationLevelDidChangeForConversation:conversationID:", a4, a5);

}

- (void)queryHelper:(id)a3 didAddMessages:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryHelperDidAddMessages:", v6);

}

- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryHelperDidDeleteMessages:", v6);

}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  void *v6;
  id v7;

  v7 = a4;
  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryHelperDidFindMessages:", v7);

}

- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryHelperDidUpdateMessages:forKeyPaths:", v9, v7);

}

- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryHelperMessageFlagsDidChangeForMessages:", v7);

}

- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6
{
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v9 = a5;
  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryHelperObjectIDDidChangeForMessage:oldObjectID:oldConversationID:", v11, v9, a6);

}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  void (**v4)(void);
  id v5;

  -[_EDMessageQueryHelperDelegateImpl didFindAllMessagesBlock](self, "didFindAllMessagesBlock", a3);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryHelperDidFindAllMessages");

}

- (void)queryHelperDidFinishRemoteSearch:(id)a3
{
  id v3;

  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryHelperDidFinishRemoteSearch");

}

- (void)queryHelperNeedsRestart:(id)a3
{
  id v3;

  -[_EDMessageQueryHelperDelegateImpl observer](self, "observer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryHelperNeedsRestart");

}

- (EMMessageQueryHelperObserver_xpc)observer
{
  return self->_observer;
}

- (id)didFindAllMessagesBlock
{
  return self->_didFindAllMessagesBlock;
}

- (void)setDidFindAllMessagesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFindAllMessagesBlock, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
