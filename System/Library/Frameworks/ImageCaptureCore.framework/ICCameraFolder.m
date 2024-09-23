@implementation ICCameraFolder

- (NSString)mediaItemType
{
  return (NSString *)CFSTR("folder");
}

- (ICCameraFolder)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  ICCameraFolder *v5;
  void *v6;
  void *v7;
  void *v8;
  ICCameraFolder *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICCameraFolder;
  v5 = -[ICCameraItem initWithName:parentFolder:device:](&v11, sel_initWithName_parentFolder_device_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFolder setFiles:](v5, "setFiles:", v6);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFolder setFolders:](v5, "setFolders:", v7);

    objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setUTI:](v5, "setUTI:", v8);

    -[ICCameraItem setThumbnailState:](v5, "setThumbnailState:", 8);
    -[ICCameraItem setMetadataState:](v5, "setMetadataState:", 8);
    -[ICCameraFolder setFolderMediaLock:](v5, "setFolderMediaLock:", 0);
    v9 = v5;
  }

  return v5;
}

- (void)dealloc
{
  os_unfair_lock_s *p_folderMediaLock;
  NSMutableArray *files;
  NSMutableArray *folders;
  objc_super v6;

  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  files = self->_files;
  self->_files = 0;

  folders = self->_folders;
  self->_folders = 0;

  os_unfair_lock_unlock(p_folderMediaLock);
  v6.receiver = self;
  v6.super_class = (Class)ICCameraFolder;
  -[ICCameraFolder dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ICCameraFolder files](self, "files");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    LODWORD(v6) = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "sidecarFiles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "count") + v6 + 1;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
    v10 = v6;
  }
  else
  {
    v10 = 0;
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[ICCameraItem name](self, "name");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "UTF8String");
  v14 = -[ICCameraItem objectID](self, "objectID");
  -[ICCameraFolder folders](self, "folders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("🔶 [%10s ID:%6lu]➡[%8s:%6u][%8s:%6lu]"), v13, v14, "Files", v10, "Folders", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)addFile:(id)a3
{
  os_unfair_lock_s *p_folderMediaLock;
  id v5;

  p_folderMediaLock = &self->_folderMediaLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  -[NSMutableArray addObject:](self->_files, "addObject:", v5);

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)addFolder:(id)a3
{
  os_unfair_lock_s *p_folderMediaLock;
  id v5;

  p_folderMediaLock = &self->_folderMediaLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  -[NSMutableArray addObject:](self->_folders, "addObject:", v5);

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteItem:(id)a3
{
  os_unfair_lock_s *p_folderMediaLock;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int *v9;

  p_folderMediaLock = &self->_folderMediaLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  objc_msgSend(v5, "UTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  v9 = &OBJC_IVAR___ICCameraFolder__files;
  if (v8)
    v9 = &OBJC_IVAR___ICCameraFolder__folders;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v9), "removeObject:", v5);

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteFile:(id)a3
{
  os_unfair_lock_s *p_folderMediaLock;
  id v5;

  p_folderMediaLock = &self->_folderMediaLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  -[NSMutableArray removeObject:](self->_files, "removeObject:", v5);

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteFolder:(id)a3
{
  os_unfair_lock_s *p_folderMediaLock;
  id v5;

  p_folderMediaLock = &self->_folderMediaLock;
  v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  -[NSMutableArray removeObject:](self->_folders, "removeObject:", v5);

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (NSArray)contents
{
  os_unfair_lock_s *p_folderMediaLock;
  void *v4;

  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_folders);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", self->_files);
  os_unfair_lock_unlock(p_folderMediaLock);
  return (NSArray *)v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("children")))
  {
    -[ICCameraFolder contents](self, "contents");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICCameraFolder;
    -[ICCameraItem valueForUndefinedKey:](&v8, sel_valueForUndefinedKey_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (NSMutableArray)files
{
  os_unfair_lock_s *p_folderMediaLock;
  void *v4;

  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_files);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_folderMediaLock);
  return (NSMutableArray *)v4;
}

- (void)setFiles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *files;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock(&self->_folderMediaLock);
  files = self->_files;
  self->_files = v4;

  os_unfair_lock_unlock(&self->_folderMediaLock);
}

- (NSMutableArray)folders
{
  os_unfair_lock_s *p_folderMediaLock;
  void *v4;

  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_folders);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_folderMediaLock);
  return (NSMutableArray *)v4;
}

- (void)setFolders:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *folders;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock(&self->_folderMediaLock);
  folders = self->_folders;
  self->_folders = v4;

  os_unfair_lock_unlock(&self->_folderMediaLock);
}

- (BOOL)hasThumbnail
{
  return 1;
}

- (void)deleteFolderWithID:(unint64_t)a3
{
  os_unfair_lock_s *p_folderMediaLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_folders;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    v12 = v9;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v6);
      v9 = (NSMutableArray *)*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11);

      if (-[NSMutableArray objectID](v9, "objectID", (_QWORD)v13) == a3)
        break;
      ++v11;
      v12 = v9;
      if (v8 == v11)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;

        goto LABEL_12;
      }
    }

    if (!v9)
      goto LABEL_13;
    -[NSMutableArray removeObject:](self->_folders, "removeObject:", v9);
    v6 = v9;
  }
LABEL_12:

LABEL_13:
  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteFileWithID:(unint64_t)a3
{
  os_unfair_lock_s *p_folderMediaLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_files;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    v12 = v9;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v6);
      v9 = (NSMutableArray *)*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11);

      if (-[NSMutableArray objectID](v9, "objectID", (_QWORD)v13) == a3)
        break;
      ++v11;
      v12 = v9;
      if (v8 == v11)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;

        goto LABEL_12;
      }
    }

    if (!v9)
      goto LABEL_13;
    -[NSMutableArray removeObject:](self->_files, "removeObject:", v9);
    v6 = v9;
  }
LABEL_12:

LABEL_13:
  os_unfair_lock_unlock(p_folderMediaLock);
}

- (id)getFolderWithID:(unint64_t)a3
{
  ICCameraFolder *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[ICCameraItem objectID](self, "objectID") != a3 || (v5 = self) == 0)
  {
    -[ICCameraFolder folders](self, "folders");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "getFolderWithID:", a3, (_QWORD)v13);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (ICCameraFolder *)v11;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_13:

  }
  return v5;
}

- (id)getFileWithID:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[ICCameraFolder files](self, "files");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      if (objc_msgSend(v10, "objectID") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (v11)
      goto LABEL_22;
  }
  else
  {
LABEL_9:

  }
  -[ICCameraFolder folders](self, "folders");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "getFileWithID:", a3, (_QWORD)v19);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v11 = (id)v17;
          goto LABEL_21;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v14)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_21:

LABEL_22:
  return v11;
}

- (CGImage)thumbnailIfAvailable
{
  return 0;
}

- (id)metadataIfAvailable
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (os_unfair_lock_s)folderMediaLock
{
  return self->_folderMediaLock;
}

- (void)setFolderMediaLock:(os_unfair_lock_s)a3
{
  self->_folderMediaLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

@end
