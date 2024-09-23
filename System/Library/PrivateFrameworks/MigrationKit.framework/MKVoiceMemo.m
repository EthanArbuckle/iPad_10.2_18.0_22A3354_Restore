@implementation MKVoiceMemo

- (MKVoiceMemo)initWithAudioPath:(id)a3 originalFilename:(id)a4 dateAdded:(id)a5 size:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  MKVoiceMemo *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  MKVoiceMemo *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  objc_super v25;
  uint8_t buf[4];
  MKVoiceMemo *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MKVoiceMemo;
  v13 = -[MKVoiceMemo init](&v25, sel_init);
  if (objc_msgSend(v10, "length") && objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "compare:", v14);

    if (v12 && v15)
    {
      if (!v13)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v18;
      if (!v13)
      {
LABEL_14:
        v17 = v13;
        goto LABEL_15;
      }
    }
    -[MKVoiceMemo setAudioPath:](v13, "setAudioPath:", v10);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v10);
    -[MKVoiceMemo setAudioUrl:](v13, "setAudioUrl:", v19);

    -[MKVoiceMemo setOriginalFilename:](v13, "setOriginalFilename:", v11);
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v20, "count") >= 2)
    {
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") + ~objc_msgSend(v21, "length"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVoiceMemo setName:](v13, "setName:", v22);

      -[MKVoiceMemo setDateAdded:](v13, "setDateAdded:", v12);
      -[MKVoiceMemo setSize:](v13, "setSize:", a6);

      goto LABEL_14;
    }
    +[MKLog log](MKLog, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MKVoiceMemo initWithAudioPath:originalFilename:dateAdded:size:].cold.1((uint64_t)v13, (uint64_t)v11, v24);

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412803;
      v27 = v13;
      v28 = 2113;
      v29 = v10;
      v30 = 2113;
      v31 = v11;
      _os_log_error_impl(&dword_21EC08000, v16, OS_LOG_TYPE_ERROR, "%@ could not initialize voice memo for audioPath=%{private}@, originalFilename=%{private}@", buf, 0x20u);
    }

  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (NSString)audioPath
{
  return self->_audioPath;
}

- (void)setAudioPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)audioUrl
{
  return self->_audioUrl;
}

- (void)setAudioUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_audioUrl, 0);
  objc_storeStrong((id *)&self->_audioPath, 0);
}

- (void)initWithAudioPath:(os_log_t)log originalFilename:dateAdded:size:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412547;
  v4 = a1;
  v5 = 2113;
  v6 = a2;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "%@ could not initialize voice memo for invalid originalFilename=%{private}@", (uint8_t *)&v3, 0x16u);
}

@end
