@implementation AMSMediaResult

- (AMSMediaResult)initWithResult:(id)a3
{
  id v4;
  AMSMediaResult *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *responseDictionary;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSMediaResult;
  v5 = -[AMSURLResult initWithResult:](&v10, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = v7;

  }
  return v5;
}

- (NSArray)responseDataItems
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMediaResult responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
