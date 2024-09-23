@implementation ICRemoteFileWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICRemoteFileWrapper)initWithRemoteURL:(id)a3
{
  id v4;
  ICRemoteFileWrapper *v5;
  ICRemoteFileWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICRemoteFileWrapper;
  v5 = -[ICRemoteFileWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICRemoteFileWrapper setRemoteURL:](v5, "setRemoteURL:", v4);

  return v6;
}

- (ICRemoteFileWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICRemoteFileWrapper *v6;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[ICRemoteFileWrapper initWithRemoteURL:](self, "initWithRemoteURL:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    -[ICRemoteFileWrapper remoteURL](self, "remoteURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("remoteURL"));

  }
}

- (BOOL)isSymbolicLink
{
  return 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (id)filename
{
  void *v2;
  void *v3;

  -[ICRemoteFileWrapper remoteURL](self, "remoteURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fileAttributes
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)fileWrappers
{
  return 0;
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 originalContentsURL:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  char v11;

  v8 = a3;
  -[ICRemoteFileWrapper dataWithError:](self, "dataWithError:", a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "writeToURL:options:error:", v8, 0, a6);
  else
    v11 = 0;

  return v11;
}

- (id)regularFileContents
{
  void *v2;
  id v3;
  void *v4;
  id v6;

  v6 = 0;
  -[ICRemoteFileWrapper dataWithError:](self, "dataWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v4 = v3;
  if (v3)
    NSLog(CFSTR("Error loading data for remote file wrapper: %@"), v3);

  return v2;
}

- (id)dataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICRemoteFileWrapper cachedData](self, "cachedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D50];
    -[ICRemoteFileWrapper remoteURL](self, "remoteURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithContentsOfURL:options:error:", v7, 0, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRemoteFileWrapper setCachedData:](self, "setCachedData:", v8);

  }
  return -[ICRemoteFileWrapper cachedData](self, "cachedData");
}

- (id)serializedRepresentation
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper serializedRepresentation]", v5);

  return 0;
}

- (BOOL)matchesContentsOfURL:(id)a3
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper matchesContentsOfURL:]", v6);

  return 0;
}

- (BOOL)readFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper readFromURL:options:error:]", v8);

  return 0;
}

- (id)addFileWrapper:(id)a3
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper addFileWrapper:]", v6);

  return 0;
}

- (void)removeFileWrapper:(id)a3
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper removeFileWrapper:]", v6);

}

- (id)addRegularFileWithContents:(id)a3 preferredFilename:(id)a4
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper addRegularFileWithContents:preferredFilename:]", v7);

  return 0;
}

- (id)keyForFileWrapper:(id)a3
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper keyForFileWrapper:]", v6);

  return 0;
}

- (id)symbolicLinkDestinationURL
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Cannot call %s on %@"), "-[ICRemoteFileWrapper symbolicLinkDestinationURL]", v5);

  return 0;
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
  objc_storeStrong((id *)&self->_remoteURL, a3);
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
}

@end
