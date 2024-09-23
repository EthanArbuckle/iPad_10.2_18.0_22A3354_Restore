@implementation CATActiveIDSServiceConnectionContentRequestMissingData

- (CATActiveIDSServiceConnectionContentRequestMissingData)initWithExpectedSequenceNumber:(unint64_t)a3
{
  CATActiveIDSServiceConnectionContentRequestMissingData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CATActiveIDSServiceConnectionContentRequestMissingData;
  result = -[CATActiveIDSServiceConnectionContentRequestMissingData init](&v5, sel_init);
  if (result)
    result->_expectedSequenceNumber = a3;
  return result;
}

- (int64_t)contentType
{
  return 5;
}

- (NSDictionary)dictionaryValue
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("ExpectedSequenceNumber");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentRequestMissingData expectedSequenceNumber](self, "expectedSequenceNumber"));
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

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ExpectedSequenceNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpectedSequenceNumber:", objc_msgSend(v6, "unsignedIntegerValue"));
  else
    v7 = 0;

  return v7;
}

- (unint64_t)expectedSequenceNumber
{
  return self->_expectedSequenceNumber;
}

@end
