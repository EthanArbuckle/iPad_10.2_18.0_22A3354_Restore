@implementation MPModelStaticRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelStaticRequest;
  v4 = -[MPModelRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 8, self->_staticResponse);
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[MPModelStaticRequest staticResponse](self, "staticResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB34C8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__MPModelStaticRequest_newOperationWithResponseHandler___block_invoke;
  v11[3] = &unk_1E3162560;
  v12 = v5;
  v13 = v4;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "blockOperationWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MPModelStaticResponse)staticResponse
{
  return self->_staticResponse;
}

- (void)setStaticResponse:(id)a3
{
  objc_storeStrong((id *)&self->_staticResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticResponse, 0);
}

uint64_t __56__MPModelStaticRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end
