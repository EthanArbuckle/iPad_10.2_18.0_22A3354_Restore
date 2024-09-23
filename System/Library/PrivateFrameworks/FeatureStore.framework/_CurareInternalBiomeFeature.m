@implementation _CurareInternalBiomeFeature

- (NSDictionary)content
{
  return (NSDictionary *)self->_content;
}

- (_CurareInternalBiomeFeature)initWithCurareInteraction:(id)a3
{
  id v4;
  _CurareInternalBiomeFeature *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *content;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CurareInternalBiomeFeature;
  v5 = -[_CurareInternalBiomeFeature init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    content = v5->_content;
    v5->_content = v6;

    v8 = v5->_content;
    objc_msgSend(v4, "interactionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, CFSTR("interactionId"));

    objc_msgSend(v4, "serialize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FSFUtils getBase64EncodedStrFromData:](FSFUtils, "getBase64EncodedStrFromData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v5->_content, "setObject:forKey:", v11, CFSTR("feature"));

  }
  return v5;
}

- (_CurareInternalBiomeFeature)initWithData:(id)a3
{
  id v4;
  _CurareInternalBiomeFeature *v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *content;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CurareInternalBiomeFeature;
  v5 = -[_CurareInternalBiomeFeature init](&v11, sel_init);
  if (v5)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    content = v5->_content;
    v5->_content = (NSMutableDictionary *)v6;

    if (v7)
      NSLog(CFSTR("Error while creating json/dict from data: %@"), v7);

  }
  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  _CurareInternalBiomeFeature *v5;

  v4 = a3;
  v5 = -[_CurareInternalBiomeFeature initWithData:]([_CurareInternalBiomeFeature alloc], "initWithData:", v4);

  return v5;
}

- (id)serialize
{
  NSMutableDictionary *content;
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

- (id)interactionId
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_content, "objectForKeyedSubscript:", CFSTR("interactionId"));
}

- (id)json
{
  NSMutableDictionary *content;
  void *v3;
  id v4;
  void *v5;
  id v7;

  content = self->_content;
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", content, 3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v4;
  if (v4)
    NSLog(CFSTR("Error while serilaizing dict: %@"), v4);

  return v3;
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
