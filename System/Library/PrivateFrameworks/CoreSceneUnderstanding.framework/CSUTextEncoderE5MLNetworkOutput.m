@implementation CSUTextEncoderE5MLNetworkOutput

- (CSUTextEncoderE5MLNetworkOutput)initWithTextEmbedding:(id)a3 tokenSegments:(id)a4
{
  id v7;
  id v8;
  CSUTextEncoderE5MLNetworkOutput *v9;
  CSUTextEncoderE5MLNetworkOutput *v10;
  CSUTextEncoderE5MLNetworkOutput *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CSUTextEncoderE5MLNetworkOutput;
  v9 = -[CSUTextEncoderE5MLNetworkOutput init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenSegments, a4);
    objc_storeStrong((id *)&v10->_textEmbedding, a3);
    v11 = v10;
  }

  return v10;
}

- (MLMultiArray)textEmbedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)additionalLayers
{
  return self->_additionalLayers;
}

- (void)setAdditionalLayers:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLayers, a3);
}

- (NSArray)tokenSegments
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)truncatedInput
{
  return self->_truncatedInput;
}

- (void)setTruncatedInput:(BOOL)a3
{
  self->_truncatedInput = a3;
}

- (NSString)processedInput
{
  return self->_processedInput;
}

- (void)setProcessedInput:(id)a3
{
  objc_storeStrong((id *)&self->_processedInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedInput, 0);
  objc_storeStrong((id *)&self->_tokenSegments, 0);
  objc_storeStrong((id *)&self->_additionalLayers, 0);
  objc_storeStrong((id *)&self->_textEmbedding, 0);
}

@end
