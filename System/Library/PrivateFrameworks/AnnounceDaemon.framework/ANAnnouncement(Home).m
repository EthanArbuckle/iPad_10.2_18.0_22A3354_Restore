@implementation ANAnnouncement(Home)

- (id)announcerNameInHome:()Home
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "announcer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameInHome:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)uniqueAnnouncersInAnnouncements:()Home
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "announcer", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "containsObject:", v10))
            objc_msgSend(v4, "removeObject:", v10);
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

@end
