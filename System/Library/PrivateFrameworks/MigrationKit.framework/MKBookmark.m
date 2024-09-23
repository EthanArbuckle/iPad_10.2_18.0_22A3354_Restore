@implementation MKBookmark

- (MKBookmark)initWithData:(id)a3
{
  id v4;
  MKBookmark *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *title;
  void *v16;
  NSString *url;
  void *v18;
  MKBookmark *v19;
  id v21;
  objc_super v22;
  const __CFString *v23;
  NSString *v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MKBookmark;
  v5 = -[MKBookmark init](&v22, sel_init);
  if (v5)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v7)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKBookmark initWithData:].cold.2((uint64_t)v7, v8);
LABEL_14:

      v19 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKBookmark initWithData:].cold.1(v8);
      goto LABEL_14;
    }
    v9 = v6;
    objc_msgSend(v9, "objectForKey:", CFSTR("id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKBookmark setID:](v5, "setID:", v10);

    objc_msgSend(v9, "objectForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKBookmark setTitle:](v5, "setTitle:", v11);

    objc_msgSend(v9, "objectForKey:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKBookmark setUrl:](v5, "setUrl:", v12);

    if (!v5->_title)
      -[MKBookmark setTitle:](v5, "setTitle:", v5->_url);
    if (v5->_url)
    {
      v26[0] = CFSTR("WebBookmarkTypeLeaf");
      v25[0] = CFSTR("WebBookmarkType");
      v25[1] = CFSTR("WebBookmarkUUID");
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v14;
      v25[2] = CFSTR("URIDictionary");
      title = v5->_title;
      v23 = CFSTR("title");
      v24 = title;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[3] = CFSTR("URLString");
      url = v5->_url;
      v26[2] = v16;
      v26[3] = url;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKBookmark setData:](v5, "setData:", v18);

    }
  }
  v19 = v5;
LABEL_15:

  return v19;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "MKBookmark could not initialize because an invalid json format was received.", v1, 2u);
}

- (void)initWithData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "MKBookmark could not initialize because an underlying error occurred unexpectedly. error=%@", (uint8_t *)&v2, 0xCu);
}

@end
