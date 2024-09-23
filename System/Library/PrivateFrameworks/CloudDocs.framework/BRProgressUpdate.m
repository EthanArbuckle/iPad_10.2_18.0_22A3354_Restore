@implementation BRProgressUpdate

- (id)description
{
  void *v3;
  void *v4;
  unint64_t uploadTotalSize;
  unint64_t downloadTotalSize;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<progress %@"), self->_folderID);
  v4 = v3;
  uploadTotalSize = self->_uploadTotalSize;
  if (uploadTotalSize)
    objc_msgSend(v3, "appendFormat:", CFSTR(" ul:%llu/%llu (%.1f%%)"), self->_uploadCompletedSize, uploadTotalSize, (double)self->_uploadCompletedSize * 100.0 / (double)uploadTotalSize);
  downloadTotalSize = self->_downloadTotalSize;
  if (downloadTotalSize)
    objc_msgSend(v4, "appendFormat:", CFSTR(" dl:%llu/%llu (%.1f%%)"), self->_downloadCompletedSize, downloadTotalSize, (double)self->_downloadCompletedSize * 100.0 / (double)downloadTotalSize);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (NSArray)parentFileIDs
{
  NSArray *parentFileIDs;
  void *v4;
  NSObject *v5;

  parentFileIDs = self->_parentFileIDs;
  if (!parentFileIDs)
  {
    brc_bread_crumbs((uint64_t)"-[BRProgressUpdate parentFileIDs]", 44);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRProgressUpdate parentFileIDs].cold.1((uint64_t)v4, v5);

    parentFileIDs = self->_parentFileIDs;
  }
  return parentFileIDs;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRProgressUpdate)initWithCoder:(id)a3
{
  id v4;
  BRProgressUpdate *v5;
  uint64_t v6;
  BRFileObjectID *folderID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRProgressUpdate;
  v5 = -[BRProgressUpdate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    folderID = v5->_folderID;
    v5->_folderID = (BRFileObjectID *)v6;

    v5->_uploadCompletedSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ul"));
    v5->_uploadTotalSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ulDone"));
    v5->_downloadCompletedSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dl"));
    v5->_downloadTotalSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dlDone"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BRFileObjectID *folderID;
  id v5;

  folderID = self->_folderID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", folderID, CFSTR("id"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_uploadCompletedSize, CFSTR("ul"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_uploadTotalSize, CFSTR("ulDone"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_downloadCompletedSize, CFSTR("dl"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_downloadTotalSize, CFSTR("dlDone"));

}

- (void)setParentFileIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BRFileObjectID)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)uploadCompletedSize
{
  return self->_uploadCompletedSize;
}

- (void)setUploadCompletedSize:(unint64_t)a3
{
  self->_uploadCompletedSize = a3;
}

- (unint64_t)uploadTotalSize
{
  return self->_uploadTotalSize;
}

- (void)setUploadTotalSize:(unint64_t)a3
{
  self->_uploadTotalSize = a3;
}

- (unint64_t)downloadCompletedSize
{
  return self->_downloadCompletedSize;
}

- (void)setDownloadCompletedSize:(unint64_t)a3
{
  self->_downloadCompletedSize = a3;
}

- (unint64_t)downloadTotalSize
{
  return self->_downloadTotalSize;
}

- (void)setDownloadTotalSize:(unint64_t)a3
{
  self->_downloadTotalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFileIDs, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
}

- (void)parentFileIDs
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: this call was not supposed to be made%@", (uint8_t *)&v2, 0xCu);
}

@end
