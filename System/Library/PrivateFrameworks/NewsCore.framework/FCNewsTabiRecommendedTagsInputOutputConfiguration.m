@implementation FCNewsTabiRecommendedTagsInputOutputConfiguration

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)init
{
  return -[FCNewsTabiRecommendedTagsInputOutputConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)initWithDictionary:(id)a3
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
  id v13;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v14;
  id *p_isa;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v16;
  objc_super v18;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("contextFeatureKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("recommendationsOutputName"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("recommendationsScoreOutputName"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
        v18.receiver = self;
        v18.super_class = (Class)FCNewsTabiRecommendedTagsInputOutputConfiguration;
        v14 = -[FCNewsTabiRecommendedTagsInputOutputConfiguration init](&v18, sel_init);
        p_isa = (id *)&v14->super.isa;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_contextFeatureKey, v6);
          objc_storeStrong(p_isa + 2, v9);
          objc_storeStrong(p_isa + 3, v12);
        }
        self = p_isa;

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

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiRecommendedTagsInputOutputConfiguration contextFeatureKey](self, "contextFeatureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcontextFeatureKey: %@;"), v4);

  -[FCNewsTabiRecommendedTagsInputOutputConfiguration recommendationsOutputName](self, "recommendationsOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendationsOutputName: %@;"), v5);

  -[FCNewsTabiRecommendedTagsInputOutputConfiguration recommendationsScoreOutputName](self, "recommendationsScoreOutputName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendationsScoreOutputName: %@;"), v6);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)contextFeatureKey
{
  return self->_contextFeatureKey;
}

- (void)setContextFeatureKey:(id)a3
{
  objc_storeStrong((id *)&self->_contextFeatureKey, a3);
}

- (NSString)recommendationsOutputName
{
  return self->_recommendationsOutputName;
}

- (void)setRecommendationsOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationsOutputName, a3);
}

- (NSString)recommendationsScoreOutputName
{
  return self->_recommendationsScoreOutputName;
}

- (void)setRecommendationsScoreOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationsScoreOutputName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationsScoreOutputName, 0);
  objc_storeStrong((id *)&self->_recommendationsOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

@end
