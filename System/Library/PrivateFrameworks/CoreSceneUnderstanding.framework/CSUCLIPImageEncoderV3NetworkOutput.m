@implementation CSUCLIPImageEncoderV3NetworkOutput

- (CSUCLIPImageEncoderV3NetworkOutput)initWithImageEmbedding:(id)a3
{
  id v5;
  CSUCLIPImageEncoderV3NetworkOutput *v6;
  CSUCLIPImageEncoderV3NetworkOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSUCLIPImageEncoderV3NetworkOutput;
  v6 = -[CSUCLIPImageEncoderV3NetworkOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageEmbedding, a3);

  return v7;
}

- (CSUBuffer)imageEmbedding
{
  return (CSUBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageEmbedding, 0);
}

@end
