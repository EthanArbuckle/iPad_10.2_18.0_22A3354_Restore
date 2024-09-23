@implementation FBKRequestRecord

- (NSAttributedString)attrRequestBody
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DEDRequestRecord requestBody](self, "requestBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  v5 = v4;
  if (v3)
  {
    -[DEDRequestRecord requestBody](self, "requestBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKRequestRecord attributedStringAttributes](self, "attributedStringAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  }
  else
  {
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", &stru_24E15EAF8, 0);
  }
  return (NSAttributedString *)v8;
}

- (NSAttributedString)attrRequestHeader
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DEDRequestRecord requestHeader](self, "requestHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  v5 = v4;
  if (v3)
  {
    -[DEDRequestRecord requestHeader](self, "requestHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKRequestRecord attributedStringAttributes](self, "attributedStringAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  }
  else
  {
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", &stru_24E15EAF8, 0);
  }
  return (NSAttributedString *)v8;
}

- (NSAttributedString)attrResponseHeader
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DEDRequestRecord responseHeader](self, "responseHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  v5 = v4;
  if (v3)
  {
    -[DEDRequestRecord responseHeader](self, "responseHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKRequestRecord attributedStringAttributes](self, "attributedStringAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  }
  else
  {
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", &stru_24E15EAF8, 0);
  }
  return (NSAttributedString *)v8;
}

- (NSAttributedString)attrResponseBody
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DEDRequestRecord responseBody](self, "responseBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  v5 = v4;
  if (v3)
  {
    -[DEDRequestRecord responseBody](self, "responseBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKRequestRecord attributedStringAttributes](self, "attributedStringAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  }
  else
  {
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", &stru_24E15EAF8, 0);
  }
  return (NSAttributedString *)v8;
}

- (id)attributedStringAttributes
{
  if (attributedStringAttributes_onceToken != -1)
    dispatch_once(&attributedStringAttributes_onceToken, &__block_literal_global_28);
  return (id)attributedStringAttributes__attr;
}

void __46__FBKRequestRecord_attributedStringAttributes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)attributedStringAttributes__attr;
  attributedStringAttributes__attr = v1;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DEDRequestRecord method](self, "method");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDRequestRecord URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDRequestRecord requestHeader](self, "requestHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@\n%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIColor)displayColor
{
  if (-[DEDRequestRecord isFailure](self, "isFailure"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

@end
