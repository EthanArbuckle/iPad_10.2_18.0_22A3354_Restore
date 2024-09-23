@implementation SUUIFacebookLikeStatus

- (SUUIFacebookLikeStatus)initWithURL:(id)a3 likeStatusDictionary:(id)a4
{
  id v6;
  id v7;
  SUUIFacebookLikeStatus *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *friends;
  uint64_t v22;
  NSURL *url;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SUUIFacebookLikeStatus;
  v8 = -[SUUIFacebookLikeStatus init](&v30, sel_init);
  if (v8)
  {
    v9 = (void *)SUUISocialFramework();
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)SUUIWeakLinkedSymbolForString("SLFacebookLikeInfoMeKey", v9));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8->_userLiked = objc_msgSend(v10, "BOOLValue");
    v11 = (void *)SUUISocialFramework();
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)SUUIWeakLinkedSymbolForString("SLFacebookLikeInfoFriendsKey", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v6;
      v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v27;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v13, "addObject:", v19);
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v16);
      }

      v20 = objc_msgSend(v13, "copy");
      friends = v8->_friends;
      v8->_friends = (NSArray *)v20;

      v6 = v25;
    }
    v22 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v22;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSArray copyWithZone:](self->_friends, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  *(_BYTE *)(v5 + 24) = self->_userLiked;
  return (id)v5;
}

- (NSArray)friendNames
{
  return self->_friends;
}

- (void)setFriendNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isUserLiked
{
  return self->_userLiked;
}

- (void)setUserLiked:(BOOL)a3
{
  self->_userLiked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_friends, 0);
}

@end
