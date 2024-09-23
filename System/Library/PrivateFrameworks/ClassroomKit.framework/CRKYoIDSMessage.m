@implementation CRKYoIDSMessage

- (CRKYoIDSMessage)initWithMessage:(id)a3
{
  id v4;
  CRKYoIDSMessage *v5;
  uint64_t v6;
  NSString *message;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKYoIDSMessage;
  v5 = -[CRKYoIDSMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    message = v5->_message;
    v5->_message = (NSString *)v6;

  }
  return v5;
}

- (int64_t)messageType
{
  return 0;
}

- (NSDictionary)dictionaryValue
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("Yo");
  -[CRKYoIDSMessage message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (id)instanceWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Yo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", v6);
  else
    v7 = 0;

  return v7;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
