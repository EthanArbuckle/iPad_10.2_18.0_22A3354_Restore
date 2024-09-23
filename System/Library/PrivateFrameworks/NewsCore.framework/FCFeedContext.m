@implementation FCFeedContext

+ (id)feedContextForTag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "asChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asTopic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setChannelID:", v8);

    objc_msgSend(v5, "defaultSectionID");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v9;
    objc_msgSend(v4, "setSectionID:", v9);
    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(v6, "parentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setChannelID:", v10);

    objc_msgSend(v6, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v7)
    goto LABEL_7;
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopicID:", v11);
LABEL_6:

LABEL_7:
  return v4;
}

+ (id)feedContextForTopStoriesTag:(id)a3
{
  void *v3;

  objc_msgSend(a1, "feedContextForTag:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsTopStories:", 1);
  return v3;
}

+ (id)feedContextForEditorialTag:(id)a3
{
  void *v3;

  objc_msgSend(a1, "feedContextForTag:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsEditorial:", 1);
  return v3;
}

+ (id)feedContextForChannel:(id)a3 sectionID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setChannelID:", v8);
  objc_msgSend(v7, "setSectionID:", v5);

  return v7;
}

+ (id)feedContextForTopStoriesChannel:(id)a3 sectionID:(id)a4
{
  void *v4;

  objc_msgSend(a1, "feedContextForChannel:sectionID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsTopStories:", 1);
  return v4;
}

+ (id)feedContextForEditorialChannel:(id)a3 sectionID:(id)a4
{
  void *v4;

  objc_msgSend(a1, "feedContextForChannel:sectionID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsEditorial:", 1);
  return v4;
}

+ (id)feedContextForEditorialChannel:(id)a3 editorialGemsSectionID:(id)a4
{
  void *v4;

  objc_msgSend(a1, "feedContextForChannel:sectionID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsEditorialGems:", 1);
  return v4;
}

+ (id)feedContextForBreakingNewsChannelID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setChannelID:", v3);

  return v4;
}

+ (id)feedContextForCoverArticlesFeed
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIsCoverArticles:", 1);
  return v2;
}

+ (id)feedContextForHiddenFeed
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIsHiddenFeed:", 1);
  return v2;
}

+ (id)feedContextForPaidBundleFeed
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIsPaidBundleFeed:", 1);
  return v2;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)topicID
{
  return self->_topicID;
}

- (void)setTopicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isHiddenFeed
{
  return self->_isHiddenFeed;
}

- (void)setIsHiddenFeed:(BOOL)a3
{
  self->_isHiddenFeed = a3;
}

- (BOOL)isPaidBundleFeed
{
  return self->_isPaidBundleFeed;
}

- (void)setIsPaidBundleFeed:(BOOL)a3
{
  self->_isPaidBundleFeed = a3;
}

- (BOOL)isTopStories
{
  return self->_isTopStories;
}

- (void)setIsTopStories:(BOOL)a3
{
  self->_isTopStories = a3;
}

- (BOOL)isEditorial
{
  return self->_isEditorial;
}

- (void)setIsEditorial:(BOOL)a3
{
  self->_isEditorial = a3;
}

- (BOOL)isEditorialGems
{
  return self->_isEditorialGems;
}

- (void)setIsEditorialGems:(BOOL)a3
{
  self->_isEditorialGems = a3;
}

- (BOOL)isCoverArticles
{
  return self->_isCoverArticles;
}

- (void)setIsCoverArticles:(BOOL)a3
{
  self->_isCoverArticles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
