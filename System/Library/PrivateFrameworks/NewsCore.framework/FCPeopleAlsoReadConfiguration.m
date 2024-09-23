@implementation FCPeopleAlsoReadConfiguration

- (FCPeopleAlsoReadConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCPeopleAlsoReadConfiguration *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCPeopleAlsoReadConfiguration;
  v5 = -[FCPeopleAlsoReadConfiguration init](&v10, sel_init);
  if (v5)
  {
    v5->_seedMaxCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("seedMaxCount"), 0);
    v5->_seedMaxAgeSeconds = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("seedMaxAgeSeconds"), 31536000);
    v5->_seedMaxIntervalSinceLastReadSeconds = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("seedMaxIntervalSinceLastReadSeconds"), 1209600);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateArticleListSuffix"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("base");
    objc_storeStrong((id *)&v5->_candidateArticleListSuffix, v8);

    v5->_candidateArticleListMaxCachedAgeSeconds = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("candidateArticleListMaxCachedAgeSeconds"), 7200);
    v5->_candidateMaxAgeSeconds = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("candidateMaxAgeSeconds"), 1209600);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateArticleListSuffix, 0);
}

- (FCPeopleAlsoReadConfiguration)init
{
  return -[FCPeopleAlsoReadConfiguration initWithDictionary:](self, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
}

- (id)candidateArticleListIDForSeedArticleID:(id)a3 storeFrontID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  -[FCPeopleAlsoReadConfiguration candidateArticleListSuffix](self, "candidateArticleListSuffix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), CFSTR("LX"), v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)seedMaxCount
{
  return self->_seedMaxCount;
}

- (int64_t)seedMaxAgeSeconds
{
  return self->_seedMaxAgeSeconds;
}

- (int64_t)seedMaxIntervalSinceLastReadSeconds
{
  return self->_seedMaxIntervalSinceLastReadSeconds;
}

- (NSString)candidateArticleListSuffix
{
  return self->_candidateArticleListSuffix;
}

- (int64_t)candidateArticleListMaxCachedAgeSeconds
{
  return self->_candidateArticleListMaxCachedAgeSeconds;
}

- (int64_t)candidateMaxAgeSeconds
{
  return self->_candidateMaxAgeSeconds;
}

@end
