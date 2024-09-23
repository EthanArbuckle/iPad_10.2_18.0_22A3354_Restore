@implementation MPStoreSocialPendingFollowRequestOperationDataSource

- (MPStoreSocialPendingFollowRequestOperationDataSource)initWithAction:(int64_t)a3
{
  MPStoreSocialPendingFollowRequestOperationDataSource *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPStoreSocialPendingFollowRequestOperationDataSource;
  result = -[MPStoreSocialPendingFollowRequestOperationDataSource init](&v5, sel_init);
  if (result)
    result->_action = a3;
  return result;
}

- (id)_actionTypeString
{
  unint64_t action;

  action = self->_action;
  if (action > 3)
    return 0;
  else
    return off_1E315AEB8[action];
}

- (id)bagKey
{
  return CFSTR("followRequest");
}

- (id)fallbackBagKeys
{
  return &unk_1E31E61D8;
}

- (id)httpBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreSocialPendingFollowRequestOperationDataSource _actionTypeString](self, "_actionTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("actionType"));

  -[MPModelObject identifiers](self->_person, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "socialProfileID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("id"));
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)httpBodyType
{
  return 1;
}

- (int64_t)httpMethod
{
  return 1;
}

- (id)queryItems
{
  return 0;
}

- (int64_t)action
{
  return self->_action;
}

- (MPModelSocialPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

@end
