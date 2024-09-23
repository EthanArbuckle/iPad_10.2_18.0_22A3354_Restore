@implementation FCChannelMembership

- (FCChannelMembership)initWithRecord:(id)a3 interestToken:(id)a4
{
  id v7;
  id v8;
  FCChannelMembership *v9;
  FCChannelMembership *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCChannelMembership;
  v9 = -[FCChannelMembership init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_interestToken, a4);
  }

  return v10;
}

- (NSString)channelID
{
  void *v2;
  void *v3;

  -[FCChannelMembership record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isAllowedToSeeDrafts
{
  void *v2;
  char v3;

  -[FCChannelMembership record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canAccessDrafts");

  return v3;
}

- (NSString)draftArticleListID
{
  void *v2;
  void *v3;

  -[FCChannelMembership record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draftArticleListID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)draftIssueListID
{
  void *v2;
  void *v3;

  -[FCChannelMembership record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draftIssueListID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "channelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCChannelMembership channelID](self, "channelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7)
      && (v8 = objc_msgSend(v5, "isAllowedToSeeDrafts"),
          v8 == -[FCChannelMembership isAllowedToSeeDrafts](self, "isAllowedToSeeDrafts")))
    {
      objc_msgSend(v5, "draftArticleListID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCChannelMembership draftArticleListID](self, "draftArticleListID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v11))
      {
        objc_msgSend(v5, "draftIssueListID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCChannelMembership draftIssueListID](self, "draftIssueListID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v12, "isEqualToString:", v13);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCChannelMembership record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NTPBChannelMembershipRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
  objc_storeStrong((id *)&self->_interestToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
