@implementation CDMEmbeddingGraphRequestCommand

- (CDMEmbeddingGraphRequestCommand)initWithText:(id)a3
{
  return -[CDMEmbeddingGraphRequestCommand initWithText:requestId:](self, "initWithText:requestId:", a3, 0);
}

- (CDMEmbeddingGraphRequestCommand)initWithText:(id)a3 requestId:(id)a4
{
  id v7;
  id v8;
  CDMEmbeddingGraphRequestCommand *v9;
  CDMEmbeddingGraphRequestCommand *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDMEmbeddingGraphRequestCommand;
  v9 = -[CDMBaseCommand init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:0"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIdA:", v14);

      CDMOSLoggerForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "idA");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v20 = "-[CDMEmbeddingGraphRequestCommand initWithText:requestId:]";
        v21 = 2112;
        v22 = v17;
        _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Request ID not set, generated request id with UUID: %@", buf, 0x16u);

      }
    }
    objc_storeStrong((id *)&v10->_requestId, v8);
  }

  return v10;
}

- (CDMEmbeddingGraphRequestCommand)initWithCoder:(id)a3
{
  id v4;
  CDMEmbeddingGraphRequestCommand *v5;
  uint64_t v6;
  NSString *text;
  void *v8;
  uint64_t v9;
  SIRINLUEXTERNALRequestID *requestId;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMEmbeddingGraphRequestCommand;
  v5 = -[CDMServiceGraphCommand initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE9E0F0]), "initWithData:", v8);
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLUEXTERNALRequestID *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDMEmbeddingGraphRequestCommand;
  v4 = a3;
  -[CDMServiceGraphCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("text"), v6.receiver, v6.super_class);
  -[SIRINLUEXTERNALRequestID data](self->_requestId, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestId"));

}

- (id)loggingRequestID
{
  return self->_requestId;
}

- (NSString)text
{
  return self->_text;
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)serviceGraphName
{
  return CFSTR("CDMEmbeddingServiceGraph");
}

@end
