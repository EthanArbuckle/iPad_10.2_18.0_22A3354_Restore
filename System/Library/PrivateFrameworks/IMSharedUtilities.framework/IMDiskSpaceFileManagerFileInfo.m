@implementation IMDiskSpaceFileManagerFileInfo

- (IMDiskSpaceFileManagerFileInfo)initWithPath:(id)a3 fileSize:(IMFileSize)a4 isDirectory:(BOOL)a5 isAttachment:(BOOL)a6 isSyncAsset:(BOOL)a7 isSticker:(BOOL)a8 purgableFlags:(unint64_t)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  unint64_t disk_allocation_size;
  unint64_t file_size;
  id v15;
  BOOL v16;
  IMDiskSpaceFileManagerFileInfo *v17;
  IMDiskSpaceFileManagerFileInfo *v18;
  __int16 v20;
  objc_super v21;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  disk_allocation_size = a4.disk_allocation_size;
  file_size = a4.file_size;
  v15 = a3;
  if (a9)
    v16 = (IM_APFS_PURGEABLE_IGNORE_ME() & a9) == 0;
  else
    v16 = 0;
  v21.receiver = self;
  v21.super_class = (Class)IMDiskSpaceFileManagerFileInfo;
  HIBYTE(v20) = v16;
  LOBYTE(v20) = a8;
  v17 = -[IMDiskSpaceFileInfo initWithPath:fileSize:isDirectory:isAttachment:isSyncAsset:isSticker:isPurgableOnDisk:](&v21, sel_initWithPath_fileSize_isDirectory_isAttachment_isSyncAsset_isSticker_isPurgableOnDisk_, v15, file_size, disk_allocation_size, v11, v10, v9, v20);
  v18 = v17;
  if (v17)
    v17->_purgableFlags = a9;

  return v18;
}

- (void)addLogItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMDiskSpaceFileManagerFileInfo;
  v4 = a3;
  -[IMDiskSpaceFileInfo addLogItems:](&v8, sel_addLogItems_, v4);
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[IMAPFSUtils stringForPurgableFlags:](IMAPFSUtils, "stringForPurgableFlags:", -[IMDiskSpaceFileManagerFileInfo purgableFlags](self, "purgableFlags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("isPurgable: %@ (on disk)"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

}

- (unint64_t)purgableFlags
{
  return self->_purgableFlags;
}

- (NSString)purgableFlagsString
{
  return self->_purgableFlagsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgableFlagsString, 0);
}

@end
