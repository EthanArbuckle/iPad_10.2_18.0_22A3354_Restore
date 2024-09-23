@implementation LACBackgroundTaskResult

- (LACBackgroundTaskResult)initWithValue:(id)a3
{
  return -[LACBackgroundTaskResult initWithValue:error:](self, "initWithValue:error:", a3, 0);
}

- (LACBackgroundTaskResult)initWithError:(id)a3
{
  return -[LACBackgroundTaskResult initWithValue:error:](self, "initWithValue:error:", 0, a3);
}

- (LACBackgroundTaskResult)initWithValue:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  LACBackgroundTaskResult *v9;
  LACBackgroundTaskResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACBackgroundTaskResult;
  v9 = -[LACBackgroundTaskResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACBackgroundTaskResult value](self, "value");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACBackgroundTaskResult value](self, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v5, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACBackgroundTaskResult error](self, "error");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {
      v12 = 1;
      v15 = v13;
    }
    else
    {
      v15 = (void *)v14;
      objc_msgSend(v5, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACBackgroundTaskResult error](self, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "isEqual:", v17);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[LACBackgroundTaskResult value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("value: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[LACBackgroundTaskResult error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("error: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("; "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
