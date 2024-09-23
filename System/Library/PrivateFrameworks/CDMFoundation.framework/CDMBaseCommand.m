@implementation CDMBaseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdError, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)commandName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSError)cmdError
{
  return self->_cmdError;
}

- (CDMBaseCommand)init
{
  CDMBaseCommand *v2;
  void *v3;
  uint64_t v4;
  NSString *uuid;
  NSError *cmdError;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDMBaseCommand;
  v2 = -[CDMBaseCommand init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    cmdError = v2->_cmdError;
    v2->_cmdError = 0;

  }
  return v2;
}

- (CDMBaseCommand)initWithCoder:(id)a3
{
  id v4;
  CDMBaseCommand *v5;
  uint64_t v6;
  NSString *uuid;
  uint64_t v8;
  NSError *cmdError;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMBaseCommand;
  v5 = -[CDMBaseCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cmdError"));
    v8 = objc_claimAutoreleasedReturnValue();
    cmdError = v5->_cmdError;
    v5->_cmdError = (NSError *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cmdError, CFSTR("cmdError"));

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setCmdError:(id)a3
{
  objc_storeStrong((id *)&self->_cmdError, a3);
}

@end
