@implementation COMessagingSessionInfo

- (COMessagingSessionInfo)initWithSubTopic:(id)a3 member:(id)a4 produced:(BOOL)a5
{
  id v9;
  id v10;
  COMessagingSessionInfo *v11;
  COMessagingSessionInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMessagingSessionInfo;
  v11 = -[COMessagingSessionInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subTopic, a3);
    objc_storeStrong((id *)&v12->_member, a4);
    v12->_producedSession = a5;
  }

  return v12;
}

- (NSString)subTopic
{
  return self->_subTopic;
}

- (COClusterMember)member
{
  return self->_member;
}

- (BOOL)producedSession
{
  return self->_producedSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member, 0);
  objc_storeStrong((id *)&self->_subTopic, 0);
}

@end
