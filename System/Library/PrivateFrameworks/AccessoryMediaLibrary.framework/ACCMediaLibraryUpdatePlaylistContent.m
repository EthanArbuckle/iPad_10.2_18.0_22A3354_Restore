@implementation ACCMediaLibraryUpdatePlaylistContent

- (ACCMediaLibraryUpdatePlaylistContent)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9;
  id v10;
  ACCMediaLibraryUpdatePlaylistContent *v11;
  ACCMediaLibraryUpdatePlaylistContent *v12;
  NSMutableArray *contentList;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACCMediaLibraryUpdatePlaylistContent;
  v11 = -[ACCMediaLibraryUpdatePlaylistContent init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_contentStyle = 0;
    contentList = v12->_contentList;
    v12->_persistentID = a4;
    v12->_contentList = 0;

  }
  return v12;
}

- (ACCMediaLibraryUpdatePlaylistContent)initWithMediaLibrary:(id)a3 revision:(id)a4 dict:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACCMediaLibraryUpdatePlaylistContent *v12;
  ACCMediaLibraryUpdatePlaylistContent *v13;
  NSMutableArray *contentList;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *v22;
  int contentStyle;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  uint64_t v30;
  uint64_t v31;
  ACCMediaLibraryUpdatePlaylistContentItem *v32;
  uint64_t v33;
  uint64_t v34;
  ACCMediaLibraryUpdatePlaylistContentItem *v35;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v47.receiver = self;
  v47.super_class = (Class)ACCMediaLibraryUpdatePlaylistContent;
  v12 = -[ACCMediaLibraryUpdatePlaylistContent init](&v47, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v13->_revision, a4);
    contentList = v13->_contentList;
    v13->_persistentID = 0;
    v13->_contentList = 0;
    v13->_contentStyle = 0;

    objc_msgSend(v11, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistPersistentID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistPersistentID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_persistentID = objc_msgSend(v16, "unsignedLongLongValue");

    }
    objc_msgSend(v11, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_contentStyle = objc_msgSend(v18, "unsignedCharValue");

    }
    objc_msgSend(v11, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistItemList"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistItemList"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v20, "count"));
      v22 = v13->_contentList;
      v13->_contentList = (NSMutableArray *)v21;

      contentStyle = v13->_contentStyle;
      if (contentStyle == 2)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v29 = v20;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v30)
        {
          v31 = v30;
          v37 = v20;
          v38 = v10;
          v32 = 0;
          v33 = *(_QWORD *)v40;
          do
          {
            v34 = 0;
            v35 = v32;
            do
            {
              if (*(_QWORD *)v40 != v33)
                objc_enumerationMutation(v29);
              v32 = -[ACCMediaLibraryUpdatePlaylistContentItem initWithMediaLibrary:playlistPersistentID:dict:]([ACCMediaLibraryUpdatePlaylistContentItem alloc], "initWithMediaLibrary:playlistPersistentID:dict:", v9, v13->_persistentID, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v34));

              -[NSMutableArray addObject:](v13->_contentList, "addObject:", v32);
              ++v34;
              v35 = v32;
            }
            while (v31 != v34);
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v31);

          v20 = v37;
          v10 = v38;
        }
      }
      else
      {
        if (contentStyle != 1)
        {
LABEL_26:

          goto LABEL_27;
        }
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v24 = v20;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v44 != v27)
                objc_enumerationMutation(v24);
              -[NSMutableArray addObject:](v13->_contentList, "addObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
          }
          while (v26);
        }
      }

      goto LABEL_26;
    }
  }
LABEL_27:

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCMediaLibraryUpdatePlaylistContent>[%@:%llu revision=%@ style=%d count=%lu]"), self->_mediaLibraryUID, self->_persistentID, self->_revision, self->_contentStyle, -[ACCMediaLibraryUpdatePlaylistContent contentListCount](self, "contentListCount"));
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCMediaLibraryUpdatePlaylistContent description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n    %@"), v4, self->_contentList);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyDict
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKey:", self->_mediaLibraryUID, CFSTR("ACCMediaLibraryUIDKey"));
  objc_msgSend(v3, "setObject:forKey:", self->_revision, CFSTR("ACCMediaLibraryUpdateRevisionKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_persistentID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ACCMediaLibraryUpdatePlaylistPersistentID"));

  if ((self->_contentStyle - 1) <= 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_contentStyle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));

  }
  v6 = -[ACCMediaLibraryUpdatePlaylistContent copyContentDictList](self, "copyContentDictList");
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ACCMediaLibraryUpdatePlaylistItemList"));

  return v3;
}

