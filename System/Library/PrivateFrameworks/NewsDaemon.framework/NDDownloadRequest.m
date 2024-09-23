@implementation NDDownloadRequest

- (NDDownloadRequest)initWithContentID:(id)a3 options:(int64_t)a4
{
  id v6;
  NDDownloadRequest *v7;
  uint64_t v8;
  NSString *contentID;
  uint64_t v10;
  _QWORD v12[5];
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NDDownloadRequest;
  v7 = -[NDDownloadRequest init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    contentID = v7->_contentID;
    v7->_contentID = (NSString *)v8;

    v10 = MEMORY[0x1E0C809B0];
    v7->_options = a4;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __47__NDDownloadRequest_initWithContentID_options___block_invoke;
    v12[3] = &unk_1E9BD9E38;
    v12[4] = v6;
    v7->_contentType = __47__NDDownloadRequest_initWithContentID_options___block_invoke((uint64_t)v12);
  }

  return v7;
}

uint64_t __47__NDDownloadRequest_initWithContentID_options___block_invoke(uint64_t a1)
{
  id *v1;

  v1 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", *MEMORY[0x1E0D58238]) & 1) != 0)
    return 0;
  if ((objc_msgSend(*v1, "hasPrefix:", CFSTR("N")) & 1) != 0)
    return 1;
  if ((objc_msgSend(*v1, "hasPrefix:", *MEMORY[0x1E0D584B8]) & 1) != 0)
    return 2;
  if ((objc_msgSend(*v1, "hasPrefix:", *MEMORY[0x1E0D58758]) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __47__NDDownloadRequest_initWithContentID_options___block_invoke_cold_1(v1);
    return 0;
  }
  return 3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NDDownloadRequest contentID](self, "contentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[NDDownloadRequest options](self, "options");
      v9 = v8 == objc_msgSend(v5, "options");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NDDownloadRequest contentID](self, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NDDownloadRequest options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D58AB0]), "initWithObject:", self);
  v4 = -[NDDownloadRequest contentType](self, "contentType") - 1;
  if (v4 > 2)
    v5 = CFSTR("Article");
  else
    v5 = off_1E9BD9E58[v4];
  objc_msgSend(v3, "addField:object:", CFSTR("type"), v5);
  -[NDDownloadRequest contentID](self, "contentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("id"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NDDownloadRequest options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("options"), v7);

  objc_msgSend(v3, "descriptionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDDownloadRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NDDownloadRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  v7 = -[NDDownloadRequest initWithContentID:options:](self, "initWithContentID:options:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NDDownloadRequest contentID](self, "contentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("contentID"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[NDDownloadRequest options](self, "options"), CFSTR("options"));
}

- (NSString)articleID
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[NDDownloadRequest contentType](self, "contentType");
  if (v3 == 1)
  {
    -[NDDownloadRequest contentID](self, "contentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NDArticleIDFromAudioContentID(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[NDDownloadRequest contentID](self, "contentID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)issueID
{
  void *v3;

  if (-[NDDownloadRequest contentType](self, "contentType") == 2)
  {
    -[NDDownloadRequest contentID](self, "contentID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)puzzleID
{
  void *v3;

  if (-[NDDownloadRequest contentType](self, "contentType") == 3)
  {
    -[NDDownloadRequest contentID](self, "contentID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentID, 0);
}

void __47__NDDownloadRequest_initWithContentID_options___block_invoke_cold_1(_QWORD *a1)
{
  void *v1;
  uint8_t buf[4];
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown content type for identifier: %@"), *a1);
  *(_DWORD *)buf = 136315906;
  v3 = "-[NDDownloadRequest initWithContentID:options:]_block_invoke";
  v4 = 2080;
  v5 = "NDDownloadRequest.m";
  v6 = 1024;
  v7 = 45;
  v8 = 2114;
  v9 = v1;
  _os_log_error_impl(&dword_1D7105000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
