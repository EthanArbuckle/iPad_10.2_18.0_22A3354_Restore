@implementation DIShadowNode

- (DIShadowNode)initWithURL:(id)a3 isCache:(BOOL)a4
{
  id v6;
  DIShadowNode *v7;
  DIURL *v8;
  DIURL *URL;
  FileLocalXPC *fileBackend;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIShadowNode;
  v7 = -[DIShadowNode init](&v12, sel_init);
  if (v7)
  {
    v8 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v6);
    URL = v7->_URL;
    v7->_URL = v8;

    v7->_isCache = a4;
    fileBackend = v7->_fileBackend;
    v7->_fileBackend = 0;
    v7->_numBlocks = 0;

  }
  return v7;
}

- (void)createBackendWithFlags:(int)a3
{
  FileLocalXPC *fileBackend;
  FileLocalXPC *v5;
  FileLocalXPC *v6;
  FileLocalXPC *v7;
  id v8;

  fileBackend = self->_fileBackend;
  self->_fileBackend = 0;

  v5 = [FileLocalXPC alloc];
  -[DIShadowNode URL](self, "URL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[FileLocalXPC initWithURL:fileOpenFlags:](v5, "initWithURL:fileOpenFlags:");
  v7 = self->_fileBackend;
  self->_fileBackend = v6;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowNode)initWithCoder:(id)a3
{
  id v4;
  DIShadowNode *v5;
  uint64_t v6;
  DIURL *URL;
  uint64_t v8;
  FileLocalXPC *fileBackend;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIShadowNode;
  v5 = -[DIShadowNode init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (DIURL *)v6;

    v5->_isCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCache"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileBackend"));
    v8 = objc_claimAutoreleasedReturnValue();
    fileBackend = v5->_fileBackend;
    v5->_fileBackend = (FileLocalXPC *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DIShadowNode URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("URL"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DIShadowNode isCache](self, "isCache"), CFSTR("isCache"));
  -[DIShadowNode fileBackend](self, "fileBackend");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("fileBackend"));

}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DIShadowNode URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DIShadowNode isCache](self, "isCache");
  v6 = CFSTR("Shadow");
  if (v5)
    v6 = CFSTR("Cache");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[DIShadowNode URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[DIShadowNode isCache](self, "isCache");
      v9 = v8 ^ objc_msgSend(v5, "isCache") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;

  -[DIShadowNode URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[DIShadowNode isCache](self, "isCache");
  v6 = 2221;
  if (v5)
    v6 = 2207;
  return v6 - v4 + 32 * v4 + 961;
}

- (DIURL)URL
{
  return self->_URL;
}

- (BOOL)isCache
{
  return self->_isCache;
}

- (FileLocalXPC)fileBackend
{
  return self->_fileBackend;
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileBackend, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
