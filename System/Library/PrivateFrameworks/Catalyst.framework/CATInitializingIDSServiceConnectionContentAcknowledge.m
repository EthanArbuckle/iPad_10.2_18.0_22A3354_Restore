@implementation CATInitializingIDSServiceConnectionContentAcknowledge

- (CATInitializingIDSServiceConnectionContentAcknowledge)initWithConnectionIdentifier:(id)a3
{
  id v5;
  CATInitializingIDSServiceConnectionContentAcknowledge *v6;
  CATInitializingIDSServiceConnectionContentAcknowledge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATInitializingIDSServiceConnectionContentAcknowledge;
  v6 = -[CATInitializingIDSServiceConnectionContentAcknowledge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connectionIdentifier, a3);

  return v7;
}

- (int64_t)contentType
{
  return 4;
}

- (NSDictionary)dictionaryValue
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("ConnectionIdentifier");
  -[CATInitializingIDSServiceConnectionContentAcknowledge connectionIdentifier](self, "connectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (id)instanceWithDictionary:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "cat_uuidForKey:", CFSTR("ConnectionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnectionIdentifier:", v4);
  else
    v5 = 0;

  return v5;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end
