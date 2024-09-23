@implementation MPStoreItemMovieClip

- (MPStoreItemMovieClip)initWithLookupDictionary:(id)a3
{
  id v5;
  MPStoreItemMovieClip *v6;
  MPStoreItemMovieClip *v7;

  v5 = a3;
  v6 = -[MPStoreItemMovieClip init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lookupDictionary, a3);

  return v7;
}

- (NSArray)assets
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  MPStoreItemMovieClipAsset *v10;
  MPStoreItemMovieClipAsset *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("clipAssets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [MPStoreItemMovieClipAsset alloc];
            v11 = -[MPStoreItemMovieClipAsset initWithLookupDictionary:](v10, "initWithLookupDictionary:", v9, (_QWORD)v13);
            if (v11)
            {
              if (!v6)
                v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
              objc_msgSend(v6, "addObject:", v11);
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (MPStoreArtworkRequestToken)previewArtworkRequestToken
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("previewArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[MPStoreItemMetadata artworkRequestTokenForStorePlatformArtworkValue:](MPStoreItemMetadata, "artworkRequestTokenForStorePlatformArtworkValue:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (MPStoreArtworkRequestToken *)v3;
}

- (NSString)title
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_lookupDictionary, "objectForKey:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupDictionary, 0);
}

@end
