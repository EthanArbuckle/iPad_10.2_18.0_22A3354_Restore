@implementation IMCombinedDirectoryContents

- (IMCombinedDirectoryContents)initWithCombinedDirectoryContents:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  IMCombinedDirectoryContents *v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "rootPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" + "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)IMCombinedDirectoryContents;
  v14 = -[IMDirectoryContents initWithRootPath:attachmentsPath:syncAssetsPath:stickersPath:](&v16, sel_initWithRootPath_attachmentsPath_syncAssetsPath_stickersPath_, v13, 0, 0, 0);

  if (v14)
    objc_storeStrong((id *)&v14->_directoryContents, a3);

  return v14;
}

- (id)combineArrays:(id)a3 rhs:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "addObjectsFromArray:", v5);

  return v6;
}

- (void)gather
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory("DiskSpace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[IMDirectoryContents rootPath](self, "rootPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v4;
    _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "IMCombinedDirectoryContents: Combining directory contents for paths: %@", buf, 0xCu);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IMCombinedDirectoryContents directoryContents](self, "directoryContents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        -[IMDirectoryContents fileInfoMap](self, "fileInfoMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "fileInfoMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addEntriesFromDictionary:", v12);

        -[IMDirectoryContents setFileInfoMap:](self, "setFileInfoMap:", v11);
        -[IMDirectoryContents sortedPaths](self, "sortedPaths");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sortedPaths");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMCombinedDirectoryContents combineArrays:rhs:](self, "combineArrays:rhs:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "sortUsingComparator:", &unk_1E3FB3D28);
        -[IMDirectoryContents setSortedPaths:](self, "setSortedPaths:", v15);
        -[IMDirectoryContents topLevelPaths](self, "topLevelPaths");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "topLevelPaths");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMCombinedDirectoryContents combineArrays:rhs:](self, "combineArrays:rhs:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDirectoryContents setTopLevelPaths:](self, "setTopLevelPaths:", v18);

        -[IMDirectoryContents attachmentPaths](self, "attachmentPaths");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attachmentPaths");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMCombinedDirectoryContents combineArrays:rhs:](self, "combineArrays:rhs:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDirectoryContents setAttachmentPaths:](self, "setAttachmentPaths:", v21);

        -[IMDirectoryContents syncAssetPaths](self, "syncAssetPaths");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "syncAssetPaths");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMCombinedDirectoryContents combineArrays:rhs:](self, "combineArrays:rhs:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDirectoryContents setSyncAssetPaths:](self, "setSyncAssetPaths:", v24);

        -[IMDirectoryContents allPaths](self, "allPaths");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v25, "mutableCopy");

        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "allPaths");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "allObjects");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObjectsFromArray:", v28);

        -[IMDirectoryContents setAllPaths:](self, "setAllPaths:", v26);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

}

- (NSArray)directoryContents
{
  return self->_directoryContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryContents, 0);
}

@end
