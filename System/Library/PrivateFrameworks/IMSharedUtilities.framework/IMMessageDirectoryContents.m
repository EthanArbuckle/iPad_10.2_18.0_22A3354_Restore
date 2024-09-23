@implementation IMMessageDirectoryContents

- (IMMessageDirectoryContents)init
{
  IMMessageDirectoryContents *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  IMDirectoryContents *v7;
  IMDirectoryContents *messagesDirectoryContents;
  IMDirectoryContents *v9;
  IMDirectoryContents *metaDataDirectoryContents;
  IMCombinedDirectoryContents *v11;
  IMDirectoryContents *v12;
  void *v13;
  uint64_t v14;
  IMCombinedDirectoryContents *allDirectoryContents;
  uint64_t v16;
  NSArray *directoryContents;
  objc_super v19;
  __int128 v20;
  IMCombinedDirectoryContents *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)IMMessageDirectoryContents;
  v2 = -[IMMessageDirectoryContents init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(CFSTR("/var/mobile/Library/SMS"), "stringByAppendingPathComponent:", CFSTR("Attachments"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/SMS"), "stringByAppendingPathComponent:", CFSTR("Sync"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Assets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("/var/mobile/Library/SMS"), "stringByAppendingPathComponent:", CFSTR("StickerCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IMDirectoryContents initWithRootPath:attachmentsPath:syncAssetsPath:stickersPath:]([IMDirectoryContents alloc], "initWithRootPath:attachmentsPath:syncAssetsPath:stickersPath:", CFSTR("/var/mobile/Library/SMS"), v3, v5, v6);
    messagesDirectoryContents = v2->_messagesDirectoryContents;
    v2->_messagesDirectoryContents = v7;

    v9 = -[IMDirectoryContents initWithRootPath:attachmentsPath:syncAssetsPath:stickersPath:]([IMDirectoryContents alloc], "initWithRootPath:attachmentsPath:syncAssetsPath:stickersPath:", CFSTR("/var/mobile/Library/MessagesMetaData"), 0, v5, 0);
    metaDataDirectoryContents = v2->_metaDataDirectoryContents;
    v2->_metaDataDirectoryContents = v9;

    v11 = [IMCombinedDirectoryContents alloc];
    v12 = v2->_metaDataDirectoryContents;
    v22[0] = v2->_messagesDirectoryContents;
    v22[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[IMCombinedDirectoryContents initWithCombinedDirectoryContents:](v11, "initWithCombinedDirectoryContents:", v13);
    allDirectoryContents = v2->_allDirectoryContents;
    v2->_allDirectoryContents = (IMCombinedDirectoryContents *)v14;

    v20 = *(_OWORD *)&v2->_messagesDirectoryContents;
    v21 = v2->_allDirectoryContents;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 3);
    v16 = objc_claimAutoreleasedReturnValue();
    directoryContents = v2->_directoryContents;
    v2->_directoryContents = (NSArray *)v16;

    v2->_needsGathering = 1;
  }
  return v2;
}

- (void)gather
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  IMMessageDirectoryContents *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory("DiskSpace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Gathering directory info...", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = self;
  v4 = self->_directoryContents;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        IMLogHandleForCategory("DiskSpace");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "rootPath");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Gathering directory info for: %@", buf, 0xCu);

        }
        objc_msgSend(v9, "gather");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

  v12->_needsGathering = 0;
}

- (BOOL)gatherIfNeeded
{
  _BOOL4 v3;

  v3 = -[IMMessageDirectoryContents needsGathering](self, "needsGathering");
  if (v3)
    -[IMMessageDirectoryContents gather](self, "gather");
  return v3;
}

- (IMDirectoryContents)messagesDirectoryContents
{
  return self->_messagesDirectoryContents;
}

- (IMDirectoryContents)metaDataDirectoryContents
{
  return self->_metaDataDirectoryContents;
}

- (IMCombinedDirectoryContents)allDirectoryContents
{
  return self->_allDirectoryContents;
}

- (BOOL)needsGathering
{
  return self->_needsGathering;
}

- (void)setNeedsGathering:(BOOL)a3
{
  self->_needsGathering = a3;
}

- (NSArray)directoryContents
{
  return self->_directoryContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryContents, 0);
  objc_storeStrong((id *)&self->_allDirectoryContents, 0);
  objc_storeStrong((id *)&self->_metaDataDirectoryContents, 0);
  objc_storeStrong((id *)&self->_messagesDirectoryContents, 0);
}

@end
