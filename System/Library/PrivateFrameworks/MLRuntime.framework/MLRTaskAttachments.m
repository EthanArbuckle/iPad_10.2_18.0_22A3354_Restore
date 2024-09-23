@implementation MLRTaskAttachments

- (MLRTaskAttachments)initWithURLs:(id)a3
{
  id v4;
  MLRTaskAttachments *v5;
  uint64_t v6;
  NSArray *attachmentURLs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLRTaskAttachments;
  v5 = -[MLRTaskAttachments init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attachmentURLs = v5->_attachmentURLs;
    v5->_attachmentURLs = (NSArray *)v6;

  }
  return v5;
}

- (MLRTaskAttachments)initWithDESRecipe:(id)a3
{
  void *v4;
  MLRTaskAttachments *v5;

  if (a3)
  {
    objc_msgSend(a3, "attachments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MLRTaskAttachments initWithURLs:](self, "initWithURLs:", v4);

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MLRTaskAttachments)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  MLRTaskAttachments *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "URLByResolvingSymlinksInPath");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Nil URL"), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x212BD80FC]();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, MEMORY[0x24BDBD1A8], 0, &__block_literal_global_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v16, "hasDirectoryPath", (_QWORD)v21) & 1) == 0)
        {
          objc_msgSend(v16, "URLByStandardizingPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  objc_autoreleasePoolPop(v8);
  v18 = -[MLRTaskAttachments initWithURLs:](self, "initWithURLs:", v7);

  return v18;
}

uint64_t __50__MLRTaskAttachments_initWithContentsOfURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "code") != 260)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_2112F5000, v6, OS_LOG_TYPE_DEFAULT, "Fail to enumerate %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)\n"), v5, self->_attachmentURLs);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attachmentURLsForBasename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_attachmentURLs;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "lastPathComponent", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasSuffix:", v4);

        if (v14)
        {
          objc_msgSend(v12, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "fileExistsAtPath:", v15);

          if (v16)
            objc_msgSend(v5, "addObject:", v12);
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_attachmentURLs, CFSTR("attachmentURLs"));
}

- (MLRTaskAttachments)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  MLRTaskAttachments *v9;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("attachmentURLs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MLRTaskAttachments initWithURLs:](self, "initWithURLs:", v8);
  return v9;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentURLs, 0);
}

@end
