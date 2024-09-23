@implementation FSFNLUFeature

- (FSFNLUFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  FSFNLUFeature *v7;
  FSFNLUFeature *v8;
  uint64_t v9;
  NSString *content;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FSFNLUFeature;
  v7 = -[FSFNLUFeature init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_dataVersion = a4;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    content = v8->_content;
    v8->_content = (NSString *)v9;

  }
  return v8;
}

- (FSFNLUFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7;
  FSFNLUFeature *v8;
  FSFNLUFeature *v9;
  FSFNLUFeature *v10;
  objc_super v12;

  v7 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v12.receiver = self;
    v12.super_class = (Class)FSFNLUFeature;
    v8 = -[FSFNLUFeature init](&v12, sel_init);
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

- (id)content
{
  NSString *v3;

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

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  FSFNLUFeature *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[FSFNLUFeature initWithData:dataVersion:]([FSFNLUFeature alloc], "initWithData:dataVersion:", v5, v4);

  return v6;
}

- (id)serialize
{
  return -[NSString dataUsingEncoding:](self->_content, "dataUsingEncoding:", 4);
}

- (id)json
{
  return -[NSString dataUsingEncoding:](self->_content, "dataUsingEncoding:", 4);
}

- (id)interactionId
{
  void *v2;
  void *v3;
  void *v4;

  -[NSString dataUsingEncoding:](self->_content, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("interactionId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
