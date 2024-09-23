@implementation ATMessage

- (id)parameterForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATMessage parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)options
{
  void *v2;
  unsigned int v3;

  -[ATMessage parameterForKey:](self, "parameterForKey:", CFSTR("_Options"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setOptions:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ATMessage parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ATMessage parameters](self, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("_Options"));
  -[ATMessage setParameters:](self, "setParameters:", v8);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[ATMessage messageID](self, "messageID");
  -[ATMessage additionalDescription](self, "additionalDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p id=%d %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)additionalDescription
{
  return &stru_24C4CBA48;
}

- (ATMessage)initWithCoder:(id)a3
{
  id v4;
  ATMessage *v5;
  double v6;
  uint64_t v7;
  ATCodableStream *stream;
  uint64_t v9;
  NSInputStream *dataStream;
  void *v11;
  uint64_t v12;
  id v13;
  NSDictionary *parameters;
  id v16;
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATMessage;
  v5 = -[ATMessage init](&v18, sel_init);
  if (v5)
  {
    v5->_messageID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("messageID"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataStream"));
    v7 = objc_claimAutoreleasedReturnValue();
    stream = v5->_stream;
    v5->_stream = (ATCodableStream *)v7;

    -[ATCodableStream inputStream](v5->_stream, "inputStream");
    v9 = objc_claimAutoreleasedReturnValue();
    dataStream = v5->_dataStream;
    v5->_dataStream = (NSInputStream *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameters"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v11, 0, 0, &v17);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v17;
      parameters = v5->_parameters;
      v5->_parameters = (NSDictionary *)v12;

      if (!v5->_parameters)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("unable to decode params data"), 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v16);
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *parameters;
  void *v6;
  id v7;
  void *v8;
  ATCodableStream *v9;
  ATCodableStream *stream;
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_messageID, CFSTR("messageID"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  parameters = self->_parameters;
  if (parameters)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", parameters, 200, 0, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("unable to encode params data"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v11);
    }
    v8 = v7;
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameters"));

  }
  if (self->_dataStream)
  {
    v9 = -[ATCodableStream initWithInputStream:]([ATCodableStream alloc], "initWithInputStream:", self->_dataStream);
    stream = self->_stream;
    self->_stream = v9;

    objc_msgSend(v4, "encodeObject:forKey:", self->_stream, CFSTR("dataStream"));
  }

}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned int)a3
{
  self->_messageID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSInputStream)dataStream
{
  return self->_dataStream;
}

- (void)setDataStream:(id)a3
{
  objc_storeStrong((id *)&self->_dataStream, a3);
}

- (ATCodableStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_dataStream, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
