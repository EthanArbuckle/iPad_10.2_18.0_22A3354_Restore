@implementation CDMServiceGraphProtoBackedCommand

- (id)loggingRequestID
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "innerProtoPropertyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraphProtoBackedCommand valueForKey:](self, "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = CFSTR("requestId");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = CFSTR("requestID");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v5 = CFSTR("nluRequestId");
  }
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v6;
}

- (CDMServiceGraphProtoBackedCommand)initWithCoder:(id)a3
{
  id v4;
  CDMServiceGraphProtoBackedCommand *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMServiceGraphProtoBackedCommand;
  v5 = -[CDMServiceGraphCommand initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (objc_class *)objc_msgSend((id)objc_opt_class(), "innerProtoType");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("innerProtoCodingKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend([v6 alloc], "initWithData:", v7);
    objc_msgSend((id)objc_opt_class(), "innerProtoPropertyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMServiceGraphProtoBackedCommand setValue:forKey:](v5, "setValue:forKey:", v8, v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDMServiceGraphProtoBackedCommand;
  v4 = a3;
  -[CDMServiceGraphCommand encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend((id)objc_opt_class(), "innerProtoPropertyName", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraphProtoBackedCommand valueForKey:](self, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("innerProtoCodingKey"));
}

+ (Class)innerProtoType
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass"), v4);

  return 0;
}

+ (id)innerProtoPropertyName
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass"), v4);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
