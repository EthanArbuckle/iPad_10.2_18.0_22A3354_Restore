@implementation AFSiriResponse

- (id)_initWithRequestIdentifier:(id)a3
{
  id v4;
  AFSiriResponse *v5;
  uint64_t v6;
  NSUUID *requestIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriResponse;
  v5 = -[AFSiriResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v6;

  }
  return v5;
}

- (id)_initWithRequest:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AFSiriResponse _initWithRequestIdentifier:](self, "_initWithRequestIdentifier:", v4);

  return v5;
}

- (BOOL)_isForRequest:(id)a3
{
  NSUUID *requestIdentifier;
  void *v4;

  requestIdentifier = self->_requestIdentifier;
  objc_msgSend(a3, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(requestIdentifier) = -[NSUUID isEqual:](requestIdentifier, "isEqual:", v4);

  return (char)requestIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("SiriResponseRequestIdentifier"));
}

- (AFSiriResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFSiriResponse *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriResponseRequestIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AFSiriResponse _initWithRequestIdentifier:](self, "_initWithRequestIdentifier:", v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
