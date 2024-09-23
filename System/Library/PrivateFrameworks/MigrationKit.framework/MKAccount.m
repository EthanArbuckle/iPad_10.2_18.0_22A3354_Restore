@implementation MKAccount

- (MKAccount)initWithData:(id)a3
{
  id v4;
  MKAccount *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *type;
  MKAccount *v14;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  MKAccount *v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKAccount;
  v5 = -[MKAccount init](&v17, sel_init);
  if (v5)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    if (v7)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKAccount initWithData:].cold.2((uint64_t)v5, (uint64_t)v7, v8);
LABEL_12:

      v14 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKAccount initWithData:].cold.1((uint64_t)v5, v8);
      goto LABEL_12;
    }
    v9 = v6;
    objc_msgSend(v9, "objectForKey:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAccount setName:](v5, "setName:", v10);

    objc_msgSend(v9, "objectForKey:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAccount setType:](v5, "setType:", v11);

    +[MKLog log](MKLog, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      type = v5->_type;
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = type;
      _os_log_impl(&dword_21EC08000, v12, OS_LOG_TYPE_INFO, "%@ did receive an account. type=%@", buf, 0x16u);
    }

  }
  v14 = v5;
LABEL_13:

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ could not initialize because an invalid json format was received.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithData:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "%@ could not initialize because an underlying error occurred unexpectedly. error=%@", (uint8_t *)&v3, 0x16u);
}

@end
