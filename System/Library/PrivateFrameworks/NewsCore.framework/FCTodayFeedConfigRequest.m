@implementation FCTodayFeedConfigRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (NSString)forYouConfigID
{
  return self->_forYouConfigID;
}

- (unint64_t)feedType
{
  return self->_feedType;
}

- (NSArray)additionalRecordIDs
{
  return self->_additionalRecordIDs;
}

- (FCTodayFeedConfigRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  FCTodayFeedConfigRequest *v16;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feedType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("forYouConfigID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatVersion"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)MEMORY[0x1E0C99E60];
          v13 = objc_opt_class();
          objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("additionalRecordIDs"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            self = -[FCTodayFeedConfigRequest initWithFeedType:forYouConfigID:formatVersion:additionalRecordIDs:](self, "initWithFeedType:forYouConfigID:formatVersion:additionalRecordIDs:", objc_msgSend(v7, "unsignedIntegerValue"), v10, v11, v15);
            v16 = self;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (FCTodayFeedConfigRequest)initWithFeedType:(unint64_t)a3 forYouConfigID:(id)a4 formatVersion:(id)a5 additionalRecordIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  FCTodayFeedConfigRequest *v13;
  FCTodayFeedConfigRequest *v14;
  uint64_t v15;
  NSString *forYouConfigID;
  uint64_t v17;
  NSString *formatVersion;
  uint64_t v19;
  NSArray *additionalRecordIDs;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FCTodayFeedConfigRequest;
  v13 = -[FCTodayFeedConfigRequest init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_feedType = a3;
    v15 = objc_msgSend(v10, "copy");
    forYouConfigID = v14->_forYouConfigID;
    v14->_forYouConfigID = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    formatVersion = v14->_formatVersion;
    v14->_formatVersion = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    additionalRecordIDs = v14->_additionalRecordIDs;
    v14->_additionalRecordIDs = (NSArray *)v19;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6 && (v7 = -[FCTodayFeedConfigRequest feedType](self, "feedType"), v7 == objc_msgSend(v6, "feedType")))
  {
    -[FCTodayFeedConfigRequest forYouConfigID](self, "forYouConfigID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forYouConfigID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {
      -[FCTodayFeedConfigRequest formatVersion](self, "formatVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formatVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v11))
      {
        v12 = (void *)MEMORY[0x1E0C99E60];
        -[FCTodayFeedConfigRequest additionalRecordIDs](self, "additionalRecordIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setWithArray:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v6, "additionalRecordIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setWithArray:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v14, "isEqualToSet:", v17);

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCTodayFeedConfigRequest feedType](self, "feedType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCTodayFeedConfigRequest forYouConfigID](self, "forYouConfigID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[FCTodayFeedConfigRequest formatVersion](self, "formatVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[FCTodayFeedConfigRequest additionalRecordIDs](self, "additionalRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v4;

  return v10;
}

- (id)description
{
  FCDescription *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  v4 = -[FCTodayFeedConfigRequest feedType](self, "feedType");
  v5 = CFSTR("regular");
  if (v4 == 1)
    v5 = CFSTR("premium");
  if (v4 == 2)
    v6 = CFSTR("premium_lite");
  else
    v6 = v5;
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("feedType"), v6);
  -[FCTodayFeedConfigRequest forYouConfigID](self, "forYouConfigID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("forYouConfigID"), v7);

  -[FCTodayFeedConfigRequest formatVersion](self, "formatVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("formatVersion"), v8);

  -[FCTodayFeedConfigRequest additionalRecordIDs](self, "additionalRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("additionalRecordIDs"), v9);

  -[FCDescription descriptionString](v3, "descriptionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCTodayFeedConfigRequest feedType](self, "feedType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("feedType"));

  -[FCTodayFeedConfigRequest forYouConfigID](self, "forYouConfigID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("forYouConfigID"));

  -[FCTodayFeedConfigRequest formatVersion](self, "formatVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("formatVersion"));

  -[FCTodayFeedConfigRequest additionalRecordIDs](self, "additionalRecordIDs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("additionalRecordIDs"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalRecordIDs, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_forYouConfigID, 0);
}

@end
