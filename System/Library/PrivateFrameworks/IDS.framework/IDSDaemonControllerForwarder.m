@implementation IDSDaemonControllerForwarder

- (IDSDaemonControllerForwarder)initWithProtocol:(id)a3 ivarQueue:(id)a4 remoteMessageQueue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id completion;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (self)
  {
    objc_storeStrong((id *)&self->_protocol, a3);
    v14 = a6;
    objc_storeStrong((id *)&self->_ivarQueue, a4);
    objc_storeStrong((id *)&self->_remoteMessageQueue, a5);
    v15 = (void *)objc_msgSend(v14, "copy");

    completion = self->_completion;
    self->_completion = v15;

  }
  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  int priority;
  void *v6;
  id completion;
  void *v8;
  char v9;
  char v10;
  char v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int v20;
  char v21;
  char v22;
  char v23;

  v4 = a3;
  priority = self->_priority;
  self->_priority = 0;
  v6 = (void *)MEMORY[0x19400FE1C](self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "consumeQueryContext:", CFSTR("QueryWithReplySync"));
  v10 = objc_msgSend(v8, "consumeQueryContext:", CFSTR("QueryWithReply"));
  v11 = objc_msgSend(v8, "consumeQueryContext:", CFSTR("QueryWithBoost"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1906E9D24;
  v16[3] = &unk_1E2C60898;
  v16[4] = self;
  v12 = v8;
  v20 = priority;
  v17 = v12;
  v18 = v4;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v19 = v6;
  v13 = v6;
  v14 = v4;
  v15 = (void (**)(_QWORD))MEMORY[0x19400FE1C](v16);
  if (_os_feature_enabled_impl())
    v15[2](v15);
  else
    objc_msgSend(v12, "_performBlock:wait:", v15, 1);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSProtocolChecker _imMethodSignatureForSelector:](self->_protocol, "_imMethodSignatureForSelector:", a3);
}

- (IDSDaemonControllerForwarder)initWithProtocol:(id)a3 ivarQueue:(id)a4 remoteMessageQueue:(id)a5
{
  return -[IDSDaemonControllerForwarder initWithProtocol:ivarQueue:remoteMessageQueue:completion:](self, "initWithProtocol:ivarQueue:remoteMessageQueue:completion:", a3, a4, a5, 0);
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (id)completion
{
  return self->_completion;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (OS_dispatch_queue)remoteMessageQueue
{
  return self->_remoteMessageQueue;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
