@implementation ASTAction

- (ASTAction)init
{
  void *v3;
  ASTAction *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASTAction initWithAction:data:](self, "initWithAction:data:", &stru_24F96AF90, v3);

  return v4;
}

- (ASTAction)initWithAction:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  ASTAction *v9;
  ASTAction *v10;
  uint64_t v11;
  NSDictionary *results;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  void *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *parameters;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ASTAction;
  v9 = -[ASTAction init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    *(_WORD *)&v10->_finished = 0;
    v10->_progress = 0;
    v10->_resultCode = 2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    results = v10->_results;
    v10->_results = (NSDictionary *)v11;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
      v14 = objc_claimAutoreleasedReturnValue();
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v14;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v10->_identifier;
      v10->_identifier = (NSString *)v17;

      v10->_generatedId = 1;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parameters"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parameters"));
      v20 = objc_claimAutoreleasedReturnValue();
      parameters = v10->_parameters;
      v10->_parameters = (NSDictionary *)v20;

    }
  }

  return v10;
}

- (void)setProgress:(unint64_t)a3
{
  unint64_t v3;

  v3 = 100;
  if (a3 < 0x64)
    v3 = a3;
  self->_progress = v3;
}

- (unint64_t)progress
{
  return self->_progress;
}

- (void)setFinished:(BOOL)a3
{
  if (a3)
    self->_finished = 1;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTAction action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("action"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ASTAction progress](self, "progress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("progress"));

  if (!-[ASTAction generatedId](self, "generatedId"))
  {
    -[ASTAction identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("id"));

  }
  if (-[ASTAction isFinished](self, "isFinished"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ASTAction resultCode](self, "resultCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("resultCode"));

    -[ASTAction results](self, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("resultPayload"));

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v9;
}

- (ASTAction)initWithCoder:(id)a3
{
  id v4;
  ASTAction *v5;
  uint64_t v6;
  NSString *action;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSDictionary *parameters;
  void *v13;
  uint64_t v14;
  NSDictionary *results;

  v4 = a3;
  v5 = -[ASTAction init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v6 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    -[ASTAction acceptableDecoderClasses](v5, "acceptableDecoderClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("parameters"));
    v11 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v11;

    v5->_progress = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("progress"));
    v5->_resultCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resultCode"));
    -[ASTAction acceptableDecoderClasses](v5, "acceptableDecoderClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("resultPayload"));
    v14 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSDictionary *)v14;

    v5->_finished = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("finished"));
    v5->_generatedId = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("generatedId"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASTAction action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("action"));

  -[ASTAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASTAction parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("parameters"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[ASTAction progress](self, "progress"), CFSTR("progress"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[ASTAction resultCode](self, "resultCode"), CFSTR("resultCode"));
  -[ASTAction results](self, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("resultPayload"));

  objc_msgSend(v8, "encodeBool:forKey:", -[ASTAction isFinished](self, "isFinished"), CFSTR("finished"));
  objc_msgSend(v8, "encodeBool:forKey:", -[ASTAction generatedId](self, "generatedId"), CFSTR("generatedId"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)acceptableDecoderClasses
{
  if (acceptableDecoderClasses_onceToken != -1)
    dispatch_once(&acceptableDecoderClasses_onceToken, &__block_literal_global_5);
  return (id)acceptableDecoderClasses_singleton;
}

void __37__ASTAction_acceptableDecoderClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)acceptableDecoderClasses_singleton;
  acceptableDecoderClasses_singleton = v9;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_action, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSDictionary copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  *(_QWORD *)(v5 + 16) = self->_progress;
  *(_QWORD *)(v5 + 48) = self->_resultCode;
  v12 = -[NSDictionary copyWithZone:](self->_results, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  *(_BYTE *)(v5 + 8) = self->_finished;
  *(_BYTE *)(v5 + 9) = self->_generatedId;
  return (id)v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTAction action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTAction identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTAction parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASTAction progress](self, "progress");
  v10 = -[ASTAction resultCode](self, "resultCode");
  -[ASTAction results](self, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; action = %@, identifier = %@, parameters = %@, progress = %lu, resultCode = %ld, results = %@, finished = %d, generatedId = %d>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    -[ASTAction isFinished](self, "isFinished"),
    -[ASTAction generatedId](self, "generatedId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (BOOL)generatedId
{
  return self->_generatedId;
}

- (void)setGeneratedId:(BOOL)a3
{
  self->_generatedId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
