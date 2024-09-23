@implementation UARPStandaloneCommandReplyRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPStandaloneCommandReplyRecord)initWithModelNumber:(id)a3
{
  id v4;
  UARPStandaloneCommandReplyRecord *v5;
  uint64_t v6;
  NSString *modelNumber;
  uint64_t v8;
  NSMutableArray *solicitedURLResponses;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPStandaloneCommandReplyRecord;
  v5 = -[UARPStandaloneCommandReplyRecord init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;

    v8 = objc_opt_new();
    solicitedURLResponses = v5->_solicitedURLResponses;
    v5->_solicitedURLResponses = (NSMutableArray *)v8;

  }
  return v5;
}

- (void)addResponseURL:(id)a3
{
  UARPStandaloneCommandReplyRecord *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_solicitedURLResponses, "addObject:", v5);
  objc_sync_exit(v4);

}

- (id)getResponseURLs
{
  UARPStandaloneCommandReplyRecord *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2->_solicitedURLResponses);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (UARPStandaloneCommandReplyRecord)initWithCoder:(id)a3
{
  id v4;
  UARPStandaloneCommandReplyRecord *v5;
  uint64_t v6;
  NSString *modelNumber;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *solicitedURLResponses;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UARPStandaloneCommandReplyRecord;
  v5 = -[UARPStandaloneCommandReplyRecord init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("responseURLs"));
    v11 = objc_claimAutoreleasedReturnValue();
    solicitedURLResponses = v5->_solicitedURLResponses;
    v5->_solicitedURLResponses = (NSMutableArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *modelNumber;
  id v5;

  modelNumber = self->_modelNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modelNumber, CFSTR("modelNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_solicitedURLResponses, CFSTR("responseURLs"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPStandaloneCommandReplyRecord *v4;
  uint64_t v5;
  NSString *modelNumber;
  uint64_t v7;
  NSMutableArray *solicitedURLResponses;

  v4 = objc_alloc_init(UARPStandaloneCommandReplyRecord);
  v5 = -[NSString copy](self->_modelNumber, "copy");
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v5;

  v7 = -[NSMutableArray copy](self->_solicitedURLResponses, "copy");
  solicitedURLResponses = v4->_solicitedURLResponses;
  v4->_solicitedURLResponses = (NSMutableArray *)v7;

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: modelNumber=%@ solicitedResponses=%@>"), v5, self->_modelNumber, self->_solicitedURLResponses);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_solicitedURLResponses, 0);
}

@end
