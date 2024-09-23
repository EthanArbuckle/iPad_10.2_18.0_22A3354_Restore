@implementation KGErrorMarker

- (KGErrorMarker)initWithDatabaseURL:(id)a3
{
  id v4;
  KGErrorMarker *v5;
  uint64_t v6;
  NSURL *fileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGErrorMarker;
  v5 = -[KGErrorMarker init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("errormarker"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

  }
  return v5;
}

- (BOOL)markerExists
{
  int v2;
  int v3;

  v2 = open(-[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"), 0);
  v3 = v2;
  if ((v2 & 0x80000000) == 0)
    close(v2);
  return v3 >= 0;
}

- (id)readComment
{
  int v2;
  int v3;
  ssize_t v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  _BYTE v9[129];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = open(-[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"), 0);
  if (v2 < 0)
  {
    v5 = 0;
  }
  else
  {
    v3 = v2;
    v4 = read(v2, v9, 0x80uLL);
    if (v4 < 1)
    {
      v5 = 0;
    }
    else
    {
      v9[v4] = 0;
      v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, v4, 4);
    }
    close(v3);
  }
  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E83E6588;
  v7 = v6;

  return v7;
}

- (void)createWithComment:(id)a3
{
  id v4;
  int v5;
  int v6;
  size_t v7;
  char __s[129];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = open(-[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"), 514, 384);
  if ((v5 & 0x80000000) == 0)
  {
    v6 = v5;
    objc_msgSend(v4, "getCString:maxLength:encoding:", __s, 128, 4);
    v7 = strlen(__s);
    write(v6, __s, v7 + 1);
    close(v6);
  }

}

- (void)removeMarker
{
  unlink(-[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
