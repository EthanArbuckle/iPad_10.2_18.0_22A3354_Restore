@implementation IMDiskSpaceFileInfo

- (IMDiskSpaceFileInfo)initWithPath:(id)a3 fileSize:(IMFileSize)a4 isDirectory:(BOOL)a5 isAttachment:(BOOL)a6 isSyncAsset:(BOOL)a7 isSticker:(BOOL)a8 isPurgableOnDisk:(BOOL)a9
{
  _BOOL4 v10;
  unint64_t disk_allocation_size;
  unint64_t file_size;
  id v15;
  IMDiskSpaceFileInfo *v16;
  uint64_t v17;
  NSString *path;
  void *v19;
  uint64_t v20;
  NSString *guid;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *fileExtension;
  NSString *v26;
  objc_super v28;

  v10 = a6;
  disk_allocation_size = a4.disk_allocation_size;
  file_size = a4.file_size;
  v15 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IMDiskSpaceFileInfo;
  v16 = -[IMDiskSpaceFileInfo init](&v28, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    path = v16->_path;
    v16->_path = (NSString *)v17;

    v16->_isDirectory = a5;
    v16->_isAttachment = v10;
    v16->_isSyncAsset = a7;
    v16->_isPurgableOnDisk = a9;
    v16->_fileSize.file_size = file_size;
    v16->_fileSize.disk_allocation_size = disk_allocation_size;
    v16->_isSticker = a8;
    if (v10)
    {
      objc_msgSend(v15, "stringByDeletingLastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = objc_claimAutoreleasedReturnValue();
      guid = v16->_guid;
      v16->_guid = (NSString *)v20;

    }
    objc_msgSend(v15, "pathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && objc_msgSend(v22, "length"))
    {
      v24 = v23;
      fileExtension = v16->_fileExtension;
      v16->_fileExtension = v24;
    }
    else
    {
      objc_msgSend(v15, "lastPathComponent");
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      fileExtension = v26;
      if (v26
        && -[NSString length](v26, "length")
        && -[NSString containsString:](fileExtension, "containsString:", CFSTR("GroupPhotoImage")))
      {
        objc_storeStrong((id *)&v16->_fileExtension, fileExtension);
      }
    }

  }
  return v16;
}

- (void)addLogItems:(id)a3
{
  void *v4;
  const __CFString *guid;
  id v6;
  void *v7;
  void *v8;
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
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  id v22;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (self->_guid)
    guid = (const __CFString *)self->_guid;
  else
    guid = CFSTR("nil");
  v6 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("guid: %@ (on disk)"), guid);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("path: %@ (on disk)"), self->_path);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_fileSize.file_size);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromHugeNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("file size: %@ (on disk)"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_fileSize.disk_allocation_size);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromHugeNumber:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("disk allocation size: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v18);

  if (self->_isAttachment)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isAttachment: %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v20);

  if (self->_isDirectory)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isDirectory: %@"), v21);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v22);

}

- (id)logString
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiskSpaceFileInfo addLogItems:](self, "addLogItems:", v3);
  objc_msgSend(v3, "sortUsingComparator:", &unk_1E3FB3768);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n      "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@"), v6, CFSTR("\n      "), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)log
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory("DiskSpace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[IMDiskSpaceFileInfo logString](self, "logString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v5, 0xCu);

  }
}

- (NSString)path
{
  return self->_path;
}

- (IMFileSize)fileSize
{
  unint64_t disk_allocation_size;
  unint64_t file_size;
  IMFileSize result;

  disk_allocation_size = self->_fileSize.disk_allocation_size;
  file_size = self->_fileSize.file_size;
  result.disk_allocation_size = disk_allocation_size;
  result.file_size = file_size;
  return result;
}

- (BOOL)isAttachment
{
  return self->_isAttachment;
}

- (BOOL)isSyncAsset
{
  return self->_isSyncAsset;
}

- (BOOL)isPurgableOnDisk
{
  return self->_isPurgableOnDisk;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
