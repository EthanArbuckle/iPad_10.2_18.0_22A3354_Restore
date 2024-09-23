@implementation _EMUnsubscribeInfo

- (_EMUnsubscribeInfo)initWithHeaders:(id)a3
{
  id v3;
  _EMUnsubscribeInfo *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_EMUnsubscribeInfo *)objc_opt_new();
  objc_msgSend(v3, "listUnsubscribePostContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMUnsubscribeInfo setPostContent:]((uint64_t)v4, v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "listUnsubscribeCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "ef_hasScheme:", CFSTR("mailto")))
        {
          -[_EMUnsubscribeInfo setMailtoURL:]((uint64_t)v4, v10);
        }
        else if (objc_msgSend(v10, "ef_hasScheme:", CFSTR("https")))
        {
          -[_EMUnsubscribeInfo setPostURL:]((uint64_t)v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setPostContent:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setMailtoURL:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setPostURL:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postContent, 0);
  objc_storeStrong((id *)&self->_postURL, 0);
  objc_storeStrong((id *)&self->_mailtoURL, 0);
}

@end
