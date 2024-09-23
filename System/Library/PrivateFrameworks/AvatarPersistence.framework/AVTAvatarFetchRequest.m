@implementation AVTAvatarFetchRequest

+ (id)requestForAllAvatars
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:", 0);
}

+ (id)requestForAllAvatarsExcluding:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:", 6, 0, v4, 0);

  return v5;
}

+ (id)requestForAvatarWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:identifier:", 1, v4);

  return v5;
}

+ (id)requestForAvatarsWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:", 2, v4, MEMORY[0x24BDBD1A8], 0);

  return v6;
}

+ (id)requestForPredefinedAvatars
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:", 3);
}

+ (id)requestForPredefinedAvatarsExcluding:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:", 7, 0, v4, 0);

  return v5;
}

+ (id)requestForCustomAvatars
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:", 4);
}

+ (id)requestForCustomAvatarsWithLimit:(int64_t)a3
{
  id v4;

  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v4, "initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:", 4, 0, MEMORY[0x24BDBD1A8], a3);
}

+ (id)requestForStorePrimaryAvatar
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:", 5);
}

- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3
{
  return -[AVTAvatarFetchRequest initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:](self, "initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:", a3, 0, MEMORY[0x24BDBD1A8], 0);
}

- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3 identifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  AVTAvatarFetchRequest *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AVTAvatarFetchRequest initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:](self, "initWithCriteria:identifiers:excludedIdentifiers:fetchLimit:", a3, v8, MEMORY[0x24BDBD1A8], 0, v11, v12);
  return v9;
}

- (AVTAvatarFetchRequest)initWithCriteria:(int64_t)a3 identifiers:(id)a4 excludedIdentifiers:(id)a5 fetchLimit:(int64_t)a6
{
  id v10;
  id v11;
  AVTAvatarFetchRequest *v12;
  AVTAvatarFetchRequest *v13;
  uint64_t v14;
  NSArray *identifiers;
  objc_super v17;

  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarFetchRequest;
  v12 = -[AVTAvatarFetchRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_criteria = a3;
    v14 = objc_msgSend(v10, "copy");
    identifiers = v13->_identifiers;
    v13->_identifiers = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_excludingIdentifiers, a5);
    v13->_fetchLimit = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTAvatarFetchRequest *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int64_t v16;

  v5 = (AVTAvatarFetchRequest *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v6 = -[AVTAvatarFetchRequest criteria](self, "criteria");
    if (v6 != -[AVTAvatarFetchRequest criteria](v5, "criteria"))
      goto LABEL_17;
    -[AVTAvatarFetchRequest identifiers](self, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[AVTAvatarFetchRequest identifiers](v5, "identifiers"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AVTAvatarFetchRequest identifiers](self, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarFetchRequest identifiers](v5, "identifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {

        if (!v10)
          goto LABEL_17;
      }
      else
      {

        if ((v10 & 1) == 0)
          goto LABEL_17;
      }
    }
    -[AVTAvatarFetchRequest excludingIdentifiers](self, "excludingIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[AVTAvatarFetchRequest excludingIdentifiers](v5, "excludingIdentifiers");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_15;
    }
    -[AVTAvatarFetchRequest excludingIdentifiers](self, "excludingIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarFetchRequest excludingIdentifiers](v5, "excludingIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v12)
    {

      if (v15)
      {
LABEL_15:
        v16 = -[AVTAvatarFetchRequest fetchLimit](self, "fetchLimit");
        v11 = v16 == -[AVTAvatarFetchRequest fetchLimit](v5, "fetchLimit");
        goto LABEL_18;
      }
    }
    else
    {

      if ((v15 & 1) != 0)
        goto LABEL_15;
    }
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  v11 = 1;
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unint64_t v9;

  -[AVTAvatarFetchRequest identifiers](self, "identifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  -[AVTAvatarFetchRequest identifiers](self, "identifiers");
  v4 = objc_claimAutoreleasedReturnValue();
  -[AVTAvatarFetchRequest excludingIdentifiers](self, "excludingIdentifiers");
  v5 = objc_claimAutoreleasedReturnValue();
  -[AVTAvatarFetchRequest excludingIdentifiers](self, "excludingIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v8 + 1) = v5 ^ v3;
  *(_QWORD *)&v8 = v6 ^ v4;
  v7 = v8 >> 43;
  *((_QWORD *)&v8 + 1) = -[AVTAvatarFetchRequest fetchLimit](self, "fetchLimit");
  *(_QWORD *)&v8 = -[AVTAvatarFetchRequest fetchLimit](self, "fetchLimit");
  v9 = v7 ^ (v8 >> 32) ^ -[AVTAvatarFetchRequest criteria](self, "criteria");

  return v9;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSArray)excludingIdentifiers
{
  return self->_excludingIdentifiers;
}

- (int64_t)criteria
{
  return self->_criteria;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludingIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
