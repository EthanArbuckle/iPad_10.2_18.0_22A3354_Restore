@implementation NDTodayFeed

- (NDTodayFeed)initWithConfigData:(id)a3 publishDate:(id)a4 contentManifest:(id)a5 contentArchive:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NDTodayFeed *v14;
  uint64_t v15;
  NSData *configData;
  uint64_t v17;
  NSDate *publishDate;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NDTodayFeed;
  v14 = -[NDTodayFeed init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    configData = v14->_configData;
    v14->_configData = (NSData *)v15;

    v17 = objc_msgSend(v11, "copy");
    publishDate = v14->_publishDate;
    v14->_publishDate = (NSDate *)v17;

    objc_storeStrong((id *)&v14->_contentManifest, a5);
    objc_storeStrong((id *)&v14->_contentArchive, a6);
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D58AB0]), "initWithObject:", self);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NDTodayFeed configData](self, "configData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%lu bytes>"), objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("configData"), v6);

  -[NDTodayFeed publishDate](self, "publishDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("publishDate"), v7);

  -[NDTodayFeed contentManifest](self, "contentManifest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("contentManifest"), v8);

  objc_msgSend(v3, "descriptionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDTodayFeed)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NDTodayFeed *v12;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publishDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentManifest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentArchive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v7;
  if (v7)
  {
    if (v8)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D58A78], "empty");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_7:
      v12 = -[NDTodayFeed initWithConfigData:publishDate:contentManifest:contentArchive:](self, "initWithConfigData:publishDate:contentManifest:contentArchive:", v9, v10, v11, v8);
      if (v7)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0D58A68], "empty");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NDTodayFeed initWithConfigData:publishDate:contentManifest:contentArchive:](self, "initWithConfigData:publishDate:contentManifest:contentArchive:", v9, v10, v11, v14);

  if (v7)
  {
LABEL_8:
    if (v6)
      goto LABEL_9;
LABEL_14:

    if (v5)
      goto LABEL_10;
LABEL_15:

    goto LABEL_10;
  }
LABEL_13:

  if (!v6)
    goto LABEL_14;
LABEL_9:
  if (!v5)
    goto LABEL_15;
LABEL_10:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NDTodayFeed configData](self, "configData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configData"));

  -[NDTodayFeed publishDate](self, "publishDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("publishDate"));

  -[NDTodayFeed contentManifest](self, "contentManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contentManifest"));

  -[NDTodayFeed contentArchive](self, "contentArchive");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("contentArchive"));

}

- (NSData)configData
{
  return self->_configData;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (FCContentManifest)contentManifest
{
  return self->_contentManifest;
}

- (FCContentArchive)contentArchive
{
  return self->_contentArchive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentArchive, 0);
  objc_storeStrong((id *)&self->_contentManifest, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_configData, 0);
}

@end
