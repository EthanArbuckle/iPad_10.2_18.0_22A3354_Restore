@implementation FSFBMStringData

- (FSFBMStringData)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  FSFBMStringData *v7;
  FSFBMStringData *v8;
  uint64_t v9;
  NSString *content;
  FSFBMStringData *v11;
  objc_super v13;

  v6 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v13.receiver = self;
    v13.super_class = (Class)FSFBMStringData;
    v7 = -[FSFBMStringData init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_dataVersion = a4;
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      content = v8->_content;
      v8->_content = (NSString *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v11 = 0;
  }

  return v11;
}

- (FSFBMStringData)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7;
  FSFBMStringData *v8;
  FSFBMStringData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSFBMStringData;
  v8 = -[FSFBMStringData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_dataVersion = a4;
    objc_storeStrong((id *)&v8->_content, a3);
  }

  return v9;
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
  FSFBMStringData *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[FSFBMStringData initWithData:dataVersion:]([FSFBMStringData alloc], "initWithData:dataVersion:", v5, v4);

  return v6;
}

- (id)serialize
{
  return -[NSString dataUsingEncoding:](self->_content, "dataUsingEncoding:", 4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
