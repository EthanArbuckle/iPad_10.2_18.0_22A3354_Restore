@implementation FlexSongAssetProvider_V2

- (FlexSongAssetProvider_V2)initWithFolderPath:(id)a3 audioFileExtension:(id)a4
{
  id v7;
  id v8;
  FlexSongAssetProvider_V2 *v9;
  FlexSongAssetProvider_V2 *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FlexSongAssetProvider_V2;
  v9 = -[FlexSongAssetProvider_V2 init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootFolderPath, a3);
    objc_storeStrong((id *)&v10->_audioFileExtension, a4);
  }

  return v10;
}

- (BOOL)assetsAreLocal
{
  return 1;
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

- (id)_folderNameForSegmentType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("?");
  else
    return off_24C5EFFB8[a3 - 1];
}

- (id)urlToAudioContainerForSegmentType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  objc_msgSend__folderNameForSegmentType_(self, a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootFolderPath(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v11, v12, (uint64_t)v6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)urlToAudioForSegment:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  if (a3)
  {
    v4 = a3;
    v9 = objc_msgSend_type(v4, v5, v6, v7, v8);
    objc_msgSend__folderNameForSegmentType_(self, v10, v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rootFolderPath(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v18, v19, (uint64_t)v13, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_name(v4, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByAppendingPathComponent_(v22, v28, (uint64_t)v27, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_audioFileExtension(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathExtension_(v31, v37, (uint64_t)v36, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v41, (uint64_t)v40, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = 0;
  }
  return v44;
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
