@implementation FSFCurareInteractionAsJsonStr

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (FSFCurareInteractionAsJsonStr)initWithJsonStr:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  id v8;
  id v9;
  FSFCurareInteractionAsJsonStr *v10;
  FSFCurareInteractionAsJsonStr *v11;
  uint64_t v12;
  NSData *content;
  FSFCurareInteractionAsJsonStr *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v16.receiver = self;
    v16.super_class = (Class)FSFCurareInteractionAsJsonStr;
    v10 = -[FSFCurareInteractionAsJsonStr init](&v16, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_interactionId, a4);
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v12 = objc_claimAutoreleasedReturnValue();
      content = v11->_content;
      v11->_content = (NSData *)v12;

      v11->_dataVersion = a5;
    }
    self = v11;
    v14 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v14 = 0;
  }

  return v14;
}

- (id)json
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_content, 4);
}

- (id)serialize
{
  return self->_content;
}

+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  FSFCurareInteractionAsJsonStr *v11;

  v5 = *(_QWORD *)&a4;
  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithData:encoding:", v9, 4);

  v11 = -[FSFCurareInteractionAsJsonStr initWithJsonStr:interactionId:dataVersion:]([FSFCurareInteractionAsJsonStr alloc], "initWithJsonStr:interactionId:dataVersion:", v10, v8, v5);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
