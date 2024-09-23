@implementation ATXContextHeuristicsEvent

- (ATXContextHeuristicsEvent)initWithContextName:(id)a3 contextType:(id)a4 isStart:(BOOL)a5
{
  id v8;
  id v9;
  ATXContextHeuristicsEvent *v10;
  uint64_t v11;
  NSString *contextName;
  uint64_t v13;
  NSString *contextType;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXContextHeuristicsEvent;
  v10 = -[ATXContextHeuristicsEvent init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    contextName = v10->_contextName;
    v10->_contextName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    contextType = v10->_contextType;
    v10->_contextType = (NSString *)v13;

    v10->_isStart = a5;
  }

  return v10;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("contextName");
  -[ATXContextHeuristicsEvent contextName](self, "contextName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("contextType");
  -[ATXContextHeuristicsEvent contextType](self, "contextType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("isStart");
  v7 = -[ATXContextHeuristicsEvent isStart](self, "isStart");
  v8 = &unk_1E83CC748;
  if (v7)
    v8 = &unk_1E83CC730;
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v9;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXContextHeuristicsEvent jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXContextHeuristicsEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBContextHeuristicsEvent *v5;
  ATXContextHeuristicsEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBContextHeuristicsEvent initWithData:]([ATXPBContextHeuristicsEvent alloc], "initWithData:", v4);

    self = -[ATXContextHeuristicsEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXContextHeuristicsEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXContextHeuristicsEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ATXContextHeuristicsEvent *v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "contextName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isStart");

    self = -[ATXContextHeuristicsEvent initWithContextName:contextType:isStart:](self, "initWithContextName:contextType:isStart:", v6, v7, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[ATXContextHeuristicsEvent contextName](self, "contextName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContextName:", v4);

  -[ATXContextHeuristicsEvent contextType](self, "contextType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContextType:", v5);

  objc_msgSend(v3, "setIsStart:", -[ATXContextHeuristicsEvent isStart](self, "isStart"));
  return v3;
}

- (NSString)contextName
{
  return self->_contextName;
}

- (NSString)contextType
{
  return self->_contextType;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void)setIsStart:(BOOL)a3
{
  self->_isStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
}

@end
