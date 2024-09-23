@implementation ASTErrorStatus

- (ASTErrorStatus)init
{
  ASTErrorStatus *v2;
  uint64_t v3;
  NSMutableDictionary *data;
  NSNumber *code;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASTErrorStatus;
  v2 = -[ASTErrorStatus init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    data = v2->_data;
    v2->_data = (NSMutableDictionary *)v3;

    code = v2->_code;
    v2->_code = (NSNumber *)&unk_24F975FF8;

  }
  return v2;
}

- (void)setCode:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_code, a3);
  v5 = a3;
  -[ASTErrorStatus reasonForCode:](self, "reasonForCode:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ASTErrorStatus setReason:](self, "setReason:", v6);
}

- (id)dictionary
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  -[ASTErrorStatus code](self, "code");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", &unk_24F975FF8);

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("NoError");
  }
  else
  {
    -[ASTErrorStatus code](self, "code");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = CFSTR("code");
  v18[1] = CFSTR("reason");
  v19[0] = v5;
  -[ASTErrorStatus reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[ASTErrorStatus reason](self, "reason");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASTErrorStatus data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    v16 = CFSTR("data");
    -[ASTErrorStatus data](self, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v13);

    v14 = objc_msgSend(v11, "copy");
    v8 = (void *)v14;
  }

  return v8;
}

- (id)reasonForCode:(id)a3
{
  return 0;
}

+ (ASTErrorStatus)errorStatusWithCode:(int64_t)a3
{
  ASTErrorStatus *v4;
  void *v5;

  v4 = objc_alloc_init(ASTErrorStatus);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTErrorStatus setCode:](v4, "setCode:", v5);

  return v4;
}

- (NSNumber)code
{
  return self->_code;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSMutableDictionary)data
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
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
