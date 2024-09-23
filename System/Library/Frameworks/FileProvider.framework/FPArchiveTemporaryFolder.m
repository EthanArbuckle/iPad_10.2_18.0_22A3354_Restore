@implementation FPArchiveTemporaryFolder

- (FPArchiveTemporaryFolder)init
{
  return -[FPArchiveTemporaryFolder initWithURL:](self, "initWithURL:", 0);
}

- (FPArchiveTemporaryFolder)initWithURL:(id)a3
{
  id v6;
  FPArchiveTemporaryFolder *v7;
  FPArchiveTemporaryFolder *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v11.receiver = self;
  v11.super_class = (Class)FPArchiveTemporaryFolder;
  v7 = -[FPArchiveTemporaryFolder init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_url, a3);

  return v8;
}

- (id)temporaryFolderURLGetError:(id *)a3
{
  NSURL *temporaryFolderURL;
  BOOL v6;
  void *v7;
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;

  temporaryFolderURL = self->_temporaryFolderURL;
  if (temporaryFolderURL)
    goto LABEL_6;
  v6 = -[NSURL startAccessingSecurityScopedResource](self->_url, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, self->_url, 1, a3);
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v9 = self->_temporaryFolderURL;
  self->_temporaryFolderURL = v8;

  temporaryFolderURL = self->_temporaryFolderURL;
  if (temporaryFolderURL || !v6)
  {
    self->_didStartAccessing = v6;
LABEL_6:
    v10 = temporaryFolderURL;
    return v10;
  }
  -[NSURL stopAccessingSecurityScopedResource](self->_url, "stopAccessingSecurityScopedResource");
  v10 = 0;
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_didStartAccessing)
    -[NSURL stopAccessingSecurityScopedResource](self->_url, "stopAccessingSecurityScopedResource");
  v3.receiver = self;
  v3.super_class = (Class)FPArchiveTemporaryFolder;
  -[FPArchiveTemporaryFolder dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryFolderURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
