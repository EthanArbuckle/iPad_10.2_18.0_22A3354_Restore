@implementation MPStoreSocialRemoveFollowerOperationDataSource

- (id)bagKey
{
  return CFSTR("removeFollower");
}

- (id)httpBody
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[MPModelObject identifiers](self->_person, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialProfileID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36D8];
    v9 = CFSTR("id");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithJSONObject:options:error:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
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
