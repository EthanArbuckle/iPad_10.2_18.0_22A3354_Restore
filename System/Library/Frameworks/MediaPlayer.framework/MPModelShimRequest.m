@implementation MPModelShimRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelShimRequest;
  -[MPRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" modelRequest=%@"), self->_modelRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)middlewareClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPModelShimRequest;
  v4 = -[MPRequest copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[MPModelRequest copy](self->_modelRequest, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  return v4;
}

- (void)setModelRequest:(id)a3
{
  objc_storeStrong((id *)&self->_modelRequest, a3);
}

- (MPModelRequest)modelRequest
{
  return self->_modelRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelRequest, 0);
}

@end
