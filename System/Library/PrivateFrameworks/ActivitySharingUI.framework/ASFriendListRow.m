@implementation ASFriendListRow

- (_HKFitnessFriendActivitySnapshot)snapshot
{
  return self->_snapshot;
}

- (ASFriend)friend
{
  return self->_friend;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (void)setFriend:(id)a3
{
  objc_storeStrong((id *)&self->_friend, a3);
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "friend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASFriendListRow friend](self, "friend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_friend, 0);
}

@end
