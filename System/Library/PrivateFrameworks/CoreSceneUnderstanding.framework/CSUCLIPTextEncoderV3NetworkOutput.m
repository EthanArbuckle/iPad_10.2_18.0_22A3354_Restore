@implementation CSUCLIPTextEncoderV3NetworkOutput

- (CSUCLIPTextEncoderV3NetworkOutput)initWithTokenEmbeddingIDs:(id)a3 tokenEmbeddingMask:(id)a4 clipTextEmbedding:(id)a5
{
  id v9;
  id v10;
  id v11;
  CSUCLIPTextEncoderV3NetworkOutput *v12;
  CSUCLIPTextEncoderV3NetworkOutput *v13;
  CSUCLIPTextEncoderV3NetworkOutput *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CSUCLIPTextEncoderV3NetworkOutput;
  v12 = -[CSUCLIPTextEncoderV3NetworkOutput init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tokenEmbeddingIDs, a3);
    objc_storeStrong((id *)&v13->_tokenEmbeddingMask, a4);
    objc_storeStrong((id *)&v13->_clipTextEmbedding, a5);
    v14 = v13;
  }

  return v13;
}

- (CSUBuffer)tokenEmbeddingIDs
{
  return (CSUBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (CSUBuffer)tokenEmbeddingMask
{
  return (CSUBuffer *)objc_getProperty(self, a2, 16, 1);
}

- (CSUBuffer)clipTextEmbedding
{
  return (CSUBuffer *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipTextEmbedding, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingMask, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingIDs, 0);
}

@end
