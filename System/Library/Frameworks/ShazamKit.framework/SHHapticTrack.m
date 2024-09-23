@implementation SHHapticTrack

- (SHHapticTrack)initWithFileIdentifier:(id)a3 hapticData:(id)a4 algorithm:(id)a5
{
  id v9;
  id v10;
  id v11;
  SHHapticTrack *v12;
  SHHapticTrack *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHHapticTrack;
  v12 = -[SHHapticTrack init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileIdentifier, a3);
    objc_storeStrong((id *)&v13->_hapticData, a4);
    objc_storeStrong((id *)&v13->_algorithm, a5);
  }

  return v13;
}

- (NSURL)fileURL
{
  NSURL *fileURL;
  NSURL *v4;
  NSURL *v5;

  fileURL = self->_fileURL;
  if (!fileURL)
  {
    -[SHHapticTrack hapticFileURL](self, "hapticFileURL");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fileURL;
    self->_fileURL = v4;

    fileURL = self->_fileURL;
  }
  return fileURL;
}

- (NSFileManager)fileManager
{
  NSFileManager *fileManager;
  NSFileManager *v4;
  NSFileManager *v5;

  fileManager = self->_fileManager;
  if (!fileManager)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (NSFileManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fileManager;
    self->_fileManager = v4;

    fileManager = self->_fileManager;
  }
  return fileManager;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHHapticTrack)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SHHapticTrack *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHHapticItemFileIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHHapticItemHapticDataKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHHapticItemAlgorithmKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SHHapticTrack initWithFileIdentifier:hapticData:algorithm:](self, "initWithFileIdentifier:hapticData:algorithm:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SHHapticTrack fileIdentifier](self, "fileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SHHapticItemFileIdentifierKey"));

  -[SHHapticTrack hapticData](self, "hapticData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SHHapticItemHapticDataKey"));

  -[SHHapticTrack algorithm](self, "algorithm");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SHHapticItemAlgorithmKey"));

}

- (id)hapticFileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SHHapticTrack destinationURLForHapticFile](self, "destinationURLForHapticFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    sh_log_object();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[SHHapticTrack fileIdentifier](self, "fileIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_218BF1000, v9, OS_LOG_TYPE_DEBUG, "Could not create file path to save haptic file with identifier %@", (uint8_t *)&v18, 0xCu);

    }
    goto LABEL_16;
  }
  -[SHHapticTrack fileManager](self, "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:", v5) & 1) != 0)
  {
    -[SHHapticTrack fileManager](self, "fileManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "removeItemAtURL:error:", v3, 0);

    if ((v7 & 1) == 0)
    {
      sh_log_object();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v3;
        _os_log_impl(&dword_218BF1000, v8, OS_LOG_TYPE_INFO, "Returning existing ahap url %@", (uint8_t *)&v18, 0xCu);
      }

      goto LABEL_12;
    }
  }
  else
  {

  }
  -[SHHapticTrack fileManager](self, "fileManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHHapticTrack hapticData](self, "hapticData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v12, v13, 0);

  if ((v14 & 1) == 0)
  {
    sh_log_object();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_218BF1000, v16, OS_LOG_TYPE_ERROR, "Failed to copy haptic file from source bundle to destination.", (uint8_t *)&v18, 2u);
    }

LABEL_16:
    v15 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v15 = v3;
LABEL_17:

  return v15;
}

- (id)destinationURLForHapticFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[SHHapticTrack fileManager](self, "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporaryDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("MusicHaptics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHHapticTrack fileManager](self, "fileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) == 0)
  {
    -[SHHapticTrack fileManager](self, "fileManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v21);
    v11 = v21;

    if ((v10 & 1) == 0)
    {
      sh_log_object();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v11;
        _os_log_impl(&dword_218BF1000, v12, OS_LOG_TYPE_ERROR, "Could not create folder for haptic files, using temporary directory %@", buf, 0xCu);
      }

      -[SHHapticTrack fileManager](self, "fileManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "temporaryDirectory");
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v14;
    }

  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  -[SHHapticTrack fileIdentifier](self, "fileIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHHapticTrack algorithm](self, "algorithm");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@_%@"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:conformingToType:", v18, *MEMORY[0x24BDF8260]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (NSString)fileIdentifier
{
  return self->_fileIdentifier;
}

- (NSData)hapticData
{
  return self->_hapticData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticData, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
