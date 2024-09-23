@implementation NSError

- (BOOL)isVettedToSelfError
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v4 = objc_msgSend(v3, "isEqualToString:", CKErrorDomain);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v7 = objc_msgSend(v6, "code") == (id)8007;
  return v7;
}

- (BOOL)isAuthenticationUserCancelled
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v4 = objc_msgSend(v3, "isEqualToString:", CKErrorDomain);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  if (objc_msgSend(v6, "code") == (id)8011 || objc_msgSend(v6, "code") == (id)2012)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v9 = objc_msgSend(v8, "code") == (id)-7003;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
