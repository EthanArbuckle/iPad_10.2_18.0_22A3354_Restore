@implementation CSPerson(Suggestions)

- (id)sg_emailAddress
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "handleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("emailAddresses"));

  if (v3
    && (objc_msgSend(a1, "handles"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    objc_msgSend(a1, "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (SGSimpleNamedEmailAddress)sg_namedEmailAddress
{
  void *v2;
  SGSimpleNamedEmailAddress *v3;
  void *v4;
  SGSimpleNamedEmailAddress *v5;

  objc_msgSend(a1, "sg_emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [SGSimpleNamedEmailAddress alloc];
    objc_msgSend(a1, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SGSimpleNamedEmailAddress initWithName:emailAddress:](v3, "initWithName:emailAddress:", v4, v2);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sg_initWithNamedEmailAddress:()Suggestions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithDisplayName:handles:handleIdentifier:", v6, v8, CFSTR("emailAddresses"));

  return v9;
}

- (id)sg_serialized
{
  void *v1;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;

  objc_msgSend(a1, "displayName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E4762D08;
  if (v3)
    v6 = (__CFString *)v3;
  else
    v6 = &stru_1E4762D08;
  objc_msgSend(a1, "handles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    objc_msgSend(a1, "handles");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "handleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SGDelimitedStringsSerialize(v6, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

  }
  return v16;
}

- (id)sg_initWithSerializedForm:()Suggestions
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  SGDelimitedStringsDeserialize(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 3)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v8 = (void *)objc_msgSend(a1, "initWithDisplayName:handles:handleIdentifier:", v7, v13, v12);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
