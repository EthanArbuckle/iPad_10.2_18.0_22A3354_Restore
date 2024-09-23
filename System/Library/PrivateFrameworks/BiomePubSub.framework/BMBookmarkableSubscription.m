@implementation BMBookmarkableSubscription

- (void)cancel
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Override method %@ in subclass %@"), v4, objc_opt_class());

}

- (void)requestDemand:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Override method %@ in subclass %@"), v5, objc_opt_class());

}

- (id)upstreamSubscriptions
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Override method %@ in subclass %@"), v4, objc_opt_class());

  return 0;
}

- (id)newBookmark
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  BMBookmarkNode *v13;
  objc_class *v14;
  void *v15;
  BMBookmarkNode *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[BMBookmarkableSubscription upstreamSubscriptions](self, "upstreamSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EEAF3EE8) & 1) != 0)
        {
          v10 = objc_msgSend(v9, "newBookmark");
          if (v10)
            goto LABEL_13;
        }
        else
        {
          __biome_log_for_category();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v9;
            _os_log_error_impl(&dword_1A956A000, v11, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v12 = (void *)v10;
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  v13 = [BMBookmarkNode alloc];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BMBookmarkNode initWithValue:upstreams:name:](v13, "initWithValue:upstreams:name:", 0, v3, v15);

  return v16;
}

@end
