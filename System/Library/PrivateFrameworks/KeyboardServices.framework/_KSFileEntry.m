@implementation _KSFileEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)entryWithSerialisedDataAtURL:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD *v6;
  id v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = (_QWORD *)MEMORY[0x24BDBCAB0];
  if (v5 <= 0xF)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Input file '%@' smaller than minimum header size (size %lu, minimum %lu)"), v3, objc_msgSend(v4, "length"), 16);
  v7 = objc_retainAutorelease(v4);
  v8 = (unsigned int *)objc_msgSend(v7, "bytes");
  v9 = *v8;
  if ((_DWORD)v9)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v6, CFSTR("Input file '%@' incorrect version (contains %i, expected %i)"), v3, v9, 0);
  v10 = *((_QWORD *)v8 + 1);
  if (v10 + 16 > (unint64_t)objc_msgSend(v7, "length"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v6, CFSTR("Input file '%@' too short to contain serialised directory (size %lu, expected %lu)"), v3, objc_msgSend(v7, "length"), v10 + 16);
  objc_msgSend(v7, "subdataWithRange:", 16, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  if (v13)
  {
    KSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[_KSFileEntry entryWithSerialisedDataAtURL:].cold.1(v13, v14);

  }
  if (!v12)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v6, CFSTR("Input file '%@' didn't deserialise directory"), v3);
  v15 = *((_QWORD *)v8 + 1);
  v16 = objc_msgSend(v7, "length");
  if (v16 > objc_msgSend(v7, "length"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v6, CFSTR("Input file '%@' missing padding (size %lu, expected %lu)"), v3, objc_msgSend(v7, "length"), v16);
  objc_msgSend(v7, "subdataWithRange:", ((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v16 - (((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __45___KSFileEntry_entryWithSerialisedDataAtURL___block_invoke;
  v20[3] = &unk_24E2056E0;
  v21 = v17;
  v18 = v17;
  objc_msgSend(v12, "performOnEverything:", v20);
  objc_msgSend(v12, "consistencyCheck");

  return v12;
}

- (id)serialiseToTemporaryFile
{
  id v3;
  ssize_t v4;
  ssize_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD __buf[2];
  _QWORD v25[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[_KSFileEntry temporaryFileNameForType:](self, "temporaryFileNameForType:", CFSTR("UserWordStore"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 1573, 384);
  if ((v4 & 0x80000000) != 0)
  {
    v18 = 0;
  }
  else
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __40___KSFileEntry_serialiseToTemporaryFile__block_invoke;
    v25[3] = &unk_24E2056E0;
    v7 = v6;
    v26 = v7;
    -[_KSFileEntry performOnEverything:](self, "performOnEverything:", v25);
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSFileEntry performOnEverything:](self, "performOnEverything:", &__block_literal_global_4);
    __buf[0] = 0;
    __buf[1] = objc_msgSend(v8, "length");
    write(v5, __buf, 0x10uLL);
    v9 = objc_retainAutorelease(v8);
    write(v5, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    WritePadding(v5, objc_msgSend(v9, "length"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x2207A8B6C]();
          objc_msgSend(v15, "contents");
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          write(v5, (const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
          WritePadding(v5, objc_msgSend(v17, "length"));

          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v12);
    }

    close(v5);
    v18 = v3;

  }
  return v18;
}

- (id)temporaryFileNameForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *tempFiles;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  +[_KSUserWordsSynchroniser generateKeyWithSize:](_KSUserWordsSynchroniser, "generateKeyWithSize:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_KSUserWordsSynchroniser generateRecordNameForFilename:withKey:](_KSUserWordsSynchroniser, "generateRecordNameForFilename:withKey:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(".%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  tempFiles = self->_tempFiles;
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_retainAutorelease(v11);
  objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](tempFiles, "addObject:", v15);

  return v14;
}

- (_KSFileEntry)initWithName:(id)a3
{
  id v5;
  _KSFileEntry *v6;
  _KSFileEntry *v7;
  uint64_t v8;
  NSMutableDictionary *extendedAttributes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSFileEntry;
  v6 = -[_KSFileEntry init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    extendedAttributes = v7->_extendedAttributes;
    v7->_extendedAttributes = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (_KSFileEntry)initWithCoder:(id)a3
{
  id v4;
  _KSFileEntry *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *extendedAttributes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_KSFileEntry;
  v5 = -[_KSFileEntry init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("eattr"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    extendedAttributes = v5->_extendedAttributes;
    v5->_extendedAttributes = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_tempFiles;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++)), "UTF8String"));
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_KSFileEntry;
  -[_KSFileEntry dealloc](&v8, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extendedAttributes, CFSTR("eattr"));

}

- (unint64_t)addBlobToFile:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_fileArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 += (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "size", (_QWORD)v12) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[NSMutableArray addObject:](self->_fileArray, "addObject:", v4);
  return v8;
}

- (void)performOnEverything:(id)a3
{
  (*((void (**)(id, _KSFileEntry *))a3 + 2))(a3, self);
}

- (void)loadAttributesFromURL:(id)a3
{
  id v4;
  const char *v5;
  ssize_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  char *v11;
  ssize_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  ssize_t v26;
  void *v27;
  id v28;
  void *v29;
  NSMutableDictionary *extendedAttributes;
  void *v31;
  NSMutableDictionary *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = listxattr(v5, 0, 0, 0);
  if (v6 == -1)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB0];
    v9 = *__error();
    v10 = __error();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unable to find size of extended attributes for '%@': %i: %s"), v4, v9, strerror(*v10));
  }
  v11 = (char *)malloc_type_malloc(v6, 0x491080D4uLL);
  if (!v11)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Unable to allocate memory for extended attributes for '%@' (%zi bytes)"), v4, v6);
  v12 = listxattr(v5, v11, v6, 0);
  v13 = (void *)v12;
  v31 = v4;
  if (v12)
  {
    if (v12 == -1)
    {
      free(v11);
      v14 = (void *)MEMORY[0x24BDBCE88];
      v15 = *MEMORY[0x24BDBCAB0];
      v16 = *__error();
      v17 = __error();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Unable to load extended attributes for '%@': %i: %s"), v4, v16, strerror(*v17), v4);
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v11, v13, 4);
    objc_msgSend(v18, "componentsSeparatedByString:", &stru_24E206F78);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  free(v11);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_msgSend(v24, "isEqualToString:", &stru_24E206F98) & 1) == 0)
        {
          v25 = objc_retainAutorelease(v24);
          v26 = getxattr(v5, (const char *)objc_msgSend(v25, "UTF8String"), 0, 0, 0, 0);
          v27 = malloc_type_malloc(v26, 0x7AAA60C7uLL);
          v28 = objc_retainAutorelease(v25);
          getxattr(v5, (const char *)objc_msgSend(v28, "UTF8String"), v27, v26, 0, 0);
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v27, v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setValue:forKey:](v32, "setValue:forKey:", v29, v28);

          free(v27);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v21);
  }

  extendedAttributes = self->_extendedAttributes;
  self->_extendedAttributes = v32;

}

- (void)saveAttributesToURL:(id)a3
{
  const char *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_extendedAttributes;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_extendedAttributes, "objectForKey:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
        v13 = objc_retainAutorelease(v11);
        setxattr(v4, v12, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 0, 0);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
  v7.super_class = (Class)_KSFileEntry;
  -[_KSFileEntry description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; \"%@\" (extended attributes %@)>"),
    v4,
    self->_name,
    self->_extendedAttributes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)consistencyCheck
{
  if (!self->_name)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ missing name"), self);
  if (!self->_extendedAttributes)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ missing extended attributes"), self);
}

- (void)restoreToPath:(id)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Base class doesn't know how to restore itself"));
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableDictionary)extendedAttributes
{
  return self->_extendedAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileBlob, 0);
  objc_storeStrong((id *)&self->_fileArray, 0);
  objc_storeStrong((id *)&self->_tempFiles, 0);
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)entryWithSerialisedDataAtURL:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21DFEB000, a2, OS_LOG_TYPE_ERROR, "%s  couldn't decode data: %@", (uint8_t *)v4, 0x16u);

}

@end
