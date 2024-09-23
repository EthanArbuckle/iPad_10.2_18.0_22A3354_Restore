@implementation FCSingleTagFeedDescriptor

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 sortMethod:(int64_t)a5 filterOptions:(unint64_t)a6 personalizationConfigurationSet:(int64_t)a7 feedConfiguration:(unint64_t)a8
{
  return -[FCSingleTagFeedDescriptor initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet:feedConfiguration:referringFeedItemIdentifier:](self, "initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet:feedConfiguration:referringFeedItemIdentifier:", a3, a4, a5, a6, a7, a8, 0);
}

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 sortMethod:(int64_t)a5 filterOptions:(unint64_t)a6 personalizationConfigurationSet:(int64_t)a7 feedConfiguration:(unint64_t)a8 referringFeedItemIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  FCSingleTagFeedDescriptor *v19;
  uint64_t v20;
  FCTagProviding *tag;
  void **p_masterTag;
  uint64_t v23;
  NSString *referringFeedItemIdentifier;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v32;
  void *v33;
  int64_t v34;
  unint64_t v35;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a9;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
    *(_DWORD *)buf = 136315906;
    v38 = "-[FCSingleTagFeedDescriptor initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet:feedC"
          "onfiguration:referringFeedItemIdentifier:]";
    v39 = 2080;
    v40 = "FCSingleTagFeedDescriptor.m";
    v41 = 1024;
    v42 = 69;
    v43 = 2114;
    v44 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v16, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = self;
  v36.super_class = (Class)FCSingleTagFeedDescriptor;
  v19 = -[FCFeedDescriptor initWithIdentifier:](&v36, sel_initWithIdentifier_, v18);

  if (v19)
  {
    if (v16)
    {
      v34 = a7;
      v35 = a8;
      v20 = objc_msgSend(v16, "copy");
      tag = v19->_tag;
      v19->_tag = (FCTagProviding *)v20;

      p_masterTag = (void **)&v19->_masterTag;
      objc_storeStrong((id *)&v19->_masterTag, v19->_tag);
      v23 = objc_msgSend(v17, "copy");
      referringFeedItemIdentifier = v19->_referringFeedItemIdentifier;
      v19->_referringFeedItemIdentifier = (NSString *)v23;

      -[FCTagProviding asSection](v19->_tag, "asSection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(v15, "tagController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "parentID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "expectedFastCachedTagForID:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *p_masterTag;
        *p_masterTag = (void *)v28;

        if (!*p_masterTag && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to lookup parent channel in cache"));
          *(_DWORD *)buf = 136315906;
          v38 = "-[FCSingleTagFeedDescriptor initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet"
                ":feedConfiguration:referringFeedItemIdentifier:]";
          v39 = 2080;
          v40 = "FCSingleTagFeedDescriptor.m";
          v41 = 1024;
          v42 = 85;
          v43 = 2114;
          v44 = v33;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }
      v19->_feedSortMethod = a5;
      v19->_feedFilterOptions = a6;
      v19->_feedPersonalizationConfigurationSet = v34;
      v19->_feedConfiguration = v35;
      v30 = objc_msgSend(v16, "tagType");
      if (v30 <= 5)
        v19->_feedType = qword_1A1E82158[v30];
    }
    else
    {
      v25 = v19;
      v19 = 0;
    }

  }
  return v19;
}

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 feedConfiguration:(unint64_t)a5
{
  return -[FCSingleTagFeedDescriptor initWithContext:tag:feedConfiguration:referringFeedItemIdentifier:](self, "initWithContext:tag:feedConfiguration:referringFeedItemIdentifier:", a3, a4, a5, 0);
}

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 feedConfiguration:(unint64_t)a5 referringFeedItemIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  FCSingleTagFeedDescriptor *v27;
  unint64_t v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "asSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "tagController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "parentID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "expectedFastCachedTagForID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if ((objc_msgSend(v11, "isLocal") & 1) != 0 || objc_msgSend(v16, "isLocal"))
    v17 = 0x60000011ALL;
  else
    v17 = 0x20000011ALL;
  v18 = objc_msgSend(v11, "tagType");
  if ((unint64_t)(v18 - 2) < 2)
  {
    v19 = 0;
    v20 = 2;
  }
  else if ((unint64_t)(v18 - 4) >= 2)
  {
    if (v18 == 1)
    {
      v29 = a5;
      objc_msgSend(v10, "configurationManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "personalizationTreatment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "topicFeedFilterMutedTopics");
      v25 = v24;

      if (v25 == 0.0)
        v26 = 36;
      else
        v26 = 262180;
      v17 |= v26;
      v19 = 1;
      v20 = 3;
      a5 = v29;
    }
    else
    {
      v20 = 0;
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    v20 = 1;
  }
  v27 = -[FCSingleTagFeedDescriptor initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet:feedConfiguration:referringFeedItemIdentifier:](self, "initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet:feedConfiguration:referringFeedItemIdentifier:", v10, v11, v20, v17, v19, a5, v12);

  return v27;
}

