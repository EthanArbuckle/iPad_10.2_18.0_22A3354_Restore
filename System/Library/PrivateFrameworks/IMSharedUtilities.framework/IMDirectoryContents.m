@implementation IMDirectoryContents

- (IMDirectoryContents)initWithRootPath:(id)a3 attachmentsPath:(id)a4 syncAssetsPath:(id)a5 stickersPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IMDirectoryContents *v14;
  uint64_t v15;
  NSString *rootPath;
  uint64_t v17;
  NSString *attachmentsPath;
  uint64_t v19;
  NSString *stickersPath;
  uint64_t v21;
  NSString *syncAssetsPath;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)IMDirectoryContents;
  v14 = -[IMDirectoryContents init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    rootPath = v14->_rootPath;
    v14->_rootPath = (NSString *)v15;

    if (v11)
    {
      v17 = objc_msgSend(v11, "copy");
      attachmentsPath = v14->_attachmentsPath;
      v14->_attachmentsPath = (NSString *)v17;

    }
    if (v13)
    {
      v19 = objc_msgSend(v13, "copy");
      stickersPath = v14->_stickersPath;
      v14->_stickersPath = (NSString *)v19;

    }
    if (v12)
    {
      v21 = objc_msgSend(v12, "copy");
      syncAssetsPath = v14->_syncAssetsPath;
      v14->_syncAssetsPath = (NSString *)v21;

    }
  }

  return v14;
}

- (BOOL)isAttachmentPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[IMDirectoryContents attachmentsPath](self, "attachmentsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMDirectoryContents attachmentsPath](self, "attachmentsPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "hasPrefix:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isStickerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[IMDirectoryContents stickersPath](self, "stickersPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMDirectoryContents stickersPath](self, "stickersPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "hasPrefix:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isSyncAssetPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[IMDirectoryContents syncAssetsPath](self, "syncAssetsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMDirectoryContents syncAssetsPath](self, "syncAssetsPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "hasPrefix:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)recursivelyGatherFileInfoAtPath:(id)a3 fileInfoMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  IMDiskSpaceFileManagerFileInfo *v19;
  _BOOL8 v20;
  _BOOL8 v21;
  IMDiskSpaceFileManagerFileInfo *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  int v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v6, &v37);

  if (!v9)
    goto LABEL_25;
  v36 = 0;
  v10 = +[IMAPFSUtils purgableFlagsForPath:error:](IMAPFSUtils, "purgableFlagsForPath:error:", v6, &v36);
  if (v36)
  {
    IMLogHandleForCategory("DiskSpace");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_19E36E938((uint64_t)v6, &v36, v11);

  }
  if (!v37)
  {
    v30 = IMFileSizeZero;
    v29 = 0;
    v16 = IMFileSizeForItemAtPath(v6, (off_t *)&v30, 1, &v29);
    v17 = v29;
    if (!v16)
    {
      IMLogHandleForCategory("DiskSpace");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_19E36E830((uint64_t)v6, v17);

    }
    v19 = [IMDiskSpaceFileManagerFileInfo alloc];
    v20 = -[IMDirectoryContents isAttachmentPath:](self, "isAttachmentPath:", v6);
    v21 = -[IMDirectoryContents isSyncAssetPath:](self, "isSyncAssetPath:", v6);
    LOBYTE(v28) = -[IMDirectoryContents isStickerPath:](self, "isStickerPath:", v6);
    v22 = -[IMDiskSpaceFileManagerFileInfo initWithPath:fileSize:isDirectory:isAttachment:isSyncAsset:isSticker:purgableFlags:](v19, "initWithPath:fileSize:isDirectory:isAttachment:isSyncAsset:isSticker:purgableFlags:", v6, v30, 0, v20, v21, v28, v10);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v6);

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v6, &v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v35;

  if (!v14)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v13;
    v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v17);
          objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDirectoryContents recursivelyGatherFileInfoAtPath:fileInfoMap:](self, "recursivelyGatherFileInfoAtPath:fileInfoMap:", v27, v7);

        }
        v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v24);
    }

LABEL_24:
    goto LABEL_25;
  }
  IMLogHandleForCategory("DiskSpace");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_19E36E8B4((uint64_t)v6, v14);

LABEL_25:
}

- (NSArray)sortedPaths
{
  NSArray *sortedPaths;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  sortedPaths = self->_sortedPaths;
  if (!sortedPaths)
  {
    -[NSDictionary allKeys](self->_fileInfoMap, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &unk_1E3FB3C08);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sortedPaths;
    self->_sortedPaths = v5;

    sortedPaths = self->_sortedPaths;
  }
  return sortedPaths;
}

