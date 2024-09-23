@implementation BRCSideCarInfo

- (id)descriptionWithContext:(id)a3
{
  void *v4;
  BRFieldCKInfo *ckInfo;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  ckInfo = self->_ckInfo;
  if (ckInfo)
  {
    -[BRFieldCKInfo etag](ckInfo, "etag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" etag:%@"), v6);

  }
  if (self->_favoriteRank)
    objc_msgSend(v4, "appendFormat:", CFSTR(" fav:%lld"), self->_favoriteRank);
  if (self->_lastUsedTime)
    objc_msgSend(v4, "appendFormat:", CFSTR(" lu:%lld"), self->_lastUsedTime);
  if (self->_finderTags)
    objc_msgSend(v4, "appendFormat:", CFSTR(" has-finder-tags"));
  return v4;
}

- (id)description
{
  return -[BRCSideCarInfo descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BRFieldCKInfo etag](self->_ckInfo, "etag");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_finderTags)
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p {etag : %@; fr: %lld; lu : %lld; ft: %s}>"),
    v4,
    self,
    v5,
    self->_favoriteRank,
    self->_lastUsedTime,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasfieldsToSync
{
  return self->_favoriteRank || self->_lastUsedTime || self->_finderTags != 0;
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (void)setCkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_ckInfo, a3);
}

- (int64_t)favoriteRank
{
  return self->_favoriteRank;
}

- (void)setFavoriteRank:(int64_t)a3
{
  self->_favoriteRank = a3;
}

- (int64_t)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(int64_t)a3
{
  self->_lastUsedTime = a3;
}

- (NSData)finderTags
{
  return self->_finderTags;
}

- (void)setFinderTags:(id)a3
{
  objc_storeStrong((id *)&self->_finderTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finderTags, 0);
  objc_storeStrong((id *)&self->_ckInfo, 0);
}

@end
