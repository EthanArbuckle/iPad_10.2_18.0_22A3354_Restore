@implementation FSFNluUserParseFeature

- (id)interactionId
{
  return 0;
}

- (FSFNluUserParseFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  FSFNluUserParseFeature *v7;
  FSFNluUserParseFeature *v8;
  uint64_t v9;
  SIRINLUEXTERNALUserParse *content;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FSFNluUserParseFeature;
  v7 = -[FSFNluUserParseFeature init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_dataVersion = a4;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE9E160]), "initWithData:", v6);
    content = v8->_content;
    v8->_content = (SIRINLUEXTERNALUserParse *)v9;

  }
  return v8;
}

- (FSFNluUserParseFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7;
  FSFNluUserParseFeature *v8;
  FSFNluUserParseFeature *v9;
  FSFNluUserParseFeature *v10;
  objc_super v12;

  v7 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v12.receiver = self;
    v12.super_class = (Class)FSFNluUserParseFeature;
    v8 = -[FSFNluUserParseFeature init](&v12, sel_init);
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

- (FSFNluUserParseFeature)initWithContentJson:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  FSFNluUserParseFeature *v7;
  FSFNluUserParseFeature *v8;
  id v9;
  void *v10;
  uint64_t v11;
  SIRINLUEXTERNALUserParse *content;
  FSFNluUserParseFeature *v13;
  objc_super v15;

  v6 = a3;
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFNluUserParseFeature;
    v7 = -[FSFNluUserParseFeature init](&v15, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_dataVersion = a4;
      v9 = objc_alloc(MEMORY[0x24BE9E160]);
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithData:", v10);
      content = v8->_content;
      v8->_content = (SIRINLUEXTERNALUserParse *)v11;

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

- (id)content
{
  SIRINLUEXTERNALUserParse *v3;

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
  FSFNluUserParseFeature *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[FSFNluUserParseFeature initWithData:dataVersion:]([FSFNluUserParseFeature alloc], "initWithData:dataVersion:", v5, v4);

  return v6;
}

- (id)serialize
{
  return (id)-[SIRINLUEXTERNALUserParse data](self->_content, "data");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[SIRINLUEXTERNALUserParse dictionaryRepresentation](self->_content, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
