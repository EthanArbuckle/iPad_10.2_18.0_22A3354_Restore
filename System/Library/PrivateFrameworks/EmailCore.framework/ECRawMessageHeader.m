@implementation ECRawMessageHeader

- (ECRawMessageHeader)initWithHeaderFieldName:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  ECRawMessageHeader *v8;
  uint64_t v9;
  NSString *transmittedName;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *body;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ECRawMessageHeader;
  v8 = -[ECRawMessageHeader init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    transmittedName = v8->_transmittedName;
    v8->_transmittedName = (NSString *)v9;

    -[NSString lowercaseString](v8->_transmittedName, "lowercaseString");
    v11 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v13 = objc_msgSend(v7, "copy");
    body = v8->_body;
    v8->_body = (NSString *)v13;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->_transmittedName, self->_body);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)transmittedName
{
  return self->_transmittedName;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_transmittedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
