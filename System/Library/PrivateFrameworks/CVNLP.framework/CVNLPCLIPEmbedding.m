@implementation CVNLPCLIPEmbedding

- (CVNLPCLIPEmbedding)initWithData:(id)a3
{
  id v5;
  CVNLPCLIPEmbedding *v6;
  CVNLPCLIPEmbedding *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVNLPCLIPEmbedding;
  v6 = -[CVNLPCLIPEmbedding init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
