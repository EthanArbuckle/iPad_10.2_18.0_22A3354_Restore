@implementation FSFCurareEvaluationFeature

- (FSFCurareEvaluationFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  FSFCurareEvaluationFeature *v7;
  FSFCurareEvaluationFeature *v8;
  uint64_t v9;
  NSDictionary *content;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FSFCurareEvaluationFeature;
  v7 = -[FSFCurareEvaluationFeature init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_dataVersion = a4;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    content = v8->_content;
    v8->_content = (NSDictionary *)v9;

  }
  return v8;
}

- (FSFCurareEvaluationFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7;
  FSFCurareEvaluationFeature *v8;
  FSFCurareEvaluationFeature *v9;
  FSFCurareEvaluationFeature *v10;
  objc_super v12;

  v7 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v12.receiver = self;
    v12.super_class = (Class)FSFCurareEvaluationFeature;
    v8 = -[FSFCurareEvaluationFeature init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_dataVersion = a4;
      objc_storeStrong((id *)&v8->_content, a3);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v10 = 0;
  }

  return v10;
}

- (FSFCurareEvaluationFeature)initWithContentJson:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  FSFCurareEvaluationFeature *v7;
  FSFCurareEvaluationFeature *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *content;
  FSFCurareEvaluationFeature *v13;
  objc_super v15;

  v6 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFCurareEvaluationFeature;
    v7 = -[FSFCurareEvaluationFeature init](&v15, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_dataVersion = a4;
      v9 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "JSONObjectWithData:options:error:", v10, 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      content = v8->_content;
      v8->_content = (NSDictionary *)v11;

    }
    self = v8;
    v13 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v13 = 0;
  }

  return v13;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  FSFCurareEvaluationFeature *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[FSFCurareEvaluationFeature initWithData:dataVersion:]([FSFCurareEvaluationFeature alloc], "initWithData:dataVersion:", v5, v4);

  return v6;
}

- (id)serialize
{
  return (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", self->_content, 3, 0);
}

- (id)content
{
  NSDictionary *v3;

  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v3 = self->_content;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v3 = 0;
  }
  return v3;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (id)json
{
  return (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", self->_content, 3, 0);
}

- (id)interactionId
{
  return -[NSDictionary objectForKeyedSubscript:](self->_content, "objectForKeyedSubscript:", CFSTR("interactionId"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
