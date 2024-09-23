@implementation FCFeedTransformationLowQualityContentFilter

+ (id)transformationWithPersonalizer:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFeedPersonalizer:", v3);

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v4 = a3;
  NewsCoreUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("personalization_disabled"));

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    -[FCFeedTransformationLowQualityContentFilter feedPersonalizer](self, "feedPersonalizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "limitItemsByMinimumItemQuality:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
