@implementation FCFeedTransformationHideInAutoFavorites

+ (id)transformationWithFeedContextByFeedID:(id)a3 autoFavoriteTagIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFeedContextByFeedID:", v6);

  objc_msgSend(v7, "setAutoFavoriteTagIDs:", v5);
  return v7;
}

- (id)transformFeedItems:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__FCFeedTransformationHideInAutoFavorites_transformFeedItems___block_invoke;
  v4[3] = &unk_1E463B468;
  v4[4] = self;
  objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __62__FCFeedTransformationHideInAutoFavorites_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;

  v3 = a2;
  if (!objc_msgSend(v3, "isHiddenFromAutoFavorites"))
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "feedContextByFeedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safeObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "topicID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "channelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v3, "sourceFeedID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {

        goto LABEL_8;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "autoFavoriteTagIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) == 0)
  {
LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void)setFeedContextByFeedID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)autoFavoriteTagIDs
{
  return self->_autoFavoriteTagIDs;
}

- (void)setAutoFavoriteTagIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
}

@end
