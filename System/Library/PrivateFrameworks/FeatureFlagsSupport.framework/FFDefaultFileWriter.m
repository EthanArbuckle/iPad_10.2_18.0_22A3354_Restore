@implementation FFDefaultFileWriter

- (FFDefaultFileWriter)init
{
  FFDefaultFileWriter *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSDictionary *fileAttributes;
  uint64_t v8;
  NSDictionary *dirAttributes;
  objc_super v11;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  uint64_t v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)FFDefaultFileWriter;
  v2 = -[FFDefaultFileWriter init](&v11, sel_init);
  if (v2)
  {
    v4 = *MEMORY[0x1E0CB2A50];
    v14[0] = *MEMORY[0x1E0CB2A90];
    v3 = v14[0];
    v14[1] = v4;
    v16[0] = &unk_1E9882648;
    v16[1] = &unk_1E9882648;
    v15 = *MEMORY[0x1E0CB2AA8];
    v5 = v15;
    v16[2] = &unk_1E9882660;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v14, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    fileAttributes = v2->_fileAttributes;
    v2->_fileAttributes = (NSDictionary *)v6;

    v12[0] = v3;
    v12[1] = v4;
    v13[0] = &unk_1E9882648;
    v13[1] = &unk_1E9882648;
    v12[2] = v5;
    v13[2] = &unk_1E9882678;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    dirAttributes = v2->_dirAttributes;
    v2->_dirAttributes = (NSDictionary *)v8;

  }
  return v2;
}

- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if (v12)
    objc_msgSend(v10, "removeItemAtURL:error:", v9, 0);
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 100, 0, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "writeToURL:options:error:", v9, 0x10000000, a5);
    -[FFDefaultFileWriter fileAttributes](self, "fileAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v16, v17, 0);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)createDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[FFDefaultFileWriter dirAttributes](self, "dirAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, v11, a4);

  }
  return v10;
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (NSDictionary)dirAttributes
{
  return self->_dirAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirAttributes, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
}

@end
