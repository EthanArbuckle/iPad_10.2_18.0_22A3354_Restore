@implementation SGSuggestedEventLaunchInfo

- (SGSuggestedEventLaunchInfo)initWithBundleId:(id)a3 localizedShowInString:(id)a4 userActivity:(id)a5 intent:(id)a6 sourceURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGSuggestedEventLaunchInfo *v18;
  SGSuggestedEventLaunchInfo *v19;
  uint64_t v20;
  NSString *userActivityString;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SGSuggestedEventLaunchInfo;
  v18 = -[SGSuggestedEventLaunchInfo init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bundleId, a3);
    objc_storeStrong((id *)&v19->_localizedShowInString, a4);
    objc_storeStrong((id *)&v19->_intent, a6);
    objc_storeStrong((id *)&v19->_sourceURL, a7);
    if (v15)
    {
      objc_msgSend(v15, "sg_serialize");
      v20 = objc_claimAutoreleasedReturnValue();
      userActivityString = v19->_userActivityString;
      v19->_userActivityString = (NSString *)v20;

    }
  }

  return v19;
}

- (SGSuggestedEventLaunchInfo)initWithCoder:(id)a3
{
  id v5;
  SGSuggestedEventLaunchInfo *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *bundleId;
  void *v11;
  void *v12;
  NSString *v13;
  void *localizedShowInString;
  void *v15;
  uint64_t v16;
  NSString *userActivityString;
  void *v18;
  uint64_t v19;
  INIntent *intent;
  void *v21;
  uint64_t v22;
  NSURL *sourceURL;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SGSuggestedEventLaunchInfo;
  v6 = -[SGSuggestedEventLaunchInfo init](&v25, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("bundleId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      bundleId = v6->_bundleId;
      v6->_bundleId = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      bundleId = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(bundleId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGSuggestedEventLaunchInfo.m"), 53, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "bundleId");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("localizedShowInString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      localizedShowInString = v6->_localizedShowInString;
      v6->_localizedShowInString = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      localizedShowInString = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(localizedShowInString, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGSuggestedEventLaunchInfo.m"), 54, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "localizedShowInString");
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("userActivityString"));
    v16 = objc_claimAutoreleasedReturnValue();
    userActivityString = v6->_userActivityString;
    v6->_userActivityString = (NSString *)v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v18, CFSTR("intent"));
    v19 = objc_claimAutoreleasedReturnValue();
    intent = v6->_intent;
    v6->_intent = (INIntent *)v19;

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v21, CFSTR("sourceURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    sourceURL = v6->_sourceURL;
    v6->_sourceURL = (NSURL *)v22;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleId;
  id v5;

  bundleId = self->_bundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedShowInString, CFSTR("localizedShowInString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userActivityString, CFSTR("userActivityString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intent, CFSTR("intent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("sourceURL"));

}

- (NSUserActivity)userActivity
{
  void *v2;

  if (self->_userActivityString)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityStrings:secondaryString:optionalData:", self->_userActivityString, 0, 0);
  else
    v2 = 0;
  return (NSUserActivity *)v2;
}

- (NSString)localizedShowInString
{
  return self->_localizedShowInString;
}

- (NSString)userActivityString
{
  return self->_userActivityString;
}

- (void)setUserActivityString:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityString, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_userActivityString, 0);
  objc_storeStrong((id *)&self->_localizedShowInString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
