@implementation FlexSongAssetProvider_V1

- (FlexSongAssetProvider_V1)initWithFolderPath:(id)a3
{
  id v5;
  FlexSongAssetProvider_V1 *v6;
  FlexSongAssetProvider_V1 *v7;
  NSString *audioFileExtension;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FlexSongAssetProvider_V1;
  v6 = -[FlexSongAssetProvider_V1 init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootFolderPath, a3);
    audioFileExtension = v7->_audioFileExtension;
    v7->_audioFileExtension = (NSString *)CFSTR("m4a");

  }
  return v7;
}

- (id)urlToRoot
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_rootFolderPath(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(v5, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)urlToAudioContainerForSegmentType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_rootFolderPath(self, a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(v5, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)urlToAudioForSegment:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  if (a3)
  {
    v4 = a3;
    objc_msgSend_rootFolderPath(self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v4, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByAppendingPathComponent_(v9, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioFileExtension(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathExtension_(v18, v24, (uint64_t)v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v28, (uint64_t)v27, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  return v31;
}

- (NSString)rootFolderPath
{
  return self->_rootFolderPath;
}

- (void)setRootFolderPath:(id)a3
{
  objc_storeStrong((id *)&self->_rootFolderPath, a3);
}

- (NSString)audioFileExtension
{
  return self->_audioFileExtension;
}

- (void)setAudioFileExtension:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileExtension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileExtension, 0);
  objc_storeStrong((id *)&self->_rootFolderPath, 0);
}

@end
