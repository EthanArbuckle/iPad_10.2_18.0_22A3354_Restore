@implementation AFContextResponse

- (id)_initWithRequest:(id)a3 context:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFContextResponse;
  v8 = -[AFSiriResponse _initWithRequest:](&v11, sel__initWithRequest_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(v8 + 2, a4);

  return v9;
}

- (id)_context
{
  return self->_context;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFContextResponse;
  v4 = a3;
  -[AFSiriResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("GetContextResponseContext"), v5.receiver, v5.super_class);

}

- (AFContextResponse)initWithCoder:(id)a3
{
  id v4;
  AFContextResponse *v5;
  uint64_t v6;
  STSiriContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFContextResponse;
  v5 = -[AFSiriResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GetContextResponseContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (STSiriContext *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
