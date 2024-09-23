@implementation ICSActivationContext

- (ICSActivationContext)initWithReason:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  ICSActivationContext *v9;
  ICSActivationContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSActivationContext;
  v9 = -[ICSActivationContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reason, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (ICSActivationContext)initWithVideoMessageURL:(id)a3
{
  id v5;
  ICSActivationContext *v6;
  ICSActivationContext *v7;

  v5 = a3;
  v6 = -[ICSActivationContext initWithReason:userInfo:](self, "initWithReason:userInfo:", CFSTR("ICSSceneActivationReasonVideoMessagePlayback"), 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_videoMessageURL, a3);

  return v7;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSActivationContext reason](self, "reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSActivationContext userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p reason=%@ userInfo=%@>"), v3, self, v4, v5));

  return v6;
}

- (TUFilteredRequest)pendingRestrictedScreenTimeRequest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSActivationContext reason](self, "reason"));
  v4 = (void *)SOSRemoteAlertActivationReasonActivatingForScreenTime;

  if (v3 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSActivationContext userInfo](self, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", SOSRemoteAlertActivationContextUserInfoRequestURLStringKey));

    v9 = objc_opt_class(NSString, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
      if (v10)
      {
        v5 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithURL:", v10);
        if (!v5)
        {
          v11 = objc_msgSend(objc_alloc((Class)TUJoinConversationRequest), "initWithURL:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "conversationManager"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteMembers"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversationLink"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeConversationWithRemoteMembers:andLink:", v14, v15));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeRemoteParticipants"));
          if (objc_msgSend(v17, "count"))
            v18 = v16;
          else
            v18 = v11;
          v5 = v18;

        }
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return (TUFilteredRequest *)v5;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSURL)videoMessageURL
{
  return self->_videoMessageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoMessageURL, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
