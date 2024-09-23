@implementation FCPersonalizationUserProfile

- (FCPersonalizationUserProfile)initWithSubscribedTagIDs:(id)a3 mutedTagIDs:(id)a4 autofavoritedTagIDs:(id)a5 purchasedTagIDs:(id)a6 readArticleIDs:(id)a7 listenedArticleIDs:(id)a8 seenArticleIDs:(id)a9 bundleSubscription:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  FCPersonalizationUserProfile *v24;
  uint64_t v25;
  NSSet *subscribedTagIDs;
  uint64_t v27;
  NSSet *mutedTagIDs;
  uint64_t v29;
  NSSet *autofavoritedTagIDs;
  uint64_t v31;
  NSSet *purchasedTagIDs;
  uint64_t v33;
  NSSet *readArticleIDs;
  uint64_t v35;
  NSSet *listenedArticleIDs;
  uint64_t v37;
  NSSet *seenArticleIDs;
  objc_super v40;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)FCPersonalizationUserProfile;
  v24 = -[FCPersonalizationUserProfile init](&v40, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    subscribedTagIDs = v24->_subscribedTagIDs;
    v24->_subscribedTagIDs = (NSSet *)v25;

    v27 = objc_msgSend(v17, "copy");
    mutedTagIDs = v24->_mutedTagIDs;
    v24->_mutedTagIDs = (NSSet *)v27;

    v29 = objc_msgSend(v18, "copy");
    autofavoritedTagIDs = v24->_autofavoritedTagIDs;
    v24->_autofavoritedTagIDs = (NSSet *)v29;

    v31 = objc_msgSend(v19, "copy");
    purchasedTagIDs = v24->_purchasedTagIDs;
    v24->_purchasedTagIDs = (NSSet *)v31;

    v33 = objc_msgSend(v20, "copy");
    readArticleIDs = v24->_readArticleIDs;
    v24->_readArticleIDs = (NSSet *)v33;

    v35 = objc_msgSend(v21, "copy");
    listenedArticleIDs = v24->_listenedArticleIDs;
    v24->_listenedArticleIDs = (NSSet *)v35;

    v37 = objc_msgSend(v22, "copy");
    seenArticleIDs = v24->_seenArticleIDs;
    v24->_seenArticleIDs = (NSSet *)v37;

    objc_storeStrong((id *)&v24->_bundleSubscription, a10);
  }

  return v24;
}

- (FCPersonalizationUserProfile)initWithSubscribedTagIDs:(id)a3 mutedTagIDs:(id)a4 autofavoritedTagIDs:(id)a5 purchasedTagIDs:(id)a6 bundleSubscription:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  FCPersonalizationUserProfile *v21;

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[FCPersonalizationUserProfile initWithSubscribedTagIDs:mutedTagIDs:autofavoritedTagIDs:purchasedTagIDs:readArticleIDs:listenedArticleIDs:seenArticleIDs:bundleSubscription:](self, "initWithSubscribedTagIDs:mutedTagIDs:autofavoritedTagIDs:purchasedTagIDs:readArticleIDs:listenedArticleIDs:seenArticleIDs:bundleSubscription:", v17, v16, v15, v14, v18, v19, v20, v13);

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationUserProfile)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FCPersonalizationUserProfile *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscribedTagIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mutedTagIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autofavoritedTagIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchasedTagIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readArticleIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listenedArticleIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seenArticleIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleSubscription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[FCPersonalizationUserProfile initWithSubscribedTagIDs:mutedTagIDs:autofavoritedTagIDs:purchasedTagIDs:readArticleIDs:listenedArticleIDs:seenArticleIDs:bundleSubscription:](self, "initWithSubscribedTagIDs:mutedTagIDs:autofavoritedTagIDs:purchasedTagIDs:readArticleIDs:listenedArticleIDs:seenArticleIDs:bundleSubscription:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[FCPersonalizationUserProfile subscribedTagIDs](self, "subscribedTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subscribedTagIDs"));

  -[FCPersonalizationUserProfile mutedTagIDs](self, "mutedTagIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mutedTagIDs"));

  -[FCPersonalizationUserProfile autofavoritedTagIDs](self, "autofavoritedTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("autofavoritedTagIDs"));

  -[FCPersonalizationUserProfile purchasedTagIDs](self, "purchasedTagIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("purchasedTagIDs"));

  -[FCPersonalizationUserProfile readArticleIDs](self, "readArticleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("readArticleIDs"));

  -[FCPersonalizationUserProfile listenedArticleIDs](self, "listenedArticleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("listenedArticleIDs"));

  -[FCPersonalizationUserProfile seenArticleIDs](self, "seenArticleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("seenArticleIDs"));

  -[FCPersonalizationUserProfile bundleSubscription](self, "bundleSubscription");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("bundleSubscription"));

}

- (NSSet)subscribedTagIDs
{
  return self->_subscribedTagIDs;
}

- (NSSet)mutedTagIDs
{
  return self->_mutedTagIDs;
}

- (NSSet)autofavoritedTagIDs
{
  return self->_autofavoritedTagIDs;
}

- (NSSet)purchasedTagIDs
{
  return self->_purchasedTagIDs;
}

- (NSSet)readArticleIDs
{
  return self->_readArticleIDs;
}

- (NSSet)listenedArticleIDs
{
  return self->_listenedArticleIDs;
}

- (NSSet)seenArticleIDs
{
  return self->_seenArticleIDs;
}

- (FCBundleSubscription)bundleSubscription
{
  return self->_bundleSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleSubscription, 0);
  objc_storeStrong((id *)&self->_seenArticleIDs, 0);
  objc_storeStrong((id *)&self->_listenedArticleIDs, 0);
  objc_storeStrong((id *)&self->_readArticleIDs, 0);
  objc_storeStrong((id *)&self->_purchasedTagIDs, 0);
  objc_storeStrong((id *)&self->_autofavoritedTagIDs, 0);
  objc_storeStrong((id *)&self->_mutedTagIDs, 0);
  objc_storeStrong((id *)&self->_subscribedTagIDs, 0);
}

@end
