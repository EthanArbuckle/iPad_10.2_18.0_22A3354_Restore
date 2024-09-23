@implementation CMSContentFailureRequest

- (CMSContentFailureRequest)initWithContentFailure:(id)a3 whilePlaying:(id)a4 previousContentURL:(id)a5 nextContentURL:(id)a6 userActivityDictionary:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CMSContentFailureRequest *v17;
  CMSContentFailureRequest *v18;
  uint64_t v19;
  NSDate *timestamp;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CMSContentFailureRequest;
  v17 = -[CMSContentFailureRequest init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentFailure, a3);
    objc_storeStrong((id *)&v18->_whilePlaying, a4);
    objc_storeStrong((id *)&v18->_previousContentURL, a5);
    objc_storeStrong((id *)&v18->_nextContentURL, a6);
    objc_storeStrong((id *)&v18->_userActivityDictionary, a7);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = objc_claimAutoreleasedReturnValue();
    timestamp = v18->_timestamp;
    v18->_timestamp = (NSDate *)v19;

  }
  return v18;
}

- (id)cmsCoded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CMSCloudExtensionSpecVersion();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  -[CMSContentFailure cmsCoded](self->_contentFailure, "cmsCoded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("contentFailure"));

  objc_msgSend(v3, "cmsSetOptionalCodedObject:forKey:", self->_whilePlaying, CFSTR("whilePlaying"));
  -[NSURL absoluteString](self->_previousContentURL, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cmsSetNullableObject:forKey:", v6, CFSTR("previousContentUrl"));

  -[NSURL absoluteString](self->_nextContentURL, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cmsSetNullableObject:forKey:", v7, CFSTR("nextContentUrl"));

  -[NSDate cmsCoded](self->_timestamp, "cmsCoded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

  objc_msgSend(v3, "cmsSetNullableObject:forKey:", self->_userActivityDictionary, CFSTR("userActivity"));
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", self->_constraints, CFSTR("constraints"));
  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CMSContentFailureRequest cmsCoded](self, "cmsCoded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CMSContentFailure)contentFailure
{
  return self->_contentFailure;
}

- (void)setContentFailure:(id)a3
{
  objc_storeStrong((id *)&self->_contentFailure, a3);
}

- (CMSPlayerContext)whilePlaying
{
  return self->_whilePlaying;
}

- (void)setWhilePlaying:(id)a3
{
  objc_storeStrong((id *)&self->_whilePlaying, a3);
}

- (NSURL)previousContentURL
{
  return self->_previousContentURL;
}

- (void)setPreviousContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_previousContentURL, a3);
}

- (NSURL)nextContentURL
{
  return self->_nextContentURL;
}

- (void)setNextContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_nextContentURL, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userActivityDictionary, 0);
  objc_storeStrong((id *)&self->_nextContentURL, 0);
  objc_storeStrong((id *)&self->_previousContentURL, 0);
  objc_storeStrong((id *)&self->_whilePlaying, 0);
  objc_storeStrong((id *)&self->_contentFailure, 0);
}

@end
