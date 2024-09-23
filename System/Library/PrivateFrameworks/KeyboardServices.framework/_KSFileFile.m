@implementation _KSFileFile

+ (int)protectionFromURL:(id)a3
{
  int v3;
  int v4;
  int v5;

  v3 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 256, 0, 1);
  if (v3 < 0)
    return -1;
  v4 = v3;
  v5 = fcntl(v3, 63);
  close(v4);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_KSFileFile)initWithCoder:(id)a3
{
  id v4;
  _KSFileFile *v5;
  uint64_t v6;
  NSDate *lastModified;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_KSFileFile;
  v5 = -[_KSFileEntry initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_offset = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("offset"));
    v5->_size = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("size"));
    v5->_protectionClass = objc_msgSend(v4, "decodeIntForKey:", CFSTR("class"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastmodified"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastModified = v5->_lastModified;
    v5->_lastModified = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_KSFileFile;
  v4 = a3;
  -[_KSFileEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", -[_KSFileEntry addBlobToFile:](self, "addBlobToFile:", self, v5.receiver, v5.super_class), CFSTR("offset"));
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_size), CFSTR("size"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_protectionClass, CFSTR("class"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastModified, CFSTR("lastmodified"));

}

- (_KSFileFile)initWithURL:(id)a3
{
  id v5;
  void *v6;
  _KSFileFile *v7;
  NSURL **p_url;
  stat v10;
  objc_super v11;

  v5 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)_KSFileFile;
  v7 = -[_KSFileEntry initWithName:](&v11, sel_initWithName_, v6);

  if (v7)
  {
    p_url = &v7->_url;
    objc_storeStrong((id *)&v7->_url, a3);
    memset(&v10, 0, sizeof(v10));
    if (stat(-[NSURL fileSystemRepresentation](v7->_url, "fileSystemRepresentation"), &v10) == -1)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0C88], CFSTR("Can't stat %@"), *p_url);
    v7->_size = v10.st_size;
    -[_KSFileFile loadAttributesFromURL:](v7, "loadAttributesFromURL:", *p_url);
  }

  return v7;
}

- (void)loadAttributesFromURL:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_KSFileFile;
  v4 = a3;
  -[_KSFileEntry loadAttributesFromURL:](&v9, sel_loadAttributesFromURL_, v4);
  self->_protectionClass = objc_msgSend((id)objc_opt_class(), "protectionFromURL:", self->_url);
  v8 = 0;
  v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v8, *MEMORY[0x24BDBCBE0], 0);

  v6 = v8;
  v7 = v8;
  if (v5)
    objc_storeStrong((id *)&self->_lastModified, v6);

}

- (void)saveAttributesToURL:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_KSFileFile;
  v4 = a3;
  -[_KSFileEntry saveAttributesToURL:](&v5, sel_saveAttributesToURL_, v4);
  objc_msgSend(v4, "setResourceValue:forKey:error:", self->_lastModified, *MEMORY[0x24BDBCBE0], 0, v5.receiver, v5.super_class);

}

- (void)saveTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;

  v4 = a3;
  -[_KSFileFile contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = open_dprotected_np((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 1573, self->_protectionClass, 0, 384);
    if (v7 < 0)
    {
      KSCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_KSFileFile saveTo:].cold.2();

    }
    else
    {
      v8 = v7;
      v9 = objc_retainAutorelease(v5);
      write(v8, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
      close(v8);
      -[_KSFileFile saveAttributesToURL:](self, "saveAttributesToURL:", v6);
    }
  }
  else
  {
    KSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_KSFileFile saveTo:].cold.1();

  }
}

- (id)contents
{
  NSURL *url;
  void *v3;

  url = self->_url;
  if (url)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", url, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->super._fileBlob)
  {
    -[NSData subdataWithRange:](self->super._fileBlob, "subdataWithRange:", self->_offset, self->_size);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@: Don't have URL or Data"), self);
    v3 = 0;
  }
  return v3;
}

- (unint64_t)size
{
  return self->_size;
}

- (id)lastModified
{
  return self->_lastModified;
}

- (id)URL
{
  NSURL *url;
  NSURL *v3;
  void *v5;
  char v6;

  url = self->_url;
  if (!url)
  {
    if (self->super._fileBlob)
    {
      -[_KSFileEntry temporaryFileNameForType:](self, "temporaryFileNameForType:", CFSTR("UserWordStore"));
      v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
      -[NSData subdataWithRange:](self->super._fileBlob, "subdataWithRange:", self->_offset, self->_size);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "writeToURL:atomically:", v3, 1);

      if ((v6 & 1) != 0)
        return v3;

    }
    v3 = 0;
    return v3;
  }
  v3 = url;
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  NSURL *url;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)_KSFileFile;
  -[_KSFileEntry description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_KSFileFile size](self, "size");
  v6 = v5;
  url = self->_url;
  if (url)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %i bytes; %@>"), v4, v5, url);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("serialised (offset %i)"), self->_offset);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %i bytes; %@>"), v4, v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)consistencyCheck
{
  NSURL *url;
  NSData *fileBlob;
  unint64_t v5;
  unint64_t offset;
  unint64_t size;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_KSFileFile;
  -[_KSFileEntry consistencyCheck](&v13, sel_consistencyCheck);
  url = self->_url;
  if (url)
  {
    if (!-[NSURL checkResourceIsReachableAndReturnError:](url, "checkResourceIsReachableAndReturnError:", 0))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ refers to URL %@ but it is inaccessible"), self, self->_url);
  }
  else
  {
    fileBlob = self->super._fileBlob;
    if (fileBlob)
    {
      v5 = -[NSData length](fileBlob, "length");
      offset = self->_offset;
      size = self->_size;
      if (v5 < size + offset)
      {
        v8 = (void *)MEMORY[0x24BDBCE88];
        v9 = *MEMORY[0x24BDBCAB0];
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "raise:format:", v9, CFSTR("%@ contains invalid offset %lu size %lu into <%@; %lu bytes>"),
          self,
          offset,
          size,
          v11,
          -[NSData length](self->super._fileBlob, "length"));

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ contains no content provider"), self, v12);
    }
  }
}

- (void)restoreToPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_KSFileEntry name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_KSFileFile saveTo:](self, "saveTo:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)saveTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21DFEB000, v0, v1, "%s  Unable to find contents of %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)saveTo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21DFEB000, v0, v1, "%s  Unable to create file at %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

@end
