@implementation FCFeedTransformationNoneSurfacedBy

+ (id)transformationWithTagIDs:(id)a3 feedContextByFeedID:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTagIDs:", v6);

  objc_msgSend(v7, "setFeedContextByFeedID:", v5);
  return v7;
}

- (id)transformFeedItems:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__FCFeedTransformationNoneSurfacedBy_transformFeedItems___block_invoke;
  v4[3] = &unk_1E463B468;
  v4[4] = self;
  objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __57__FCFeedTransformationNoneSurfacedBy_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "feedContextByFeedID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fc_safeObjectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "topicID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "tagIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topicID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", v7) & 1) != 0)
    {
      v10 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  objc_msgSend(v8, "channelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "tagIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "channelID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsObject:", v2) & 1) != 0)
    {
      v10 = 1;
LABEL_13:

      goto LABEL_14;
    }
    v20 = v12;
  }
  objc_msgSend(v8, "sectionID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(*(id *)(a1 + 32), "tagIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionID");
    v16 = v7;
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v15, "containsObject:", v18);

    v6 = v17;
    v7 = v16;

  }
  else
  {
    v10 = 0;
  }
  v12 = v20;
  if (v11)
    goto LABEL_13;
LABEL_14:
  if (v9)
    goto LABEL_15;
LABEL_16:

  return v10 == 0;
}

- (NSSet)tagIDs
{
  return self->_tagIDs;
}

- (void)setTagIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void)setFeedContextByFeedID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_tagIDs, 0);
}

@end
