@implementation AAUIServerSuppliedProfilePictureCacheEntry

- (void)setPicture:(id)a3
{
  UIImage *v4;
  void *v5;
  NSDate *v6;
  NSDate *expirationDate;
  UIImage *picture;

  v4 = (UIImage *)a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 3600.0);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v6;

  picture = self->_picture;
  self->_picture = v4;

}

- (BOOL)expired
{
  void *v3;
  BOOL v4;

  if (!self->_expirationDate)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", self->_expirationDate) == 1;

  return v4;
}

- (void)extendExpirationDate
{
  NSDate *v3;
  NSDate *expirationDate;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 3600.0);
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v3;

}

- (void)expire
{
  NSDate *expirationDate;

  expirationDate = self->_expirationDate;
  self->_expirationDate = 0;

}

- (id)description
{
  void *v3;
  UIImage *picture;
  NSString *serverCacheTag;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  picture = self->_picture;
  serverCacheTag = self->_serverCacheTag;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_updating);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AAUIServerSuppliedProfilePictureCacheEntry: %p picture %@ serverCacheTag %@ updating %@ _expirationDate %@ >"), self, picture, serverCacheTag, v6, self->_expirationDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIImage)picture
{
  return self->_picture;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void)setServerCacheTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_picture, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
