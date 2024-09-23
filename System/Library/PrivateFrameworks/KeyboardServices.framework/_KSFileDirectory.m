@implementation _KSFileDirectory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_KSFileDirectory)initWithCoder:(id)a3
{
  id v4;
  _KSFileDirectory *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *contents;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_KSFileDirectory;
  v5 = -[_KSFileEntry initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("contents"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    contents = v5->_contents;
    v5->_contents = (NSMutableDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_KSFileDirectory;
  v4 = a3;
  -[_KSFileEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contents, CFSTR("contents"), v5.receiver, v5.super_class);

}

- (_KSFileDirectory)initWithName:(id)a3
{
  _KSFileDirectory *v3;
  uint64_t v4;
  NSMutableDictionary *contents;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_KSFileDirectory;
  v3 = -[_KSFileEntry initWithName:](&v7, sel_initWithName_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    contents = v3->_contents;
    v3->_contents = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (_KSFileDirectory)initWithDirectory:(id)a3 captureContents:(BOOL)a4 storeRoot:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  __CFString *v10;
  _KSFileDirectory *v11;
  uint64_t v12;
  NSMutableDictionary *contents;
  id v14;
  DIR *v15;
  DIR *v16;
  dirent *v17;
  dirent *v18;
  void *v19;
  void *v20;
  int d_type;
  _KSFileDirectory *v22;
  _KSFileDirectory *v23;
  objc_super v25;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "lastPathComponent");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_24E206F98;
  }
  v25.receiver = self;
  v25.super_class = (Class)_KSFileDirectory;
  v11 = -[_KSFileEntry initWithName:](&v25, sel_initWithName_, v10);
  if (v5)

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    contents = v11->_contents;
    v11->_contents = (NSMutableDictionary *)v12;

    -[_KSFileEntry loadAttributesFromURL:](v11, "loadAttributesFromURL:", v9);
    if (v6)
    {
      v14 = objc_retainAutorelease(v9);
      v15 = opendir((const char *)objc_msgSend(v14, "fileSystemRepresentation"));
      if (v15)
      {
        v16 = v15;
        v17 = readdir(v15);
        if (v17)
        {
          v18 = v17;
          while (1)
          {
            if (!strcmp(v18->d_name, ".") || !strcmp(v18->d_name, ".."))
              goto LABEL_19;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18->d_name);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "URLByAppendingPathComponent:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            d_type = v18->d_type;
            if (d_type == 8)
              break;
            if (d_type == 4)
            {
              v22 = -[_KSFileDirectory initWithDirectory:captureContents:storeRoot:]([_KSFileDirectory alloc], "initWithDirectory:captureContents:storeRoot:", v20, 1, 1);
LABEL_17:
              v23 = v22;
              -[_KSFileDirectory addEntry:](v11, "addEntry:", v22);

            }
LABEL_19:
            v18 = readdir(v16);
            if (!v18)
              goto LABEL_20;
          }
          v22 = -[_KSFileFile initWithURL:]([_KSFileFile alloc], "initWithURL:", v20);
          goto LABEL_17;
        }
LABEL_20:
        closedir(v16);
      }
    }
  }

  return v11;
}

- (void)addEntry:(id)a3
{
  NSMutableDictionary *contents;
  id v4;
  id v5;

  contents = self->_contents;
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](contents, "setObject:forKey:", v4, v5);

}

- (void)removeEntryWithName:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_contents, "removeObjectForKey:", a3);
}

- (id)entryForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contents, "objectForKey:", a3);
}

- (NSArray)contents
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_contents, "allKeys");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[NSMutableDictionary allValues](self->_contents, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)performOnEverything:(id)a3
{
  id v4;
  _KSFileDirectory *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_KSFileDirectory;
  -[_KSFileEntry performOnEverything:](&v14, sel_performOnEverything_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self;
  v6 = -[_KSFileDirectory countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "performOnEverything:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[_KSFileDirectory countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)_KSFileDirectory;
  -[_KSFileEntry description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %@>"), v4, self->_contents);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)consistencyCheck
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)_KSFileDirectory;
  -[_KSFileEntry consistencyCheck](&v12, sel_consistencyCheck);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSMutableDictionary allValues](self->_contents, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "consistencyCheck");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)restoreToPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_KSFileEntry name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[_KSFileEntry name](self, "name"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", &stru_24E206F98),
        v7,
        v6,
        !v8))
  {
    -[_KSFileEntry name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
    {
      v9 = objc_retainAutorelease(v9);
      mkdir((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0x1EDu);
    }
  }
  else
  {
    v9 = v4;
  }
  -[_KSFileEntry saveAttributesToURL:](self, "saveAttributesToURL:", v9);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_contents, "allValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "restoreToPath:", v9);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (id)findEntryWithComparison:(id)a3 recursively:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t (**v6)(id, void *);
  _KSFileDirectory *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (**)(id, void *))a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self;
  v8 = -[_KSFileDirectory countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "name", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v6[2](v6, v13);

        if (v14)
        {
          v15 = v12;
LABEL_14:
          v16 = v15;
          goto LABEL_15;
        }
        if (v4)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "findEntryWithComparison:recursively:", v6, 1);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            if (v15)
              goto LABEL_14;
          }
        }
      }
      v9 = -[_KSFileDirectory countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
