@implementation AMSLookupItem

- (AMSLookupItem)initWithLookupDictionary:(id)a3
{
  id v5;
  AMSLookupItem *v6;
  AMSLookupItem *v7;
  AMSLookupItem *v8;
  objc_super v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)AMSLookupItem;
    v6 = -[AMSLookupItem init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_itemDictionary, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)artistName
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("artistName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSArray)artwork
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AMSLookupItemArtwork *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("artwork"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
    else
      v5 = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = -[AMSLookupItemArtwork initWithArtworkDictionary:]([AMSLookupItemArtwork alloc], "initWithArtworkDictionary:", v11);
          if (v12)
            objc_msgSend(v3, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("bundleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSArray)categoryNames
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("genreNames"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;

  return (NSArray *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;

  return (NSString *)v3;
}

- (BOOL)isPOIBased
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("poiBased"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)itemKind
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSNumber)iTunesStoreIdentifier
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSNumber *)v5;
}

- (int64_t)numberOfUserRatings
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("userRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ratingCount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)numberOfUserRatingsForCurrentVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("userRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ratingCountCurrentVersion"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (NSString)offerName
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("offerName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSArray)offers
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AMSLookupItemOffer *v11;
  AMSLookupItemOffer *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("offers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = [AMSLookupItemOffer alloc];
            v12 = -[AMSLookupItemOffer initWithLookupDictionary:](v11, "initWithLookupDictionary:", v10, (_QWORD)v14);
            if (v12)
              objc_msgSend(v3, "addObject:", v12);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return (NSArray *)v3;
}

- (NSURL)productPageURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (float)userRating
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("userRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("value"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "floatValue");
    v4 = v5;
  }

  return v4;
}

- (float)userRatingForCurrentVersion
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("userRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("valueCurrentVersion"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "floatValue");
    v4 = v5;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSDictionary copy](self->_itemDictionary, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSLookupItem)initWithCoder:(id)a3
{
  id v4;
  AMSLookupItem *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *itemDictionary;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSLookupItem;
  v5 = -[AMSLookupItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("AMSEncodingDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    itemDictionary = v5->_itemDictionary;
    v5->_itemDictionary = (NSDictionary *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_itemDictionary, CFSTR("AMSEncodingDictionary"));
}

- (NSDictionary)itemDictionary
{
  return self->_itemDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemDictionary, 0);
}

@end
