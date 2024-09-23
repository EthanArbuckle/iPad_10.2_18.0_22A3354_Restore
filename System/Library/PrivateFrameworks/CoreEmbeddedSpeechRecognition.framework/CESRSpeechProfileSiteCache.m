@implementation CESRSpeechProfileSiteCache

- (CESRSpeechProfileSiteCache)initWithRootDirectoryURL:(id)a3 readOnly:(BOOL)a4
{
  id v7;
  CESRSpeechProfileSiteCache *v8;
  CESRSpeechProfileSiteCache *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CESRSpeechProfileSiteCache;
  v8 = -[CESRSpeechProfileSiteCache init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rootDirectoryURL, a3);
    v9->_readOnly = a4;
  }

  return v9;
}

- (id)speechProfileSiteWithUserId:(id)a3 error:(id *)a4
{
  id v6;
  CESRSpeechProfileSite *v7;
  void *v8;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_userExSpeechProfileSites, "objectForKey:", v6);
    v7 = (CESRSpeechProfileSite *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->_defaultSpeechProfileSite;
  }
  v8 = v7;
  if (!v7)
  {
    +[CESRSpeechProfileSite _speechProfileSiteAtRootDirectoryURL:userId:readOnly:error:](CESRSpeechProfileSite, "_speechProfileSiteAtRootDirectoryURL:userId:readOnly:error:", self->_rootDirectoryURL, v6, self->_readOnly, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CESRSpeechProfileSiteCache _cacheSpeechProfileSite:](self, "_cacheSpeechProfileSite:", v8);
  }

  return v8;
}

- (id)speechProfileSiteAtURL:(id)a3 error:(id *)a4
{
  id v6;
  CESRSpeechProfileSite *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CESRSpeechProfileSite isEquivalentSpeechProfileSiteURL:](self->_defaultSpeechProfileSite, "isEquivalentSpeechProfileSiteURL:", v6))
  {
    v7 = self->_defaultSpeechProfileSite;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary allValues](self->_userExSpeechProfileSites, "allValues", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEquivalentSpeechProfileSiteURL:", v6) & 1) != 0)
          {
            v7 = v13;

            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }

    +[CESRSpeechProfileSite _existingSpeechProfileSiteAtURL:readOnly:error:](CESRSpeechProfileSite, "_existingSpeechProfileSiteAtURL:readOnly:error:", v6, self->_readOnly, a4);
    v7 = (CESRSpeechProfileSite *)objc_claimAutoreleasedReturnValue();
    -[CESRSpeechProfileSiteCache _cacheSpeechProfileSite:](self, "_cacheSpeechProfileSite:", v7);
  }
LABEL_13:

  return v7;
}

- (BOOL)removeSpeechProfileSite:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  CESRSpeechProfileSite *defaultSpeechProfileSite;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "userId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_userExSpeechProfileSites, "removeObjectForKey:", v8);
    }
    else
    {
      defaultSpeechProfileSite = self->_defaultSpeechProfileSite;
      self->_defaultSpeechProfileSite = 0;

    }
    if (self->_readOnly)
      v9 = 1;
    else
      v9 = objc_msgSend(v7, "remove:", a4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)clear
{
  CESRSpeechProfileSite *defaultSpeechProfileSite;

  defaultSpeechProfileSite = self->_defaultSpeechProfileSite;
  self->_defaultSpeechProfileSite = 0;

  -[NSMutableDictionary removeAllObjects](self->_userExSpeechProfileSites, "removeAllObjects");
}

- (void)_cacheSpeechProfileSite:(id)a3
{
  id v5;
  void *v6;
  NSMutableDictionary *userExSpeechProfileSites;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v5 = a3;
  if (v5)
  {
    v10 = v5;
    objc_msgSend(v5, "userId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      userExSpeechProfileSites = self->_userExSpeechProfileSites;
      if (!userExSpeechProfileSites)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = self->_userExSpeechProfileSites;
        self->_userExSpeechProfileSites = v8;

        userExSpeechProfileSites = self->_userExSpeechProfileSites;
      }
      -[NSMutableDictionary setObject:forKey:](userExSpeechProfileSites, "setObject:forKey:", v10, v6);
    }
    else
    {
      objc_storeStrong((id *)&self->_defaultSpeechProfileSite, a3);
    }

    v5 = v10;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userExSpeechProfileSites, 0);
  objc_storeStrong((id *)&self->_defaultSpeechProfileSite, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

@end
