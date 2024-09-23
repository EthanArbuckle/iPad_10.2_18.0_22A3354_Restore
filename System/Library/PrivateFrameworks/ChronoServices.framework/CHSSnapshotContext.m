@implementation CHSSnapshotContext

- (CHSSnapshotContext)initWithURL:(id)a3 attributes:(id)a4 fileManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHSSnapshotContext *v12;
  CHSSnapshotContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHSSnapshotContext;
  v12 = -[CHSSnapshotContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_attributes, a4);
    objc_storeStrong((id *)&v13->_fileManager, a5);
  }

  return v13;
}

- (NSString)typeIdentifier
{
  ssize_t v3;
  size_t v4;
  void *v5;
  ssize_t v6;
  void *v7;
  void *v8;

  v3 = getxattr(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), "FormatType", 0, 0, 0, 0);
  v4 = v3;
  if (v3 < 1)
    goto LABEL_6;
  v5 = malloc_type_malloc(v3, 0x1326343FuLL);
  v6 = getxattr(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), "FormatType", v5, v4, 0, 0);
  if (v6 == -1)
  {
    free(v5);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_6:
    v8 = 0;
    return (NSString *)v8;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);

  return (NSString *)v8;
}

- (BOOL)needsCAPackage
{
  char v3;
  void *v4;

  if (self->_checkedContentType)
    return self->_usesCAPackage;
  -[CHSSnapshotContext typeIdentifier](self, "typeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.coreanimation"));
  self->_usesCAPackage = v3;
  self->_checkedContentType = 1;

  return v3;
}

- (NSString)contentIdentifier
{
  ssize_t v3;
  size_t v4;
  void *v5;
  ssize_t v6;
  void *v7;
  void *v8;

  v3 = getxattr(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), "ContentIdentifier", 0, 0, 0, 0);
  if (v3 < 1)
    goto LABEL_6;
  v4 = v3;
  v5 = malloc_type_malloc(v3, 0xDCB77E4EuLL);
  v6 = getxattr(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), "ContentIdentifier", v5, v4, 0, 0);
  if (v6 == -1)
  {
    free(v5);
LABEL_6:
    v8 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
  else
    v8 = 0;
LABEL_7:

  return (NSString *)v8;
}

- (BOOL)fileExists
{
  BOOL *p_fileExists;
  NSFileManager *fileManager;
  void *v5;
  void *v6;

  if (self->_checkedFileExists)
  {
    p_fileExists = &self->_fileExists;
  }
  else
  {
    fileManager = self->_fileManager;
    -[NSURL path](self->_url, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_fileExists = -[NSFileManager fileExistsAtPath:](fileManager, "fileExistsAtPath:", v5);
    p_fileExists = &self->_fileExists;

    p_fileExists[1] = 1;
    v6 = *(void **)(p_fileExists + 14);
    *(_QWORD *)(p_fileExists + 14) = 0;

  }
  return *p_fileExists;
}

- (CHSScreenshotPresentationAttributes)attributes
{
  return self->_attributes;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
