@implementation MSMMCSProtocol

- (MSMMCSProtocol)initWithPersonID:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  MSMMCSProtocol *v9;
  MSMMCSProtocol *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  objc_super v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSMMCSProtocol;
  v9 = -[MSMMCSProtocol init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_MMCSDirPath, a4);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    v12 = *MEMORY[0x1E0D46740];
    v24[0] = *MEMORY[0x1E0D46738];
    v24[1] = v12;
    v25[0] = MEMORY[0x1E0C9AAB0];
    v25[1] = MEMORY[0x1E0C9AAB0];
    v24[2] = *MEMORY[0x1E0D46730];
    v25[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99748]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getCFRunLoop");
    MSPlatform();
    v16 = v8;
    v17 = a3;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appBundleInfoString");
    v10->_engine = (_mmcs_engine *)MMCSEngineCreate();

    v7 = v18;
    objc_storeStrong((id *)&v10->_engineDirPath, a4);
    v20 = v17;
    v8 = v16;
    objc_storeStrong((id *)&v10->_personID, v20);

  }
  return v10;
}

- (void)deactivate
{
  -[MSMMCSProtocol deactivateRemoveAllFiles:](self, "deactivateRemoveAllFiles:", 0);
}

- (void)deactivateRemoveAllFiles:(BOOL)a3
{
  _BOOL4 v3;
  NSString *personID;
  NSString *engineDirPath;
  void *v7;
  NSString *MMCSDirPath;
  uint8_t v9[16];

  v3 = a3;
  if (self->_engine)
  {
    MMCSEngineDestroy();
    self->_engine = 0;
  }
  personID = self->_personID;
  self->_personID = 0;

  engineDirPath = self->_engineDirPath;
  self->_engineDirPath = 0;

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Removing database.", v9, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", self->_MMCSDirPath, 0);

  }
  MMCSDirPath = self->_MMCSDirPath;
  self->_MMCSDirPath = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MSMMCSProtocol deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)MSMMCSProtocol;
  -[MSMMCSProtocol dealloc](&v3, sel_dealloc);
}

- (void)abort
{
  MMCSEngineCancelRequests();
}

- (void)didFinishUsingAssets:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataItemID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v9, "unsignedLongLongValue");
          MMCSUnregisterFile();
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (int)_getFileDescriptorFromItem:(unint64_t)a3
{
  __assert_rtn("-[MSMMCSProtocol _getFileDescriptorFromItem:]", "MSMMCSProtocol.m", 188, "0");
}

- (id)_getUTIFromItem:(unint64_t)a3
{
  return 0;
}

- (void)_getItemDone:(unint64_t)a3 path:(id)a4 error:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a5;
  __assert_rtn("-[MSMMCSProtocol _getItemDone:path:error:]", "MSMMCSProtocol.m", 197, "0");
}

- (void)_putItemDone:(unint64_t)a3 putReceipt:(id)a4 error:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a5;
  __assert_rtn("-[MSMMCSProtocol _putItemDone:putReceipt:error:]", "MSMMCSProtocol.m", 201, "0");
}

- (void)_requestCompleted
{
  __assert_rtn("-[MSMMCSProtocol _requestCompleted]", "MSMMCSProtocol.m", 205, "0");
}

- (NSString)personID
{
  return self->_personID;
}

- (_mmcs_engine)engine
{
  return self->_engine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineDirPath, 0);
  objc_storeStrong((id *)&self->_MMCSDirPath, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

+ (id)computeItemIDForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MSAssetMetadataItemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = (void *)__masterManifest_1072;
    if (!__masterManifest_1072)
    {
      MSPathMMCSMasterManifest();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(v11, "propertyListWithData:options:format:error:", v12, 1, 0, &v28);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v28;
        v15 = (void *)__masterManifest_1072;
        __masterManifest_1072 = v13;

        if (!__masterManifest_1072 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v14;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to deserialize MMCS master manifest: %{public}@", buf, 0xCu);
        }

      }
      if (!__masterManifest_1072)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v17 = (void *)__masterManifest_1072;
        __masterManifest_1072 = (uint64_t)v16;

      }
      v7 = (void *)__masterManifest_1072;
    }
    v18 = v7;
    objc_msgSend(v18, "objectForKey:", CFSTR("nextFileID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = objc_msgSend(v19, "unsignedLongLongValue") + 1;
    }
    else
    {
      v22 = arc4random();
      v21 = arc4random() | (unint64_t)(v22 << 32);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v23, CFSTR("nextFileID"));

    v24 = (void *)__masterManifest_1072;
    MSPathMMCSMasterManifest();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "writeToFile:atomically:", v25, 1);

    objc_msgSend(v6, "numberWithUnsignedLongLong:", v21);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v26, "setObject:forKey:", v5, CFSTR("MSAssetMetadataItemID"));
    objc_msgSend(v3, "setMetadata:", v26);

  }
  return v5;
}

@end
