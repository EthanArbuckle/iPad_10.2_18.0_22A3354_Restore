@implementation NMSPodcastIdentifierSet

- (NMSPodcastIdentifierSet)initWithStoreID:(id)a3 feedURL:(id)a4
{
  id v7;
  id v8;
  NMSPodcastIdentifierSet *v9;
  NMSPodcastIdentifierSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NMSPodcastIdentifierSet;
  v9 = -[NMSPodcastIdentifierSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeID, a3);
    objc_storeStrong((id *)&v10->_feedURL, a4);
  }

  return v10;
}

- (NMSPodcastIdentifierSet)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NMSPodcastIdentifierSet *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("storeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToNumber:", &unk_24D655C38))
  {

    v5 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("feedURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

    v6 = 0;
  }
  v7 = -[NMSPodcastIdentifierSet initWithStoreID:feedURL:](self, "initWithStoreID:feedURL:", v5, v6);

  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("storeID");
  -[NMSPodcastIdentifierSet storeID](self, "storeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &unk_24D655C38;
  v13[1] = CFSTR("feedURL");
  v14[0] = v6;
  -[NMSPodcastIdentifierSet feedURL](self, "feedURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v8;
  v10 = &stru_24D648498;
  if (v8)
    v10 = (const __CFString *)v8;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqualToPodcastIdentifierSet:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;

  v4 = a3;
  -[NMSPodcastIdentifierSet storeID](self, "storeID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "storeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NMSPodcastIdentifierSet storeID](self, "storeID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "storeID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToNumber:", v9);
LABEL_7:
      v14 = v10;

      goto LABEL_15;
    }
  }
  -[NMSPodcastIdentifierSet feedURL](self, "feedURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v4, "feedURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NMSPodcastIdentifierSet feedURL](self, "feedURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "feedURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);
      goto LABEL_7;
    }
  }
  -[NMSPodcastIdentifierSet storeID](self, "storeID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "storeID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17 == 0;

  }
  -[NMSPodcastIdentifierSet feedURL](self, "feedURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v4, "feedURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20 == 0;

  }
  v14 = v16 && v19;
LABEL_15:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  NMSPodcastIdentifierSet *v4;
  BOOL v5;

  v4 = (NMSPodcastIdentifierSet *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NMSPodcastIdentifierSet isEqualToPodcastIdentifierSet:](self, "isEqualToPodcastIdentifierSet:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NMSPodcastIdentifierSet storeID](self, "storeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)NMSPodcastIdentifierSet;
  -[NMSPodcastIdentifierSet description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSPodcastIdentifierSet storeID](self, "storeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSPodcastIdentifierSet feedURL](self, "feedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ storeID <%@> feedURL <%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)-[NSNumber copyWithZone:](self->_storeID, "copyWithZone:");
  v6 = (void *)-[NSString copyWithZone:](self->_feedURL, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStoreID:feedURL:", v5, v6);

  return v7;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

@end
