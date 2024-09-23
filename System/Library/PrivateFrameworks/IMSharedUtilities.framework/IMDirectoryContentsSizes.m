@implementation IMDirectoryContentsSizes

- (IMDirectoryContentsSizes)initWithDirectoryContents:(id)a3
{
  id v4;
  IMDirectoryContentsSizes *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IMDirectoryContentsSizes;
  v5 = -[IMDirectoryContentsSizes init](&v38, sel_init);
  if (v5)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "fileInfoMap", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isDirectory") & 1) == 0)
          {
            v13 = objc_msgSend(v12, "fileSize");
            v15 = v5->_totalSize.disk_allocation_size + v14;
            v5->_totalSize.file_size += v13;
            v5->_totalSize.disk_allocation_size = v15;
            if (objc_msgSend(v12, "isAttachment"))
            {
              v16 = objc_msgSend(v12, "fileSize");
              v18 = v5->_totalAttachmentSize.disk_allocation_size + v17;
              v5->_totalAttachmentSize.file_size += v16;
              v5->_totalAttachmentSize.disk_allocation_size = v18;
            }
            if (objc_msgSend(v12, "isPurgableOnDisk"))
            {
              v19 = objc_msgSend(v12, "fileSize");
              v21 = v5->_totalPurgableSize.disk_allocation_size + v20;
              v5->_totalPurgableSize.file_size += v19;
              v5->_totalPurgableSize.disk_allocation_size = v21;
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v9);
    }

    IMLogHandleForCategory("DiskSpace");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "fileInfoMap");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 134217984;
      v40 = v24;
      _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Total Item Count: %ld", buf, 0xCu);

    }
    IMLogHandleForCategory("DiskSpace");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37F0], "stringFromFileSize:", v5->_totalSize.file_size, v5->_totalSize.disk_allocation_size);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v26;
      _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Total Size: %@", buf, 0xCu);

    }
    IMLogHandleForCategory("DiskSpace");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37F0], "stringFromFileSize:", v5->_totalPurgableSize.file_size, v5->_totalPurgableSize.disk_allocation_size);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v28;
      _os_log_impl(&dword_19E239000, v27, OS_LOG_TYPE_INFO, "Total Purgable Size: %@", buf, 0xCu);

    }
    IMLogHandleForCategory("DiskSpace");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37F0], "stringFromFileSize:", v5->_totalSize.file_size - v5->_totalPurgableSize.file_size, v5->_totalSize.disk_allocation_size - v5->_totalPurgableSize.disk_allocation_size);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v30;
      _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "Total Non-Purgable Size: %@", buf, 0xCu);

    }
    IMLogHandleForCategory("DiskSpace");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37F0], "stringFromFileSize:", v5->_totalAttachmentSize.file_size, v5->_totalAttachmentSize.disk_allocation_size);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v32;
      _os_log_impl(&dword_19E239000, v31, OS_LOG_TYPE_INFO, "Total Attachment Size: %@", buf, 0xCu);

    }
  }

  return v5;
}

- (IMFileSize)totalSize
{
  unint64_t disk_allocation_size;
  unint64_t file_size;
  IMFileSize result;

  disk_allocation_size = self->_totalSize.disk_allocation_size;
  file_size = self->_totalSize.file_size;
  result.disk_allocation_size = disk_allocation_size;
  result.file_size = file_size;
  return result;
}

- (IMFileSize)totalPurgableSize
{
  unint64_t disk_allocation_size;
  unint64_t file_size;
  IMFileSize result;

  disk_allocation_size = self->_totalPurgableSize.disk_allocation_size;
  file_size = self->_totalPurgableSize.file_size;
  result.disk_allocation_size = disk_allocation_size;
  result.file_size = file_size;
  return result;
}

- (IMFileSize)totalAttachmentSize
{
  unint64_t disk_allocation_size;
  unint64_t file_size;
  IMFileSize result;

  disk_allocation_size = self->_totalAttachmentSize.disk_allocation_size;
  file_size = self->_totalAttachmentSize.file_size;
  result.disk_allocation_size = disk_allocation_size;
  result.file_size = file_size;
  return result;
}

@end
