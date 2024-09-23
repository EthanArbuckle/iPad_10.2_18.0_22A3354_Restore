@implementation FSFCurareInteractionAsProto

- (FSFCurareInteractionAsProto)initWithProto:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  id v9;
  id v10;
  FSFCurareInteractionAsProto *v11;
  FSFCurareInteractionAsProto *v12;
  FSFCurareInteractionAsProto *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFCurareInteractionAsProto;
    v11 = -[FSFCurareInteractionAsProto init](&v15, sel_init);
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

- (FSFCurareInteractionAsProto)initWithProto:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5 jsonStr:(id)a6
{
  id v11;
  id v12;
  id v13;
  FSFCurareInteractionAsProto *v14;
  FSFCurareInteractionAsProto *v15;
  FSFCurareInteractionAsProto *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v18.receiver = self;
    v18.super_class = (Class)FSFCurareInteractionAsProto;
    v14 = -[FSFCurareInteractionAsProto init](&v18, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_interactionId, a4);
      objc_storeStrong((id *)&v15->_content, a3);
      v15->_dataVersion = a5;
      objc_storeStrong((id *)&v15->_jsonStr, a6);
    }
    self = v15;
    v16 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v16 = 0;
  }

  return v16;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  FSFCurareInteractionAsProto *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = -[FSFCurareInteractionAsProto initWithProto:interactionId:dataVersion:]([FSFCurareInteractionAsProto alloc], "initWithProto:interactionId:dataVersion:", v8, v7, v5);

  return v9;
}

- (id)json
{
  return self->_jsonStr;
}

- (id)serialize
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonStr, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
