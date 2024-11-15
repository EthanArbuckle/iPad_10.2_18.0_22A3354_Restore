@implementation FSFCurareInteractionAsDict

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (FSFCurareInteractionAsDict)initWithContent:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  id v9;
  id v10;
  FSFCurareInteractionAsDict *v11;
  FSFCurareInteractionAsDict *v12;
  FSFCurareInteractionAsDict *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFCurareInteractionAsDict;
    v11 = -[FSFCurareInteractionAsDict init](&v15, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_interactionId, a4);
      objc_storeStrong((id *)&v12->_content, a3);
      v12->_dataVersion = a5;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v13 = 0;
  }

  return v13;
}

- (id)json
{
  void *v2;
  void *v3;

  -[FSFCurareInteractionAsDict serialize](self, "serialize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  return v3;
}

- (id)serialize
{
  NSDictionary *content;
  void *v3;
  id v4;
  void *v5;
  id v7;

  content = self->_content;
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", content, 2, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v4;
  if (v4)
    NSLog(CFSTR("Error while serilaizing dict: %@"), v4);

  return v3;
}

- (FSFCurareInteractionAsDict)initWithData:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  id v8;
  id v9;
  FSFCurareInteractionAsDict *v10;
  FSFCurareInteractionAsDict *v11;
  uint64_t v12;
  id v13;
  NSDictionary *content;
  id v16;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FSFCurareInteractionAsDict;
  v10 = -[FSFCurareInteractionAsDict init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_dataVersion = a4;
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v16;
    content = v11->_content;
    v11->_content = (NSDictionary *)v12;

    if (v13)
      NSLog(CFSTR("Error while creating dict from data: %@"), v13);
    objc_storeStrong((id *)&v11->_interactionId, a5);

  }
  return v11;
}

+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  FSFCurareInteractionAsDict *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = -[FSFCurareInteractionAsDict initWithData:dataVersion:interactionId:]([FSFCurareInteractionAsDict alloc], "initWithData:dataVersion:interactionId:", v8, v5, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
