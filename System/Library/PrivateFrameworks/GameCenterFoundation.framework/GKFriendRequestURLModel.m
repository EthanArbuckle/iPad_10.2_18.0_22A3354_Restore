@implementation GKFriendRequestURLModel

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[GKFriendRequestURLModel friendSupportPageURL](self, "friendSupportPageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFriendRequestURLModel friendCode](self, "friendCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFriendRequestURLModel friendRequestState](self, "friendRequestState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFriendRequestURLModel initiator](self, "initiator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFriendRequestURLModel friendRequestVersion](self, "friendRequestVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("             \n\t <%@: %p>             \n\t friendSupportPageURL: %@             \n\t friendCode: %@             \n\t friendRequestState: %@             \n\t initiator: %@             \n\t friendRequestVersion: %@             \n             "), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)friendSupportPageURL
{
  return self->_friendSupportPageURL;
}

- (void)setFriendSupportPageURL:(id)a3
{
  objc_storeStrong((id *)&self->_friendSupportPageURL, a3);
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
  objc_storeStrong((id *)&self->_friendCode, a3);
}

- (NSString)friendRequestState
{
  return self->_friendRequestState;
}

- (void)setFriendRequestState:(id)a3
{
  objc_storeStrong((id *)&self->_friendRequestState, a3);
}

- (GKPlayer)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (NSString)friendRequestVersion
{
  return self->_friendRequestVersion;
}

- (void)setFriendRequestVersion:(id)a3
{
  objc_storeStrong((id *)&self->_friendRequestVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendRequestVersion, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_friendRequestState, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);
  objc_storeStrong((id *)&self->_friendSupportPageURL, 0);
}

@end
