@implementation DEDDataTask

- (DEDDataTask)initWithDataTask:(id)a3
{
  id v4;
  DEDDataTask *v5;
  DEDDataTask *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDDataTask;
  v5 = -[DEDDataTask init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DEDDataTask setDataTask:](v5, "setDataTask:", v4);
    objc_msgSend(v4, "resume");
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("dataTask");
  -[DEDDataTask dataTask](self, "dataTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("data");
  -[DEDDataTask data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("response");
  -[DEDDataTask response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("isFinished");
  v6 = -[DEDDataTask isFinished](self, "isFinished");
  v7 = CFSTR("false");
  if (v6)
    v7 = CFSTR("true");
  v15[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@"), v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSURLSessionDataTask)dataTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSHTTPURLResponse)response
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

@end
