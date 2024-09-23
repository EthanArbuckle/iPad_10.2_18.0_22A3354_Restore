@implementation ATRequest

- (ATRequest)initWithCommand:(id)a3 dataClass:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATRequest *v11;
  ATRequest *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATRequest;
  v11 = -[ATRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ATRequest setCommand:](v11, "setCommand:", v8);
    -[ATRequest setDataClass:](v12, "setDataClass:", v9);
    -[ATMessage setParameters:](v12, "setParameters:", v10);
  }

  return v12;
}

- (id)responseWithError:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  ATResponse *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(ATResponse);
  -[ATMessage setMessageID:](v8, "setMessageID:", -[ATMessage messageID](self, "messageID"));
  -[ATMessage setSessionID:](v8, "setSessionID:", -[ATMessage sessionID](self, "sessionID"));
  -[ATResponse setError:](v8, "setError:", v7);

  -[ATMessage setParameters:](v8, "setParameters:", v6);
  return v8;
}

- (id)partialResponseWithParameters:(id)a3
{
  id v4;
  ATResponse *v5;

  v4 = a3;
  v5 = objc_alloc_init(ATResponse);
  -[ATMessage setMessageID:](v5, "setMessageID:", -[ATMessage messageID](self, "messageID"));
  -[ATMessage setSessionID:](v5, "setSessionID:", -[ATMessage sessionID](self, "sessionID"));
  -[ATResponse setPartial:](v5, "setPartial:", 1);
  -[ATMessage setParameters:](v5, "setParameters:", v4);

  return v5;
}

- (id)additionalDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ATRequest command](self, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATRequest dataClass](self, "dataClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ATRequest)initWithCoder:(id)a3
{
  id v4;
  ATRequest *v5;
  uint64_t v6;
  NSString *command;
  uint64_t v8;
  NSString *dataClass;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATRequest;
  v5 = -[ATMessage initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("command"));
    v6 = objc_claimAutoreleasedReturnValue();
    command = v5->_command;
    v5->_command = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataClass"));
    v8 = objc_claimAutoreleasedReturnValue();
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATRequest;
  v4 = a3;
  -[ATMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_command, CFSTR("command"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataClass, CFSTR("dataClass"));

}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
