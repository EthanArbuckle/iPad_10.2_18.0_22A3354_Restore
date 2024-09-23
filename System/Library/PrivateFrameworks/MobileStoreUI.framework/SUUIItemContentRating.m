@implementation SUUIItemContentRating

- (SUUIItemContentRating)initWithContentRatingDictionary:(id)a3 systemName:(id)a4
{
  id v6;
  id v7;
  SUUIItemContentRating *v8;
  void *v9;
  uint64_t v10;
  NSArray *contentRatingAdvisories;
  void *v12;
  uint64_t v13;
  NSString *contentRatingName;
  void *v15;
  uint64_t v16;
  NSString *contentRank;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *contentRatingSystemName;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SUUIItemContentRating;
  v8 = -[SUUIItemContentRating init](&v23, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEB2790]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      contentRatingAdvisories = v8->_contentRatingAdvisories;
      v8->_contentRatingAdvisories = (NSArray *)v10;

    }
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEB27C0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      contentRatingName = v8->_contentRatingName;
      v8->_contentRatingName = (NSString *)v13;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("rank"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "stringValue");
      v16 = objc_claimAutoreleasedReturnValue();
      contentRank = v8->_contentRank;
      v8->_contentRank = (NSString *)v16;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("system"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v19 = v18;
    else
      v19 = v7;
    v20 = objc_msgSend(v19, "copy");
    contentRatingSystemName = v8->_contentRatingSystemName;
    v8->_contentRatingSystemName = (NSString *)v20;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{ system:%@ name:%@ rank:%@ advisories:%@ }"), self->_contentRatingSystemName, self->_contentRatingName, self->_contentRank, self->_contentRatingAdvisories);
}

- (NSString)contentRatingName
{
  return self->_contentRatingName;
}

- (NSArray)contentRatingAdvisories
{
  return self->_contentRatingAdvisories;
}

- (NSString)contentRatingSystemName
{
  return self->_contentRatingSystemName;
}

- (NSString)contentRank
{
  return self->_contentRank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRank, 0);
  objc_storeStrong((id *)&self->_contentRatingSystemName, 0);
  objc_storeStrong((id *)&self->_contentRatingName, 0);
  objc_storeStrong((id *)&self->_contentRatingAdvisories, 0);
}

@end
