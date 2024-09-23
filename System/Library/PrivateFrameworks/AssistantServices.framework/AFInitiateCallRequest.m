@implementation AFInitiateCallRequest

- (id)_initWithCall:(id)a3
{
  id v5;
  AFInitiateCallRequest *v6;
  AFInitiateCallRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFInitiateCallRequest;
  v6 = -[AFSiriRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_call, a3);

  return v7;
}

- (id)call
{
  return self->_call;
}

- (id)description
{
  STCall *call;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  call = self->_call;
  v7 = CFSTR("call");
  v8[0] = call;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSiriRequest _descriptionWithProperties:](self, "_descriptionWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFSiriRequestSucceededResponse alloc], "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFInitiateCallRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_call, CFSTR("Call"), v5.receiver, v5.super_class);

}

- (AFInitiateCallRequest)initWithCoder:(id)a3
{
  id v4;
  AFInitiateCallRequest *v5;
  uint64_t v6;
  STCall *call;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFInitiateCallRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Call"));
    v6 = objc_claimAutoreleasedReturnValue();
    call = v5->_call;
    v5->_call = (STCall *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
