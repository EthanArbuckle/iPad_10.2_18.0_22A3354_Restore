@implementation ANSender

- (ANSender)initWithID:(id)a3 type:(unint64_t)a4
{
  id v7;
  ANSender *v8;
  ANSender *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANSender;
  v8 = -[ANSender init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (ANSender)senderWithID:(id)a3 type:(unint64_t)a4
{
  id v5;
  ANSender *v6;

  v5 = a3;
  v6 = -[ANSender initWithID:type:]([ANSender alloc], "initWithID:type:", v5, a4);

  return v6;
}

- (id)stringForSenderIdentifierType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Rapport");
  if (a3 == 1)
    return CFSTR("IDS");
  else
    return (id)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ANSender identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANSender stringForSenderIdentifierType:](self, "stringForSenderIdentifierType:", -[ANSender type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ID = %@, Type = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ANSender identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Identifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANSender type](self, "type"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("IdentifierType"));

}

- (ANSender)initWithCoder:(id)a3
{
  id v4;
  ANSender *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;

  v4 = a3;
  v5 = -[ANSender init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentifierType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