- (id)copyContentDictList
{
  NSMutableArray *contentList;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  contentList = self->_contentList;
  if (!contentList || !-[NSMutableArray count](contentList, "count"))
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_contentList, "count"));
  if (self->_contentStyle == 1)
  {
    v22 = 0uLL;
    v23 = 0uLL;
    v20 = 0uLL;
    v21 = 0uLL;
    v5 = self->_contentList;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }
  }
  else
  {
    v18 = 0uLL;
    v19 = 0uLL;
    v16 = 0uLL;
    v17 = 0uLL;
    v5 = self->_contentList;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v5);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "copyNSRepresentation:", self->_contentStyle, (_QWORD)v16);
          objc_msgSend(v4, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }
  }

  return v4;
}

- (id)copyContentList
{
  if (!self->_contentList)
    return objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setMediaLibraryUID:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryUID, a3);
}

- (void)setRevision:(id)a3
{
  objc_storeStrong((id *)&self->_revision, a3);
}

- (void)setPersistentID:(unint64_t)a3
{
  self->_persistentID = a3;
}

- (void)setContentStyle:(int)a3
{
  self->_contentStyle = a3;
}

- (unint64_t)contentListCount
{
  return -[NSMutableArray count](self->_contentList, "count");
}

- (void)replaceContentList:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *contentList;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a3);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  contentList = self->_contentList;
  self->_contentList = v4;

}

- (void)addContentItem:(id)a3
{
  id v4;
  NSMutableArray *contentList;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (self->_contentStyle != 1)
  {
    contentList = self->_contentList;
    v8 = v4;
    if (!contentList)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->_contentList;
      self->_contentList = v6;

      contentList = self->_contentList;
    }
    -[NSMutableArray addObject:](contentList, "addObject:", v8);
    v4 = v8;
  }

}

- (void)addContentPersistentID:(unint64_t)a3
{
  NSMutableArray *contentList;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  if (self->_contentStyle == 1)
  {
    contentList = self->_contentList;
    if (!contentList)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->_contentList;
      self->_contentList = v6;

      contentList = self->_contentList;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](contentList, "addObject:", v8);

  }
}

- (void)replaceContentItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSMutableArray *contentList;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  v6 = a3;
  if (self->_contentStyle != 1)
  {
    contentList = self->_contentList;
    v10 = v6;
    if (!contentList)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = self->_contentList;
      self->_contentList = v8;

      contentList = self->_contentList;
    }
    -[NSMutableArray replaceObjectAtIndex:withObject:](contentList, "replaceObjectAtIndex:withObject:", a4, v10);
    v6 = v10;
  }

}

- (void)replaceContentPersistentID:(unint64_t)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *contentList;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  if (self->_contentStyle == 1)
  {
    contentList = self->_contentList;
    if (!contentList)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = self->_contentList;
      self->_contentList = v8;

      contentList = self->_contentList;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](contentList, "replaceObjectAtIndex:withObject:", a4, v10);

  }
}

- (id)getContentItemAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contentList, "objectAtIndex:", a3);
}

- (void)iterateContentItems:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (self->_contentStyle != 1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_contentList;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)iterateContentPersistentIDs:(id)a3
{
  void (**v4)(id, uint64_t);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  if (self->_contentStyle == 1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_contentList;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "unsignedLongLongValue", (_QWORD)v10));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (int)contentStyle
{
  return self->_contentStyle;
}

- (NSMutableArray)contentList
{
  return self->_contentList;
}

- (void)setContentList:(id)a3
{
  objc_storeStrong((id *)&self->_contentList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentList, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

@end
