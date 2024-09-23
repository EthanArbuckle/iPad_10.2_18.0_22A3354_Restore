@implementation _SFRecentWebSearchesController

+ (unint64_t)_maximumNumberOfSearchesToTrack
{
  return 20;
}

- (void)_saveRecentSearchDictionaries:(id)a3 toUserDefaultsUsingKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, v5);

}

- (id)_recentSearchDictionariesFromUserDefaultsUsingKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