- (FCSingleTagFeedDescriptor)initWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCSingleTagFeedDescriptor initWithIdentifier:]";
    v11 = 2080;
    v12 = "FCSingleTagFeedDescriptor.m";
    v13 = 1024;
    v14 = 196;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCSingleTagFeedDescriptor initWithIdentifier:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v13.receiver = self;
  v13.super_class = (Class)FCSingleTagFeedDescriptor;
  v7 = -[FCFeedDescriptor isEqual:](&v13, sel_isEqual_, v4);

  if (v7)
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToTag:", v9))
    {
      v10 = -[FCSingleTagFeedDescriptor feedConfiguration](self, "feedConfiguration");
      v11 = v10 == objc_msgSend(v6, "feedConfiguration");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)name
{
  void *v3;
  void *v4;

  if (-[FCSingleTagFeedDescriptor feedConfiguration](self, "feedConfiguration") == 1)
  {
    FCBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Home"), &stru_1E464BC40, 0);
  }
  else
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hideAccessoryText
{
  void *v2;
  char v3;

  -[FCSingleTagFeedDescriptor masterTag](self, "masterTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hideAccessoryText");

  return v3;
}

- (id)theme
{
  void *v2;
  void *v3;

  if (self->_masterTag)
    -[FCSingleTagFeedDescriptor masterTag](self, "masterTag");
  else
    -[FCSingleTagFeedDescriptor tag](self, "tag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSubscribable
{
  void *v2;
  char v3;

  -[FCSingleTagFeedDescriptor masterTag](self, "masterTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubscribable");

  return v3;
}

- (BOOL)isSubscribedToWithSubscriptionController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptionController");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCSingleTagFeedDescriptor isSubscribedToWithSubscriptionController:]";
    v12 = 2080;
    v13 = "FCSingleTagFeedDescriptor.m";
    v14 = 1024;
    v15 = 250;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCSingleTagFeedDescriptor masterTag](self, "masterTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasSubscriptionToTag:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasSubscriptionToTag:", v7);

  }
  return v6;
}

- (BOOL)hasNotificationsEnabledWithSubscriptionController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptionController");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCSingleTagFeedDescriptor hasNotificationsEnabledWithSubscriptionController:]";
    v12 = 2080;
    v13 = "FCSingleTagFeedDescriptor.m";
    v14 = 1024;
    v15 = 258;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCSingleTagFeedDescriptor masterTag](self, "masterTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasNotificationsEnabledForTag:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasNotificationsEnabledForTag:", v7);

  }
  return v6;
}

- (id)backingChannel
{
  void *v2;
  void *v3;

  -[FCSingleTagFeedDescriptor masterTag](self, "masterTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)backingChannelID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tagType");

  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 != 2)
    {
      v7 = 0;
      return v7;
    }
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)backingSectionID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tagType");

  if ((unint64_t)(v4 - 3) > 2)
  {
    v6 = 0;
  }
  else
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)backingTopicID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tagType");

  if (v4 == 1)
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)iAdCategories
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iAdCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)iAdKeywords
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iAdKeywords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (int64_t)iAdContentProvider
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tagType");

  if ((unint64_t)(v4 - 2) > 3)
    return 1;
  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contentProvider");

  return v6;
}

- (id)iAdPrimaryAudience
{
  void *v2;
  void *v3;

  -[FCSingleTagFeedDescriptor tag](self, "tag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAudience");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iAdFeedID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCSingleTagFeedDescriptor backingChannelID](self, "backingChannelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCSingleTagFeedDescriptor tag](self, "tag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (FCTagProviding)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (int64_t)feedSortMethod
{
  return self->_feedSortMethod;
}

- (unint64_t)feedFilterOptions
{
  return self->_feedFilterOptions;
}

- (int64_t)feedPersonalizationConfigurationSet
{
  return self->_feedPersonalizationConfigurationSet;
}

- (unint64_t)feedConfiguration
{
  return self->_feedConfiguration;
}

- (id)referringFeedItemIdentifier
{
  return self->_referringFeedItemIdentifier;
}

- (void)setReferringFeedItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (FCTagProviding)masterTag
{
  return self->_masterTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterTag, 0);
  objc_storeStrong((id *)&self->_referringFeedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
