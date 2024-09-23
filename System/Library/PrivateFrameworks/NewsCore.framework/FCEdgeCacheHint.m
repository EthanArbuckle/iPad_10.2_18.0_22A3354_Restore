@implementation FCEdgeCacheHint

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)cacheControlKey
{
  return self->_cacheControlKey;
}

+ (id)edgeCacheHintForForYouConfig
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("foryouconfig"));
}

+ (id)edgeCacheHintForPurchaseLookup
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("purchaselookup"));
}

- (FCEdgeCacheHint)initWithGroupName:(id)a3 cacheControlKey:(id)a4
{
  id v6;
  id v7;
  FCEdgeCacheHint *v8;
  uint64_t v9;
  NSString *groupName;
  uint64_t v11;
  NSString *cacheControlKey;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCEdgeCacheHint;
  v8 = -[FCEdgeCacheHint init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    groupName = v8->_groupName;
    v8->_groupName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    cacheControlKey = v8->_cacheControlKey;
    v8->_cacheControlKey = (NSString *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheControlKey, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

+ (id)edgeCacheHintForTopStories
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("topstories"));
}

+ (id)edgeCacheHintForTrending
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("trending"));
}

+ (id)edgeCacheHintForEditorial
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("editorial"));
}

+ (id)edgeCacheHintForToday
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("today"));
}

+ (id)edgeCacheHintForFeaturedArticles
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("featuredarticles"));
}

+ (id)edgeCacheHintForCurrentIssues
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("currentissues"));
}

+ (id)edgeCacheHintForCurrentIssueArticles
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("currentissuearticles"));
}

+ (id)edgeCacheHintForSpotlight
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("spotlight"));
}

+ (id)edgeCacheHintForMagazineContent
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("magazinecontent"));
}

+ (id)edgeCacheHintForAudioContent
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("audiocontent"));
}

+ (id)edgeCacheHintForLocalNews
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("localnews"));
}

+ (id)edgeCacheHintForEvergreenArticles
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("evergreenarticles"));
}

+ (id)edgeCacheHintForSportsArticles
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupName:cacheControlKey:", CFSTR("news"), CFSTR("sportsarticles"));
}

@end
