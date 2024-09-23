@implementation ASActivitySharingFriendQuery

- (ASActivitySharingFriendQuery)initWithActivitySharingClient:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  ASActivitySharingFriendQuery *v8;
  _ASActivitySharingFriendQuery *v9;
  void *v10;
  uint64_t v11;
  _ASActivitySharingFriendQuery *activitySharingFriendQuery;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASActivitySharingFriendQuery;
  v8 = -[ASActivitySharingFriendQuery init](&v14, sel_init);
  if (v8)
  {
    v9 = [_ASActivitySharingFriendQuery alloc];
    objc_msgSend(v6, "activitySharingClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_ASActivitySharingFriendQuery initWithActivitySharingClient:updateHandler:](v9, "initWithActivitySharingClient:updateHandler:", v10, v7);
    activitySharingFriendQuery = v8->_activitySharingFriendQuery;
    v8->_activitySharingFriendQuery = (_ASActivitySharingFriendQuery *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySharingFriendQuery, 0);
}

@end