- (NSSet)allPaths
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[IMDirectoryContents sortedPaths](self, "sortedPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return (NSSet *)v5;
}

- (NSArray)attachmentPaths
{
  NSArray *attachmentPaths;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  attachmentPaths = self->_attachmentPaths;
  if (!attachmentPaths)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[IMDirectoryContents sortedPaths](self, "sortedPaths", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (-[IMDirectoryContents isAttachmentPath:](self, "isAttachmentPath:", v10))
          {
            -[IMDirectoryContents fileInfoMap](self, "fileInfoMap");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isDirectory");

            if ((v13 & 1) == 0)
              -[NSArray addObject:](v4, "addObject:", v10);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v14 = self->_attachmentPaths;
    self->_attachmentPaths = v4;

    attachmentPaths = self->_attachmentPaths;
  }
  return attachmentPaths;
}

- (NSArray)syncAssetPaths
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_syncAssetPaths)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[IMDirectoryContents sortedPaths](self, "sortedPaths", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (-[IMDirectoryContents isSyncAssetPath:](self, "isSyncAssetPath:", v9))
          {
            -[IMDirectoryContents fileInfoMap](self, "fileInfoMap");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isDirectory");

            if ((v12 & 1) == 0)
              objc_msgSend(v3, "addObject:", v9);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)topLevelPaths
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSArray *topLevelPaths;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_topLevelPaths)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[IMDirectoryContents sortedPaths](self, "sortedPaths", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "stringByDeletingLastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDirectoryContents rootPath](self, "rootPath");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v12)
            -[NSArray addObject:](v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    topLevelPaths = self->_topLevelPaths;
    self->_topLevelPaths = v3;

  }
  return self->_attachmentPaths;
}

- (void)gather
{
  NSObject *v3;
  void *v4;
  NSArray *topLevelPaths;
  NSArray *attachmentPaths;
  NSArray *syncAssetPaths;
  NSArray *sortedPaths;
  NSDictionary *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSDictionary *fileInfoMap;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory("DiskSpace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[IMDirectoryContents rootPath](self, "rootPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Directory Contents: Gathering info for path: %@", (uint8_t *)&v14, 0xCu);

  }
  topLevelPaths = self->_topLevelPaths;
  self->_topLevelPaths = 0;

  attachmentPaths = self->_attachmentPaths;
  self->_attachmentPaths = 0;

  syncAssetPaths = self->_syncAssetPaths;
  self->_syncAssetPaths = 0;

  sortedPaths = self->_sortedPaths;
  self->_sortedPaths = 0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  -[IMDirectoryContents rootPath](self, "rootPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[IMDirectoryContents rootPath](self, "rootPath");
    v12 = objc_claimAutoreleasedReturnValue();
    -[IMDirectoryContents recursivelyGatherFileInfoAtPath:fileInfoMap:](self, "recursivelyGatherFileInfoAtPath:fileInfoMap:", v12, v9);
  }
  else
  {
    IMLogHandleForCategory("DiskSpace");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_19E36E9EC(v12);
  }

  fileInfoMap = self->_fileInfoMap;
  self->_fileInfoMap = v9;

}

+ (BOOL)isGroupPhotoPath:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("GroupPhotoImage"));

  return v4;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (NSString)attachmentsPath
{
  return self->_attachmentsPath;
}

- (NSString)syncAssetsPath
{
  return self->_syncAssetsPath;
}

- (NSString)stickersPath
{
  return self->_stickersPath;
}

- (NSDictionary)fileInfoMap
{
  return self->_fileInfoMap;
}

- (void)setFileInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_fileInfoMap, a3);
}

- (void)setSortedPaths:(id)a3
{
  objc_storeStrong((id *)&self->_sortedPaths, a3);
}

- (void)setTopLevelPaths:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelPaths, a3);
}

- (void)setAttachmentPaths:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentPaths, a3);
}

- (void)setSyncAssetPaths:(id)a3
{
  objc_storeStrong((id *)&self->_syncAssetPaths, a3);
}

- (void)setAllPaths:(id)a3
{
  objc_storeStrong((id *)&self->_allPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPaths, 0);
  objc_storeStrong((id *)&self->_syncAssetPaths, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_topLevelPaths, 0);
  objc_storeStrong((id *)&self->_sortedPaths, 0);
  objc_storeStrong((id *)&self->_fileInfoMap, 0);
  objc_storeStrong((id *)&self->_stickersPath, 0);
  objc_storeStrong((id *)&self->_syncAssetsPath, 0);
  objc_storeStrong((id *)&self->_attachmentsPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end
