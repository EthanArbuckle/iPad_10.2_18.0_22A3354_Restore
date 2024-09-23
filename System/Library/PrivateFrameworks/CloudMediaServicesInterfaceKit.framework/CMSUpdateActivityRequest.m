@implementation CMSUpdateActivityRequest

- (id)initForActivity:(id)a3 report:(unint64_t)a4 nowPlaying:(id)a5 previouslyPlaying:(id)a6
{
  id v11;
  id v12;
  id v13;
  CMSUpdateActivityRequest *v14;
  CMSUpdateActivityRequest *v15;
  uint64_t v16;
  NSDate *timestamp;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CMSUpdateActivityRequest;
  v14 = -[CMSUpdateActivityRequest init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userActivityDictionary, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    timestamp = v15->_timestamp;
    v15->_timestamp = (NSDate *)v16;

    v15->_report = a4;
    objc_storeStrong((id *)&v15->_nowPlaying, a5);
    objc_storeStrong((id *)&v15->_previouslyPlaying, a6);
  }

  return v15;
}

- (id)initForActivity:(id)a3 failure:(id)a4 whilePlaying:(id)a5
{
  id v9;
  id *v10;

  v9 = a4;
  if (self)
  {
    v10 = -[CMSUpdateActivityRequest initForActivity:report:nowPlaying:previouslyPlaying:](self, "initForActivity:report:nowPlaying:previouslyPlaying:", a3, 13, 0, a5);
    objc_storeStrong(v10 + 8, a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)cmsCoded
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CMSCloudExtensionSpecVersion();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  objc_msgSend(v3, "cmsSetOptionalCodedObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  CMSActivityReportTypeToString(self->_report);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("report"));

  objc_msgSend(v3, "cmsSetOptionalCodedObject:forKey:", self->_nowPlaying, CFSTR("nowPlaying"));
  objc_msgSend(v3, "cmsSetOptionalCodedObject:forKey:", self->_previouslyPlaying, CFSTR("previouslyPlaying"));
  objc_msgSend(v3, "cmsSetOptionalCodedObject:forKey:", self->_contentFailure, CFSTR("contentFailure"));
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", self->_constraints, CFSTR("constraints"));
  objc_msgSend(v3, "cmsSetNullableObject:forKey:", self->_userActivityDictionary, CFSTR("userActivity"));
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CMSUpdateActivityRequest cmsCoded](self, "cmsCoded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSDictionary)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSDictionary)userActivityDictionary
{
  return self->_userActivityDictionary;
}

- (void)setUserActivityDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityDictionary, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (unint64_t)report
{
  return self->_report;
}

- (void)setReport:(unint64_t)a3
{
  self->_report = a3;
}

- (CMSPlayerContext)nowPlaying
{
  return self->_nowPlaying;
}

- (void)setNowPlaying:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlaying, a3);
}

- (CMSPlayerContext)previouslyPlaying
{
  return self->_previouslyPlaying;
}

- (void)setPreviouslyPlaying:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyPlaying, a3);
}

- (CMSContentFailure)contentFailure
{
  return self->_contentFailure;
}

- (void)setContentFailure:(id)a3
{
  objc_storeStrong((id *)&self->_contentFailure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFailure, 0);
  objc_storeStrong((id *)&self->_previouslyPlaying, 0);
  objc_storeStrong((id *)&self->_nowPlaying, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userActivityDictionary, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
