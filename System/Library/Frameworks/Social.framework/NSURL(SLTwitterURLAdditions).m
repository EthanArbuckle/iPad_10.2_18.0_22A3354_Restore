@implementation NSURL(SLTwitterURLAdditions)

+ (uint64_t)SLTwitterUpdateStatusURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/statuses/update.json"));
}

+ (uint64_t)SLTwitterUpdateMultiPartStatusURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/statuses/update_with_media.json"));
}

+ (uint64_t)SLTwitterNearbyPlacesURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/geo/search.json"));
}

+ (uint64_t)SLTwitterFriendshipsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/friendships/show.json"));
}

+ (uint64_t)SLTwitterFriendsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/friends/ids.json"));
}

+ (uint64_t)SLTwitterTCoLengthURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/help/configuration.json"));
}

+ (uint64_t)SLTwitterImageLimitsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/help/configuration.json"));
}

+ (uint64_t)SLTwitterVerifyCredentialsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/account/verify_credentials.json"));
}

+ (uint64_t)SLTwitterCleanupPushDestinationsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/account/push_destinations/cleanup.json"));
}

+ (uint64_t)SLTwitterRequestTokenURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/oauth/request_token"));
}

+ (uint64_t)SLTwitterAccessTokenURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/oauth/access_token"));
}

+ (uint64_t)SLTwitterUserInfoURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/users/show.json"));
}

+ (uint64_t)SLTwitterAccountSettingsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/account/settings.json"));
}

+ (uint64_t)SLTwitterUsersLookupURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/users/lookup.json"));
}

+ (uint64_t)SLTwitterAccountGenerateURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1/account/generate.json"));
}

+ (id)SLTwitterRetweetURLForTweetID:()SLTwitterURLAdditions
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://api.twitter.com/1.1/statuses/retweet/%@.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)SLTwitterDirectMessageURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://api.twitter.com/1.1/direct_messages/new.json"));
}

@end
